package com.luxuryshop.entities.primarykey;

/**
 * khóa chính của SaledOrderProducts
 */
import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@SuppressWarnings("serial")
@Embeddable
@Data
@AllArgsConstructor
@NoArgsConstructor
public class PKOfRoleUser implements Serializable{
	
	@Column(name = "role_id",nullable = false)
	private Integer roleId;
	
	@Column(name = "user_id",nullable = false)
	private Integer userId;
}
