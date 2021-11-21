package com.luxuryshop.repositories;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.luxuryshop.entities.Cart;
import com.luxuryshop.entities.primarykey.PKOfCart;

@Repository
public interface CartRepository extends JpaRepository<Cart, PKOfCart> {

	@Query(value = "FROM Cart c WHERE c.user.username = ?1")
	public List<Cart> findByUserName(String username);
	
	@Transactional
	@Modifying
	@Query(value= "DELETE FROM Cart c WHERE c.user.id = ?1")
	public int deleteByUserId(Integer id);
}
