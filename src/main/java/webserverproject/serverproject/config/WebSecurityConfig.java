package webserverproject.serverproject.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.web.cors.CorsUtils;

import lombok.extern.slf4j.Slf4j;
import webserverproject.serverproject.repository.UserRepository;
import webserverproject.serverproject.security.JwtAuthenticationFilter;
import webserverproject.serverproject.security.JwtAuthorizationFilter;
import webserverproject.serverproject.security.Role;
import webserverproject.serverproject.security.TokenProvider;

@Configuration
@EnableWebSecurity
@Slf4j
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

	private final UserRepository userRepository;
	private final TokenProvider tokenProvider;

	private  final PasswordEncoder passwordEncoder;

	public WebSecurityConfig(UserRepository userRepository, TokenProvider tokenProvider, PasswordEncoder passwordEncoder) {
		this.userRepository = userRepository;
		this.tokenProvider = tokenProvider;
		this.passwordEncoder = passwordEncoder;
	}


	@Override
	    protected void configure(HttpSecurity http) throws Exception {
		http.cors();
		http.csrf()
				.disable().sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS)
				.and()
				.formLogin().disable()
				.httpBasic().disable()
				.authorizeRequests()
				.requestMatchers(CorsUtils::isPreFlightRequest).permitAll()
				.antMatchers("/api/join").permitAll() //회원 가입
				.antMatchers("/api/login").permitAll() // 로그인
				.antMatchers("/api/movies").permitAll()
				.antMatchers("/api/admin").permitAll()
				.antMatchers("/").permitAll()
				.antMatchers("/login").permitAll()
				.antMatchers("/join").permitAll()
				.antMatchers("/user").permitAll()
				.antMatchers("/admin").permitAll()
				.antMatchers("/moviedetail/*").permitAll()
				.antMatchers("/movieCreate").permitAll()
				.antMatchers("/api/user/role").hasRole("USER")
				.antMatchers("/api/movie/delete/*").hasRole("ADMIN")
				.antMatchers("/api/admin/role").hasRole("ADMIN")
				.antMatchers("/api/control/role").permitAll()
				.antMatchers("/moviesearch/*").permitAll()
				.antMatchers("/user/moviesearch/*").permitAll()
				.antMatchers("/admin/moviesearch/*").permitAll()
				.antMatchers("/api/movie/search/*").permitAll()
				.antMatchers("/api/review/create/*").hasRole("USER")
				.antMatchers("/api/review/movie/all/*").permitAll()
				.antMatchers("/api/review").hasRole("USER")
				.antMatchers("/api/review/delete/*").hasRole("USER")
				.antMatchers("/myinfo").permitAll()
				.antMatchers("/admindetail/*").permitAll()
				.anyRequest().authenticated();
		http.cors();
		http.addFilterBefore(new JwtAuthorizationFilter(tokenProvider, userRepository), UsernamePasswordAuthenticationFilter.class);
		http.addFilterBefore(new JwtAuthenticationFilter(authenticationManager(), tokenProvider), UsernamePasswordAuthenticationFilter.class);

	}

}
