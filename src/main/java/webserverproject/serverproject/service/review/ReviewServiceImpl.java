package webserverproject.serverproject.service.review;

import org.springframework.security.core.Authentication;
import webserverproject.serverproject.requestDTO.reviewDTO.ReviewCreateDTO;
import webserverproject.serverproject.responseDTO.reviewResponseDTO.ReviewCreateResponseDTO;
import webserverproject.serverproject.responseDTO.reviewResponseDTO.ReviewMovieAllResponseDTO;

import java.util.List;

public interface ReviewServiceImpl {


    ReviewCreateResponseDTO createReview(Authentication authentication, long movieId, ReviewCreateDTO reviewCreateDTO);

    List<ReviewMovieAllResponseDTO> reviewMovieAll(long movieId);

    List<ReviewMovieAllResponseDTO> reviews(Authentication authentication);
    void deleteReview(long reviewId, Authentication authentication);
}
