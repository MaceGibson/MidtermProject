package com.skilldistillery.ratemystudent.entities;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;

@Entity
public class Subject {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String name;

	@OneToMany(mappedBy = "subject")
	private List<Review> reviews;

	@OneToMany(mappedBy = "subject")
	private List<User> users;

	public Subject() {

	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Review> getReviews() {
		return reviews;
	}

	public void setReviews(List<Review> reviews) {
		this.reviews = reviews;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	public void addUser(User user) {
		if (users == null) {
			users = new ArrayList<>();
		}
		if (!users.contains(user)) {
			users.add(user);

			if (user.getSubject() != null) {
				user.getSubject().removeUser(user);
			}
			user.setSubject(this);
		}
	}

	public void removeUser(User user) {
		if (users != null && users.contains(user)) {
			users.remove(user);
			user.setSubject(null);
		}
	}

	public void addReview(Review review) {
		if (reviews == null) {
			reviews = new ArrayList<>();
		}
		if (!reviews.contains(review)) {
			reviews.add(review);

			if (review.getSubject() != null) {
				review.getSubject().removeReview(review);
			}
			review.setSubject(this);
		}
	}

	public void removeReview(Review review) {
		if (reviews != null && reviews.contains(review)) {
			reviews.remove(review);
			review.setSubject(null);
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
		Subject other = (Subject) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "Subject [id=" + id + ", name=" + name + "]";
	}

}
