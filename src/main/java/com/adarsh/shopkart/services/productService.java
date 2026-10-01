package com.adarsh.shopkart.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.adarsh.shopkart.dao.productDao;
import com.adarsh.shopkart.models.Product;

@Service
public class productService {
	private final productDao productDao;

	public productService(productDao productDao) {
		this.productDao = productDao;
	}

	public List<Product> getProducts() {
		return this.productDao.getProducts();
	}

	public List<Product> searchProducts(String keyword, Integer categoryId) {
		return this.productDao.searchProducts(keyword, categoryId);
	}

	public Product addProduct(Product product) {
		return this.productDao.addProduct(product);
	}

	public Product getProduct(int id) {
		return this.productDao.getProduct(id);
	}

	public Product updateProduct(int id, Product product) {
		product.setId(id);
		return this.productDao.updateProduct(product);
	}

	public boolean deleteProduct(int id) {
		return this.productDao.deleteProduct(id);
	}
}
