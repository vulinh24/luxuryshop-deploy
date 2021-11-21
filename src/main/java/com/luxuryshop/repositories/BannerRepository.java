package com.luxuryshop.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.luxuryshop.entities.Banner;

@Repository
public interface BannerRepository extends JpaRepository<Banner, Integer>{

}
