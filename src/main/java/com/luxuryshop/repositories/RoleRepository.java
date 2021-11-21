package com.luxuryshop.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.luxuryshop.entities.Role;
@Repository
public interface RoleRepository extends JpaRepository<Role, Integer>{
	public Role findByName(String name);
}
