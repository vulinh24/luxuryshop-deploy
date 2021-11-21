package com.luxuryshop.controller.admin;

import java.time.LocalDateTime;

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

import com.github.slugify.Slugify;
import com.luxuryshop.SolveException.CustomException;
import com.luxuryshop.entities.Collection;
import com.luxuryshop.entities.User;
import com.luxuryshop.repositories.CollectionRepository;
import com.luxuryshop.services.MyUserDetail;

@Controller
public class AdminCollectionController {

	@Autowired
	private CollectionRepository collectionRepo;

	@RequestMapping(value = { "/admin/collections" }, method = RequestMethod.GET)
	public String index(final ModelMap model, final HttpServletRequest request, final HttpServletResponse Response)
			throws Exception {
		model.addAttribute("collections", collectionRepo.findAll());
		return "back-end/view_collections";
	}

	@RequestMapping(value = { "/admin/collection-add" }, method = RequestMethod.GET)
	public String viewadd(final ModelMap model, final HttpServletRequest request, final HttpServletResponse Response)
			throws Exception {
		model.addAttribute("collection", new Collection());
		return "back-end/insert_collection";
	}

	@Transactional
	@RequestMapping(value = { "/admin/collection-add" }, method = RequestMethod.POST)
	public String add(@ModelAttribute(name = "collection") Collection collection, final ModelMap model,
			final HttpServletRequest request, final HttpServletResponse Response) throws Exception {
		try {
			MyUserDetail detail = (MyUserDetail) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			User user = detail.getUser();
			Slugify slugify = new Slugify();
			String seo = slugify.slugify(collection.getName() + "-" + System.currentTimeMillis());
			collection.setSeo(seo);
			String type = request.getParameter("type");
			if (type.equals("update")) {
				collection.setUpdatedDate(LocalDateTime.now());
				collection.setUpdatedBy(user.getId());
			} else {
				collection.setCreatedDate(LocalDateTime.now());
				collection.setCreatedBy(user.getId());
			}

			collectionRepo.save(collection);
			return "redirect:/admin/collections";
		} catch (Exception e) {
			e.printStackTrace();
			throw new CustomException();
		}
	}

	@RequestMapping(value = { "/admin/collections/{id}" }, method = RequestMethod.GET)
	public String savecollection(@PathVariable("id") Integer id, final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response) throws Exception {
		try {
			Collection collection = collectionRepo.findById(id).get();
			model.addAttribute("collection", collection);
			return "back-end/insert_collection";
		} catch(Exception e) {
			e.printStackTrace();
			throw new CustomException();
		}
	}

	@Transactional
	@RequestMapping(value = { "/admin/collections-delete/{id}" }, method = RequestMethod.GET)
	public String deletecollection(@PathVariable("id") Integer id, final ModelMap model,
			final HttpServletRequest request, final HttpServletResponse response) throws Exception {
		try {
			collectionRepo.deleteById(id);
			return "redirect:/admin/collections";
		} catch(Exception e) {
			e.printStackTrace();
			throw new CustomException();
		}
	}
}
