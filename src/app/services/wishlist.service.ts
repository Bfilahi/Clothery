import { Injectable } from '@angular/core';
import { WishlistItem } from '../common/wishlist-item';

@Injectable({
  providedIn: 'root'
})

export class WishlistService {

  wishlistItems: WishlistItem[] = [];

  storage: Storage = localStorage;

  constructor(){
    const data = JSON.parse(this.storage.getItem('wishlistItems')!);

    if(data != null)
      this.wishlistItems = data;
  }

  addToWishList(wishlistItem: WishlistItem){
    if(!this.isItemInWishlist(wishlistItem)){
      this.wishlistItems.push(wishlistItem);

      this.updateStorage();
    }
  }

  removeFromWishlist(wishlistItem: WishlistItem){
    this.wishlistItems.splice(this.wishlistItems.indexOf(wishlistItem), 1);

    this.updateStorage();
  }

  isItemInWishlist(wishlistItem: WishlistItem): boolean{
    if(this.wishlistItems.length > 0){
      const existingItem = this.wishlistItems.find(item => item.id === wishlistItem.id);
      let isAlreadyInWishlist = (existingItem != undefined);
  
      return isAlreadyInWishlist;
    }
    return false;
  }

  updateStorage(){
    this.storage.setItem('wishlistItems', JSON.stringify(this.wishlistItems));
  }
}
