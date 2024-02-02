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

class StudentTest {

	private static EntityManagerFactory emf;
    private EntityManager em;
    private Student student;

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
        student = em.find(Student.class, 1);
    }

    @AfterEach
    void tearDown() throws Exception {
    	student = null;
        em.close();
    }

    @Test
    void test_mapping() {
        assertNotNull(student);
        assertNotNull(student.getSchool());
        assertEquals("Allan", student.getFirstName());
        assertEquals("Meyer", student.getLastName());
        assertEquals(2027, student.getGraduationYear());
        assertEquals(3, student.getSchool().getId());
    }
}
