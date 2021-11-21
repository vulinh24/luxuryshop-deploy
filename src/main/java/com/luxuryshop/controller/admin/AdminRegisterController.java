package com.luxuryshop.controller.admin;

import java.time.LocalDateTime;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.luxuryshop.SolveException.CustomException;
import com.luxuryshop.entities.User;
import com.luxuryshop.repositories.UserRepository;

@Controller
public class AdminRegisterController {

	@Autowired
	UserRepository userRepo;

	@Autowired
	PasswordEncoder passwordEncoder;

	@RequestMapping(value = { "/registion" }, method = RequestMethod.POST)
	public String registion(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		try {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String password_again = request.getParameter("password-again");
			String email = request.getParameter("email");
			String name = request.getParameter("name");
			User user = userRepo.findByUsername(username);
			if (user == null) {
				user = new User();
				if (password.equals(password_again)) {
					user.setUsername(username);
					user.setName(name);
					user.setPassword(passwordEncoder.encode(password));
					user.setEmail(email);
					user.setCreatedDate(LocalDateTime.now());
					user.setEnabled(true);
				} else {
					model.addAttribute("notsimilar", true);
					return "back-end/login";
				}
				userRepo.save(user);
				model.addAttribute("successr", true);
				return "back-end/login";
			} else {
				model.addAttribute("userexist", true);
				return "back-end/login";
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new CustomException();
		}
	}

	@RequestMapping(value = { "/hien-thi-loi-neu-khong-co-quen" }, method = RequestMethod.GET)
	public String accessDenied(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response) throws Exception {
		return "back-end/accessDenied";
	}
}
