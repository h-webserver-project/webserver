package webserverproject.serverproject.service.user;

import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import webserverproject.serverproject.auth.PrincipalDetails;
import webserverproject.serverproject.error.CustomException;
import webserverproject.serverproject.error.ErrorCode;
import webserverproject.serverproject.model.User;
import webserverproject.serverproject.repository.UserRepository;
import webserverproject.serverproject.requestDTO.userDTO.UserJoinRequestDTO;
import webserverproject.serverproject.responseDTO.userDTO.UserInfoResponseDTO;
import webserverproject.serverproject.responseDTO.userDTO.UserJoinResponseDTO;
import webserverproject.serverproject.responseDTO.userDTO.UserRoleResponseDTO;
import webserverproject.serverproject.security.Role;

@Service
@Transactional
public class UserService implements UserServiceImpl {
    private final UserRepository userRepository;
    private final BCryptPasswordEncoder passwordEncoder;

    public UserService(UserRepository userRepository, BCryptPasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }


    @Override
    public UserJoinResponseDTO createUser(UserJoinRequestDTO userJoinRequestDTO) {
        if(userRepository.existsByEmail(userJoinRequestDTO.getEmail())){
            throw  new CustomException(ErrorCode.BadUserException);
        }
        User user = userJoinRequestDTO.toUserEntity(passwordEncoder.encode(userJoinRequestDTO.getPassword()), Role.ROLE_USER);
        userRepository.save(user);
        return  UserJoinResponseDTO.toUserJoinResponseDTO(user);
    }

    @Override
    public void createAdmin() {
        User user = new User("admin",passwordEncoder.encode("admin"),"admin","01000000000",Role.ROLE_ADMIN,"admin");

        if(!userRepository.existsByEmail(user.getEmail())){
            userRepository.save(user);
        }

    }

    @Override
    public UserInfoResponseDTO infoUser(Authentication authentication) {
        // user 찾고
        User user = ((PrincipalDetails) authentication.getPrincipal()).getUser();
        return UserInfoResponseDTO.toUserInfoResponseDTO(user);
    }

    @Override
    public UserRoleResponseDTO roleUser(Authentication authentication) {
        User user = ((PrincipalDetails) authentication.getPrincipal()).getUser();

        return UserRoleResponseDTO.toUserRoleResponseDTO(user);
    }
}
