import { Component, OnInit } from '@angular/core';
import { ProductService } from '../../services/product.service';
import { Product } from '../../common/product';
import { ActivatedRoute } from '@angular/router';


@Component({
  selector: 'app-products',
  templateUrl: './products.component.html',
  styleUrl: './products.component.css'
})
export class ProductsComponent implements OnInit {

  products: Product[] = [];

  searchMode: boolean = false;
  currentPage: number = 0;
  pageSize: number = 5;
  totalElements: number = 0;

  previousKeyword: string = '';

  isLoading: boolean = true;

  constructor(
    private productService: ProductService,
    private route: ActivatedRoute,
  ){}

  ngOnInit(): void {
    this.route.paramMap.subscribe(
      () => this.listProducts()
    );
  }

  listProducts(){
    this.searchMode = this.route.snapshot.paramMap.has('keyword');

    if(this.searchMode)
      this.searchProducts();
    else if(this.route.snapshot.queryParamMap.has('id'))
      this.listProductsById();
    else
      this.listProductsByGender();
  }

  searchProducts(){
    const keyword: string = this.route.snapshot.paramMap.get('keyword')!;

    if(this.previousKeyword != keyword){
      this.previousKeyword = keyword;

      this.products = [];
      this.totalElements = 0;
      this.currentPage = 0;
    }

    this.productService.searchProducts(keyword, this.currentPage, this.pageSize).subscribe(
      data => {
        this.products = [...this.products, ...data._embedded.products];
        this.totalElements = data.page.totalElements;
        this.currentPage++;

        this.isLoading = false;
      }
    );
  }

  listProductsById(){
    const categoryId: number = +this.route.snapshot.queryParamMap.get('id')!;

    this.productService.getProductsById(categoryId, this.currentPage, this.pageSize).subscribe(
      data => {
        this.products = [...this.products, ...data._embedded.products];
        this.totalElements = data.page.totalElements;
        this.currentPage++;

        this.isLoading = false;
      }
    );
  }

  listProductsByGender(){
    const searchGender: string = this.route.snapshot.paramMap.get('gender')!;

    this.productService.getProductsByGender(searchGender, this.currentPage, this.pageSize).subscribe(
      data => {
        this.products = [...this.products, ...data._embedded.products];
        this.totalElements = data.page.totalElements;
        this.currentPage++;

        this.isLoading = false;
      }
    );
  }

}
