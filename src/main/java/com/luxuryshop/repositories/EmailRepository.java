package com.luxuryshop.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.luxuryshop.entities.NotificationEmail;

@Repository
public interface EmailRepository extends JpaRepository<NotificationEmail, Integer>{

}
