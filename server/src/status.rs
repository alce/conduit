use tonic::Status;

use conduit::error::{ConduitError, FieldError, FieldErrorKind};

use bytes::Bytes;
use prost::Message;

pub trait StatusExt {
    fn from_conduit_error(e: ConduitError) -> Status;
    fn bad_request(e: FieldError) -> Status;
}

impl StatusExt for Status {
    fn from_conduit_error(e: ConduitError) -> Status {
        match e {
            ConduitError::Validation(field_error) => Status::bad_request(field_error),
            ConduitError::Unauthorized => Status::permission_denied("Unauthorized"),
            ConduitError::Unauthenticated => Status::unauthenticated("Authentication required"),
            ConduitError::RecordNotFound => Status::not_found("Resource not found"),
            ConduitError::ResourceExists(name) => {
                let error = FieldError {
                    name,
                    kind: FieldErrorKind::ResourceExists,
                };
                Status::bad_request(error)
            }
            ConduitError::Database(_) | ConduitError::Internal(_) => {
                Status::internal("Server error")
            }
        }
    }

    fn bad_request(e: FieldError) -> Status {
        use crate::pb::google::rpc;

        let mut buf = Vec::with_capacity(256);

        let bad_req = rpc::BadRequest {
            field_violations: vec![rpc::bad_request::FieldViolation {
                field: e.name,
                description: e.kind.to_string(),
            }],
        };

        bad_req.encode(&mut buf).expect("encode rpc::BadRequest");

        let status = rpc::Status {
            code: rpc::Code::InvalidArgument as i32,
            message: String::new(),
            details: vec![prost_types::Any {
                type_url: "type.googleapis.com/google.rpc.BadRequest".to_string(),
                value: buf.to_vec(),
            }],
        };

        buf.clear();
        status.encode(&mut buf).expect("encode rpc::Status");

        Status::with_details(
            tonic::Code::InvalidArgument,
            "One or ore arguments are invalid",
            Bytes::from(buf),
        )
    }
}
