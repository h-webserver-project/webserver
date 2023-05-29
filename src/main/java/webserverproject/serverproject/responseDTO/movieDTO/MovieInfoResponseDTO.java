package webserverproject.serverproject.responseDTO.movieDTO;

import webserverproject.serverproject.model.Movie;

public class MovieInfoResponseDTO {

    private  String title;
    private  String director;
    private  String imgUrl;
    private  String productYear;
    private  String summary;
    private  long averageGrade;


    private MovieInfoResponseDTO(String title, String director, String imgUrl, String productYear, String summary, long averageGrade) {
        this.title = title;
        this.director = director;
        this.imgUrl = imgUrl;
        this.productYear = productYear;
        this.summary = summary;
        this.averageGrade = averageGrade;
    }

    public static  MovieInfoResponseDTO toMovieInfoResponseDTO(Movie movie){
        return new MovieInfoResponseDTO(movie.getTitle(), movie.getDirector(),movie.getImgUrl(),movie.getProductYear(),movie.getSummary(), movie.getAverageGrade());
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

    public long getAverageGrade() {
        return averageGrade;
    }
}
