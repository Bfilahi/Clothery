import { Component, Inject } from '@angular/core';
import { OKTA_AUTH } from '@okta/okta-angular';
import OktaAuth from '@okta/okta-auth-js';
import { UserAccountService } from '../../services/user-account.service';

@Component({
  selector: 'app-user-account',
  templateUrl: './user-account.component.html',
  styleUrl: './user-account.component.css'
})
export class UserAccountComponent {

  userFullName: string = this.userAccountService.userFullName;

  constructor(
    @Inject(OKTA_AUTH) private oktaAuth: OktaAuth, 
    private userAccountService: UserAccountService){}

  exitApp(){
    this.oktaAuth.signOut();
  }

}
