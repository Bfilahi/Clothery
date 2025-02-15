import { Component, ElementRef, ViewChild } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-search',
  templateUrl: './search.component.html',
  styleUrl: './search.component.css'
})
export class SearchComponent {

  @ViewChild('overlay') overlay: ElementRef | undefined;
  @ViewChild('searchBarSm') searchBar: ElementRef | undefined;


  constructor(private router: Router){}

  doSearch(value: string){
    if(value.trim() != ''){
      this.router.navigateByUrl(`/search/${value}`);
      this.overlay?.nativeElement.classList.remove('active');
    }
  }

  handleSearchBtn(){
    this.overlay?.nativeElement.classList.add('active');
  }

  handleCloseBtn(){
    this.overlay?.nativeElement.classList.remove('active');
  }
}
