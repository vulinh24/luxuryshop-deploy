package com.luxuryshop.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "tbl_product_detail")
public class ProductDetail {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Column(name = "dimension",nullable = true)
	private String dimension;
	
	@Column(name = "origin")
	private String origin;
	
	@Column(name = "material")
	private String material;
	
	@Column(name = "insurance")
	private String insurance;
	
	@OneToOne
	@JoinColumn(name = "product_id" , referencedColumnName = "id")
	private Product product;
}
