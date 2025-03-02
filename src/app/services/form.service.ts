import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, map } from 'rxjs';
import { Country } from '../common/country';
import { City } from '../common/city';

@Injectable({
  providedIn: 'root'
})
export class FormService {

  baseUrl: string = 'http://localhost:8080/api'

  constructor(private httpClient: HttpClient) { }

  getCountries(): Observable<Country[]>{
    const searchUrl = `${this.baseUrl}/countries`;

    return this.httpClient.get<GetResponseCountry>(searchUrl).pipe(
      map(data => data._embedded.countries)
    );
  }

  getCitiesByCountryCode(code: string): Observable<City[]>{
    const searchUrl = `${this.baseUrl}/cities/search/findByCountryCode?code=${code}`;

    return this.httpClient.get<GetResponseCity>(searchUrl).pipe(
      map(data => data._embedded.cities)
    );
  }
}


interface GetResponseCountry{
  _embedded: {
    countries: Country[]
  }
}

interface GetResponseCity{
  _embedded: {
    cities: City[]
  }
}