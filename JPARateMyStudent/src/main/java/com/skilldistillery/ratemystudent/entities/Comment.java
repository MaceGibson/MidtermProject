package com.skilldistillery.ratemystudent.entities;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;

@Entity
public class Comment {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@ManyToOne
	@JoinColumn(name="review_id")
	private Review review;

	@ManyToOne
	@JoinColumn(name = "in_reply_to")
	private Comment inReplyTo;

	@OneToMany(mappedBy="inReplyTo")
	private List<Comment> comments;

	@Column(name = "created_at")
	private LocalDateTime createdAt;
	
	@Column(name="comment_text")
	private String commentText;
	

	public Comment() {

	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public Review getReview() {
		return review;
	}


	public void setReview(Review review) {
		this.review = review;
	}


	public Comment getInReplyTo() {
		return inReplyTo;
	}


	public void setInReplyTo(Comment inReplyTo) {
		this.inReplyTo = inReplyTo;
	}


	public List<Comment> getComments() {
		return comments;
	}


	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}


	public LocalDateTime getCreatedAt() {
		return createdAt;
	}


	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}


	public String getCommentText() {
		return commentText;
	}


	public void setCommentText(String commentText) {
		this.commentText = commentText;
	}


	@Override
	public String toString() {
		return "Comment [id=" + id + ", inReplyTo=" + inReplyTo + ", num comments=" + comments.size() + ", createdAt=" + createdAt
				+ ", commentText=" + commentText + "]";
	}


	@Override
	public int hashCode() {
		return Objects.hash(id);
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Comment other = (Comment) obj;
		return id == other.id;
	}

}