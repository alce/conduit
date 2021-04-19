use crate::model::error::ConduitError;
use crate::model::{Email, Id, Password, Profile, User, Username};
use crate::{crypto, Conduit};
use sqlx::PgPool;
use std::convert::TryFrom;

#[derive(Debug)]
pub struct CreateUserArgs {
    pub username: Username,
    pub email: Email,
    pub password: Password,
}

#[derive(Debug)]
pub struct UpdateUserArgs {
    pub username: Username,
    pub email: Email,
    pub password: Password,
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

    pub async fn current_user(&self) -> Result<User, ConduitError> {
        current().await
    }

    pub async fn update_user(&self, _args: UpdateUserArgs) -> Result<User, ConduitError> {
        todo!()
    }

    pub async fn delete_user(&self) -> Result<(), ConduitError> {
        delete("foo", &self.pool).await
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
    let hash = args.password.hash()?;
    let id = Id::new_v4();
    let token = crypto::token::new(id)?;

    let user = User {
        id,
        token,
        username: args.username,
        email: args.email,
        bio: None,
        image: None,
    };

    sqlx::query!(
        r#"
        INSERT INTO users (id, email, username, hash)
        VALUES ($1, $2, $3, $4)
        "#,
        user.id,
        user.email.as_ref(),
        user.username.as_ref(),
        hash
    )
    .execute(pool)
    .await?;

    Ok(user)
}

async fn login(args: LoginArgs, pool: &PgPool) -> Result<User, ConduitError> {
    let rec = sqlx::query!(
        "SELECT id, email, username, bio, image, hash FROM users WHERE email = $1",
        args.email.as_ref()
    )
    .fetch_one(pool)
    .await?;

    crypto::verify(&args.password, &rec.hash)?;
    let token = crypto::token::new(rec.id)?;

    let user = User {
        id: rec.id,
        token,
        username: Username::try_from(rec.username)?,
        email: Email::new(rec.email)?,
        bio: rec.bio,
        image: rec.image,
    };

    Ok(user)
}
async fn current() -> Result<User, ConduitError> {
    Ok(User {
        id: Id::new_v4(),
        token: "some-token".to_string(),
        username: Username::try_from("current-user".to_string())?,
        email: Email::new("current-user-email".to_string())?,
        bio: None,
        image: None,
    })
}

async fn delete(username: &str, pool: &PgPool) -> Result<(), ConduitError> {
    sqlx::query!("DELETE FROM users WHERE username = $1", username)
        .execute(pool)
        .await?;

    Ok(())
}
