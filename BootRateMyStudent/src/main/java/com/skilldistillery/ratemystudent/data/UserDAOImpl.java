package com.skilldistillery.ratemystudent.data;

import java.util.List;

import org.springframework.stereotype.Service;

import com.skilldistillery.ratemystudent.entities.Comment;
import com.skilldistillery.ratemystudent.entities.Review;
import com.skilldistillery.ratemystudent.entities.School;
import com.skilldistillery.ratemystudent.entities.Student;
import com.skilldistillery.ratemystudent.entities.Subject;
import com.skilldistillery.ratemystudent.entities.User;

import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Service
@Transactional
public class UserDAOImpl implements UserDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public User authenticateUser(String username, String password) {
		String query = "SELECT u FROM User u WHERE u.username = :username AND u.password = :password";
		User u = em.createQuery(query, User.class).setParameter("username", username).setParameter("password", password)
				.getSingleResult();
		return u;
	}

	

	@Override
	public List<Student> searchByStudent(String keyword) {
		String jpql = "SELECT s FROM Student s WHERE s.firstName LIKE :keyword OR s.lastName LIKE :keyword";
		return em.createQuery(jpql, Student.class).setParameter("keyword", "%" + keyword + "%").getResultList();
	}

	@Override
	public Student findByStudentId(int id) {
		return em.find(Student.class, id);
	}
	
	@Override
	public User findByUserId(int id) {
		return em.find(User.class, id);
	}

	

	@Override
	public Review findReviewById(int id) {
		return em.find(Review.class, id);
	}

	@Override
	public User getUserByUserNameAndPassword(String username, String password) {
		String jpql = "SELECT u FROM User u WHERE u.username = :username AND u.password = :password";
		User user = null;
		try {
			user = em.createQuery(jpql, User.class).setParameter("username", username)
					.setParameter("password", password).getSingleResult();
		} catch (NoResultException e) {
		}
		return user;
	}

	@Override
	public void createComment(Comment comment) {
		em.persist(comment);

	}

	@Override
	public void createReview(Review review) {
		em.persist(review);

	}

	@Override
	public Comment updateComment(int id, Comment comment) {
		Comment managedComment = em.find(Comment.class, id);
		if(managedComment != null) {
			managedComment.setCommentText(comment.getCommentText());
		}
		return managedComment;
	}

	@Override
	public Review updateReview(Review review, int subjectId) {
		Review managedReview = em.find(Review.class, review.getId());
		Subject managedSubject = em.find(Subject.class, subjectId);
		if(managedReview != null) {
		managedReview.setTitle(review.getTitle());
		managedReview.setReviewText(review.getReviewText());
		managedReview.setRating(review.getRating());
		managedReview.setSubject(managedSubject);
		}
		return managedReview;
	}

	@Override
	public boolean deleteComment(int id) {
		Comment comment = em.find(Comment.class, id);
		if (comment != null) {
			em.remove(comment);
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteReview(int id) {
		Review review = em.find(Review.class, id);
		if (review != null) {
			em.remove(review);
			return true;
		}
		return false;
	}

	@Override
	public Comment findCommentById(int id) {
		return em.find(Comment.class, id);
	}

	@Override
	public Subject findSubjectById(int subjectId) {
		return em.find(Subject.class, subjectId);
	}

}
