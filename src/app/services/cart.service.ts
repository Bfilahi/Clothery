import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { CartItem } from '../common/cart-item';

@Injectable({
  providedIn: 'root'
})
export class CartService {

  cartItems: BehaviorSubject<CartItem[]> = new BehaviorSubject<CartItem[]>([]);

  totalPrice: BehaviorSubject<number> = new BehaviorSubject<number>(0);
  totalQuantity: BehaviorSubject<number> = new BehaviorSubject<number>(0);
  isCartDisplayed: BehaviorSubject<boolean> = new BehaviorSubject<boolean>(false);

  addToCart(cartItem: CartItem){
    let isAlreadyInCart: boolean = false;
    let existingCartItem: CartItem | undefined = undefined;

    const currentCartItems = this.cartItems.getValue();

    if(currentCartItems.length > 0){
      existingCartItem = currentCartItems.find(item => item.id === cartItem.id && item.selectedSize === cartItem.selectedSize);

      isAlreadyInCart = (existingCartItem != undefined);
    }

    if(isAlreadyInCart)
      existingCartItem!.quantity++;
    else
    currentCartItems.push(cartItem);

    this.computeCartTotals();

    this.isCartDisplayed.next(true);
  }

  computeCartTotals(){
    let totalPriceValue = 0;
    let totalQuantityValue = 0;

    const currentCartItems = this.cartItems.getValue();

    for(let cartItem of currentCartItems){
      totalPriceValue += cartItem.unitPrice * cartItem.quantity;
      totalQuantityValue += cartItem.quantity;
    }

    this.totalPrice.next(totalPriceValue);
    this.totalQuantity.next(totalQuantityValue);
    this.cartItems.next(currentCartItems);

    if(totalPriceValue === 0)
      this.isCartDisplayed.next(false);
  }

  removeFromCart(item: CartItem){
    const currentCartItems = this.cartItems.getValue();
    
    currentCartItems.splice(currentCartItems.indexOf(item) , 1);

    this.computeCartTotals();
  }

  closeQuickCart(){
    this.isCartDisplayed.next(false);
  }

}
