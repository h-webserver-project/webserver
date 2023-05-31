package webserverproject.serverproject.error;

import lombok.Builder;
import lombok.Getter;

public class ErrorResponse {
    private  int status;
    private  String message;
    private  String errorCode;

    @Builder
    public ErrorResponse(ErrorCode errorCode) {
        this.status = errorCode.getStatus();
        this.message = errorCode.getMessage();
        this.errorCode = errorCode.getErrorCode();
    }

	public int getStatus() {
		return status;
	}



	public String getMessage() {
		return message;
	}


	public String getErrorCode() {
		return errorCode;
	}

	
    
}
