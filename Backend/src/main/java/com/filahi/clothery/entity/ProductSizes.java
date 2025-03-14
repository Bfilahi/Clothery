package com.filahi.clothery.entity;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "product_sizes")
@Data
public class ProductSizes {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "size")
    private String size;

    @Column(name = "quantity")
    private int quantity;

    @ManyToOne
    @JoinColumn(name = "product_id", nullable = false)
    private Product product;
}
