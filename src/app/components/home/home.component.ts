import { Component } from '@angular/core';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrl: './home.component.css'
})
export class HomeComponent {
  buttons = [
    {
      name: "SHOP MEN'S",
      gender: 'men'
    },
    {
      name: "SHOP WOMEN'S",
      gender: 'women'
    }
  ];

}
