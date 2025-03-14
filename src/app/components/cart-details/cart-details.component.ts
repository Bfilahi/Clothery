import { Component, OnInit } from '@angular/core';
import { CartItem } from '../../common/cart-item';
import { CartService } from '../../services/cart.service';

@Component({
  selector: 'app-cart-details',
  templateUrl: './cart-details.component.html',
  styleUrl: './cart-details.component.css'
})
export class CartDetailsComponent implements OnInit{

  totalPrice: number = 0;
  totalQuantity: number = 0;

  cartItems: CartItem[] = [];

  constructor(private cartService: CartService){}

  ngOnInit(): void {
    this.updateCartDetails();
  }


  updateCartDetails(){
    this.cartService.totalPrice.subscribe(
      data => this.totalPrice = data
    );

    this.cartService.totalQuantity.subscribe(
      data => this.totalQuantity = data
    );

    this.cartService.cartItems$.subscribe(
      data => this.cartItems = data
    );
  }

  onQuantityChange(item: CartItem){
    item.quantity = Number(item.quantity);
    this.recalculateTotal();
  }

  recalculateTotal(){
    this.cartService.computeCartTotals();
  }

  removeProduct(item: CartItem){
    this.cartService.removeFromCart(item);
  }

}
