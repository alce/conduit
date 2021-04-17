use crate::model::User;

pub async fn current() -> Result<User, ()> {
    Ok(User {
        token: "some-token".to_string(),
        username: "current-user".to_string(),
        email: "current-user-email".to_string(),
        bio: None,
        image: None,
    })
}
