package webserverproject.serverproject.service.movie;

import org.springframework.security.core.Authentication;
import webserverproject.serverproject.requestDTO.movieDTO.MovieCreateDTO;
import webserverproject.serverproject.responseDTO.movieDTO.MovieCreateResponseDTO;
import webserverproject.serverproject.responseDTO.movieDTO.MovieGetResponseDTO;
import webserverproject.serverproject.responseDTO.movieDTO.MovieInfoResponseDTO;

import java.util.List;

public interface MovieServiceImpl {

    MovieCreateResponseDTO create(Authentication authentication, MovieCreateDTO movieCreateDTO);

    List<MovieGetResponseDTO> getMovie();

    MovieInfoResponseDTO getInfoMovie(long movieId);

    void deleteMovie(long movieId);

}
