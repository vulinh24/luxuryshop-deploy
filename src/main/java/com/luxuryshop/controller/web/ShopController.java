package com.luxuryshop.controller.web;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.luxuryshop.model.ProductFilterModel;
import com.luxuryshop.repositories.CartRepository;
import com.luxuryshop.repositories.ImageRepository;
import com.luxuryshop.repositories.ProductDetailRepository;
import com.luxuryshop.repositories.UserRepository;
import com.luxuryshop.services.MyUserDetail;
import com.luxuryshop.services.ProductService;
import com.luxuryshop.services.WebService;
import com.luxuryshop.SolveException.CustomException;
import com.luxuryshop.entities.Cart;
import com.luxuryshop.entities.Category;
import com.luxuryshop.entities.Product;
import com.luxuryshop.entities.ProductImages;
import com.luxuryshop.entities.User;
import com.luxuryshop.entities.primarykey.PKOfCart;

@Controller
public class ShopController {

	/*
	 * filter model in session
	 */
	public final static String FILTER_MODEL = "filterModel";
	@Autowired
	WebService webService;

	@Autowired
	ImageRepository imageRepository;

	@Autowired
	ProductService productService;
	
	@Autowired
	UserRepository userRepository;

	@Autowired
	HttpServletRequest request;

	@Autowired
	ProductDetailRepository proDetailRepository;
	
	@Autowired
	CartRepository cartRepository;
	
	@RequestMapping(value = "/shop", method = RequestMethod.GET)
	public String index(Model model) throws Exception{

		request.getSession().removeAttribute(FILTER_MODEL);
//		model.addAttribute("collections",webService.getAllCollection());
//		model.addAttribute("categories",webService.getAllCategory());
//		model.addAttribute("products",webService.getAllProduct(PageRequest.of(0, WebConstants.NUM_OF_PRODUCTS)));
//		model.addAttribute("size",webService.getAllProduct().size());
//		model.addAttribute("currentPage",1);
//		model.addAttribute("totalPage",Math.ceil((double)webService.getAllProduct().size()/WebConstants.NUM_OF_PRODUCTS));
//		return "front-end/shop";
		return "forward:/shop/search?page=1";
	}

	@RequestMapping(value = "/shop/search", method = RequestMethod.GET)
	public String shopSearch(Model model) throws Exception{
		try {
			HttpSession session = request.getSession();
			String favorite = request.getParameter("favorite");
			if (favorite != null && favorite.equals("true")) {
				String username = (String) session.getAttribute("USER");
				User user = userRepository.findByUsername(username);
				List<Product> products = user.getFProducts();
				model.addAttribute("products", products);
				model.addAttribute("favorite",true);
				model.addAttribute("cate", "shop");
				model.addAttribute("size", products.size());
				return "front-end/shop";
			}
			ProductFilterModel proFilter = null;
			if (session.getAttribute(FILTER_MODEL) != null) {
				proFilter = (ProductFilterModel) session.getAttribute(FILTER_MODEL);
			} else {
				proFilter = new ProductFilterModel();
				proFilter.setCurrenPage(1);
				session.setAttribute(FILTER_MODEL, proFilter);
			}

			String strCategoryId = request.getParameter("categoryid");
			String strCollectionId = request.getParameter("collectionid");
			String strCurrentPage = request.getParameter("page");
			String strPriceBegin = request.getParameter("priceBegin");
			String strPriceEnd = request.getParameter("priceEnd");
			String strSort = request.getParameter("sort");
			String tag = request.getParameter("tag");

			if (strCategoryId != null) {
				proFilter.setCategoryId(Integer.valueOf(strCategoryId));
				proFilter.setSort(null);
			}
			if (strCollectionId != null) {
				proFilter.setCollectionId(Integer.valueOf(strCollectionId));
				proFilter.setSort(null);
			}
			if (strPriceBegin != null) {
				proFilter.setBeginPrice(Float.valueOf(strPriceBegin));
				proFilter.setSort(null);
			}
			if (strPriceEnd != null)
				proFilter.setEndPrice(Float.valueOf(strPriceEnd));
			if (strCurrentPage != null)
				proFilter.setCurrenPage(Integer.valueOf(strCurrentPage));
			if (strSort != null)
				proFilter.setSort(strSort);
			if (tag != null) {
				proFilter.resetFilter();
				proFilter.setTag(tag);
			}

			List<Product> products = productService.filterProduct(proFilter);
			model.addAttribute("products", products);
			model.addAttribute("size", proFilter.getSize());
			model.addAttribute("totalPage", proFilter.getTotalPage());

			model.addAttribute("collections", webService.getAllCollection());
			model.addAttribute("categories", webService.getAllCategory());
			model.addAttribute("tags", webService.getAllTag());

			model.addAttribute("currentPage", proFilter.getCurrenPage());
			model.addAttribute("currentCategoryId", proFilter.getCategoryId());
			model.addAttribute("currentCollectionId", proFilter.getCollectionId());
			model.addAttribute("cate", "shop");
			model.addAttribute("price",proFilter.getBeginPrice());

			return "front-end/shop";
		} catch (Exception e) {
			e.printStackTrace();
			throw new CustomException();
		}
	}

	@RequestMapping(value = "/shop/search", method = RequestMethod.POST)
	public String search(Model model) throws Exception {
		try {
			HttpSession session = request.getSession();
			ProductFilterModel proFilter = null;
			if (session.getAttribute(FILTER_MODEL) != null) {
				proFilter = (ProductFilterModel) session.getAttribute(FILTER_MODEL);
			} else {
				proFilter = new ProductFilterModel();
				session.setAttribute(FILTER_MODEL, proFilter);
			}
			String keyword = request.getParameter("keyword");
			if (keyword != null) {
				proFilter.resetFilter();
				proFilter.setSearchKeyword(keyword);
			}

			List<Product> products = productService.filterProduct(proFilter);
			model.addAttribute("products", products);
			model.addAttribute("size", proFilter.getSize());
			model.addAttribute("totalPage", proFilter.getTotalPage());

			model.addAttribute("collections", webService.getAllCollection());
			model.addAttribute("categories", webService.getAllCategory());
			model.addAttribute("currentPage", proFilter.getCurrenPage());
			model.addAttribute("currentCategoryId", proFilter.getCategoryId());
			model.addAttribute("currentCollectionId", proFilter.getCollectionId());
			model.addAttribute("cate", "shop");

			return "front-end/shop";
		} catch (Exception e) {
			e.printStackTrace();
			throw new CustomException();
		}
	}

	@RequestMapping(value = { "/shop-details/{seo}" }, method = RequestMethod.GET)
	public String index(@PathVariable("seo") String seo, ModelMap model) throws Exception {
		try {
			Product product = productService.findBySeo(seo).get(0);
			List<ProductImages> proImages = imageRepository.findByProduct(product);
			HashMap<Integer, ProductImages> images = new HashMap<>();
			for (int i = 0; i < proImages.size(); ++i) {
				images.put(i + 1, proImages.get(i));
			}
			Category cate = product.getCategory();
			List<Product> _products = cate.getProducts();
			int rate = product.getRate();
			
			model.addAttribute("rate",rate);
			model.addAttribute("relatedProducts", _products);
			model.addAttribute("product", product);
			model.addAttribute("images", images);
			model.addAttribute("keyset", images.keySet());
			model.addAttribute("proDetail", product.getProductDetail());
			model.addAttribute("cate", "shop");
			return "front-end/shop-details";
		} catch (Exception e) {
			e.printStackTrace();
			throw new CustomException();
		}
	}
	
	@RequestMapping(value = { "/shopping-cart" }, method = RequestMethod.GET)
	public String cart(Model model) throws Exception {
		try {
			MyUserDetail userDetail = (MyUserDetail) 
					SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			User user = userDetail.getUser();
			List<Cart> carts = cartRepository.findByUserName(user.getUsername());
		
			model.addAttribute("CART",carts);
			model.addAttribute("cate", "shop");
			String checkout = request.getParameter("checkout");
			model.addAttribute("checkout",checkout);
			return "front-end/shopping-cart";
		} catch (Exception e) {
			e.printStackTrace();
			throw new CustomException();
		}
	}
	
	@RequestMapping(value = { "/remove-product-to-cart/{id}" }, method = RequestMethod.GET)
	public String removePro(@PathVariable("id") Integer productId, Model model) throws Exception {
		try {

			HttpSession httpSession = request.getSession();
			int numCart = (int) httpSession.getAttribute("NUM_CART");
			MyUserDetail userDetail = (MyUserDetail) 
					SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			User user = userDetail.getUser();
			
			PKOfCart pk = new PKOfCart(user.getId(),productId);
			Cart cart = cartRepository.findById(pk).get();
			int quantity = cart.getQuantity();
			cartRepository.delete(cart);
			
			String userName = (String) httpSession.getAttribute("USER");
			List<Cart> carts = cartRepository.findByUserName(userName);
			
			httpSession.setAttribute("NUM_CART", numCart - quantity);
			model.addAttribute("CART",carts);
			model.addAttribute("cate", "shop");
			return "redirect:/shopping-cart";
		} catch (Exception e) {
			e.printStackTrace();
			throw new CustomException();
		}
	}
}
