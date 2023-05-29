package webserverproject.serverproject.responseDTO.movieDTO;

import webserverproject.serverproject.model.Movie;

public class MovieGetResponseDTO {

    private long id;
    private  String tile;
    private String imgUrl;

    private  long averageGrade;

    public long getId() {
        return id;
    }

    public String getTile() {
        return tile;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public long getAverageGrade() {
        return averageGrade;
    }

    private MovieGetResponseDTO(long id, String tile, String imgUrl, long averageGrade) {
        this.id = id;
        this.tile = tile;
        this.imgUrl = imgUrl;
        this.averageGrade = averageGrade;
    }

    public static  MovieGetResponseDTO movieGetResponseDTO(Movie movie){
        return  new MovieGetResponseDTO(movie.getId(), movie.getTitle(), movie.getImgUrl(), movie.getAverageGrade());
    }
}
