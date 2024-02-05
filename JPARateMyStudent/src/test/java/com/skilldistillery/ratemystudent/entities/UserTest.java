package com.skilldistillery.ratemystudent.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

class UserTest {

	private static EntityManagerFactory emf;
    private EntityManager em;
    private User user;

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
        user = em.find(User.class, 2);

    }

    @AfterEach
    void tearDown() throws Exception {
        user = null;
        em.close();
    }

    @Test
    void test_User_has_Username() {
        assertNotNull(user);
        assertNotNull(user.getUsername());
        assertEquals("Jblack", user.getUsername());
        assertEquals("Jack", user.getFirstName());
        assertEquals("Jblack@SOR.com", user.getEmail());

    }
    
    @Test
    void test_User_has_school() {
    	assertNotNull(user);
    	assertNotNull(user.getSchool());
    	assertEquals("School Of Rock", user.getSchool().getName());
    }

    @Test
    void test_User_has_subject() {
    	assertNotNull(user);
    	assertNotNull(user.getSubject());
    	assertEquals("music", user.getSubject().getName());
    }
    
    @Test
    void test_user_has_reviews() {
    	assertNotNull(user);
    	assertNotNull(user.getReviews());
    	assertFalse(user.getReviews().isEmpty());
    }
   
}
