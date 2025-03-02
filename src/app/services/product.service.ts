import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { map, Observable, tap, of, BehaviorSubject } from 'rxjs';
import { ProductCategory } from '../common/product-category';
import { Product } from '../common/product';
import { ProductImages } from '../common/product-images';
import { ProductSizes } from '../common/product-sizes';

@Injectable({
  providedIn: 'root'
})
export class ProductService {

  searchKeyword: BehaviorSubject<string> = new BehaviorSubject<string>('');
  
  cachedProductCategories: ProductCategory[] = [];
  baseUrl: string = 'http://localhost:8080/api';

  constructor(private httpClient: HttpClient) { }


  getProductCategories(): Observable<ProductCategory[]>{
    const searchUrl = `${this.baseUrl}/product-category`;

    if(this.cachedProductCategories.length > 0)
      return of(this.cachedProductCategories);

    else{
      return this.httpClient.get<GetResponseProductCategory>(searchUrl).pipe(
        map(item => item._embedded.ProductCategory),
        tap(item => this.cachedProductCategories = item)
      );
    }
  }

  getProductsById(categoryId: number, page: number, size: number): Observable<GetResponseProduct>{
    const searchUrl = `${this.baseUrl}/products/search/findByCategoryId?id=${categoryId}&page=${page}&size=${size}`;

    return this.httpClient.get<GetResponseProduct>(searchUrl);
  }

  getProductsByGender(gender: string, page: number, size: number): Observable<GetResponseProduct>{
    const searchUrl = `${this.baseUrl}/products/search/findByGender?gender=${gender}&page=${page}&size=${size}`;

    return this.httpClient.get<GetResponseProduct>(searchUrl);
  }

  searchProducts(keyword: string, page: number, size: number): Observable<GetResponseProduct>{
    const searchUrl = `${this.baseUrl}/products/search/findByNameContaining?name=${keyword}&page=${page}&size=${size}`;

    this.searchKeyword.next(keyword);

    return this.httpClient.get<GetResponseProduct>(searchUrl);
  }

  getProduct(productId: number): Observable<Product>{
    const searchUrl = `${this.baseUrl}/products/${productId}`;
    return this.httpClient.get<Product>(searchUrl);
  }

  getProductImages(productId: number): Observable<ProductImages[]>{
    const searchUrl = `${this.baseUrl}/product-images/search/findByProductId?product_id=${productId}`;
    return this.httpClient.get<GetResponseProductImages>(searchUrl).pipe(
      map(item => item._embedded.productImages)
    );
  }

  getProductSizes(productId: number): Observable<ProductSizes[]>{
    const searchUrl = `${this.baseUrl}/product-sizes/search/findByProductId?product_id=${productId}`;
    return this.httpClient.get<GetResponseProductSizes>(searchUrl).pipe(
      map(item => item._embedded.productSizes)
    );
  }
}

interface GetResponseProductCategory{
  _embedded: {
    ProductCategory: ProductCategory[]
  }
}

interface GetResponseProduct{
  _embedded: {
    products: Product[]
  },
  page: {
    totalElements: number
  }
}

interface GetResponseProductImages{
  _embedded: {
    productImages: ProductImages[]
  }
}

interface GetResponseProductSizes{
  _embedded: {
    productSizes: ProductSizes[]
  }
}