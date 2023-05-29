package webserverproject.serverproject.model;

import webserverproject.serverproject.jpaAuditing.JpaAuditingConfiguration;

import javax.persistence.*;

@Entity
public class Movie extends JpaAuditingConfiguration {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name ="Movie_Id")
    private  long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "User_Id")
    private  User user;



    @Column(nullable = false)
    private  String title; // 타이틀
    @Column(nullable = false)
    private  String director; // 감독
    @Column(nullable = false)
    private String imgUrl; // img url
    @Column(nullable = false)
    private String productYear; // 제작 년도
    @Column(nullable = false)
    private  String summary; // 요약

    private long averageGrade; // 평점

    //기본 생성자
    public Movie() {

    }

    public Movie(User user, String title, String director, String imgUrl, String productYear, String summary) {
        this.user = user;
        this.title = title;
        this.director = director;
        this.imgUrl = imgUrl;
        this.productYear = productYear;
        this.summary = summary;
    }

    public long getId() {
        return id;
    }

    public User getUser() {
        return user;
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

    public Movie( User user, String title, String director, String imgUrl, String productYear, String summary, long averageGrade) {

        this.user = user;
        this.title = title;
        this.director = director;
        this.imgUrl = imgUrl;
        this.productYear = productYear;
        this.summary = summary;
        this.averageGrade = averageGrade;
    }

    public void setAverageGrade(long averageGrade) {
        this.averageGrade = averageGrade;
    }
}
