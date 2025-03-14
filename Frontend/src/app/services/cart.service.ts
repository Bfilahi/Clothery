import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { CartItem } from '../common/cart-item';

@Injectable({
  providedIn: 'root'
})

export class CartService {

  private cartItemsSubject = new BehaviorSubject<CartItem[]>([]);
  cartItems$ = this.cartItemsSubject.asObservable();

  totalPrice: BehaviorSubject<number> = new BehaviorSubject<number>(0);
  totalQuantity: BehaviorSubject<number> = new BehaviorSubject<number>(0);
  isCartDisplayed: BehaviorSubject<boolean> = new BehaviorSubject<boolean>(false);

  storage: Storage = localStorage;

  constructor(){
    const data = JSON.parse(this.storage.getItem('cartItems')!);

    if(data != null){
      this.cartItemsSubject.next(data);

      this.computeCartTotals();
    }
  }

  persistCartItems(){
    this.storage.setItem('cartItems', JSON.stringify(this.cartItemsSubject.value));
  }

  addToCart(cartItem: CartItem){

    let isAlreadyInCart: boolean = false;
    let existingCartItem: CartItem | undefined = undefined;

    let currentCartItems: CartItem[] = this.cartItemsSubject.value;

    if(currentCartItems.length > 0){ 
      existingCartItem = currentCartItems.find(item => item.id === cartItem.id && item.selectedSize === cartItem.selectedSize);

      isAlreadyInCart = (existingCartItem != undefined);
    }

    if(isAlreadyInCart)
      existingCartItem!.quantity++;
    else
      currentCartItems = [...currentCartItems, cartItem];

    this.cartItemsSubject.next(currentCartItems);

    this.computeCartTotals();

    this.isCartDisplayed.next(true);
  }

  computeCartTotals(){
    let totalPriceValue: number = 0;
    let totalQuantityValue: number = 0;

    const currentCartItems = this.cartItemsSubject.value;

    for(let cartItem of currentCartItems){
      totalPriceValue += cartItem.unitPrice * cartItem.quantity;
      totalQuantityValue += cartItem.quantity;
    }

    this.totalPrice.next(totalPriceValue);
    this.totalQuantity.next(totalQuantityValue);

    if(totalPriceValue === 0)
      this.isCartDisplayed.next(false);

    this.persistCartItems();
  }

  removeFromCart(item: CartItem){
    const currentCartItems = this.cartItemsSubject.value;
    
    currentCartItems.splice(currentCartItems.indexOf(item) , 1);

    this.computeCartTotals();
  }

  resetObservable(){
    this.cartItemsSubject.next([]);
  }

  closeQuickCart(){
    this.isCartDisplayed.next(false);
  }

}
