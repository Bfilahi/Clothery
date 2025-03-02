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


  constructor(
    private cartService: CartService,
    private formService: FormService,
    private formBuilder: FormBuilder,
    private checkoutService: CheckoutService,
    private router: Router
  ){}



  ngOnInit(): void {

    this.cartService.totalPrice.subscribe(
      data => this.totalPrice = data
    );

    this.cartService.totalQuantity.subscribe(
      data => this.totalQuantity = data
    );

    this.formService.getCountries().subscribe(
      data => this.countries = data
    );

    this.cartService.cartItems.subscribe(
      data => this.cartItems = data
    );


    this.checkoutFormGroup = new FormGroup({
      customer: this.formBuilder.group({
        email: new FormControl('', [
          Validators.required,
          Validators.pattern('^[a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,4}$')
        ])
      }),
  
      shippingAddress: this.formBuilder.group({
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
        ]),
        city: new FormControl('', [
          Validators.required
        ]),
        phone: new FormControl('', [
          Validators.required,
          Validators.minLength(15),
          Validators.maxLength(15)
        ]),
      }),
  
  
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

    this.formService.getCitiesByCountryCode(countryCode).subscribe(
      data => {
        if(controlName === 'shippingAddress')
          this.citiesShipping = data;
        
        else
          this.citiesBilling = data;

          this.checkoutFormGroup.get(`${controlName}.city` as string)?.setValue(data[0]);
      }
    );
  }

  onSubmit(){
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


    this.checkoutService.placeOrder(purchase).subscribe(
      {
        next: response => {
          alert(`Your order has been received.\nOrder tracking number: ${response.orderTrackingNumber}`);
          this.resetCart();
        },
        error: err => alert(`There was an error: ${err}`)
      }
    );

  }

  resetCart(){
    this.cartService.cartItems.next([]);
    this.cartService.totalPrice.next(0);
    this.cartService.totalQuantity.next(0);

    this.checkoutFormGroup.reset();

    this.router.navigateByUrl('/home');
  }
  
}
