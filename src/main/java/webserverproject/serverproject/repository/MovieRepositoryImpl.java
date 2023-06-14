package webserverproject.serverproject.repository;

import com.querydsl.core.types.dsl.BooleanExpression;
import com.querydsl.jpa.impl.JPAQueryFactory;
import org.springframework.util.StringUtils;
import webserverproject.serverproject.model.Movie;
import webserverproject.serverproject.model.QMovie;

import java.util.List;

public class MovieRepositoryImpl implements MovieRepositoryCustom{
    private  final JPAQueryFactory jpaQueryFactory;

    public MovieRepositoryImpl(JPAQueryFactory jpaQueryFactory) {
        this.jpaQueryFactory = jpaQueryFactory;
    }
    QMovie movie = QMovie.movie;

    private BooleanExpression eqTitle(String title){
        if(StringUtils.isEmpty(title)){
            return null;
        }
        return (movie.title.contains(title));

    }


    @Override
    public List<Movie> findSearchMovie(String title) {
        return (List<Movie>)jpaQueryFactory.from(movie).where(eqTitle(title)).fetch();
    }
}
