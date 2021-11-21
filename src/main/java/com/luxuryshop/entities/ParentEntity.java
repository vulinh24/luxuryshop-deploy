package com.luxuryshop.entities;

import java.time.LocalDateTime;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@MappedSuperclass
@Data
public abstract class ParentEntity {
	
	@Id
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@JsonIgnore
	@Column(name = "created_date", nullable = true)
	private LocalDateTime createdDate;
	
	@JsonIgnore
	@Column(name = "updated_date", nullable = true)
	private LocalDateTime updatedDate;

	@Column(name = "created_by", nullable = true)
	private Integer createdBy;

	@Column(name = "updated_by", nullable = true)
	private Integer updatedBy;
}
