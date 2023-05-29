package webserverproject.serverproject.restController.review;

import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.parameters.P;
import org.springframework.web.bind.annotation.*;
import webserverproject.serverproject.requestDTO.reviewDTO.ReviewCreateDTO;
import webserverproject.serverproject.responseDTO.reviewResponseDTO.ReviewCreateResponseDTO;
import webserverproject.serverproject.responseDTO.reviewResponseDTO.ReviewMovieAllResponseDTO;
import webserverproject.serverproject.service.review.ReviewServiceImpl;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class ReviewController {
    private final ReviewServiceImpl reviewService;

    public ReviewController(ReviewServiceImpl reviewService) {
        this.reviewService = reviewService;
    }

    @PostMapping("/api/review/create/{movieId}")
    public ResponseEntity<?> createReview(@PathVariable(value = "movieId") long movieId, Authentication authentication,@RequestBody @Valid ReviewCreateDTO reviewCreateDTO){
        ReviewCreateResponseDTO reviewCreateResponseDTO = reviewService.createReview(authentication,movieId,reviewCreateDTO);

        return ResponseEntity.ok().body(createResponse(reviewCreateResponseDTO,"리뷰생성이 완료 되었습니다."));
    }
    // 해당 영화 리뷰 조회
    @GetMapping("/api/review/movie/all/{movieId}")
    public ResponseEntity<?> movieReviewAll(@PathVariable(value = "movieId") long movieId){

        List<ReviewMovieAllResponseDTO> reviewMovieAllResponseDTOS = reviewService.reviewMovieAll(movieId);

        return ResponseEntity.ok().body(createResponse(reviewMovieAllResponseDTOS,"해당 영화 리뷰 전체 조회"));
    }

    // 자기가 쓴 리뷰 조회
    @GetMapping("/api/reviews")
    public ResponseEntity<?> reviews(Authentication authentication){
        List<ReviewMovieAllResponseDTO> reviewMovieAllResponseDTOS = reviewService.reviews(authentication);

        return ResponseEntity.ok().body(createResponse(reviewMovieAllResponseDTOS,"나의 리뷰 조회를 성공 하였습니다."));
    }

    @DeleteMapping("/api/review/delete/{reviewId}")
    public ResponseEntity<?> deleteReview(@PathVariable(value = "reviewId") long reviewId, Authentication authentication){
        reviewService.deleteReview(reviewId,authentication);
        return ResponseEntity.ok().body("리뷰 삭제가 성공 하였습니다.");
    }

    private Map<String,Object> createResponse(Object object, String msg){
        Map<String, Object> response = new HashMap<>();
        response.put("msg", msg);
        response.put("data", object);
        return response;
    }

}
