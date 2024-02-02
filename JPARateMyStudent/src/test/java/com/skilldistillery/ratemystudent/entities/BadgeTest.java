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

class BadgeTest {

	private static EntityManagerFactory emf;
    private EntityManager em;
    private Badge badge;

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
        badge = em.find(Badge.class, 1);
    }

    @AfterEach
    void tearDown() throws Exception {
        badge = null;
        em.close();
    }

    @Test
    void test_Badge_has_Badgename() {
        assertNotNull(badge);
        assertNotNull(badge.getName());

        assertEquals("Hard Worker", badge.getName());

    }
    
   
}

