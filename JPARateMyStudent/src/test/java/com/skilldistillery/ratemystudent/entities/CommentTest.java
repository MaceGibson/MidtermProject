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

class CommentTest {

	private static EntityManagerFactory emf;
    private EntityManager em;
    private Comment comment;

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
        comment = em.find(Comment.class, 1);
    }

    @AfterEach
    void tearDown() throws Exception {
        comment = null;
        em.close();
    }

    @Test
    void test_Comment_has_Commentname() {
        assertNotNull(comment);
        assertNotNull(comment.getCommentText());

        assertEquals("This is a comment", comment.getCommentText());

    }
    
   
}

