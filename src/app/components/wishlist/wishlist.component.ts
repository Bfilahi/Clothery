import { Component, OnInit } from '@angular/core';
import { WishlistItem } from '../../common/wishlist-item';
import { WishlistService } from '../../services/wishlist.service';
import { CartService } from '../../services/cart.service';
import { CartItem } from '../../common/cart-item';
import { Product } from '../../common/product';
import { ProductService } from '../../services/product.service';
import { ProductSizes } from '../../common/product-sizes';

@Component({
  selector: 'app-wishlist',
  templateUrl: './wishlist.component.html',
  styleUrl: './wishlist.component.css'
})
export class WishlistComponent implements OnInit{

  wishlistItems: WishlistItem[] = [];
  selectedSize: string = '';
  productSizes: ProductSizes[] = [];
  product!: Product;

  constructor(
    private wishlistService: WishlistService, 
    private cartService: CartService,
    private productService: ProductService
  ){}

  ngOnInit(): void {
    this.listWishlistProducts();
  }

  listWishlistProducts(){
    this.wishlistItems = this.wishlistService.wishlistItems;
  }

  moveToCart(item: WishlistItem){
    this.productService.getProduct(item.id).subscribe(
      data => {
        this.product = data;
        const cartItem = new CartItem(this.product);
        cartItem.selectedSize = this.selectedSize;

        this.productService.getProductSizes(item.id).subscribe(
          data => {
            this.productSizes = data;
            cartItem.productSizes = this.productSizes;
            this.cartService.addToCart(cartItem);
          }
        )
      }
    );
  }

  selectSize(value: string){
    this.selectedSize = value;
  }
}
