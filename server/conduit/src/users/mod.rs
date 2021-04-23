use crate::error::ConduitError;
use crate::types::{Email, Id, Password, Token, Username};
use crate::Conduit;
use sqlx::PgPool;

mod user;
pub use user::{Profile, User};

#[derive(Debug)]
pub struct CreateUserArgs {
    pub username: Username,
    pub email: Email,
    pub password: Password,
}

#[derive(Debug)]
pub struct UpdateProfileArgs {
    pub username: Option<Username>,
    pub email: Option<Email>,
    pub bio: Option<String>,
    pub image: Option<String>,
}

pub struct LoginArgs {
    pub email: Email,
    pub password: Password,
}

impl Conduit {
    pub async fn login(&self, args: LoginArgs) -> Result<(User, Token), ConduitError> {
        match login(args, &self.pool).await {
            Ok(user) => Ok(user),
            Err(e) => {
                println!("Login failed: {:?}", e);
                Err(ConduitError::Unauthenticated)
            }
        }
    }

    pub async fn signup(&self, args: CreateUserArgs) -> Result<(User, Token), ConduitError> {
        signup(args, &self.pool).await
    }

    pub async fn current_user(&self, token: Token) -> Result<(User, Token), ConduitError> {
        let user_id = token.decode()?;
        let mut conn = self.pool.acquire().await?;
        let user = db::get_user_by_id(&mut conn, user_id).await?;

        Ok((user, token))
    }

    pub async fn update_user(
        &self,
        args: UpdateProfileArgs,
        token: Token,
    ) -> Result<(User, Token), ConduitError> {
        let user_id = token.decode()?;
        let mut conn = self.pool.acquire().await?;
        let user = db::get_user_by_id(&mut conn, user_id).await?.update(args);
        db::update_user(&mut conn, &user).await?;

        Ok((user, token))
    }

    pub async fn update_password(
        &self,
        password: Password,
        token: Token,
    ) -> Result<(), ConduitError> {
        let user_id = token.decode()?;
        let hash = password.hash()?;

        sqlx::query!(
            "UPDATE users SET hash = $1 WHERE user_id = $2",
            hash,
            user_id,
        )
        .execute(&self.pool)
        .await?;

        Ok(())
    }

    // TODO: remove
    pub async fn delete_user(&self, username: &str) -> Result<(), ConduitError> {
        sqlx::query!("DELETE FROM users WHERE username = $1", username)
            .execute(&self.pool)
            .await?;

        Ok(())
    }

    pub async fn get_profile(
        &self,
        username: &str,
        token: Option<Token>,
    ) -> Result<Profile, ConduitError> {
        let current_user_id = if let Some(token) = token {
            token.decode()?
        } else {
            Id::nil()
        };

        db::load_profile(&self.pool, current_user_id, username).await
    }

    pub async fn follow_user(&self, username: &str, token: Token) -> Result<Profile, ConduitError> {
        let current_user_id = token.decode()?;
        let mut followee = db::load_profile(&self.pool, current_user_id, username).await?;

        if !followee.following {
            db::create_follow(&self.pool, current_user_id, followee.user_id).await?;
            followee.following = true;
        }

        Ok(followee)
    }

    pub async fn unfollow_user(
        &self,
        username: &str,
        token: Token,
    ) -> Result<Profile, ConduitError> {
        let current_user_id = token.decode()?;
        let mut followee = db::load_profile(&self.pool, current_user_id, username).await?;

        if followee.following {
            db::delete_follow(&self.pool, current_user_id, followee.user_id).await?;
            followee.following = false;
        }

        Ok(followee)
    }
}

async fn signup(args: CreateUserArgs, pool: &PgPool) -> Result<(User, Token), ConduitError> {
    let hash = args.password.hash()?;
    let user_id = Id::new_v4();

    let user = User {
        user_id,
        username: args.username.into_string(),
        email: args.email.into_string(),
        bio: None,
        image: None,
    };

    let token = Token::new(user.user_id)?;
    db::create_user(pool, &user, hash).await?;

    Ok((user, token))
}

async fn login(args: LoginArgs, pool: &PgPool) -> Result<(User, Token), ConduitError> {
    let rec = sqlx::query!(
        r#"
        SELECT 
            user_id, email, username, bio, image, hash 
        FROM users 
        WHERE email = $1
        "#,
        args.email.as_ref()
    )
    .fetch_one(pool)
    .await?;

    args.password.verify(&rec.hash)?;

    let user = User {
        user_id: rec.user_id,
        username: rec.username,
        email: rec.email,
        bio: rec.bio,
        image: rec.image,
    };

    Ok((user, Token::new(rec.user_id)?))
}

mod db {
    use crate::error::ConduitError;
    use crate::types::Id;
    use crate::users::{Profile, User};
    use sqlx::{PgConnection, PgPool};

    pub async fn get_user_by_id(
        conn: &mut PgConnection,
        user_id: Id,
    ) -> Result<User, ConduitError> {
        let rec = sqlx::query!(
            "
            SELECT username, email, bio, image
            FROM users 
            WHERE user_id = $1",
            user_id
        )
        .fetch_one(conn)
        .await?;

        Ok(User {
            user_id,
            username: rec.username,
            email: rec.email,
            bio: rec.bio,
            image: rec.image,
        })
    }

    pub async fn create_user(pool: &PgPool, user: &User, hash: String) -> Result<(), ConduitError> {
        sqlx::query!(
            "
            INSERT INTO users 
                (user_id, email, username, hash)
            VALUES 
                ($1, $2, $3, $4)
        ",
            user.user_id,
            user.email,
            user.username,
            hash
        )
        .execute(pool)
        .await?;

        Ok(())
    }

    pub async fn update_user(conn: &mut PgConnection, user: &User) -> Result<(), ConduitError> {
        sqlx::query!(
            r#"
        UPDATE users SET
            email = $1,
            username = $2,
            bio = $3,
            image = $4
        WHERE user_id = $5
        "#,
            user.email,
            user.username,
            user.bio,
            user.image,
            user.user_id,
        )
        .execute(conn)
        .await?;

        Ok(())
    }

    pub async fn create_follow(
        pool: &PgPool,
        followee_id: Id,
        current_user_id: Id,
    ) -> Result<(), ConduitError> {
        sqlx::query!(
            "
            INSERT INTO followers 
                (follower, followee)
            VALUES 
                ($1, $2)
            ",
            current_user_id,
            followee_id,
        )
        .execute(pool)
        .await?;

        Ok(())
    }

    pub async fn delete_follow(
        pool: &PgPool,
        followee_id: Id,
        current_user_id: Id,
    ) -> Result<(), ConduitError> {
        sqlx::query!(
            "
            DELETE 
            FROM followers 
            WHERE follower = $1 AND followee = $2
            ",
            current_user_id,
            followee_id,
        )
        .execute(pool)
        .await?;

        Ok(())
    }

    pub async fn load_profile(
        pool: &PgPool,
        current_user_id: Id,
        username: &str,
    ) -> Result<Profile, ConduitError> {
        sqlx::query_as!(
            Profile,
            r#"
            SELECT
                user_id,
                username,
                bio,
                image,
                EXISTS(
                    SELECT 1
                    FROM followers
                    WHERE follower = $1 AND followee = user_id
                ) AS "following!"
            FROM users
            WHERE username = $2
            "#,
            current_user_id,
            username,
        )
        .fetch_one(pool)
        .await
        .map_err(Into::into)
    }
}
