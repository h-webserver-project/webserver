package webserverproject.serverproject.error;

public enum ErrorCode {

    BadPasswordException(400,"BadParameterException","잘못된 password 입니다"),

    BadParameterException(400,"BadParameterException","잘못된 형식의 데이터 입니다."),

    BadException(400,"BadException","잘못된 접근 방식 입니다."),
    BadGradeException(400,"BadGradeException","점수는 0보다 작을 수 없고 5보다 클수 없습니다."),
    BadEmailException(400,"BadEmailException","잘못된 형식의 이메일 입니다"),
    BadPhoneNumberException(400,"BadPhoneNumberException","잘못된 형식의 번호입니다"),
    NotFoundUserException(404,"NotFoundUserException","계정이 존재하지 않습니다"),
    NotFoundMovieException(404,"NotFoundMovieException","영화가 존재하지 않습니다"),
    UnauthorizedException(401,"UnauthorizedException","허용되지 않는 접근입니다."),
    ExpirationException(401,"ExpirationException","만료된 토큰입니다."),

    INTER_SERVER_ERROR(500,"COMMON-ERR-500","INTER SERVER ERROR");
    private  int status;
    private  String errorCode;
    private String message;

    public int getStatus() {
        return status;
    }

    public String getErrorCode() {
        return errorCode;
    }

    public String getMessage() {
        return message;
    }

    ErrorCode(int status, String errorCode, String message) {
        this.status = status;
        this.errorCode = errorCode;
        this.message = message;
    }
}
