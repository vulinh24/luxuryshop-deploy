package com.luxuryshop.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.luxuryshop.entities.Discount;

@Repository
public interface DiscountRepository extends JpaRepository<Discount, Integer>{
	public Discount findByName(String name);
}
