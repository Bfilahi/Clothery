package com.filahi.clothery.service;

import com.filahi.clothery.dto.PaymentInfo;
import com.filahi.clothery.dto.Purchase;
import com.filahi.clothery.dto.PurchaseResponse;
import com.stripe.exception.StripeException;
import com.stripe.model.PaymentIntent;

public interface CheckoutService {
    PurchaseResponse placeOrder(Purchase purchase);

    PaymentIntent createPaymentIntent(PaymentInfo paymentInfo) throws StripeException;
}
