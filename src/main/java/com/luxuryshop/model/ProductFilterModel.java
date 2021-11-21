package com.luxuryshop.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductFilterModel {
	private Integer categoryId = null;
	private Integer collectionId = null;
	private Integer size = null;
	private Integer totalPage = null;
	private Float beginPrice = null, endPrice = null;
	private String sort = null;
	private String tag = null;
	private Integer currenPage = null;
	private String searchKeyword = null;
	
	
	public void setBeginPrice(Float beginPrice) {
		if (beginPrice < 0) {
			this.beginPrice = null;
			this.endPrice = null;
		} else this.beginPrice = beginPrice;
	}
	
	public void setCollectionId(Integer collectionId) {
		if (collectionId < 0) {
			this.collectionId = null;
		} else this.collectionId = collectionId;
	}
	
	public String upperKeyword() {
		if(this.searchKeyword != null )
			return searchKeyword.toUpperCase();
		else return this.searchKeyword;
	}
	
	public void resetFilter() {
		this.beginPrice = null;
		this.categoryId = null;
		this.collectionId = null;
		this.currenPage = 1;
		this.endPrice = null;
		this.sort = null;
		this.tag = null;
		this.searchKeyword = null;
	}
}
