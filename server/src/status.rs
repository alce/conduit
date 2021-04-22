use tonic::Status;

use conduit::error::ConduitError;

pub fn new(error: ConduitError) -> Status {
    match error {
        ConduitError::Validation(_) => Status::invalid_argument("Validation failed"),
        ConduitError::Unauthorized => Status::permission_denied("Unauthorized"),
        ConduitError::Internal => Status::internal("Internal error"),
    }
}
