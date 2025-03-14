package com.filahi.clothery.entity;

import jakarta.persistence.*;
import lombok.Data;


@Data
@Entity
@Table(name = "product_category")
public class ProductCategory {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "category_name")
    private String categoryName;

    @Column(name = "category_type")
    private String categoryType;

    @Column(name = "category_image")
    private String categoryImage;

    @Column(name = "category_gender")
    private String categoryGender;
}
