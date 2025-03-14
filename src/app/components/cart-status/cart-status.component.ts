import { Component, OnInit } from '@angular/core';
import { CartService } from '../../services/cart.service';
import { UserAccountService } from '../../services/user-account.service';


@Component({
  selector: 'app-cart-status',
  templateUrl: './cart-status.component.html',
  styleUrl: './cart-status.component.css'
})
export class CartStatusComponent implements OnInit {

  totalPrice: number = 0;
  totalQuantity: number = 0;


  constructor(
    private cartService: CartService,
    private userAccountService: UserAccountService
  ){}

  ngOnInit(): void {
    this.updateCartStatus();
  }

  updateCartStatus(){
    this.cartService.totalQuantity.subscribe(
      data => this.totalQuantity = data
    );

    this.cartService.totalPrice.subscribe(
      data => this.totalPrice = data
    );
  }

  showQuickCart(){
    if(this.totalPrice > 0){
      this.userAccountService.isDisplayed.next(false);
      this.cartService.isCartDisplayed.next(true);
    }
  }

}
