package webserverproject.serverproject.responseDTO.userDTO;

import webserverproject.serverproject.model.User;

public class UserInfoResponseDTO {
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

    private UserInfoResponseDTO(String email, String userName, String phoneNumber, String nickName) {
        this.email = email;
        this.userName = userName;
        this.phoneNumber = phoneNumber;
        this.nickName = nickName;
    }

    public static  UserInfoResponseDTO toUserInfoResponseDTO(User user){
        return new UserInfoResponseDTO(user.getEmail(),user.getUserName(), user.getPhoneNumber(), user.getNickName());
    }
}
