package webserverproject.serverproject.requestDTO.userDTO;


import webserverproject.serverproject.model.User;
import webserverproject.serverproject.security.Role;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

public class UserJoinRequestDTO {
    @Email
    @NotBlank
    private String email;

    @NotBlank
    private String password;

    @NotBlank
    private String userName;

    @NotBlank
    @Pattern(regexp = "^01(?:0|1|[6-9])[.-]?(\\d{3}|\\d{4})[.-]?(\\d{4})$")
    private  String phoneNumber;

    @NotBlank
    private String nickName;


    public User toUserEntity(String passwordEncode, Role role){
        return new User(this.email,passwordEncode,this.userName,this.phoneNumber,role, this.nickName);
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public String getUserName() {
        return userName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public String getNickName() {
        return nickName;
    }
}
