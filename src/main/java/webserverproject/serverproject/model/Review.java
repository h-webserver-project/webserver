package webserverproject.serverproject.model;

import webserverproject.serverproject.jpaAuditing.JpaAuditingConfiguration;

import javax.persistence.*;

@Entity
public class Review extends JpaAuditingConfiguration {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name ="Review_Id")
    private  long id;


    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "User_Id")
    private  User user;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "Movie_Id")
    private  Movie movie;


    @Column(nullable = false)
    private String title;
    @Column(nullable = false)
    private String content;
    @Column(nullable = false)
    private long grade;

    public Review() {

    }


    public Review( User user, Movie movie, String title, String content, long grade) {
        this.user = user;
        this.movie = movie;
        this.title = title;
        this.content = content;
        this.grade = grade;
    }

    public long getId() {
        return id;
    }

    public User getUser() {
        return user;
    }

    public Movie getMovie() {
        return movie;
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
