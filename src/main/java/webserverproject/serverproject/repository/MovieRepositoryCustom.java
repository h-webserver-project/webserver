package webserverproject.serverproject.repository;

import webserverproject.serverproject.model.Movie;

import java.util.List;

public interface MovieRepositoryCustom {
    List<Movie> findSearchMovie(String title);
}
