use crate::types::Id;

#[derive(Debug)]
pub struct User {
    pub user_id: Id,
    pub token: String,
    pub username: String,
    pub email: String,
    pub bio: Option<String>,
    pub image: Option<String>,
}

#[derive(Debug)]
pub struct Profile {
    pub user_id: Id,
    pub username: String,
    pub bio: Option<String>,
    pub image: Option<String>,
    pub following: bool,
}
