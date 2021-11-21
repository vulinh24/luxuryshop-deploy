package com.luxuryshop.SolveException;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
public class SolveAPIException {
	
	@ExceptionHandler(value = APIException.class)
	public ResponseEntity<String> handle(APIException e) {
		return new ResponseEntity<>(e.getMsg(), HttpStatus.BAD_REQUEST);
	}
}
