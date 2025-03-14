package com.filahi.clothery.dao;

import com.filahi.clothery.entity.ProductImages;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;


@RepositoryRestResource(path = "product-images", collectionResourceRel = "productImages")
public interface ProductImagesDAO extends JpaRepository<ProductImages, Long> {
    Page<ProductImages> findByProductId(@Param("product_id")Long id, Pageable pageable);
}
