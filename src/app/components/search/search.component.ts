import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import { Router } from '@angular/router';
import { ProductService } from '../../services/product.service';

@Component({
  selector: 'app-search',
  templateUrl: './search.component.html',
  styleUrl: './search.component.css'
})
export class SearchComponent implements OnInit{

  @ViewChild('overlay') overlay: ElementRef | undefined;
  @ViewChild('searchBarSm') searchBar: ElementRef | undefined;

  sharedKeyword: string = '';


  constructor(private router: Router, private productService: ProductService){}

  ngOnInit(): void {
    this.productService.searchKeyword.subscribe(
      data => this.sharedKeyword = data
    );
  }

  doSearch(value: string){
    if(value.trim() != ''){
      this.router.navigateByUrl(`/search/${value}`);
      this.overlay?.nativeElement.classList.remove('active');
      document.querySelector('body')!.classList.remove('block-scrollbar');
    }
  }

  handleSearchBtn(){
    this.overlay?.nativeElement.classList.add('active');

    document.querySelector('body')!.classList.add('block-scrollbar');
  }

  handleCloseBtn(){
    this.overlay?.nativeElement.classList.remove('active');
    document.querySelector('body')!.classList.remove('block-scrollbar');
  }
}
