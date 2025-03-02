import { Injectable } from '@angular/core';
import { WishlistItem } from '../common/wishlist-item';

@Injectable({
  providedIn: 'root'
})
export class WishlistService {

  wishlistItems: WishlistItem[] = [];

  addToWishList(wishlistItem: WishlistItem){
    if(!this.isItemInWishlist(wishlistItem)){

      this.wishlistItems.push(wishlistItem);

      console.log(wishlistItem.productSizes)
    }
  }

  removeFromWishlist(wishlistItem: WishlistItem){
    this.wishlistItems.splice(this.wishlistItems.indexOf(wishlistItem), 1);
  }

  isItemInWishlist(wishlistItem: WishlistItem): boolean{
    if(this.wishlistItems.length > 0){
      const existingItem = this.wishlistItems.find(item => item.id === wishlistItem.id);
      let isAlreadyInWishlist = (existingItem != undefined);
  
      return isAlreadyInWishlist;
    }
    return false;
  }
}
