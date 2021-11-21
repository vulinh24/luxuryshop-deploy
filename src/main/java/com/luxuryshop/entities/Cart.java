package com.luxuryshop.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonAutoDetect.Visibility;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.luxuryshop.entities.primarykey.PKOfCart;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
/**
 * bảng lưu giỏ hàng của khách
 * @author LinhVu
 *
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "tbl_cart")
@JsonAutoDetect(fieldVisibility = Visibility.ANY)
public class Cart implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -2673587709486561023L;

	@EmbeddedId
	private PKOfCart pk;
	
	@Column(name="quantity")
	private Integer quantity;

	@ManyToOne(fetch = FetchType.EAGER)
	@MapsId(value = "userId")
	@JoinColumn(name = "user_id")
	@JsonIgnore
	private User user;
	
	@ManyToOne (fetch = FetchType.EAGER)
	@MapsId(value = "productId")
	@JoinColumn(name="product_id")
	@JsonIgnore
	private Product productCart;
	
}
