package com.filahi.clothery.dao;

import com.filahi.clothery.entity.ProductCategory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;


@RepositoryRestResource(path = "product-category", collectionResourceRel = "ProductCategory")
public interface ProductCategoryDAO extends JpaRepository<ProductCategory, Long> {
}
