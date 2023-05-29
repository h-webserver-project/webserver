package webserverproject.serverproject.service.user;

import org.springframework.security.core.Authentication;
import webserverproject.serverproject.requestDTO.userDTO.UserJoinRequestDTO;
import webserverproject.serverproject.responseDTO.userDTO.UserInfoResponseDTO;
import webserverproject.serverproject.responseDTO.userDTO.UserJoinResponseDTO;

public interface UserServiceImpl {

    UserJoinResponseDTO createUser(UserJoinRequestDTO userJoinRequestDTO);

    UserInfoResponseDTO infoUser(Authentication authentication);

}
