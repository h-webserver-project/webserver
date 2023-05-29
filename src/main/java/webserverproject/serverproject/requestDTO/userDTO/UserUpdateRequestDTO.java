package webserverproject.serverproject.requestDTO.userDTO;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

public class UserUpdateRequestDTO {
    @Email
    @NotBlank
    private String email;

    @NotBlank
    private String password;

    @NotBlank
    private String nickName;


}
