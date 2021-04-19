use crate::model::{Email, Id, Username};

#[derive(Debug)]
pub struct User {
    pub id: Id,
    pub token: String,
    pub username: Username,
    pub email: Email,
    pub bio: Option<String>,
    pub image: Option<String>,
}

#[derive(Debug)]
pub struct Profile {
    pub username: Username,
    pub email: Email,
    pub bio: Option<String>,
    pub image: Option<String>,
    pub following: bool,
}
