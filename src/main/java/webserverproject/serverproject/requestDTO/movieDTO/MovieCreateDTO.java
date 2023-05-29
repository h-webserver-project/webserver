package webserverproject.serverproject.requestDTO.movieDTO;

import webserverproject.serverproject.model.Movie;
import webserverproject.serverproject.model.User;

import javax.validation.constraints.NotBlank;

public class MovieCreateDTO {

    @NotBlank
    private  String title;
    @NotBlank
    private  String director;
    @NotBlank
    private  String imgUrl;
    @NotBlank
    private  String productYear;
    @NotBlank
    private  String summary;




    public Movie toMovieEntity(User user){
        return new Movie(user, this.title, this.director, this.imgUrl, this.productYear, this.summary);
    }

    public String getTitle() {
        return title;
    }

    public String getDirector() {
        return director;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public String getProductYear() {
        return productYear;
    }

    public String getSummary() {
        return summary;
    }


}
