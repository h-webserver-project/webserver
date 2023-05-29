package webserverproject.serverproject.requestDTO.movieDTO;

import webserverproject.serverproject.model.Movie;

public class MovieUpdateDTO {
    private  String title;
    private  String director;
    private  String imgUrl;
    private  String productYear;
    private  String summary;


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
