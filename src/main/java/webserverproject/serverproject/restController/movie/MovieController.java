package webserverproject.serverproject.restController.movie;

import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;
import webserverproject.serverproject.auth.PrincipalDetails;
import webserverproject.serverproject.requestDTO.movieDTO.MovieCreateDTO;
import webserverproject.serverproject.responseDTO.movieDTO.MovieCreateResponseDTO;
import webserverproject.serverproject.responseDTO.movieDTO.MovieGetResponseDTO;
import webserverproject.serverproject.responseDTO.movieDTO.MovieInfoResponseDTO;
import webserverproject.serverproject.service.movie.MovieServiceImpl;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class MovieController {

    private  final MovieServiceImpl movieService;


    public MovieController(MovieServiceImpl movieService) {
        this.movieService = movieService;
    }


    // 영화 생성
    @PostMapping("/api/movie/create")
    public ResponseEntity<?> createMovie(@RequestBody @Valid MovieCreateDTO movieCreateDTO, Authentication authentication){

        MovieCreateResponseDTO movieCreateResponseDTO = movieService.create(authentication,movieCreateDTO);

        return ResponseEntity.ok().body(createResponse(movieCreateResponseDTO,"영화 생성이 완료 되었습니다."));

    }

    // 영화 전체 조회
    @GetMapping("/api/movies")
    public ResponseEntity<?> getMovies(){

        List<MovieGetResponseDTO> movieGetResponseDTOS = movieService.getMovie();

        return  ResponseEntity.ok().body(createResponse(movieGetResponseDTOS,"영화 조회가 완료 되었습니다."));
    }


    // 영화 개별 조회
    @GetMapping("/api/movie/info/{movieId}")
    public ResponseEntity<?> getMovieInfo(@PathVariable(value = "movieId") long movieId){
        MovieInfoResponseDTO movieInfoResponseDTO = movieService.getInfoMovie(movieId);

        return ResponseEntity.ok().body(createResponse(movieInfoResponseDTO,"해당영화 조회가 성공하였습니다."));

    }

    // 영화 삭제

    @DeleteMapping("/api/movie/delete/{movieId}")
    public ResponseEntity<?> deleteMovie(@PathVariable(value = "movieId") long movieId, Authentication authentication){

        System.out.println(((PrincipalDetails)authentication.getPrincipal()).getUser().getRoles());
        System.out.println("123");
        movieService.deleteMovie(movieId);
        return ResponseEntity.ok().body("영화 삭제가 완료되었습니다.");
    }

    // 영화 찾기
    @GetMapping("/api/movie/search/{search}")
    public ResponseEntity<?> searchMovie(@PathVariable(value = "search") @Valid  String search){
        List<MovieGetResponseDTO> movieSearchResponseDTOS = movieService.searchMovie(search);
        return ResponseEntity.ok().body(createResponse(movieSearchResponseDTOS,"찾기 성공"));
    }



    // 영화 수정
    //@PutMapping("/api/movie/update/{movieId}")
    //public ResponseEntity<?> updateMovie(@PathVariable(value = "movieId") long movieId, @RequestBody ){

    //}


    private Map<String,Object> createResponse(Object object, String msg){
        Map<String, Object> response = new HashMap<>();
        response.put("msg", msg);
        response.put("data", object);
        return response;
    }

}
