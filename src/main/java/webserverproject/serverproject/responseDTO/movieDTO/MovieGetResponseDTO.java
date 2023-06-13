package webserverproject.serverproject.responseDTO.movieDTO;

import webserverproject.serverproject.model.Movie;

public class MovieGetResponseDTO {

    private long id;
    private  String title;
    private String imgUrl;
    private String director;
    private  String productYear;

    public String getProductYear() {
        return productYear;
    }

    public String getDirector() {
        return director;
    }

    private  long averageGrade;

    public long getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public long getAverageGrade() {
        return averageGrade;
    }

    private MovieGetResponseDTO(long id, String title,String director,String productYear ,String imgUrl, long averageGrade) {
        this.id = id;
        this.title = title;
        this.imgUrl = imgUrl;
        this.director = director;
        this.productYear = productYear;
        this.averageGrade = averageGrade;
    }

    public static  MovieGetResponseDTO movieGetResponseDTO(Movie movie){
        return  new MovieGetResponseDTO(movie.getId(), movie.getTitle(),movie.getDirector(), movie.getProductYear(), movie.getImgUrl(), movie.getAverageGrade());
    }
}
