package service;

import model.Product;

import java.util.List;

public interface IProductService {
    List<Product> displayList();

    void add(Product product);

    void edit(int id, Product product);

    void delete(int id);

    Product findById(int id);

    List<Product> findByName(String name);
}
