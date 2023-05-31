package webserverproject.serverproject.responseDTO.userDTO;

import webserverproject.serverproject.model.User;
import webserverproject.serverproject.security.Role;

public class UserRoleResponseDTO {

    private Role role;

    private UserRoleResponseDTO(Role role) {
        this.role = role;
    }

    public Role getRole() {
        return role;
    }

    public static  UserRoleResponseDTO toUserRoleResponseDTO(User user){
        return new UserRoleResponseDTO(user.getRoles());
    }
}
