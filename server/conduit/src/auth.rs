use crate::model::{Email, Password, User, Username};

pub struct SignupArgs {
    pub username: Username,
    pub email: Email,
    pub password: Password,
}

pub struct LoginArgs {
    pub email: Email,
    pub password: Password,
}

fn hash_password(_password: &Password) -> String {
    "password-hash".to_string()
}

fn make_token() -> String {
    "some-token".to_string()
}

pub async fn signup(args: SignupArgs) -> Result<User, String> {
    let _hash = hash_password(&args.password);
    let token = make_token();

    let user = User {
        token,
        username: "some-username".to_string(),
        email: "some_email".to_string(),
        bio: None,
        image: None,
    };

    Ok(user)
}

pub async fn login(_args: LoginArgs) -> Result<User, String> {
    let token = make_token();

    let user = User {
        token,
        username: "some-username".to_string(),
        email: "some_email".to_string(),
        bio: None,
        image: None,
    };

    Ok(user)
}
