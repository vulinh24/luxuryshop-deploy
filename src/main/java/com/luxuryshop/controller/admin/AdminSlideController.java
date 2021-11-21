package com.luxuryshop.controller.admin;

import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.luxuryshop.SolveException.CustomException;
import com.luxuryshop.entities.Banner;
import com.luxuryshop.repositories.BannerRepository;
import com.luxuryshop.services.AmazonService;
import com.luxuryshop.services.MyUserDetail;

@Controller 
public class AdminSlideController {
	
	@Autowired
	BannerRepository bannerRepository;
	
	@Autowired
	AmazonService amazonService;
	
	@RequestMapping(value = {"/admin/slides"}, method = RequestMethod.GET )
	public String index(final ModelMap model, final HttpServletRequest request, final HttpServletResponse Response ) throws Exception{
		List<Banner> banners = bannerRepository.findAll();
		model.addAttribute("banners",banners);
		return "back-end/view_slides";
	}
	
	@RequestMapping(value = {"/admin/slide-add"}, method = RequestMethod.GET )
	public String viewadd(final ModelMap model, final HttpServletRequest request, final HttpServletResponse Response ) throws Exception{
		Banner banner = null;
		String id = request.getParameter("id");
		if (id == null) banner = new Banner();
		else banner = bannerRepository.getById(Integer.valueOf(id));
		model.addAttribute("banner",banner);
		return "back-end/insert_slide";
	}
	
	@SuppressWarnings("null")
	@Transactional
	@RequestMapping(value = {"/admin/slide-add"}, method = RequestMethod.POST )
	public String add(@RequestParam(name = "banner_image") MultipartFile files,@ModelAttribute Banner banner, final ModelMap model, final HttpServletRequest request, final HttpServletResponse Response ) throws Exception{
		
		MyUserDetail userDetail = (MyUserDetail) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Banner newBanner = null;
		if (banner.getId() != null) {
			newBanner = bannerRepository.getById(banner.getId());
			if (files == null ) newBanner.setUrlImage(newBanner.getUrlImage());
			else {
				amazonService.deleteFile(newBanner.getUrlImage());
				String url = amazonService.uploadFile(files);
				newBanner.setUrlImage(url);
			}
			newBanner.setName(banner.getName());
			newBanner.setUrl(banner.getUrl());
			newBanner.setDescription(banner.getDescription());
			newBanner.setUpdatedDate(LocalDateTime.now());
			newBanner.setUpdatedBy(userDetail.getUser().getId());
			bannerRepository.save(newBanner);
		} else {
			if (files != null) {
				String url = amazonService.uploadFile(files);
				banner.setUrlImage(url);
			}
			banner.setCreatedBy(userDetail.getUser().getId());
			banner.setCreatedDate(LocalDateTime.now());
			bannerRepository.save(banner);
		}
		
		return "redirect:/admin/slides";
	}
	
	@Transactional
	@RequestMapping(value = {"/admin/slide-remove/{id}"}, method = RequestMethod.GET )
	public String remove(@PathVariable Integer id,final ModelMap model, final HttpServletRequest request, final HttpServletResponse Response ) throws Exception{
		try {
		Banner banner = bannerRepository.getById(id);
		amazonService.deleteFile(banner.getUrlImage());
		bannerRepository.delete(banner);
		} catch (Exception e) {
			e.printStackTrace();
			throw new CustomException();
		}
		return "redirect:/admin/slides";
	}
}
