package com.skilldistillery.ratemystudent.data;

import java.util.List;

import org.springframework.stereotype.Service;

import com.skilldistillery.ratemystudent.entities.School;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Service
@Transactional
public class SchoolDAOImpl implements SchoolDAO{

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public List<School> searchByschool(String keyword) {
		String jpql = "SELECT s FROM School s WHERE s.name LIKE :keyword";
		return em.createQuery(jpql, School.class).setParameter("keyword", "%" + keyword + "%").getResultList();
	}
	
	@Override
	public School findBySchoolId(int id) {
		return em.find(School.class, id);
	}
}
