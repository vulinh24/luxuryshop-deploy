package com.luxuryshop.services;

import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.luxuryshop.entities.Role;
import com.luxuryshop.entities.User;

import lombok.Data;
@Data
public class MyUserDetail implements UserDetails {
	/**
	 * 
	 */
	private static final long serialVersionUID = 3075260148358910040L;
	private User user;
    
    public MyUserDetail(User user) {
        this.user = user;
    }
 
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        List<Role> roles = user.getRoles();
        Set<GrantedAuthority> returnRoles = new HashSet<>();
        for (Role role : roles) {
        	SimpleGrantedAuthority autho = new SimpleGrantedAuthority(role.getName());
        	returnRoles.add(autho);
        }
        return returnRoles;
    }
 
    @Override
    public String getPassword() {
        return user.getPassword();
    }
 
    @Override
    public String getUsername() {
        return user.getUsername();
    }
 
    @Override
    public boolean isAccountNonExpired() {
        return true;
    }
 
    @Override
    public boolean isAccountNonLocked() {
        return true;
    }
 
    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }
 
    @Override
    public boolean isEnabled() {
        return true;
    }
 
}