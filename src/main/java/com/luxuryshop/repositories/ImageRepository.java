package com.luxuryshop.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.luxuryshop.entities.Product;
import com.luxuryshop.entities.ProductImages;
@Repository
public interface ImageRepository extends JpaRepository<ProductImages, Integer>{
	
	public List<ProductImages> findByProduct(Product product);
}
