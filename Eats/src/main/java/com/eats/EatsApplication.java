package com.eats;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@MapperScan(basePackages = "com.eats.mapper")
@SpringBootApplication
public class EatsApplication {

	public static void main(String[] args) {
		SpringApplication.run(EatsApplication.class, args);
	}

}
