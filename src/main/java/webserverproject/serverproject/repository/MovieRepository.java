package webserverproject.serverproject.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import webserverproject.serverproject.model.Movie;

@Repository
public interface MovieRepository extends JpaRepository<Movie, Long> {
}
