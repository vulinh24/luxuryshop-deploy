package com.luxuryshop.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.luxuryshop.entities.SaledProduct;
import com.luxuryshop.entities.primarykey.PKOfRoleUser;

public interface ProductsOrderRepository extends JpaRepository<SaledProduct, PKOfRoleUser>{

}
