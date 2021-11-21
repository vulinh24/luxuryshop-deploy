package com.luxuryshop.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.stereotype.Repository;

import com.luxuryshop.entities.RateProduct;
import com.luxuryshop.entities.primarykey.PKOfCart;

@Repository
public interface RateRepository extends JpaRepository<RateProduct, PKOfCart>{
	
}
