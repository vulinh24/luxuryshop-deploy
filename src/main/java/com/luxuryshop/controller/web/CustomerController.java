package com.luxuryshop.controller.web;

import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.luxuryshop.SolveException.CustomException;
import com.luxuryshop.entities.DetailOrder;
import com.luxuryshop.entities.User;
import com.luxuryshop.repositories.DetailOrderRepository;
import com.luxuryshop.repositories.UserRepository;
import com.luxuryshop.services.MyUserDetail;

@Controller
public class CustomerController {

	@Autowired
	DetailOrderRepository orderRepository;

	@Autowired
	UserRepository userRepository;

	@RequestMapping(value = { "/customer" }, method = RequestMethod.GET)
	public String index(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		MyUserDetail userDetail = (MyUserDetail) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		User user = userDetail.getUser();
		if (user == null) throw new CustomException();
		model.addAttribute("user", user);
		String exist = request.getParameter("exist");
		if (exist != null) model.addAttribute("exist", true);
		return "back-end/customer/index";
	}

	@RequestMapping(value = { "/customer/update/{id}" }, method = RequestMethod.GET)
	public String index2(@PathVariable("id") Integer id, final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response) throws Exception {
		User user = userRepository.findById(id).get();
		if (user == null) throw new CustomException();
		model.addAttribute("user", user);
		return "back-end/customer/update_info";
	}

	@RequestMapping(value = { "/customer/password" }, method = RequestMethod.GET)
	public String changePassword() throws Exception {

		return "back-end/customer/changepassword";
	}
	
//	@RequestMapping(value = { "/customer/liked-product" }, method = RequestMethod.GET)
//	public String liked(Model model) throws Exception {
//		MyUserDetail userDetail = (MyUserDetail) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		User user = userRepository.getById(userDetail.getUser().getId());
//		
//		model.addAttribute("products",user.getFProducts());
//		
//		return "back-end/customer/like_products";
//	}
	
	@Transactional
	@RequestMapping(value = { "/customer-update" }, method = RequestMethod.POST)
	public String updatePost(@ModelAttribute(name = "user") User userModel, ModelMap model,
			final HttpServletRequest request) throws CustomException {
		try {
			MyUserDetail userDetail = (MyUserDetail) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			User user = userDetail.getUser();
			if (user.getUsername().equals(userModel.getUsername())) {
				user.setUpdatedDate(LocalDateTime.now());
				user.setName(userModel.getName());
				user.setEmail(userModel.getEmail());
				user.setPhone(userModel.getPhone());
				user.setAddress(userModel.getAddress());
				userRepository.save(user);
				return "redirect:/customer";
			} else {
				User cuser = userRepository.findByUsername(userModel.getUsername());
				if (cuser == null) {
					
					user.setUpdatedDate(LocalDateTime.now());
					user.setName(userModel.getName());
					user.setUsername(userModel.getUsername());
					user.setEmail(userModel.getEmail());
					user.setPhone(userModel.getPhone());
					user.setAddress(userModel.getAddress());
					userRepository.save(user);
					return "redirect:/customer";
				} else {
					return "redirect:/customer?exist=true";
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new CustomException();
		}
	}

	@RequestMapping(value = { "/customer-updatepassword" }, method = RequestMethod.POST)
	public String changePasswordHandle(Model model, HttpServletRequest request) throws Exception {

		try {
			MyUserDetail userDetail = (MyUserDetail) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			User user = userDetail.getUser();
			BCryptPasswordEncoder encode = new BCryptPasswordEncoder();
			String oldPass = request.getParameter("oldPass");
			String pass = request.getParameter("newPass");
			String confirmPass = request.getParameter("validateNewPass");
			if (encode.matches(oldPass, user.getPassword())) {
				if (pass.equals(confirmPass)) {
					user.setPassword(encode.encode(pass));
					userRepository.save(user);
					model.addAttribute("state", "success");
				} else {
					model.addAttribute("state", "error");
				}
			} else {
				model.addAttribute("state", "error");
			}
			return "back-end/customer/changepassword";
		} catch (Exception e) {
			e.printStackTrace();
			throw new CustomException();
		}
	}

	@RequestMapping(value = {"/customer/my-orders"}, method = RequestMethod.GET )
	public String indexMyOrder(final ModelMap model, final HttpServletRequest request, final HttpServletResponse Response ) 
		throws Exception {
		try {
			MyUserDetail userDetail = (MyUserDetail) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			User user = userDetail.getUser();
			if (user == null) throw new CustomException();
			Sort sort = Sort.by(Direction.DESC,"createdDate");
			List<DetailOrder> orders = orderRepository.findByUser(user, sort);
			model.addAttribute("user",user);
			model.addAttribute("orders",orders);
			return "back-end/customer/view_orders";
		} catch (Exception e) {
			e.printStackTrace();
			throw new CustomException();
		}
	}
}
