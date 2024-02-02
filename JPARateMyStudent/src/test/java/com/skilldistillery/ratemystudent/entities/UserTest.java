package com.skilldistillery.ratemystudent.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

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
    private User User;

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
        User = em.find(User.class, 2);
    }

    @AfterEach
    void tearDown() throws Exception {
        User = null;
        em.close();
    }

    @Test
    void test_User_has_Username() {
        assertNotNull(User);
        assertNotNull(User.getUsername());
        assertEquals("Jblack", User.getUsername());
        assertEquals("Jack", User.getFirstName());
        assertEquals("Jblack@SOR.com", User.getEmail());

    }
    
    @Test
    void test_User_has_school() {
    	assertNotNull(User);
    	assertNotNull(User.getSchool());
    	
    }
    
   
}
