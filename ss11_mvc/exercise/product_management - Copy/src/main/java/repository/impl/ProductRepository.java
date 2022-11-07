package repository.impl;

import model.Product;
import repository.IProductRepository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductRepository implements IProductRepository {
    private static Map<Integer, Product> productMap = new HashMap<>();

    static {
        productMap.put(1, new Product(1, "TUF FX506LHB", 17690000, "Laptop Gaming", "Asus"));
        productMap.put(2, new Product(2, "VICTUS D0292TX", 22190000, "Laptop Gaming", "HP"));
        productMap.put(3, new Product(3, "IDEAPAD 15ITL6", 10690000, "Laptop", "Lenovo"));
        productMap.put(4, new Product(4, "SWIFT SF314", 23990000, "Laptop", "Acer"));
        productMap.put(5, new Product(5, "VOSTRO 3510", 20490000, "Laptop", "Dell"));
        productMap.put(6, new Product(6, "AIR 2020", 30290000, "Macbook", "Apple"));
    }

    @Override
    public List<Product> displayList() {
        return new ArrayList<>(productMap.values());
    }

    @Override
    public void add(Product product) {
        productMap.put(product.getId(), product);
    }

    @Override
    public void edit(int id, Product product) {
        productMap.put(id, product);
    }

    @Override
    public void delete(int id) {
        productMap.remove(id);
    }

    @Override
    public Product findById(int id) {
        return productMap.get(id);
    }

    @Override
    public List<Product> findByName(String name) {
        List<Product> products = new ArrayList<>();

        if (productMap.size() == 0){
            return  products;
        }

        for (Product product : productMap.values()){
            if(product.getName().equals(name)){
                products.add(product);
            }
        }
        return products;
    }
}
