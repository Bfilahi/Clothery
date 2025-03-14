import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { OrderHistory } from '../common/order-history';
import { environment } from '../../environments/environment';


@Injectable({
  providedIn: 'root'
})
export class OrderHistoryService {

  private baseUrl: string = `${environment.clotheryApi}/orders`;

  constructor(private httpClient: HttpClient) { }


  getOrderHistory(email: string): Observable<GetResponseOrderHistory>{
    const searchUrl: string = `${this.baseUrl}/search/findByCustomerEmailOrderByDateCreatedDesc?email=${email}`;

    return this.httpClient.get<GetResponseOrderHistory>(searchUrl);
  }

}

interface GetResponseOrderHistory{
  _embedded: {
    orders: OrderHistory[];
  }
}