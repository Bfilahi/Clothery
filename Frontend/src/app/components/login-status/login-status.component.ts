import { Component, Inject, OnInit } from '@angular/core';
import { OKTA_AUTH, OktaAuthStateService } from '@okta/okta-angular';
import OktaAuth from '@okta/okta-auth-js';
import { UserAccountService } from '../../services/user-account.service';
import { CartService } from '../../services/cart.service';

@Component({
  selector: 'app-login-status',
  templateUrl: './login-status.component.html',
  styleUrl: './login-status.component.css'
})
export class LoginStatusComponent implements OnInit{

  isAuthenticated: boolean = false;
  userFullname: string = '';

  isDisplayed: boolean = false;

  storage: Storage = sessionStorage;

  constructor(
    private userAccountService: UserAccountService,
    private cartService: CartService,
    private oktaAuthService: OktaAuthStateService,
    @Inject(OKTA_AUTH) private oktaAuth: OktaAuth
  ){}

  ngOnInit(): void {
    this.oktaAuthService.authState$.subscribe(
      (result) => {
        this.isAuthenticated = result.isAuthenticated!;
        this.getUserDetails();
      }
    );

    this.userAccountService.isDisplayed.subscribe(
      data => this.isDisplayed = data
    );

    document.addEventListener('click', (event) =>{
      const target = event.target as HTMLElement;

      if(target.closest('.container'))
        return;

      this.userAccountService.isDisplayed.next(false);
    })
  }

  getUserDetails(){
    if(this.isAuthenticated){
      this.oktaAuth.getUser().then(
        res => {
          this.userFullname = res.name as string;
          this.userAccountService.userFullName = this.userFullname;
          this.userAccountService.userEmail = res.email as string;

          this.storage.setItem('userEmail', JSON.stringify(res.email));
        }
      );
    }
  }

  logout(){
    this.oktaAuth.signOut();
  }

  display(){
    this.cartService.isCartDisplayed.next(false);
    this.userAccountService.isDisplayed.next(true);
  }

  closeQuickCart(){
    this.userAccountService.isDisplayed.next(false);
  }
}
