package com.luxuryshop.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "tbl_tagsearch")
public class Tag {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Column(name = "name" , length = 50)
	private String name;
	
	@Column(name="description",length = 100, nullable = true)
	private String description;
	
	public String upperName() {
		if (name != null)
			return name.toUpperCase();
		else return name;
	}
}
