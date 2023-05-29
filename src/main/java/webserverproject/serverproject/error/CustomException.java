package webserverproject.serverproject.error;

public class CustomException extends RuntimeException{
    private  ErrorCode errorCode;
    public CustomException(ErrorCode errorCode ) {
        this.errorCode = errorCode;
    }

    public ErrorCode getErrorCode() {
        return errorCode;
    }
}
