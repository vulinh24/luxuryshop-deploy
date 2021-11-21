package com.luxuryshop.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.luxuryshop.SolveException.CustomException;
import com.luxuryshop.entities.Product;
import com.luxuryshop.entities.ProductImages;
import com.luxuryshop.repositories.CategoryRepository;
import com.luxuryshop.repositories.CollectionRepository;
import com.luxuryshop.repositories.FProductRepository;
import com.luxuryshop.repositories.ImageRepository;
import com.luxuryshop.repositories.ProductRepository;
import com.luxuryshop.services.AmazonService;
import com.luxuryshop.services.ProductService;

@Controller
public class AdminProductController {

	@Autowired
	ProductRepository productRepository;

	@Autowired
	CategoryRepository categoryRepository;

	@Autowired
	ImageRepository imageRepository;

	@Autowired
	ProductService productService;

	@Autowired
	CollectionRepository collectionRepository;

	@Autowired
	FProductRepository fProductRepository;
	
	@Autowired
	AmazonService amazonService;

	@RequestMapping(value = { "/admin/products" }, method = RequestMethod.GET)
	public String index(final ModelMap model, final HttpServletRequest request, final HttpServletResponse Response)
			throws Exception {
		List<Product> products = productRepository.findAll();
		model.addAttribute("products", products);
		return "back-end/view_products";
	}

	@RequestMapping(value = { "/admin/product-add/{id}" }, method = RequestMethod.GET)
	public String edit(@PathVariable Integer id, final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse Response) throws Exception {
		try {
			if (id == null)
				model.addAttribute("product", new Product());
			else {
				Product product = productRepository.getById(Integer.valueOf(id));
				product.setCategory(null);
				product.setCollection(null);
				model.addAttribute("product", product);
			}

			model.addAttribute("categories", categoryRepository.findAll());
			model.addAttribute("collections", collectionRepository.findAll());
			return "back-end/insert_product";
		} catch (Exception e) {
			e.printStackTrace();
			throw new CustomException();
		}
	}

	@RequestMapping(value = { "/admin/product-add" }, method = RequestMethod.GET)
	public String add(final ModelMap model, final HttpServletRequest request, final HttpServletResponse Response)
			throws Exception {
		try {
			String id = request.getParameter("id");
			if (id == null)
				model.addAttribute("product", new Product());
			else {
				Product product = productRepository.getById(Integer.valueOf(id));
				product.setCategory(null);
				product.setCollection(null);
				model.addAttribute("product", product);
			}

			model.addAttribute("categories", categoryRepository.findAll());
			model.addAttribute("collections", collectionRepository.findAll());
			return "back-end/insert_product";
		} catch (Exception e) {
			e.printStackTrace();
			throw new CustomException();
		}
	}

	@RequestMapping(value = { "/admin/product-delete/{id}" }, method = RequestMethod.GET)
	public String deleteProduct(@PathVariable("id") Integer id, final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response) throws Exception {
		try {
			Product product = productRepository.getById(id);
			List<ProductImages> images = product.getProductImages();
			for (ProductImages pi : images) {
				amazonService.deleteFile(pi.getPath());
			}
			imageRepository.deleteAll(images);
			fProductRepository.deleteProduct(id);

			productRepository.deleteById(id);
			return "redirect:/admin/products";
		} catch (Exception e) {
			e.printStackTrace();
			throw new CustomException();
		}
	}

	@RequestMapping(value = { "/admin/product-add" }, method = RequestMethod.POST)
	public String saveOrUpdateProduct(@RequestParam("product_images") MultipartFile[] productImages,
			@ModelAttribute("product") Product product, final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response) throws Exception {
		try {
			productService.save(productImages, product);
			return "redirect:/admin/products";
		} catch (Exception e) {
			e.printStackTrace();
			throw new CustomException();
		}
	}
}
