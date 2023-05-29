package webserverproject.serverproject.requestDTO.reviewDTO;

import webserverproject.serverproject.model.Movie;
import webserverproject.serverproject.model.Review;
import webserverproject.serverproject.model.User;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

public class ReviewCreateDTO {

    @NotBlank
    private String title;
    @NotBlank
    private String content;

    @NotNull
    private  long grade;


    public Review toReviewEntity(User user, Movie movie){
        return new Review(user,movie,this.title,this.content,this.grade);
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
}
