package com.luxuryshop.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.luxuryshop.entities.primarykey.PKOfCart;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "tbl_rate_product")
public class RateProduct implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8705928410389589562L;

	@EmbeddedId
	private PKOfCart pk;

	@Column(name = "rate", nullable = false)
	private Integer rate;

	@ManyToOne
	@MapsId(value = "productId")
	@JoinColumn(name = "product_id")
	@JsonIgnore
	private Product product;

	@ManyToOne
	@MapsId(value = "userId")
	@JsonIgnore
	@JoinColumn(name = "user_id")
	private User user;

}
