package webserverproject.serverproject.security;



import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AbstractAuthenticationProcessingFilter;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import webserverproject.serverproject.auth.PrincipalDetails;
import webserverproject.serverproject.model.User;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;


@Slf4j
public class JwtAuthenticationFilter extends JsonIdPwAuthenticationFilter {
    private  final AuthenticationManager authenticationManager;
    private  final TokenProvider tokenProvider;
    ObjectMapper objectMapper = new ObjectMapper();

    public JwtAuthenticationFilter(AuthenticationManager authenticationManager, TokenProvider tokenProvider) {
        this.authenticationManager = authenticationManager;
        this.tokenProvider = tokenProvider;
    }


    @Override
    protected void successfulAuthentication(HttpServletRequest request, HttpServletResponse response, FilterChain chain, Authentication authentication) throws IOException, ServletException {
        try{
            String accessToken = tokenProvider.generateAccessToken(authentication); // accessToken 생성
            String refreshToken = tokenProvider.generateRefreshToken(authentication);// refreshToken 생성

            System.out.println(accessToken);
            // 쿠키에 refreshToken 저장
            setCookieRefreshToken(response,refreshToken);

            // responseHeader 통한 전송
            sendResponseHeaderAccessToken(response,accessToken);




        }catch (Exception e){
            System.out.println(e.getMessage());
        }


    }

    @Override
    public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response) throws AuthenticationException {
        System.out.println("로그인 시도중");
        try{

            User user = objectMapper.readValue(request.getInputStream(),User.class);
            UsernamePasswordAuthenticationToken authenticationToken = new UsernamePasswordAuthenticationToken(user.getEmail(),user.getPassword());
            Authentication authentication = authenticationManager.authenticate(authenticationToken);
            System.out.println(authentication);
            return authentication;
        } catch (IOException e) {
            return null;
        }

    }


    // responseHeader AccessToken 보내기
    private   void sendResponseHeaderAccessToken(HttpServletResponse response,String accessToken) throws IOException {
        // accessToken header 전송
        response.setContentType("application/json");
        response.addHeader("Authorization","Bearer "+accessToken); // header에 accesstoken 추가

        Map<String, Object> message = new HashMap<>();
        message.put("msg", "login success");
        ResponseEntity.ok().body(message);
        String result = objectMapper.writeValueAsString(message);
        response.getWriter().write(result);

    }

    private  void setCookieRefreshToken( HttpServletResponse response, String refreshToken){
        Cookie cookie =  new Cookie("refreshToken",refreshToken);
        cookie.setPath("/");
        response.addCookie(cookie);

    }

}
