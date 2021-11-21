package com.luxuryshop.entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.PreRemove;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = true)
@Entity
@Table(name = "tbl_categorys")
public class Category extends ParentEntity {

	@Column(name = "name", length = 100, nullable = false)
	private String name;

	@Lob
	@Column(name = "description", nullable = true, columnDefinition = "LONGTEXT")
	private String description;

	@Column(name = "seo", nullable = true)
	private String seo;

	@OneToMany(mappedBy = "category")
	List<Product> products;
	
	@PreRemove
	void setForeignKeyNull() {
		List<Product> pros = this.getProducts();
		for (Product p : pros) {
			p.setCategory(null);
		}
	}
}
