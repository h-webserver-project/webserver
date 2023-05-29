package webserverproject.serverproject.responseDTO.reviewResponseDTO;

import webserverproject.serverproject.model.Review;

public class ReviewCreateResponseDTO {
    private String title;
    private String content;
    private  long grade;

    public String getTitle() {
        return title;
    }

    public String getContent() {
        return content;
    }

    public long getGrade() {
        return grade;
    }

    private ReviewCreateResponseDTO(String title, String content, long grade) {
        this.title = title;
        this.content = content;
        this.grade = grade;
    }

    public static ReviewCreateResponseDTO toReviewCreateResponseDTO(Review review){
        return  new ReviewCreateResponseDTO(review.getTitle(),review.getContent(),review.getGrade());
    }


}
