package com.luxuryshop.SolveException;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
@AllArgsConstructor
public class APIException extends RuntimeException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7200702759039508585L;
	private String msg;

}
