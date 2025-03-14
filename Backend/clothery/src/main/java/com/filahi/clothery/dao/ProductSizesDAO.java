package com.filahi.clothery.dao;

import com.filahi.clothery.entity.ProductSizes;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;


@RepositoryRestResource(path = "product-sizes", collectionResourceRel = "productSizes")
public interface ProductSizesDAO extends JpaRepository<ProductSizes, Long> {
    Page<ProductSizes> findByProductId(@Param("product_id") Long id, Pageable pageable);
}
