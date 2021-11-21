package com.luxuryshop.configurations;

import java.io.IOException;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

import com.luxuryshop.services.MyUserDetail;

public class CustomSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		MyUserDetail userLogined = getUserLogined();
		request.getSession().setAttribute("USER", userLogined.getUser().getUsername());
		request.getSession().setAttribute("memberName", userLogined.getUser().getName());
		@SuppressWarnings("unchecked")
		Set<GrantedAuthority> authors = (Set<GrantedAuthority>) userLogined.getAuthorities();
		for (GrantedAuthority author : authors) {
			if (author.getAuthority().equals("ROLE_ADMIN") || author.getAuthority().equals("ROLE_TESTADMIN")) {
				response.sendRedirect(request.getContextPath() + "/admin");
				return;
			}
		}
		response.sendRedirect(request.getContextPath() + "/home");
	}

	/**
	 * lấy thông tin đăng nhập vào rồi spring-secure sẽ lưu thông tin nguowif dùng ở
	 * trong class SecurityContextHolder
	 * 
	 * @return
	 */
	public MyUserDetail getUserLogined() {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		return (MyUserDetail) principal;
	}
}
