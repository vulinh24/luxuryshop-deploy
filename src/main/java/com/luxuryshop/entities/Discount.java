package com.luxuryshop.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode (callSuper = true)
@Entity
@Table (name = "tbl_discount")
public class Discount extends ParentEntity {
	
	@Column(name = "name" , nullable = false, length = 50)
	private String name;
	
	@Column(name = "discount", nullable = false)
	private Float discount;
}
