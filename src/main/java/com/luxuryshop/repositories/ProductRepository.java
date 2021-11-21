package com.luxuryshop.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.luxuryshop.entities.Product;
@Repository
public interface ProductRepository extends JpaRepository<Product, Integer>{
	public List<Product> findByIsHotTrue();
	public List<Product> findByIsNewTrue();
	public List<Product> findByIsSaleTrue();
	public List<Product> findBySeo(String seo);
}
