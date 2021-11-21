package com.luxuryshop.entities;

import java.io.Serializable;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.luxuryshop.entities.primarykey.PKOfCart;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "tbl_favorite_products")
public class FavoriteProduct implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -4577245630479225066L;
	@EmbeddedId
	private PKOfCart pk;
}
