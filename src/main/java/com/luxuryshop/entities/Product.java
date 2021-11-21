package com.luxuryshop.entities;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@SuppressWarnings("serial")
@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
@Entity
@Table (name = "tbl_products")
public class Product extends ParentEntity implements Serializable, Comparable<Product>{
	
	@Column(name = "title", length = 500, nullable = false)
	private String title;

	@Column(name = "price", nullable = false)
	private float price;

	@Column(name = "price_old", nullable = false)
	private float priceOld;
	
	@Column(name = "short_description", nullable = true, columnDefinition = "TEXT")
	private String shortDescription;

	@Lob
	@Column(name = "detail_description", nullable = true, columnDefinition = "LONGTEXT")
	private String detailDescription;
	
	@Column(name = "seo",length = 100, nullable = true)
	private String seo;

	@Column(name = "ishot", nullable = true)
	private Boolean isHot;

	@Column(name = "isnew", nullable = true)
	private Boolean isNew;

	@Column(name = "issale", nullable = true)
	private Boolean isSale;
	
	@Column(name = "rate", columnDefinition = "integer default 5")
	private Integer rate;
	
	@ManyToOne
	@JoinColumn (name = "category_id" , nullable = true )
	private Category category;
	
	@OneToMany(mappedBy = "product", fetch = FetchType.LAZY)
	private List<ProductImages> productImages = new ArrayList<>();
	
	@OneToMany(mappedBy = "productCart" , fetch = FetchType.LAZY , cascade = CascadeType.REMOVE)
	private List<Cart> carts = new ArrayList<>(); // focus
	
	@ManyToOne
	@JoinColumn(name = "collection_id" , nullable = true)
	private Collection collection;
	
	@OneToOne(mappedBy = "product",  cascade = CascadeType.REMOVE)
	private ProductDetail productDetail;
	
	@ManyToMany(mappedBy = "fProducts" , fetch = FetchType.LAZY)
	List<User> likedUsers;
	
	@OneToMany (mappedBy = "product" , fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
	List<RateProduct> rates;
	@Override
	public int compareTo(Product product) {
		return (int) (this.price - product.getPrice());
	}
	
	public boolean userLiked(String username) {
		if (username == null) return false;
		List<User> users = this.getLikedUsers();
		for (User user : users) {
			if (user.getUsername().equals(username)) return true;
		}
		return false;
	}
	
	public void caculateRate() {
		double newRate = 0;
		for (RateProduct rate : this.getRates()) {
			newRate += rate.getRate();
		}
		newRate = newRate / this.getRates().size();
		this.rate = (int) Math.round(newRate);
	}
}
