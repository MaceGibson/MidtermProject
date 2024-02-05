package com.skilldistillery.ratemystudent.data;

import java.util.List;

import org.springframework.stereotype.Service;

import com.skilldistillery.ratemystudent.entities.School;
import com.skilldistillery.ratemystudent.entities.Student;
import com.skilldistillery.ratemystudent.entities.User;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;


@Service
@Transactional
public class UserDAOImpl implements UserDAO{
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public User authenticateUser(String username, String password) {
		String query= "SELECT u FROM User u WHERE u.username = :username AND u.password = :password";
		User u = em.createQuery(query, User.class)
				.setParameter("username", username)
				.setParameter("password", password)
				.getSingleResult();
		return u;
	}

	@Override
	public List<School> searchByschool(String keyword) {
		String jpql = "SELECT s FROM School s WHERE s.name LIKE :keyword";
        return em.createQuery(jpql, School.class)
                .setParameter("keyword", "%" + keyword + "%")
                .getResultList();
    }

	@Override
	public List<Student> searchByStudent(String keyword) {
		String jpql = "SELECT s FROM Student s WHERE s.firstName LIKE :keyword OR s.lastName LIKE :keyword";
		return em.createQuery(jpql, Student.class)
				.setParameter("keyword","%"+ keyword+"%")
				.getResultList();
	}

	@Override
	public Student findByStudentId(int id) {
		return em.find(Student.class, id);
	}

	@Override
	public School findBySchoolId(int id) {
		return em.find(School.class, id);
	}

}
