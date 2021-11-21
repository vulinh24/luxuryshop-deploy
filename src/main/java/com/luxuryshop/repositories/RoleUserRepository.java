package com.luxuryshop.repositories;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.luxuryshop.entities.RoleOfUser;
import com.luxuryshop.entities.primarykey.PKOfRoleUser;

@Repository
public interface RoleUserRepository extends JpaRepository<RoleOfUser, PKOfRoleUser>{
	
	@Modifying
	@Transactional
	@Query(value = "DELETE FROM RoleOfUser ru WHERE ru.pk.userId = ?1")
	public int deleteUser(Integer id);
}
