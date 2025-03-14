import { Injector, NgModule } from '@angular/core';
import { Router, RouterModule, Routes } from '@angular/router';
import { ProductsComponent } from './components/products/products.component';
import { PageNotFoundComponent } from './components/page-not-found/page-not-found.component';
import { HomeComponent } from './components/home/home.component';
import { ProductDetailsComponent } from './components/product-details/product-details.component';
import { CartDetailsComponent } from './components/cart-details/cart-details.component';
import { WishlistComponent } from './components/wishlist/wishlist.component';
import { CheckoutComponent } from './components/checkout/checkout.component';
import { LoginComponent } from './components/login/login.component';
import { OktaAuthGuard, OktaCallbackComponent } from '@okta/okta-angular';
import { UserAccountComponent } from './components/user-account/user-account.component';
import OktaAuth from '@okta/okta-auth-js';
import { SizeGuideComponent } from './components/size-guide/size-guide.component';
import { ShippingComponent } from './components/shipping/shipping.component';
import { ReturnsComponent } from './components/returns/returns.component';
import { FaqComponent } from './components/faq/faq.component';
import { TermsConditionsComponent } from './components/terms-conditions/terms-conditions.component';
import { PrivacyPolicyComponent } from './components/privacy-policy/privacy-policy.component';
import { OrderHistoryComponent } from './components/order-history/order-history.component';




function sendToLoginPage(oktaAuth: OktaAuth, injector: Injector){
  const router = injector.get(Router);

  router.navigate(['/login']);
}



const routes: Routes = [

  {path: 'privacy-policy', component: PrivacyPolicyComponent},
  {path: 'terms-conditions', component: TermsConditionsComponent},
  {path: 'faq', component: FaqComponent},
  {path: 'returns', component: ReturnsComponent},
  {path: 'shipping', component: ShippingComponent},
  {path: 'size-guide', component: SizeGuideComponent},

  {path: 'account', component: UserAccountComponent, 
    canActivate: [OktaAuthGuard], 
    data: {onAuthRequired: sendToLoginPage}
  },

  {path: 'order-history', component: OrderHistoryComponent, 
    canActivate: [OktaAuthGuard], 
    data: {onAuthRequired: sendToLoginPage}
  },
  
  {path: 'login/callback', component: OktaCallbackComponent},
  {path: 'login', component: LoginComponent},

  {path: 'checkout', component: CheckoutComponent},

  {path: 'wishlist-details', component: WishlistComponent},
  {path: 'cart-details', component: CartDetailsComponent},

  {path: 'details/:id', component: ProductDetailsComponent},

  {path: 'search/:keyword', component: ProductsComponent},
  {path: 'collections/:gender', component: ProductsComponent},
  {path: ':gender/:type', component: ProductsComponent},
  
  {path: 'home', component: HomeComponent},
  {path: '', redirectTo: '/home', pathMatch: 'full'},
  {path: '**', component: PageNotFoundComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
