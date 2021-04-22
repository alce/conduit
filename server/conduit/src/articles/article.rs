use crate::types::DateTime;

#[derive(Debug)]
pub struct Article {
    pub slug: String,
    pub title: String,
    pub description: String,
    pub body: String,
    pub tag_list: Vec<String>,
    pub favorited: bool,
    pub create_time: DateTime,
    pub update_time: DateTime,
    pub favorites_count: i32,
}
