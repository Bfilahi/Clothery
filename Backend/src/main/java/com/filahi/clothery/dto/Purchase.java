package com.filahi.clothery.dto;

import com.filahi.clothery.entity.Address;
import com.filahi.clothery.entity.Customer;
import com.filahi.clothery.entity.Order;
import com.filahi.clothery.entity.OrderItem;
import lombok.Getter;
import lombok.Setter;

import java.util.Set;

@Getter
@Setter
public class Purchase {
    private Customer customer;
    private Address shippingAddress;
    private Address billingAddress;
    private Order order;
    private Set<OrderItem> orderItems;
}
