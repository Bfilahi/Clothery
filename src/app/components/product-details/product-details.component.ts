import { Component, OnInit } from '@angular/core';
import { Product } from '../../common/product';
import { ProductService } from '../../services/product.service';
import { ActivatedRoute } from '@angular/router';
import { ProductImages } from '../../common/product-images';
import { ProductSizes } from '../../common/product-sizes';

@Component({
  selector: 'app-product-details',
  templateUrl: './product-details.component.html',
  styleUrl: './product-details.component.css'
})
export class ProductDetailsComponent implements OnInit{

  product!: Product;
  productDetails: Product | any;
  productImages: ProductImages[] = [];
  productSizes: ProductSizes[] = [];

  selectedSize: string = '';
  display: string = 'conversion';

  constructor(
    private productService: ProductService,
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
      data => this.product = data
    );

    this.productService.getProductImages(productId).subscribe(
      data => this.productImages = data
    );

    this.productService.getProductSizes(productId).subscribe(
      data => this.productSizes = data
    );
  }

  selectSize(value: string){
    this.selectedSize = value;
  }

  selectAccordionSection(value: string){
    this.display = value;
  }
}
