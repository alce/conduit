use conduit::model::error::ConduitError;
use tonic::Status;

pub fn new(error: ConduitError) -> Status {
    match error {
        ConduitError::Validation => Status::invalid_argument("Validation failed"),
        ConduitError::Unauthorized => Status::permission_denied("Validation failed"),
        ConduitError::Internal => Status::internal("Internal error"),
    }
}
