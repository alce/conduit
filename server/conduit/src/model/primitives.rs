use std::convert::TryFrom;

#[derive(Debug)]
pub struct Username(String);

impl TryFrom<String> for Username {
    type Error = String;

    fn try_from(value: String) -> Result<Self, Self::Error> {
        Ok(Username(value))
    }
}

#[derive(Debug)]
pub struct Password(String);

impl Password {
    pub fn new(value: String) -> Result<Self, String> {
        Ok(Password(value))
    }
}

#[derive(Debug)]
pub struct Email(String);

impl Email {
    pub fn new(value: String) -> Result<Self, String> {
        Ok(Email(value))
    }
}
