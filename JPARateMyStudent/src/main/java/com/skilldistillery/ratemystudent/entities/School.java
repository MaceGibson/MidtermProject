package com.skilldistillery.ratemystudent.entities;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;

@Entity
public class School {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	
	@OneToMany(mappedBy="school")
	private List<User> users;
	
	public School() {}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	@Override
	public String toString() {
		return "School [id=" + id + ", name=" + name + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		School other = (School) obj;
		return id == other.id;
	}
	
	public void addUser(User user) {
		if(users == null) {
			users = new ArrayList<>();
		}
		if(!users.contains(user)) {
			users.add(user);
			if(user.getSchool() != null) {
				user.getSchool().removeUser(user);
			}
			user.setSchool(this);
		}
	}
	
	public void removeUser(User user) {
		if (users != null && users.contains(user)) {
			users.remove(user);
			user.setSchool(null);
		}
	}
	

}
