package com.adarsh.shopkart;

import com.adarsh.shopkart.models.Category;
import com.adarsh.shopkart.models.Product;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Component;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

@Component
public class DataLoader implements CommandLineRunner {

    private static final Logger log = LoggerFactory.getLogger(DataLoader.class);
    private static final int MAX_PRODUCTS = 500;

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void run(String... args) throws Exception {
        Session checkSession = sessionFactory.openSession();
        long productCount = ((Number) checkSession.createQuery("select count(p) from PRODUCT p").uniqueResult()).longValue();
        checkSession.close();
        
        if (productCount > 0) {
            log.info("Database already contains data ({} products). Skipping DataLoader.", productCount);
            return;
        }

        log.info("Starting product data load from flipkart.csv...");

        ClassPathResource resource = new ClassPathResource("flipkart.csv");
        Map<String, Category> categoryMap = new HashMap<>();
        int count = 0;

        try (BufferedReader reader = new BufferedReader(
                new InputStreamReader(resource.getInputStream(), StandardCharsets.UTF_8))) {

            // Skip header
            String header = reader.readLine();
            if (header == null) {
                log.warn("CSV file is empty!");
                return;
            }

            // First pass: read lines and collect unique categories
            java.util.List<String[]> rows = new java.util.ArrayList<>();
            String line;
            while ((line = reader.readLine()) != null && rows.size() < MAX_PRODUCTS) {
                String[] cols = parseCsvLine(line);
                if (cols.length >= 10) {
                    rows.add(cols);
                    String catName = cols[2].trim();
                    if (!catName.isEmpty()) {
                        categoryMap.putIfAbsent(catName, null);
                    }
                }
            }

            // Save categories
            Session session = sessionFactory.openSession();
            Transaction tx = session.beginTransaction();

            for (String catName : categoryMap.keySet()) {
                Category cat = new Category();
                cat.setName(catName);
                session.save(cat);
                categoryMap.put(catName, cat);
            }
            tx.commit();
            session.close();
            log.info("Saved {} categories.", categoryMap.size());

            // Save products
            session = sessionFactory.openSession();
            tx = session.beginTransaction();

            for (String[] cols : rows) {
                try {
                    Product product = new Product();
                    String productName = cols[1].trim();
                    String catName = cols[2].trim();
                    String brand = cols[3].trim();
                    String color = cols.length > 17 ? cols[17].trim() : "";
                    String size = cols.length > 18 ? cols[18].trim() : "";

                    product.setName(productName);

                    // Set price from final_price (col index 8)
                    try {
                        double finalPrice = Double.parseDouble(cols[8].trim());
                        product.setPrice((int) finalPrice);
                    } catch (NumberFormatException e) {
                        product.setPrice(999);
                    }

                    // Set quantity from stock_available (col index 11)
                    try {
                        product.setQuantity(Integer.parseInt(cols[11].trim()));
                    } catch (NumberFormatException e) {
                        product.setQuantity(10);
                    }

                    // Set weight from weight_g (col index 15)
                    try {
                        double wt = Double.parseDouble(cols[15].trim());
                        product.setWeight((int) wt);
                    } catch (NumberFormatException e) {
                        product.setWeight(500);
                    }

                    // Description
                    String desc = brand + " " + productName;
                    if (!color.isEmpty()) desc += " - " + color;
                    if (!size.isEmpty()) desc += ", " + size;
                    product.setDescription(desc);

                    // Image placeholder
                    String shortName = productName.length() > 20
                            ? productName.substring(0, 20)
                            : productName;
                    product.setImage("https://placehold.co/300x200/EEE/31343C?font=Lato&text="
                            + URLEncoder.encode(shortName, "UTF-8"));

                    // Category
                    Category cat = categoryMap.get(catName);
                    product.setCategory(cat);

                    session.save(product);
                    count++;

                    if (count % 50 == 0) {
                        session.flush();
                        session.clear();
                        log.info("Loaded {} products so far...", count);
                    }
                } catch (Exception e) {
                    log.warn("Skipping row due to error: {}", e.getMessage());
                }
            }

            tx.commit();
            session.close();
            log.info("Data loading complete! Loaded {} products.", count);

            // Create default users
            createDefaultUsers();
        }
    }

    private void createDefaultUsers() {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();

        // Admin user
        com.adarsh.shopkart.models.User admin = new com.adarsh.shopkart.models.User();
        admin.setUsername("admin");
        admin.setPassword("{noop}admin123");
        admin.setEmail("admin@shopkart.com");
        admin.setRole("ROLE_ADMIN");
        admin.setAddress("Shopkart HQ");
        session.save(admin);

        // Demo customer
        com.adarsh.shopkart.models.User customer = new com.adarsh.shopkart.models.User();
        customer.setUsername("adarsh");
        customer.setPassword("{noop}adarsh123");
        customer.setEmail("adarsh@shopkart.com");
        customer.setRole("ROLE_NORMAL");
        customer.setAddress("Hyderabad, India");
        session.save(customer);

        tx.commit();
        session.close();
        log.info("Default users created - Admin: admin/admin123, Customer: adarsh/adarsh123");
    }

    /**
     * Simple CSV line parser that handles quoted fields with commas inside.
     */
    private String[] parseCsvLine(String line) {
        java.util.List<String> fields = new java.util.ArrayList<>();
        boolean inQuotes = false;
        StringBuilder field = new StringBuilder();

        for (int i = 0; i < line.length(); i++) {
            char c = line.charAt(i);
            if (c == '"') {
                inQuotes = !inQuotes;
            } else if (c == ',' && !inQuotes) {
                fields.add(field.toString());
                field = new StringBuilder();
            } else {
                field.append(c);
            }
        }
        fields.add(field.toString());
        return fields.toArray(new String[0]);
    }
}
