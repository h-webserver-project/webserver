package webserverproject.serverproject.responseDTO.userDTO;

import webserverproject.serverproject.model.User;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class UserJoinResponseDTO {

    private  String email;
    private String userName;
    private  String phoneNumber;

    private String nickName;

    public String getNickName() {
        return nickName;
    }

    public String getEmail() {
        return email;
    }

    public String getUserName() {
        return userName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    private UserJoinResponseDTO(String email, String userName, String phoneNumber, String nickName) {
        this.email = email;
        this.userName = userName;
        this.phoneNumber = phoneNumber;
        this.nickName = nickName;
    }


    public static  UserJoinResponseDTO toUserJoinResponseDTO(User user){
        return new UserJoinResponseDTO(user.getEmail(), user.getUserName(), user.getPhoneNumber(), user.getNickName());
    }
}
