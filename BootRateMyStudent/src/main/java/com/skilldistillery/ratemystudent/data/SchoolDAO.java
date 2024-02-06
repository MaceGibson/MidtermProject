package com.skilldistillery.ratemystudent.data;

import java.util.List;

import com.skilldistillery.ratemystudent.entities.School;

public interface SchoolDAO {

	List<School> searchByschool (String keyword);
	School findBySchoolId(int id);
	School createSchool(School school);
}
