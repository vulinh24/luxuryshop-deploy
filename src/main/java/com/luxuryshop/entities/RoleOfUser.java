package com.luxuryshop.entities;

import java.io.Serializable;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.luxuryshop.entities.primarykey.PKOfRoleUser;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table (name = "tbl_user_role")
public class RoleOfUser implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -4577245630479225066L;
	@EmbeddedId
	private PKOfRoleUser pk;
}
