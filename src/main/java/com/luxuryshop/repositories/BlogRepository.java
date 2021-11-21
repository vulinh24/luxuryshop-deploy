package com.luxuryshop.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.luxuryshop.entities.Blog;
@Repository
public interface BlogRepository extends JpaRepository<Blog, Integer>{

}
