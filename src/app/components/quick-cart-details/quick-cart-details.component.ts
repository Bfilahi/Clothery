import { Component, HostListener, OnInit } from '@angular/core';
import { CartService } from '../../services/cart.service';
import { CartItem } from '../../common/cart-item';


@Component({
  selector: 'app-quick-cart-details',
  templateUrl: './quick-cart-details.component.html',
  styleUrl: './quick-cart-details.component.css'
})
export class QuickCartDetailsComponent implements OnInit{

  totalPrice: number = 0;
  totalQuantity: number = 0;
  isCartDisplayed: boolean = false;

  cartItems: CartItem[] = [];


  constructor(private cartService: CartService){}

  ngOnInit(): void {
    this.handleCart();
  }

  handleCart(){
    this.cartService.totalPrice.subscribe(
      data => this.totalPrice = data
    );

    this.cartService.totalQuantity.subscribe(
      data => this.totalQuantity = data
    );

    this.cartService.isCartDisplayed.subscribe(
      data => this.isCartDisplayed = data
    )

    // this.cartItems = this.cartService.cartItems;
    this.cartService.cartItems.subscribe(
      data => this.cartItems = data
    );
  }

  closeQuickCart(){
    this.cartService.closeQuickCart();
  }

  removeProduct(item: CartItem){
    this.cartService.removeFromCart(item);
  }
}
