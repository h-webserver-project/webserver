package webserverproject.serverproject.service.movie;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import webserverproject.serverproject.auth.PrincipalDetails;
import webserverproject.serverproject.error.CustomException;
import webserverproject.serverproject.error.ErrorCode;
import webserverproject.serverproject.model.Movie;
import webserverproject.serverproject.model.Review;
import webserverproject.serverproject.model.User;
import webserverproject.serverproject.repository.MovieRepository;
import webserverproject.serverproject.repository.ReviewRepository;
import webserverproject.serverproject.requestDTO.movieDTO.MovieCreateDTO;
import webserverproject.serverproject.responseDTO.movieDTO.MovieCreateResponseDTO;
import webserverproject.serverproject.responseDTO.movieDTO.MovieGetResponseDTO;
import webserverproject.serverproject.responseDTO.movieDTO.MovieInfoResponseDTO;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;


@Service
@Transactional
public class MovieService implements MovieServiceImpl {

    private  final MovieRepository movieRepository;
    private final ReviewRepository reviewRepository;

    public MovieService(MovieRepository movieRepository, ReviewRepository reviewRepository) {
        this.movieRepository = movieRepository;
        this.reviewRepository = reviewRepository;
    }


    // 영화 생성
    @Override
    public MovieCreateResponseDTO create(Authentication authentication, MovieCreateDTO movieCreateDTO) {
        User user  = ((PrincipalDetails) authentication.getPrincipal()).getUser();
        Movie movie = movieCreateDTO.toMovieEntity(user);
        movieRepository.save(movie);
        return MovieCreateResponseDTO.toMoveCreateResponseDTO(movie);
    }

    @Override
    public List<MovieGetResponseDTO> getMovie() {
        List<Movie> movies = movieRepository.findAll();
        List<MovieGetResponseDTO> movieGetResponseDTOS = new ArrayList<>();

        for(Movie movie : movies){
            movieGetResponseDTOS.add(MovieGetResponseDTO.movieGetResponseDTO(movie));
        }
        Collections.reverse(movieGetResponseDTOS);
        return movieGetResponseDTOS;
    }

    @Override
    public MovieInfoResponseDTO getInfoMovie(long movieId) {
        Movie movie = movieRepository.findById(movieId).orElseThrow(
                ()-> new CustomException(ErrorCode.NotFoundMovieException)
        );
        return  MovieInfoResponseDTO.toMovieInfoResponseDTO(movie);
    }

    @Override
    public void deleteMovie(long movieId) {
        Movie movie = movieRepository.findById(movieId).orElseThrow(
                ()-> new CustomException(ErrorCode.NotFoundMovieException)
        );

        List<Review> reviews = reviewRepository.findAllByMovie(movie);

        for(Review review : reviews){
            reviewRepository.delete(review);
        }
        movieRepository.delete(movie);
    }

    @Override
    public List<MovieGetResponseDTO> searchMovie(String title) {
        List<Movie> movies = movieRepository.findSearchMovie(title);
        List<MovieGetResponseDTO> movieGetResponseDTOS = new ArrayList<>();

        for(Movie movie : movies){
            movieGetResponseDTOS.add(MovieGetResponseDTO.movieGetResponseDTO(movie));
        }
        Collections.reverse(movieGetResponseDTOS);
        return movieGetResponseDTOS;
    }
}
