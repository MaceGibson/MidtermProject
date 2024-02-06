package com.skilldistillery.ratemystudent.entities;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import org.hibernate.annotations.CreationTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "review")
public class Review {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String title;

	@Column(name = "review_text")
	private String reviewText;

	@ManyToOne
	@JoinColumn(name = "teacher_id")
	private User user;

	@ManyToOne
	@JoinColumn(name = "student_id")
	private Student student;

	private int rating;

	@ManyToOne
	@JoinColumn(name = "subject_id")
	private Subject subject;

	@CreationTimestamp
	@Column(name = "created_at")
	private LocalDateTime createdAt;

	@ManyToMany
	@JoinTable(name = "review_badge", joinColumns = @JoinColumn(name = "review_id"), inverseJoinColumns = @JoinColumn(name = "badge_id"))
	private List<Badge> badges;

	@OneToMany(mappedBy = "review")
	private List<Comment> comments;

	// no arg constructor
	public Review() {

	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getReviewText() {
		return reviewText;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<Badge> getBadges() {
		return badges;
	}

	public void setBadges(List<Badge> badges) {
		this.badges = badges;
	}

	public void setReviewText(String reviewText) {
		this.reviewText = reviewText;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public Subject getSubject() {
		return subject;
	}

	public void setSubject(Subject subject) {
		this.subject = subject;
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}

	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

	public void addComment(Comment comment) {
		if (comments == null) {
			comments = new ArrayList<>();
		}
		if (!comments.contains(comment)) {
			comments.add(comment);

			if (comment.getReview() != null) {
				comment.getReview().removeComment(comment);
			}
			comment.setReview(this);
		}
	}

	public void removeComment(Comment comment) {
		if (comments != null && comments.contains(comment)) {
			comments.remove(comment);
			comment.setReview(null);
		}
	}

	public void addBadge(Badge badge) {
		if (badges == null) {
			badges = new ArrayList<>();
			if (!badges.contains(badge)) {
				badges.add(badge);
				badge.addReview(this);
			}
		}
	}

	public void removeBadge(Badge badge) {
		if (badges != null && badges.contains(badge)) {
			badges.remove(badge);
			badge.removeReview(this);
		}
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
		Review other = (Review) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "Review [id=" + id + ", title=" + title + ", reviewText=" + reviewText + ", user=" + user + ", student="
				+ student + ", rating=" + rating + ", subject=" + subject + ", createdAt=" + createdAt + "]";
	}

	
}
