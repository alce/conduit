use crate::error::ConduitError;
use crate::types::{Email, Id, Password, Username};
use crate::users::user::Profile;
use crate::Conduit;
use sqlx::PgPool;
pub use user::User;

mod password;
mod token;
mod user;

#[derive(Debug)]
pub struct CreateUserArgs {
    pub username: Username,
    pub email: Email,
    pub password: Password,
}

#[derive(Debug)]
pub struct UpdateUserArgs {
    pub username: Option<Username>,
    pub email: Option<Email>,
    pub password: Option<Password>,
    pub bio: Option<String>,
    pub image: Option<String>,
}

pub struct LoginArgs {
    pub email: Email,
    pub password: Password,
}

impl Conduit {
    pub async fn login(&self, args: LoginArgs) -> Result<User, ConduitError> {
        login(args, &self.pool).await
    }

    pub async fn signup(&self, args: CreateUserArgs) -> Result<User, ConduitError> {
        signup(args, &self.pool).await
    }

    pub async fn current_user(&self, token: String) -> Result<User, ConduitError> {
        let user_id = token::decode(token.clone())?;

        let rec = sqlx::query!(
            "
            SELECT 
                username, email, bio, image
            FROM users 
            WHERE user_id = $1",
            user_id
        )
        .fetch_one(&self.pool)
        .await?;

        Ok(User {
            user_id,
            token,
            username: rec.username,
            email: rec.email,
            bio: rec.bio,
            image: rec.image,
        })
    }

    pub async fn update_user(
        &self,
        args: UpdateUserArgs,
        token: String,
    ) -> Result<User, ConduitError> {
        let _id = token::decode(token)?;
        dbg!(&args);

        todo!()
    }

    pub async fn delete_user(&self, username: &str) -> Result<(), ConduitError> {
        sqlx::query!("DELETE FROM users WHERE username = $1", username)
            .execute(&self.pool)
            .await?;

        Ok(())
    }

    pub async fn get_profile(&self) -> Result<Profile, ConduitError> {
        todo!()
    }

    pub async fn follow_user(&self) -> Result<Profile, ConduitError> {
        todo!()
    }

    pub async fn unfollow_user(&self) -> Result<Profile, ConduitError> {
        todo!()
    }
}

async fn signup(args: CreateUserArgs, pool: &PgPool) -> Result<User, ConduitError> {
    let hash = password::hash(args.password)?;
    let user_id = Id::new_v4();
    let token = token::new(user_id)?;

    let user = User {
        user_id,
        token,
        username: args.username.into_string(),
        email: args.email.into_string(),
        bio: None,
        image: None,
    };

    sqlx::query!(
        r#"
        INSERT INTO users (user_id, email, username, hash)
        VALUES ($1, $2, $3, $4)
        "#,
        user.user_id,
        user.email,
        user.username,
        hash
    )
    .execute(pool)
    .await?;

    Ok(user)
}

async fn login(args: LoginArgs, pool: &PgPool) -> Result<User, ConduitError> {
    let rec = sqlx::query!(
        r#"
        SELECT user_id, email, username, bio, image, hash 
        FROM users WHERE email = $1
        "#,
        args.email.as_ref()
    )
    .fetch_one(pool)
    .await?;

    password::verify(args.password, &rec.hash)?;
    let token = token::new(rec.user_id)?;

    let user = User {
        user_id: rec.user_id,
        token,
        username: rec.username,
        email: rec.email,
        bio: rec.bio,
        image: rec.image,
    };

    Ok(user)
}
