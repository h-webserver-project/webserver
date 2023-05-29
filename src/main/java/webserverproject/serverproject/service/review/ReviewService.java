package webserverproject.serverproject.service.review;

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
import webserverproject.serverproject.requestDTO.reviewDTO.ReviewCreateDTO;
import webserverproject.serverproject.responseDTO.reviewResponseDTO.ReviewCreateResponseDTO;
import webserverproject.serverproject.responseDTO.reviewResponseDTO.ReviewMovieAllResponseDTO;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Service
@Transactional
public class ReviewService implements ReviewServiceImpl{

    private  final MovieRepository movieRepository;
    private  final ReviewRepository reviewRepository;

    public ReviewService(MovieRepository movieRepository, ReviewRepository reviewRepository) {
        this.movieRepository = movieRepository;
        this.reviewRepository = reviewRepository;
    }

    @Override
    public ReviewCreateResponseDTO createReview(Authentication authentication, long movieId, ReviewCreateDTO reviewCreateDTO) {

        User user = ((PrincipalDetails)authentication.getPrincipal()).getUser();
        Movie movie = movieRepository.findById(movieId).orElseThrow(
                ()-> new CustomException(ErrorCode.NotFoundMovieException)
        );
        if(reviewCreateDTO.getGrade()>5 || reviewCreateDTO.getGrade()<0){
            throw  new CustomException(ErrorCode.BadGradeException);
        }

        Review review = reviewCreateDTO.toReviewEntity(user,movie);
        reviewRepository.save(review);

        List<Review> reviews = reviewRepository.findAllByMovie(movie); // 영화 생성
        long average = 0;
        for(Review r : reviews){
            average = average +r.getGrade();
        }
        long averageGrade = average/reviews.size();
        movie.setAverageGrade(averageGrade); // 영화 평점 조정
        movieRepository.save(movie);


        return ReviewCreateResponseDTO.toReviewCreateResponseDTO(review);
    }

    @Override
    public List<ReviewMovieAllResponseDTO> reviewMovieAll(long movieId) {

        Movie movie = movieRepository.findById(movieId).orElseThrow(
                ()-> new CustomException(ErrorCode.NotFoundMovieException)
        );
        List<Review> reviewList = reviewRepository.findAllByMovie(movie);
        List<ReviewMovieAllResponseDTO> reviewMovieAllResponseDTOS = new ArrayList<>();
        for(Review review : reviewList){
            reviewMovieAllResponseDTOS.add(ReviewMovieAllResponseDTO.toReviewMovieAllResponseDTO(review));
        }
        Collections.reverse(reviewMovieAllResponseDTOS);
        return  reviewMovieAllResponseDTOS;
    }

    @Override
    public List<ReviewMovieAllResponseDTO> reviews(Authentication authentication) {
        User user = ((PrincipalDetails) authentication.getPrincipal()).getUser();
        List<Review> reviews = reviewRepository.findAllByUser(user);
        List<ReviewMovieAllResponseDTO> reviewMovieAllResponseDTOS = new ArrayList<>();

        for(Review review : reviews){
            reviewMovieAllResponseDTOS.add(ReviewMovieAllResponseDTO.toReviewMovieAllResponseDTO(review));
        }
        Collections.reverse(reviewMovieAllResponseDTOS);
        return  reviewMovieAllResponseDTOS;
    }

    @Override
    public void deleteReview(long reviewId, Authentication authentication) {
        User user = ((PrincipalDetails) authentication.getPrincipal()).getUser();
        Review review = reviewRepository.findReviewByIdAndUser(reviewId, user);
        reviewRepository.delete(review);

    }


}
