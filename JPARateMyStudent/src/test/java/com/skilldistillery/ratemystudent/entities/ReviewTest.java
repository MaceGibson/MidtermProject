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

class ReviewTest {

	private static EntityManagerFactory emf;
    private EntityManager em;
    private Review review;

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
        review = em.find(Review.class, 1);
    }

    @AfterEach
    void tearDown() throws Exception {
    	review = null;
        em.close();
    }

    @Test
    void test_mapping() {
    	 assertNotNull(review);
         assertEquals("This is a review!", review.getReviewText());
         assertNotNull(review.getUser());
         assertNotNull(review.getStudent());
         assertEquals(4, review.getRating());
         assertNotNull(review.getSubject());
    }
    
    @Test
    void test_Review_has_badges() {
    	assertNotNull(review);
    	assertNotNull(review.getBadges());
    	assertFalse(review.getBadges().isEmpty());
    }
    
    @Test
    void test_Review_has_comments() {
    	assertNotNull(review);
    	assertNotNull(review.getComments());
    	assertFalse(review.getComments().isEmpty());
    }
}
