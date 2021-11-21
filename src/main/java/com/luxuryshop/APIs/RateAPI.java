package com.luxuryshop.APIs;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.luxuryshop.entities.Product;
import com.luxuryshop.entities.RateProduct;
import com.luxuryshop.entities.primarykey.PKOfCart;
import com.luxuryshop.model.RateProductModel;
import com.luxuryshop.repositories.ProductRepository;
import com.luxuryshop.repositories.RateRepository;
import com.luxuryshop.services.MyUserDetail;

@RestController
public class RateAPI {
	
	@Autowired
	RateRepository rateRepository;
	
	@Autowired
	ProductRepository productRepository;
	
	@Transactional
	@RequestMapping(value = "/rate-product" , method = RequestMethod.POST)
	public String addRate(@RequestBody RateProductModel rateModel) throws Exception {
		try {
			MyUserDetail udetail = (MyUserDetail) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			PKOfCart pk = new PKOfCart(udetail.getUser().getId(),rateModel.getProductId());
			Optional<RateProduct> op = rateRepository.findById(pk);
			if (op.isEmpty()) {
				Product product = productRepository.getById(pk.getProductId());
				List<RateProduct> old = product.getRates();
				RateProduct rate = new RateProduct();
				rate.setPk(pk);
				rate.setRate(rateModel.getRate());
				rate.setUser(udetail.getUser());
				rate.setProduct(product);
				rateRepository.save(rate);
				double totalOldRate = rateModel.getRate();
				for (RateProduct r : old) {
					totalOldRate += r.getRate();
				}
				int newRate = (int) Math.round(totalOldRate / (old.size() + 1 ));
				product.setRate(newRate);
				
			} else {
				RateProduct rate = op.get();
				rate.setRate(rateModel.getRate());
				rateRepository.save(rate);
				Product product = productRepository.getById(pk.getProductId());
				product.caculateRate();
			}
			return "200";
		} catch (Exception e) {
			e.printStackTrace();
			return "404";
		}
	}
}
