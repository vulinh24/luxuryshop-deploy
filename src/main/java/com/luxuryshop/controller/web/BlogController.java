package com.luxuryshop.controller.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.luxuryshop.SolveException.CustomException;
import com.luxuryshop.repositories.BlogRepository;

@Controller
public class BlogController {
	
	@Autowired
	BlogRepository blogRepository;
	
	@RequestMapping(value = { "/blog" }, method = RequestMethod.GET)
	public String index(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws CustomException {
		
		model.addAttribute("blogs", blogRepository.findAll());
		model.addAttribute("cate", "blog");
		return "front-end/blog";
	}
	
	@RequestMapping(value = { "/view-blog" }, method = RequestMethod.GET)
	public String view(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws CustomException {
		model.addAttribute("cate", "blog");
		return "front-end/blogcontent";
	}

}
