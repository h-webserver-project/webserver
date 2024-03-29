package webserverproject.serverproject.responseDTO.reviewResponseDTO;

import webserverproject.serverproject.model.Review;

public class ReviewMovieAllResponseDTO {



    private long id;
    private String title;
    private String content;
    private  long grade;
    private String nickName;
    private  String movieTitle;
    private  long movieId;


    public String getMovieTitle() {
        return movieTitle;
    }

    public long getMovieId() {
        return movieId;
    }

    public String getNickName() {
        return nickName;
    }

    public long getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getContent() {
        return content;
    }

    public long getGrade() {
        return grade;
    }



    public ReviewMovieAllResponseDTO(long id, String title, String content, long grade, String nickName,String movieTitle, long  movieId) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.grade = grade;
        this.nickName = nickName;
        this.movieTitle = movieTitle;
        this.movieId = movieId;
    }

    public static ReviewMovieAllResponseDTO toReviewMovieAllResponseDTO(Review review){
        return  new ReviewMovieAllResponseDTO(review.getId(),review.getTitle(),review.getContent(),review.getGrade(), review.getUser().getNickName(),review.getMovie().getTitle(),review.getMovie().getId());
    }
}
