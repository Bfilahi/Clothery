import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent implements OnInit {

  title = 'Clothery';

  ngOnInit(): void {

    const year = document.querySelector('.year');
    if(year)
      year.textContent = new Date().getFullYear().toString();
  }
  
}
