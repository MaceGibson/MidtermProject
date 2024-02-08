package com.skilldistillery.ratemystudent.entities;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

class SubjectTest {

	private static EntityManagerFactory emf;
    private EntityManager em;
    private Subject subject;

    @BeforeAll
    static void setUpBeforeClass() throws Exception {
        emf = Persistence.createEntityManagerFactory("JPARateMyStudent");
    }

    @AfterAll
    static void tearDownAfterClass() throws Exception {
        emf.close();
    }

    @BeforeEach
    void setUp() throws Exception {
        em = emf.createEntityManager();
        subject = em.find(Subject.class, 3);

    }

    @AfterEach
    void tearDown() throws Exception {
        subject = null;
        em.close();
    }

    @Test
    void test_Subject_has_name() {
        assertNotNull(subject);
        assertNotNull(subject.getName());
        assertEquals("Transfiguration", subject.getName());
    }

    @Test
    void test_Subject_has_reviews() {
    	assertNotNull(subject);
    	assertNotNull(subject.getReviews());
    	assertFalse(subject.getReviews().isEmpty());
    }
    
    @Test
    void test_Subject_has_Users() {
    	assertNotNull(subject);
    	assertNotNull(subject.getUsers());
    	assertFalse(subject.getUsers().isEmpty());
    }
}
