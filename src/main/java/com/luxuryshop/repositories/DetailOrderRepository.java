package com.luxuryshop.repositories;

import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.luxuryshop.entities.DetailOrder;
import com.luxuryshop.entities.User;

@Repository
public interface DetailOrderRepository extends JpaRepository<DetailOrder, Integer>{
	public List<DetailOrder> findByUser(User user, Sort sort);
}
