import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { CartService } from '../../services/cart.service';
import { CartItem } from '../../common/cart-item';
import { Country } from '../../common/country';
import { City } from '../../common/city';
import { FormService } from '../../services/form.service';
import { MyValidators } from '../../validators/my-validators';
import { CheckoutService } from '../../services/checkout.service';
import { Router } from '@angular/router';
import { Order } from '../../common/order';
import { OrderItem } from '../../common/order-item';
import { Purchase } from '../../common/purchase';
import { UserAccountService } from '../../services/user-account.service';
import { environment } from '../../../environments/environment';
import { PaymentInfo } from '../../common/payment-info';
import { OktaAuthStateService } from '@okta/okta-angular';



@Component({
  selector: 'app-checkout',
  templateUrl: './checkout.component.html',
  styleUrl: './checkout.component.css'
})
export class CheckoutComponent implements OnInit{

  checkoutFormGroup!: FormGroup;

  cartItems: CartItem[] = [];
  totalQuantity: number = 0;
  totalPrice: number = 0;

  countries: Country[] = [];
  citiesShipping: City[] = [];
  citiesBilling: City[] = [];

  storage: Storage = localStorage;

  stripe = Stripe(environment.stripePublishableKey);
  paymentInfo: PaymentInfo = new PaymentInfo();
  cardElement: any;
  displayError: any = '';

  isDisabled: boolean = false;
  isStripeValid: boolean = false;

  isAuthenticated: boolean = false;

  countryCodes = {
    IT: '39',
    FR: '33',
    DE: '49'
  }


  constructor(
    private cartService: CartService,
    private formService: FormService,
    private formBuilder: FormBuilder,
    private checkoutService: CheckoutService,
    private userAccountService: UserAccountService,
    private oktaAuthService: OktaAuthStateService,
    private router: Router
  ){}



  ngOnInit(): void {

    this.setupStripePaymentForm();


    this.cartService.totalPrice.subscribe(
      data => this.totalPrice = data
    );

    this.cartService.totalQuantity.subscribe(
      data => this.totalQuantity = data
    );

    this.formService.getCountries().subscribe(
      data => {
        this.countries = data;
        this.checkoutFormGroup.get('shippingAddress.country')?.setValue(data[0]);
        this.getCities('shippingAddress');
      }
    );

    this.cartService.cartItems$.subscribe(
      data => this.cartItems = data
    );

    this.oktaAuthService.authState$.subscribe(
      (result) => {
        this.isAuthenticated = result.isAuthenticated!;
      }
    );
  

    let fName: string;
    let lName: string;

    if(this.userAccountService.userFullName != ''){
      fName = this.userAccountService.userFullName.split(' ')[0].charAt(0).toUpperCase() + this.userAccountService.userFullName.split(' ')[0].substring(1);
      lName = this.userAccountService.userFullName.split(' ')[1].charAt(0).toUpperCase() + this.userAccountService.userFullName.split(' ')[1].substring(1);
    }
    else{
      fName = lName = '';
    }
    

    this.checkoutFormGroup = new FormGroup({
      customer: this.formBuilder.group({
        email: new FormControl(`${this.userAccountService.userEmail}`, [
          Validators.required,
          Validators.pattern('^[a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,4}$')
        ])
      }),
  
      shippingAddress: this.formBuilder.group({
        firstName: new FormControl(fName, [
          Validators.required,
          Validators.minLength(3),
          MyValidators.notOnlyWhiteSpace
        ]),
        lastName: new FormControl(lName, [
          Validators.required,
          Validators.minLength(3),
          MyValidators.notOnlyWhiteSpace
        ]),
        country: new FormControl('', [
          Validators.required,
        ]),
        street: new FormControl('', [
          Validators.required,
          MyValidators.notOnlyWhiteSpace
        ]),
        zipCode: new FormControl('', [
          Validators.required,
        ]),
        city: new FormControl('', [
          Validators.required,
        ]),
        phone: new FormControl('', [
          Validators.required,
          Validators.minLength(15),
          Validators.maxLength(15)
        ]),
      }),

      payment: new FormControl(''),
  
  
      billingAddress: this.formBuilder.group({
        firstName: new FormControl('', [
          Validators.required,
          Validators.minLength(3),
          MyValidators.notOnlyWhiteSpace
        ]),
        lastName: new FormControl('', [
          Validators.required,
          Validators.minLength(3),
          MyValidators.notOnlyWhiteSpace
        ]),
        country: new FormControl('', [
          Validators.required
        ]),
        street: new FormControl('', [
          Validators.required,
          MyValidators.notOnlyWhiteSpace
        ]),
        zipCode: new FormControl('', [
          Validators.required,
          Validators.minLength(2)
        ]),
        city: new FormControl('', [
          Validators.required
        ]),
        phone: new FormControl('', [
          Validators.required,
          Validators.minLength(15),
          Validators.maxLength(15)
        ])
      }),
    });


    this.checkoutFormGroup.statusChanges.subscribe(() => {
      this.updateButtonState();
    });
  }



  copyShippingAddressToBillingAddress(event: Event){
    const target = event.target as HTMLInputElement;

    if(target.checked){
      this.checkoutFormGroup.controls['billingAddress'].patchValue(this.checkoutFormGroup.controls['shippingAddress'].value);
      this.citiesBilling = this.citiesShipping;
    }
    else{
      this.checkoutFormGroup.controls['billingAddress'].reset();
      this.citiesBilling = [];
    }
  }


  getCities(controlName: string){
    const countryCode: string = this.checkoutFormGroup.get(`${controlName}.country` as string)?.value.code;

    const phoneCode = this.countryCodes[countryCode as keyof typeof this.countryCodes];

    this.formService.getCitiesByCountryCode(countryCode).subscribe(
      data => {
        if(controlName === 'shippingAddress'){
          this.citiesShipping = data;
          this.checkoutFormGroup.get('shippingAddress.phone')?.setValue(phoneCode);
        }  
        else
          this.citiesBilling = data;

          this.checkoutFormGroup.get(`${controlName}.city` as string)?.setValue(data[0]);
      }
    );
  }

  setupStripePaymentForm(){
    var elements = this.stripe.elements();

    const style = {
      base: {
        color: '#ffffff'
      },
    };

    this.cardElement = elements.create('card', {style: style, hidePostalCode: true});
    this.cardElement.mount('#card-element');

    this.cardElement.on('change', (event: any) =>{
      this.displayError = document.querySelector('#card-errors');

      if(event.complete){
        this.displayError.textContent = '';
        this.isStripeValid = true;
      }
      else if(event.error){
        this.displayError.textContent = event.error.message;
        this.isStripeValid = false;
      }
      else 
        this.isStripeValid = false;


      this.updateButtonState();
    });
  }

  updateButtonState(){
    this.isDisabled = !(this.checkoutFormGroup.valid && this.isStripeValid);
  }

  onSubmit(){
    if(this.checkoutFormGroup.invalid){
      this.checkoutFormGroup.markAllAsTouched();
      return;
    }

    this.isDisabled = true;

    let order = new Order();
    order.totalPrice = this.totalPrice;
    order.totalQuantity = this.totalQuantity;

    const cartItems = this.cartItems;

    let orderItems: OrderItem[] = cartItems.map(item => new OrderItem(item));

    let purchase = new Purchase();
    purchase.customer = this.checkoutFormGroup.controls['customer'].value;

    purchase.shippingAddress = this.checkoutFormGroup.controls['shippingAddress'].value;
    const shippingCountry: Country = JSON.parse(JSON.stringify(purchase.shippingAddress.country));
    const shippingCity: City = JSON.parse(JSON.stringify(purchase.shippingAddress.city));
    purchase.shippingAddress.country = shippingCountry.name;
    purchase.shippingAddress.city = shippingCity.name;

    purchase.billingAddress = this.checkoutFormGroup.controls['billingAddress'].value;
    const billingCountry: Country = JSON.parse(JSON.stringify(purchase.billingAddress.country));
    const billingCity: City = JSON.parse(JSON.stringify(purchase.billingAddress.city));
    purchase.billingAddress.country = billingCountry.name;
    purchase.billingAddress.city = billingCity.name;


    purchase.order = order;
    purchase.orderItems = orderItems;

    this.paymentInfo.amount = Math.round(this.totalPrice * 100);
    this.paymentInfo.currency = 'EUR';

    if(!this.checkoutFormGroup.invalid && this.displayError.textContent === ''){
      this.isDisabled = true;

      this.checkoutService.createPaymentIntent(this.paymentInfo).subscribe(
        paymentIntentResponse => {
          this.stripe.confirmCardPayment(paymentIntentResponse.client_secret,
            {
              payment_method: {
                card: this.cardElement,

                billing_details: {
                  email: purchase.customer.email,
                  name: `${purchase.billingAddress.firstName} ${purchase.billingAddress.lastName}`,
                  address: {
                    country: this.checkoutFormGroup.get('shippingAddress.country')?.value.code,
                    city: purchase.billingAddress.city,
                    line1: purchase.billingAddress.street,
                    postal_code: purchase.billingAddress.zipCode
                  }
                }
              }
            },
            {
              handleActions: false
            }
          ).then((result: any) => {
            if(result.error){
              alert(`There was an error: ${result.error.message}`);
              this.isDisabled = false;
            }
            else{
              this.checkoutService.placeOrder(purchase).subscribe({
                next: (response: any) => {
                  alert(`Your order has been received. \nOrder tracking number: ${response.orderTrackingNumber}`);

                  this.resetCart();
                  this.isDisabled = false;
                },
                error: (err: any) => {
                  alert(`There was an error: ${err.message}`);
                  this.isDisabled = false;
                }
              })
            }
          });
        }
      )
    }
    else{
      this.checkoutFormGroup.markAllAsTouched();
      return;
    }
  }

  resetCart(){
    this.cartService.resetObservable();
    this.cartService.totalPrice.next(0);
    this.cartService.totalQuantity.next(0);
    this.storage.removeItem('cartItems');

    this.checkoutFormGroup.reset();

    this.router.navigateByUrl('/home');
  }
  
}
