package com.luxuryshop.services;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.luxuryshop.entities.Product;
import com.luxuryshop.entities.ProductDetail;
import com.luxuryshop.entities.ProductImages;
import com.luxuryshop.model.ProductFilterModel;
import com.luxuryshop.repositories.ImageRepository;
import com.luxuryshop.repositories.ProductDetailRepository;
import com.luxuryshop.repositories.ProductRepository;
import com.github.slugify.Slugify;
import com.luxuryshop.WebConstants;

@Service
public class ProductService {

	@Autowired
	EntityManager entityManager;

	@Autowired
	ProductRepository productRepository;

	@Autowired
	ImageRepository imageRepository;

	@Autowired
	ProductDetailRepository detailRepository;

	@Autowired
	AmazonService amazonService;

	public ProductService() {
	}

	@SuppressWarnings("unchecked")
	public List<Product> filterProduct(final ProductFilterModel proFilter) {
		StringBuilder sql = new StringBuilder("FROM Product p WHERE 1=1");
		if (proFilter.getCategoryId() != null)
			sql.append(" AND p.category.id = " + proFilter.getCategoryId());
		if (proFilter.getCollectionId() != null)
			sql.append(" AND p.collection.id = " + proFilter.getCollectionId());
		if (proFilter.getBeginPrice() != null)
			sql.append(" AND p.price >= " + proFilter.getBeginPrice());
		if (proFilter.getEndPrice() != null && proFilter.getEndPrice() > proFilter.getBeginPrice())
			sql.append(" AND p.price <= " + proFilter.getEndPrice());
		if (proFilter.getSearchKeyword() != null) {
			Slugify slug = new Slugify();
			String keyword = slug.slugify(proFilter.upperKeyword());
			sql.append(" AND upper(p.seo) LIKE '%" + keyword + "%'");
		}

		if (proFilter.getTag() != null) {
			Slugify slug = new Slugify();
			String keyword = slug.slugify(proFilter.getTag().toUpperCase());
			sql.append(" AND upper(p.seo) LIKE '%" + keyword + "%'");
		}

		if (proFilter.getSort() != null)
			sql.append(" ORDER BY p.price " + proFilter.getSort());

		Query query = entityManager.createQuery(sql.toString());
		if (proFilter.getCurrenPage() == 1) {
			List<Product> initializeProducts = query.getResultList();
			proFilter.setSize(initializeProducts.size());
			proFilter.setTotalPage((int) Math.ceil((double) proFilter.getSize() / WebConstants.NUM_OF_PRODUCTS));
		}
		query.setFirstResult((proFilter.getCurrenPage() - 1) * WebConstants.NUM_OF_PRODUCTS);
		query.setMaxResults(WebConstants.NUM_OF_PRODUCTS);
		return query.getResultList();
	}

	public List<Product> findBySeo(String seo) {
		return productRepository.findBySeo(seo);
	}

	private boolean isEmptyUploadFile(MultipartFile[] images) {
		if (images == null || images.length <= 0)
			return true;
		if (images.length == 1 && images[0].getOriginalFilename().isEmpty())
			return true;
		return false;
	}

	@Transactional
	public void save(MultipartFile[] productImages, Product product) throws IllegalStateException, IOException {

		if (product.getId() != null) { // chỉnh sửa

			if (!isEmptyUploadFile(productImages)) { // nếu admin sửa ảnh sản phẩm
				// lấy danh sách ảnh cũ của sản phẩm
				List<ProductImages> oldProductImages = imageRepository.findByProduct(product);

				// xoá ảnh cũ trên vật lí(host)
				for (ProductImages _image : oldProductImages) {
					amazonService.deleteFile(_image.getPath());
				}

				// xoá ảnh trên database
				imageRepository.deleteAll(oldProductImages);
				for (MultipartFile productImage : productImages) {

					// lưu vật lí
					String path = amazonService.uploadFile(productImage);

					ProductImages _productImages = new ProductImages();
					_productImages.setPath(path);
					_productImages.setCreatedDate(LocalDateTime.now());
					_productImages.setProduct(product);
					imageRepository.save(_productImages);
				}

			}
			Slugify slg = new Slugify();
			String seo = slg.slugify(product.getTitle() + "-" + System.currentTimeMillis());
			product.setSeo(seo);
			product.setUpdatedDate(LocalDateTime.now());
			product.setRate(product.getRate());
			productRepository.save(product);
		} else {
			Slugify slg = new Slugify();
			String seo = slg.slugify(product.getTitle() + "-" + System.currentTimeMillis());
			product.setSeo(seo);
			product.setCreatedDate(LocalDateTime.now());
			ProductDetail detail = product.getProductDetail();
			product.setProductDetail(null);
			product.setRate(5);
			Product newProduct = productRepository.save(product);
			detail.setProduct(newProduct);
			detailRepository.save(detail);
			if (!isEmptyUploadFile(productImages)) { // có upload ảnh lên.
				for (MultipartFile productImage : productImages) {

					// lưu vật lí
					String path = amazonService.uploadFile(productImage);

					ProductImages _productImages = new ProductImages();
					_productImages.setPath(path);
					_productImages.setCreatedDate(LocalDateTime.now());
					_productImages.setProduct(newProduct);
					imageRepository.save(_productImages);
				}
			}
		}
	}
}
