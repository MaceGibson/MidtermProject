package com.skilldistillery.ratemystudent.data;

import java.util.List;

import com.skilldistillery.ratemystudent.entities.School;
import com.skilldistillery.ratemystudent.entities.Student;

public interface SchoolDAO {

	List<School> searchByschool (String keyword);
	School findBySchoolId(int id);
	public School createSchool(String schoolName);
	public Student createStudent(Student student, int schoolId);
}
