package com.luxuryshop.services;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import com.luxuryshop.entities.User;
import com.luxuryshop.repositories.UserRepository;

public class UserDetailServiceImple implements UserDetailsService {

	@Autowired
	UserRepository userRepository;

	@Override
	@Transactional
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User user = userRepository.findByUsername(username);
		if (user == null) {
			throw new UsernameNotFoundException("User not found");
		}

//        Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
//        List<Role> roles =  user.getRoles();
//        for (Role role : roles) {
//            grantedAuthorities.add(new SimpleGrantedAuthority(role.getName()));
//        }
//
//        return new org.springframework.security.core.userdetails.User(
//                user.getUsername(), user.getPassword(), grantedAuthorities);
		return new MyUserDetail(user);
	}

}
