package com.luxuryshop.configurations;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.luxuryshop.services.UserDetailServiceImple;


@Configuration
@EnableWebSecurity
public class SecureConf extends WebSecurityConfigurerAdapter {

	@Override
	protected void configure(final HttpSecurity http) throws Exception {
		http.csrf().disable().authorizeRequests() // thực hiện xác thực request ngưười dùng gửi lên.

				// không thực hiện xác thực đối với các url này.
				.antMatchers("/css/**", "/js/**", "/images/**", "/summernote/**", "/file/upload/**").permitAll()

				// thực hiện xác thực với các url kiểu ..../admin/....
				.antMatchers("/delete-admin/**"	,"/admin/customers-delete/**","/admin/slide-remove/**","/admin/slide-add/**").hasRole("ADMIN")
				
				.antMatchers("/admin/categories/1","/admin/categories/2","/admin/categories/3","/admin/categories/4"
						,"/admin/categories/5","/admin/categories/6","/admin/categories/7","/admin/categories/8",
						"/admin/categories/9","/admin/categories/10",
						"/admin/collections/1","/admin/collections/2","/admin/collections/3","/admin/collections/4").hasRole("ADMIN")
				.antMatchers("/admin/categories-delete/1","/admin/categories-delete/2","/admin/categories-delete/3","/admin/categories-delete/4"
						,"/admin/categories-delete/5","/admin/categories-delete/6","/admin/categories-delete/7","/admin/categories-delete/8",
						"/admin/categories-delete/9","/admin/categories-delete/10",
						"/admin/collections-delete/1","/admin/collections-delete/2","/admin/collections-delete/3","/admin/collections-delete/4").hasRole("ADMIN")

				
				.antMatchers("/admin/product-add/1","/admin/product-add/2","/admin/product-add/3","/admin/product-add/4",
						"/admin/product-add/5","/admin/product-add/6","/admin/product-add/7","/admin/product-add/8","/admin/product-add/9",
						"/admin/product-add/10","/admin/product-add/11","/admin/product-add/12","/admin/product-add/13","/admin/product-add/14","/admin/product-add/15",
						"/admin/product-add/16","/admin/product-add/17","/admin/product-add/18","/admin/product-add/19","/admin/product-add/20",
						"/admin/product-add/21","/admin/product-add/22","/admin/product-add/23","/admin/product-add/24","/admin/product-add/25","/admin/product-add/26",
						"/admin/product-add/27","/admin/product-add/28","/admin/product-add/29","/admin/product-add/30","/admin/product-add/31",
						"/admin/product-add/32","/admin/product-add/33","/admin/product-add/34","/admin/product-add/35","/admin/product-add/36")
						.hasRole("ADMIN")
						
						.antMatchers("/admin/product-delete/1","/admin/product-delete/2","/admin/product-delete/3","/admin/product-delete/4",
								"/admin/product-delete/5","/admin/product-delete/6","/admin/product-delete/7","/admin/product-delete/8","/admin/product-delete/9",
								"/admin/product-delete/10","/admin/product-delete/11","/admin/product-delete/12","/admin/product-delete/13","/admin/product-delete/14","/admin/product-delete/15",
								"/admin/product-delete/16","/admin/product-delete/17","/admin/product-delete/18","/admin/product-delete/19","/admin/product-delete/20",
								"/admin/product-delete/21","/admin/product-delete/22","/admin/product-delete/23","/admin/product-delete/24","/admin/product-delete/25","/admin/product-delete/26",
								"/admin/product-delete/27","/admin/product-delete/28","/admin/product-delete/29","/admin/product-delete/30","/admin/product-delete/31",
								"/admin/product-delete/32","/admin/product-delete/33","/admin/product-delete/34","/admin/product-delete/35","/admin/product-delete/36")
								.hasRole("ADMIN")	
				
				.antMatchers("/admin/**")//.authenticated()
				//edit
				.hasAnyRole("ADMIN","TESTADMIN")
				.antMatchers("/").permitAll()
				//end edit
				.and() // kết hợp với điều kiện.
				.exceptionHandling().accessDeniedHandler(new CustomAccessDeniedHandler())
				
				.and()
				// khi click vào button logout thì không cần login.
				// khi click vào button này thì dữ liệu user trên session sẽ bị xoá.
				.logout().logoutUrl("/logout").logoutSuccessUrl("/").invalidateHttpSession(true) // xoá hết dữ liệu
																										// trên seesion
				.deleteCookies("JSESSIONID") // xoá hết dữ liệu trên cokies.
				.permitAll()

				.and() // kết hợp với điều kiện.

				.formLogin() // thực hiện xác thực qua form(username và password)
	            .loginPage("/login") // trang login do mình thiết kế, trỏ vào request-mapping trong controller.
	            .loginProcessingUrl("/action-form-login") // link action for form post.
//	            .defaultSuccessUrl("/admin", true) // when user success authenticated then go to this url.
//	            .defaultSuccessUrl("/", true) // when user success authenticated then go to this url.
	            .successHandler(new CustomSuccessHandler())
	            
	            .failureUrl("/login?page_error=true") // nhập username, password sai thì redirect về trang nào.
	            .permitAll()
	            .and()
	            .rememberMe();
	}

	@Bean
    public UserDetailsService userDetailsService() {
        return new UserDetailServiceImple();
    }
     
    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
     
    @Bean
    public DaoAuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
        authProvider.setUserDetailsService(userDetailsService());
        authProvider.setPasswordEncoder(passwordEncoder());
         
        return authProvider;
    }
 
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.authenticationProvider(authenticationProvider());
    }

}
