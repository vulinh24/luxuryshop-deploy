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
import com.luxuryshop.Utils.SendMailService;
import com.luxuryshop.entities.NotificationEmail;
import com.luxuryshop.repositories.EmailRepository;

@Controller
public class EmailController {
	
	@Autowired
	EmailRepository emailRepository;
	
	@Autowired
	SendMailService mailService;
	
	@Autowired
	SendMailService sendMail;
	
//	@RequestMapping(value = { "/send-email" }, method = RequestMethod.GET)
//	public String index(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
//			throws Exception {
//		model.addAttribute("notificationEmail", new NotificationEmail());
//		model.addAttribute("cate", "home");
//		return "front-end/index";
//	}
	
	@ResponseBody
	@RequestMapping(value = {"/save-notification-email"}, method = RequestMethod.POST)
	public void saveContactWithAjax(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response,
			@RequestBody NotificationEmail data) throws Exception{
		ObjectMapper om = new ObjectMapper();
		data.setCreatedDate(LocalDateTime.now());
		emailRepository.save(data);
		sendMail.setToMail(data.getEmail());
		sendMail.start();
		om.writeValue(response.getOutputStream(), data);
	}
}
