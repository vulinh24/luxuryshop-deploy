package com.luxuryshop.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "tbl_blogs")
public class Blog {
	
	@Id
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(name = "title", nullable = true)
	private String title;
	
	@Column(name = "image", length = 100 ,nullable = true)
	private String image;
	
	@Column(name = "description" , columnDefinition = "TEXT",nullable = true)
	private String description;
}
