import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';


@Injectable({
  providedIn: 'root'
})
export class UserAccountService {

  userFullName: string = '';
  userEmail: string = '';

  isDisplayed: BehaviorSubject<boolean> = new BehaviorSubject<boolean>(false);
}
