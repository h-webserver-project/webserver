package webserverproject.serverproject.auth;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import webserverproject.serverproject.error.CustomException;
import webserverproject.serverproject.error.ErrorCode;
import webserverproject.serverproject.model.User;
import webserverproject.serverproject.repository.UserRepository;

@Service
public class PrincipalDetailsService implements UserDetailsService {

    private  final UserRepository userRepository;

    public PrincipalDetailsService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }


    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        User user = userRepository.findByEmail(email)
                .orElseThrow(()->new CustomException(ErrorCode.NotFoundUserException));

        System.out.println(user); //user  찍히고
        return  new PrincipalDetails(user);
    }
}
