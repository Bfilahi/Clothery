import { Component, OnInit } from '@angular/core';
import { NavigationEnd, Router } from '@angular/router';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent implements OnInit {

  title = 'Clothery';

  showHeader: boolean = true;

  constructor(private router: Router) {
    this.router.events.subscribe((event) => {
        if (event instanceof NavigationEnd) {
            
            this.showHeader = !(event.url === '/checkout');
        }
    });
  }

  ngOnInit(): void {

    const year = document.querySelector('.year');
    if(year)
      year.textContent = new Date().getFullYear().toString();
  }
  
}
