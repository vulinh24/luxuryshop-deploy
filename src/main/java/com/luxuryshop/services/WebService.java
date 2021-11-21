package com.luxuryshop.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.luxuryshop.entities.Category;
import com.luxuryshop.entities.Collection;
import com.luxuryshop.entities.Product;
import com.luxuryshop.entities.Tag;
import com.luxuryshop.repositories.CategoryRepository;
import com.luxuryshop.repositories.CollectionRepository;
import com.luxuryshop.repositories.ProductRepository;
import com.luxuryshop.repositories.TagRepository;

@Service
public class WebService {
	
	@Autowired
	ProductRepository productRepository;
	
	@Autowired
	CategoryRepository categoryRepository;
	
	@Autowired
	TagRepository tagRepository;
	
	@Autowired
	CollectionRepository collectionRepository;
	
	public List<Product> getAllProduct() {
		return productRepository.findAll();
	}
	
	public List<Product> getAllProduct(PageRequest page) {
		return productRepository.findAll(page).getContent();
	}
	
	public List<Category> getAllCategory() {
		return categoryRepository.findAll();
	}
	
	public List<Collection> getAllCollection() {
		return collectionRepository.findAll();
	}
	
	public List<Tag> getAllTag() {
		return tagRepository.findAll();
	}
}
