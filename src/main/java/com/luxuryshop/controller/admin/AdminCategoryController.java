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
import com.luxuryshop.entities.Category;
import com.luxuryshop.entities.User;
import com.luxuryshop.repositories.CategoryRepository;
import com.luxuryshop.services.MyUserDetail;

@Controller
public class AdminCategoryController {

	@Autowired
	private CategoryRepository categoryRepo;

	@RequestMapping(value = { "/admin/categories" }, method = RequestMethod.GET)
	public String index(final ModelMap model, final HttpServletRequest request, final HttpServletResponse Response)
			throws Exception {
		model.addAttribute("categories", categoryRepo.findAll());
		return "back-end/view_categories";
	}

	@RequestMapping(value = { "/admin/category-add" }, method = RequestMethod.GET)
	public String viewadd(final ModelMap model, final HttpServletRequest request, final HttpServletResponse Response)
			throws Exception {
		model.addAttribute("category", new Category());
		return "back-end/insert_category";
	}

	@Transactional
	@RequestMapping(value = { "/admin/category-add" }, method = RequestMethod.POST)
	public String add(@ModelAttribute(name = "category") Category category, final ModelMap model,
			final HttpServletRequest request, final HttpServletResponse Response) throws Exception {
		try {
			MyUserDetail detail = (MyUserDetail) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			User user = detail.getUser();
			Slugify slugify = new Slugify();
			String seo = slugify.slugify(category.getName() + "-" + System.currentTimeMillis());
			category.setSeo(seo);
			String type = request.getParameter("type");
			if (type.equals("update")) {
				category.setUpdatedDate(LocalDateTime.now());
				category.setUpdatedBy(user.getId());
			} else {
				category.setCreatedDate(LocalDateTime.now());
				category.setCreatedBy(user.getId());
			}

			categoryRepo.save(category);
			return "redirect:/admin/categories";
		} catch (Exception e) {
			e.printStackTrace();
			throw new CustomException();
		}
	}

	@RequestMapping(value = { "/admin/categories/{id}" }, method = RequestMethod.GET)
	public String saveCategory(@PathVariable("id") Integer id, final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response) throws Exception {
		try {
			Category category = categoryRepo.findById(id).get();

			model.addAttribute("category", category);
			return "back-end/insert_category";
		} catch (Exception e) {
			e.printStackTrace();
			throw new CustomException();
		}
	}

	@Transactional
	@RequestMapping(value = { "/admin/categories-delete/{id}" }, method = RequestMethod.GET)
	public String deleteCategory(@PathVariable("id") Integer id, final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response) throws Exception {
		try {
			categoryRepo.deleteById(id);
			return "redirect:/admin/categories";
		} catch(Exception e) {
			e.printStackTrace();
			throw new CustomException();
		}
	}
}
