package webserverproject.serverproject.service.user;

import org.springframework.security.core.Authentication;
import webserverproject.serverproject.requestDTO.userDTO.UserJoinRequestDTO;
import webserverproject.serverproject.responseDTO.userDTO.UserInfoResponseDTO;
import webserverproject.serverproject.responseDTO.userDTO.UserJoinResponseDTO;
import webserverproject.serverproject.responseDTO.userDTO.UserRoleResponseDTO;

public interface UserServiceImpl {

    UserJoinResponseDTO createUser(UserJoinRequestDTO userJoinRequestDTO);
    void createAdmin();

    UserInfoResponseDTO infoUser(Authentication authentication);

    UserRoleResponseDTO roleUser(Authentication authentication);

}
