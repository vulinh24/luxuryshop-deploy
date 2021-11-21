package com.luxuryshop.APIs;

import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.luxuryshop.SolveException.APIException;
import com.luxuryshop.entities.Cart;
import com.luxuryshop.entities.Discount;
import com.luxuryshop.entities.User;
import com.luxuryshop.entities.primarykey.PKOfCart;
import com.luxuryshop.model.CartModel;
import com.luxuryshop.repositories.CartRepository;
import com.luxuryshop.repositories.DiscountRepository;
import com.luxuryshop.repositories.ProductRepository;
import com.luxuryshop.repositories.UserRepository;
import com.luxuryshop.services.MyUserDetail;

@RestController
public class CartAPI {
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	HttpServletResponse response;
	
	@Autowired
	CartRepository cartRepository;
	
	@Autowired
	UserRepository userRepository;
	
	@Autowired
	ProductRepository productRepository;
	
	@Autowired
	DiscountRepository discountRepository;
	
	@Transactional
	@RequestMapping(value = { "/choose-product-to-cart" }, method = RequestMethod.POST)
	public ResponseEntity<CartModel> muaHang(@RequestBody CartModel cartModel,Model model) throws Exception {
		
		HttpSession httpSession = request.getSession();
		int numCart = (int) httpSession.getAttribute("NUM_CART");
		MyUserDetail userDetail = (MyUserDetail) 
				SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		User user = userDetail.getUser();
		Cart cart = new Cart();
		PKOfCart pk = new PKOfCart(user.getId(),cartModel.getProductId());
		Optional<Cart> optional = cartRepository.findById(pk);
		if (optional.isEmpty()) {
			cart.setProductCart(productRepository.findById(cartModel.getProductId()).get());
			cart.setUser(user);
			cart.setQuantity(cartModel.getQuantity());
			cart.setPk(pk);
			cartRepository.save(cart);
		} else {
			cart = optional.get();
			Integer preQuantity = cart.getQuantity();
			cart.setQuantity(preQuantity + cartModel.getQuantity());
			cartRepository.save(cart);
		}
		
		httpSession.setAttribute("NUM_CART", numCart + cartModel.getQuantity());
		model.addAttribute("cate", "shop");
		return new ResponseEntity<>(cartModel,new HttpHeaders(), HttpStatus.OK);
	}
	
	@Transactional
	@RequestMapping(value = { "/change-product-cart" }, method = RequestMethod.POST)
	public void changeQuantity(@RequestBody String json,Model model) throws Exception {
		
		HttpSession httpSession = request.getSession();
		int numCart = (int) httpSession.getAttribute("NUM_CART");
		MyUserDetail userDetail = (MyUserDetail) 
				SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		User user = userDetail.getUser();
		ObjectMapper om = new ObjectMapper();
		CartModel cartModel = om.readValue(json, CartModel.class);
		PKOfCart pk = new PKOfCart(user.getId(),cartModel.getProductId());
		Cart cart = cartRepository.findById(pk).get();
		int preQuantity = cart.getQuantity();
		cart.setQuantity(cartModel.getQuantity());
		cartRepository.save(cart);
		om.writeValue(response.getOutputStream(), cartModel);
		
		httpSession.setAttribute("NUM_CART", numCart + (cartModel.getQuantity()-preQuantity));
		model.addAttribute("cate", "shop");
	}
	
	@Transactional
	@RequestMapping(value = "/remove-product/{id}" , method = RequestMethod.GET)
	public String removeProduct (@PathVariable int id) throws Exception {
		MyUserDetail userDetail = (MyUserDetail) 
				SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		User user = userDetail.getUser();
		PKOfCart pk = new PKOfCart(user.getId(), id);
		Cart cart = cartRepository.getById(pk);
		if (cart == null) throw new APIException("Không tìm thấy sản phẩm!");
		cartRepository.delete(cart);
		return "ok";
	}
	
	@RequestMapping(value = "/check-discount/{name}", method = RequestMethod.POST)
	public String checkdiscount(@PathVariable String name, HttpServletRequest request) {
		
		Discount check = discountRepository.findByName(name.toUpperCase());
		if (check != null) {
			return String.valueOf(check.getDiscount());
		} else return "notfound";
	}
}
