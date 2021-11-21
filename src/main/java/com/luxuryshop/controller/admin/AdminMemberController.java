package com.luxuryshop.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.luxuryshop.repositories.FProductRepository;
import com.luxuryshop.repositories.RoleUserRepository;
import com.luxuryshop.repositories.UserRepository;

@Controller
public class AdminMemberController {

	@Autowired
	UserRepository userRepo;

	@Autowired
	RoleUserRepository roleUserRepository;
	
	@Autowired
	FProductRepository fProductRepository;

	@RequestMapping(value = { "/admin/customers" }, method = RequestMethod.GET)
	public String index(final ModelMap model, final HttpServletRequest request, final HttpServletResponse Response)
			throws Exception {
		model.addAttribute("users", userRepo.findAll());
		return "back-end/view_customers";
	}

	@Transactional
	@RequestMapping(value = { "/admin/customers-delete/{id}" }, method = RequestMethod.GET)
	public String index(@PathVariable("id") Integer id, final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse Response) throws Exception {

		roleUserRepository.deleteUser(id);
		fProductRepository.deleteUser(id);
		userRepo.deleteById(id);
		return "redirect:/admin/customers";
	}
}