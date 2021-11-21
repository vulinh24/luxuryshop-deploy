package com.luxuryshop.APIs;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.luxuryshop.entities.Product;
import com.luxuryshop.entities.User;
import com.luxuryshop.repositories.UserRepository;
import com.luxuryshop.services.MyUserDetail;




@Transactional
@RestController
public class FavoriteProductAPI {
	
	@Autowired
	EntityManager entityManager;
	
	@Autowired
	UserRepository userRepository;
	
	@RequestMapping(value = "/add-favorite/{id}", method = RequestMethod.GET)
	public String index(@PathVariable Integer id,HttpServletRequest request) {
		if (request.getSession().getAttribute("USER") == null) return "usernotfound";
		MyUserDetail detail = 
				(MyUserDetail) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		
		User user = userRepository.getById(detail.getUser().getId());
		List<Product> likedProduct = user.getFProducts();
		for (Product p : likedProduct) {
			if (p.getId().equals(id)) {
				String sql = "delete from tbl_favorite_products where user_id = ?1 and product_id = ?2";
				Query query = entityManager.createNativeQuery(sql);
				query.setParameter(1, user.getId());
				query.setParameter(2, id);
				query.executeUpdate();
				return "remove";
			}
		}
		String sql = "insert into tbl_favorite_products values(?1,?2)";
		Query query = entityManager.createNativeQuery(sql);
		query.setParameter(1, user.getId());
		query.setParameter(2, id);
		query.executeUpdate();
		return "add";
	}
	
	@RequestMapping(value = "/remove-favorite/{id}", method = RequestMethod.GET)
	public String remove(@PathVariable Integer id) {
		MyUserDetail detail = 
				(MyUserDetail) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		User user = detail.getUser();
		String sql = "delete from tbl_favorite_products where user_id = ?1 and product_id = ?2";
		Query query = entityManager.createNativeQuery(sql);
		query.setParameter(1, user.getId());
		query.setParameter(2, id);
		query.executeUpdate();
		return "ok";
	}
}
