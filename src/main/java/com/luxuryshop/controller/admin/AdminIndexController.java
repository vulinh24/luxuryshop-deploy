package com.luxuryshop.controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.luxuryshop.SolveException.CustomException;
import com.luxuryshop.entities.User;
import com.luxuryshop.repositories.CategoryRepository;
import com.luxuryshop.repositories.CollectionRepository;
import com.luxuryshop.repositories.DetailOrderRepository;
import com.luxuryshop.repositories.ProductRepository;
import com.luxuryshop.repositories.UserRepository;
import com.luxuryshop.services.MyUserDetail;

@Service
@RequestMapping(value = { "/admin" })
public class AdminIndexController {

	@Autowired
	ProductRepository productRepository;

	@Autowired
	UserRepository userRepository;

	@Autowired
	CategoryRepository categoryRepository;

	@Autowired
	DetailOrderRepository saleOrderRepo;

	@Autowired
	CollectionRepository collectionRepository;

	@GetMapping
	public String index(Model model, HttpServletRequest request) {
		try {
			MyUserDetail userDetail = (MyUserDetail) SecurityContextHolder.getContext().getAuthentication()
					.getPrincipal();
			User user = userDetail.getUser();
			request.getSession().setAttribute("USER_ADMIN", user);
			request.getSession().setAttribute("USER", user.getUsername());
			model.addAttribute("qualityOfProduct", productRepository.count());
			model.addAttribute("qualityOfUser", userRepository.count());
			model.addAttribute("qualityOfCategory", categoryRepository.count());
			model.addAttribute("qualityOfSaleOrder", saleOrderRepo.count());
			model.addAttribute("qualityOfCollection", collectionRepository.count());
			return "back-end/index";
		} catch (Exception e) {
			e.printStackTrace();
			throw new CustomException();
		}
	}

}
