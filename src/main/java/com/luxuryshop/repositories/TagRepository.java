package com.luxuryshop.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.luxuryshop.entities.Tag;
@Repository
public interface TagRepository extends JpaRepository<Tag, Integer>{

}
