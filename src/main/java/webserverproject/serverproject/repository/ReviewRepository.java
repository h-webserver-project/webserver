package webserverproject.serverproject.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import webserverproject.serverproject.model.Movie;
import webserverproject.serverproject.model.Review;
import webserverproject.serverproject.model.User;

import java.util.List;

@Repository
public interface ReviewRepository extends JpaRepository<Review, Long> {
    List<Review> findAllByMovie(Movie movie);

    List<Review> findAllByUser(User user);

    Review findReviewByIdAndUser(long reviewId, User user);
}
