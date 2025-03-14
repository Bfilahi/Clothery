import { Component, OnInit } from '@angular/core';
import { Product } from '../../common/product';
import { ProductService } from '../../services/product.service';
import { ActivatedRoute } from '@angular/router';
import { ProductImages } from '../../common/product-images';
import { ProductSizes } from '../../common/product-sizes';
import { CartService } from '../../services/cart.service';
import { CartItem } from '../../common/cart-item';
import { WishlistService } from '../../services/wishlist.service';
import { WishlistItem } from '../../common/wishlist-item';

@Component({
  selector: 'app-product-details',
  templateUrl: './product-details.component.html',
  styleUrl: './product-details.component.css'
})

export class ProductDetailsComponent implements OnInit{

  product: Product = {} as Product;
  productDetails: Product | any;
  productImages: ProductImages[] = [];

  productSizes: ProductSizes[] = [];

  selectedSize: string = '';
  isSizeSelected: boolean = false;
  wasAddToCartPressed: boolean = false;
  display: string = 'conversion';

  itemsInCart!: number;

  existsInWishlist: boolean = false;

  constructor(
    private productService: ProductService,
    private cartService: CartService,
    private wishlistService: WishlistService,
    private route: ActivatedRoute
  ){}

  ngOnInit(): void {
    this.route.paramMap.subscribe(
      () => this.getProductDetails()
    );
  }

  getProductDetails(){
    const productId: number = +this.route.snapshot.paramMap.get('id')!;

    this.productService.getProduct(productId).subscribe(
      data => {
        this.product = data;
        this.existsInWishlist = this.wishlistService.isItemInWishlist(new WishlistItem(this.product));
      }
    );

    this.productService.getProductImages(productId).subscribe(
      data => this.productImages = data
    );

    this.productService.getProductSizes(productId).subscribe(
      data => {
        this.productSizes = data;
        this.product.productSizes = this.productSizes;
      }
    );
  }

  selectSize(value: string){
    this.selectedSize = value;
    this.isSizeSelected = true;

    this.product.selectedSize = this.selectedSize;
  }

  selectAccordionSection(value: string){
    this.display = value;
  }

  addToCart(product: Product, event: Event){
    event.stopPropagation();
    this.wasAddToCartPressed = true;

    if(this.isSizeSelected){
      const cartItem = new CartItem(product);
      this.cartService.addToCart(cartItem);
    }
  }

  addToWishList(product: Product){
    const wishlistItem = new WishlistItem(product);
    this.wishlistService.addToWishList(wishlistItem);
    this.existsInWishlist = true;
  }
}
