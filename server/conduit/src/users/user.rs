use crate::types::Id;
use crate::users::UpdateProfileArgs;

#[derive(Debug)]
pub struct User {
    pub user_id: Id,
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

impl User {
    pub fn update(self, args: UpdateProfileArgs) -> User {
        User {
            username: args
                .username
                .map(|u| u.into_string())
                .unwrap_or(self.username),
            email: args.email.map(|e| e.into_string()).unwrap_or(self.email),
            bio: args.bio,
            image: args.image,
            ..self
        }
    }
}
