package com.luxuryshop.entities;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.PreRemove;
import javax.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@EqualsAndHashCode(callSuper = true)
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "tbl_users")
public class User extends ParentEntity implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8688323980624037918L;

	@Column(name = "enabled", nullable = false)
	private boolean enabled = Boolean.TRUE;

	@Column(name = "username", length = 45, nullable = false)
	private String username;

	@Column(name = "password", length = 60, nullable = false)
	private String password;

	@Column(name = "email", length = 45, nullable = false)
	private String email;

	@Column(name = "name", length = 100, nullable = true)
	private String name;

	@Column(name = "phone", length = 15, nullable = true)
	private String phone;

	@Column(name = "address", nullable = true, columnDefinition = "TEXT")
	private String address;

	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(name = "tbl_user_role", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "role_id"))
	List<Role> roles;

	@OneToMany(mappedBy = "user", cascade = CascadeType.REMOVE)
	private List<Cart> carts;

	@OneToMany(mappedBy = "user")
	List<DetailOrder> detailOrder;
	
	@ManyToMany(fetch = FetchType.LAZY) 
	@JoinTable(name = "tbl_favorite_products", 
				joinColumns = @JoinColumn(name = "user_id"),
				inverseJoinColumns = @JoinColumn(name="product_id"))
	List<Product> fProducts; // focus
	
	@OneToMany(mappedBy = "user", fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
	List<RateProduct> rates; //focus
	
	@PreRemove
	void deletefk() {
		List<DetailOrder> deleOrder = this.getDetailOrder();
		for (DetailOrder o : deleOrder) {
			o.setUser(null);
		}
	}
}
