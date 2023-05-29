package webserverproject.serverproject.restController.user;

import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;
import webserverproject.serverproject.requestDTO.userDTO.UserJoinRequestDTO;
import webserverproject.serverproject.responseDTO.userDTO.UserInfoResponseDTO;
import webserverproject.serverproject.responseDTO.userDTO.UserJoinResponseDTO;
import webserverproject.serverproject.service.user.UserServiceImpl;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.Map;

@RestController
public class UserController {

    private final UserServiceImpl userService;

    public UserController(UserServiceImpl userService) {
        this.userService = userService;
    }


    // 회원 가입
    @PostMapping("/api/join")
    public ResponseEntity<?> signUp(@RequestBody @Valid UserJoinRequestDTO userJoinRequestDTO){

        UserJoinResponseDTO userJoinResponseDTO = userService.createUser(userJoinRequestDTO);

        return ResponseEntity.ok().body(createResponse(userJoinResponseDTO,"회원가입 성공"));
    }
    // 유저 정보 추출
    @GetMapping("/api/user/info")
    public ResponseEntity<?> userInfo(Authentication authentication){
        UserInfoResponseDTO userInfoResponseDTO = userService.infoUser(authentication);
        return ResponseEntity.ok().body(createResponse(userInfoResponseDTO,"회원 조회가 성공하였습니다."));
    }


    private Map<String,Object> createResponse(Object object, String msg){
        Map<String, Object> response = new HashMap<>();
        response.put("msg", msg);
        response.put("data", object);
        return response;
    }



}
