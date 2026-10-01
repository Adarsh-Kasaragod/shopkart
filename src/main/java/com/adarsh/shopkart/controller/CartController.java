package com.adarsh.shopkart.controller;

import com.adarsh.shopkart.models.Cart;
import com.adarsh.shopkart.models.Product;
import com.adarsh.shopkart.models.User;
import com.adarsh.shopkart.services.cartService;
import com.adarsh.shopkart.services.productService;
import com.adarsh.shopkart.services.userService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
public class CartController {

    @Autowired
    private cartService cartService;

    @Autowired
    private productService productService;

    @Autowired
    private userService userService;

    // Simple in-memory cart map for demonstration purposes (mapping username -> List of Products)
    // The original DB schema for Cart/CartProduct is incomplete/complex, so we use a session-based approach
    private static final java.util.Map<String, List<Product>> userCarts = new java.util.HashMap<>();

    private String getCurrentUsername() {
        return SecurityContextHolder.getContext().getAuthentication().getName();
    }

    private List<Product> getOrCreateCart() {
        String username = getCurrentUsername();
        return userCarts.computeIfAbsent(username, k -> new ArrayList<>());
    }

    @GetMapping("/cart")
    public String viewCart(Model model) {
        String username = getCurrentUsername();
        List<Product> cartProducts = getOrCreateCart();
        
        int total = cartProducts.stream().mapToInt(Product::getPrice).sum();
        
        model.addAttribute("username", username);
        model.addAttribute("cartProducts", cartProducts);
        model.addAttribute("total", total);
        return "cartproduct";
    }

    @GetMapping("/products/addtocart")
    public String addToCart(@RequestParam("id") int productId) {
        Product product = productService.getProduct(productId);
        if (product != null) {
            getOrCreateCart().add(product);
        }
        return "redirect:/cart";
    }

    @GetMapping("/cart/delete")
    public String removeFromCart(@RequestParam("id") int productId) {
        List<Product> cartProducts = getOrCreateCart();
        // Remove only one instance of the product
        for (int i = 0; i < cartProducts.size(); i++) {
            if (cartProducts.get(i).getId() == productId) {
                cartProducts.remove(i);
                break;
            }
        }
        return "redirect:/cart";
    }

    @GetMapping("/checkout")
    public String checkout() {
        return "checkout";
    }

    private static final java.util.Map<String, List<Product>> userPastOrders = new java.util.HashMap<>();

    private List<Product> getOrCreatePastOrders() {
        String username = getCurrentUsername();
        return userPastOrders.computeIfAbsent(username, k -> new ArrayList<>());
    }

    @org.springframework.web.bind.annotation.PostMapping("/orderConfirmation")
    public String orderConfirmation() {
        // Move cart to past orders
        List<Product> cart = getOrCreateCart();
        getOrCreatePastOrders().addAll(cart);
        cart.clear();
        return "orderConfirmation";
    }

    @GetMapping("/myorders")
    public String myOrders(Model model) {
        String username = getCurrentUsername();
        model.addAttribute("username", username);
        model.addAttribute("pastOrders", getOrCreatePastOrders());
        return "myorders";
    }
}
