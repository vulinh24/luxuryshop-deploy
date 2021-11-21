package com.luxuryshop.entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.PreRemove;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@EqualsAndHashCode(callSuper = true)
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "tbl_collections")
public class Collection extends ParentEntity{
	
	@Column(name="name", length = 100, nullable = false)
	private String name;
	
	@Column(name="description",nullable = true,columnDefinition = "TEXT")
	private String description;
	
	@Column(name = "seo" , nullable = true)
	private String seo;
	
	@OneToMany(mappedBy = "collection")
	List<Product> products;
	
	@PreRemove
	void setForeignKeyNull() {
		List<Product> pros = this.getProducts();
		for (Product p : pros) {
			p.setCollection(null);
		}
	}
	
}
