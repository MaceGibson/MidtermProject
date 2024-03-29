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

class SchoolTest {

	private static EntityManagerFactory emf;
    private EntityManager em;
    private School school;

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
        school = em.find(School.class, 1);
    }

    @AfterEach
    void tearDown() throws Exception {
        school = null;
        em.close();
    }

    @Test
    void test_School_has_Schoolname() {
        assertNotNull(school);
        assertNotNull(school.getName());
        assertEquals("Hogwarts School of Witchcraft and Wizardry", school.getName());
    }
    
    @Test
    void test_School_has_Users() {
    	assertNotNull(school);
    	assertNotNull(school.getUsers());
    	assertFalse(school.getUsers().isEmpty());
    }
    
    @Test
    void test_School_has_students() {
    	assertNotNull(school);
    	assertNotNull(school.getStudents());
    	assertFalse(school.getStudents().isEmpty());
    }
   
}

