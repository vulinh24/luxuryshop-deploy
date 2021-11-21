package com.luxuryshop.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = true)
@Entity
@Table(name = "tbl_products_images")
public class ProductImages extends ParentEntity{
	@Column(name = "title", nullable = true)
	private String title;

	@Column(name = "path", nullable = false)
	private String path;

	@JsonIgnore
	@ManyToOne
	@JoinColumn(name = "product_id")
	private Product product;
}
