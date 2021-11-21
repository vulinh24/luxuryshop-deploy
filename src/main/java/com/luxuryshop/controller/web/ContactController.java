package com.luxuryshop.controller.web;

import java.time.LocalDateTime;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.luxuryshop.entities.Contact;
import com.luxuryshop.repositories.ContactRepository;

@Controller 
public class ContactController {
	
	@Autowired
	ContactRepository contactRepository;

	@RequestMapping(value = { "/contact" }, method = RequestMethod.GET)
	public String index(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		model.addAttribute("contact", new Contact());
		model.addAttribute("cate", "contact");
		model.addAttribute("cate","page");
		return "front-end/contact";
	}
	
	@ResponseBody
	@RequestMapping(value = {"/save-contact-with-ajax"}, method = RequestMethod.POST)
	public void saveContactWithAjax(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response,
			@RequestBody Contact data) throws Exception{
		ObjectMapper om = new ObjectMapper();
		data.setCreatedDate(LocalDateTime.now());
		contactRepository.save(data);
		om.writeValue(response.getOutputStream(), data);
	}
}
