package com.luxuryshop.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.luxuryshop.entities.Collection;
@Repository
public interface CollectionRepository extends JpaRepository<Collection, Integer>{
	
}
