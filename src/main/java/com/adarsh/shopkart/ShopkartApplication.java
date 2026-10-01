package com.adarsh.shopkart;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.orm.jpa.HibernateJpaAutoConfiguration;

@SpringBootApplication(exclude = HibernateJpaAutoConfiguration.class)
public class ShopkartApplication {

	public static void main(String[] args) {
		SpringApplication.run(ShopkartApplication.class, args);
	}

}
