import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-maps',
  templateUrl: './maps.component.html',
  styleUrls: ['./maps.component.css']
})
export class MapsComponent implements OnInit {
  title: string = 'My first AGM project';
  lat: number = 38;
  lng: number = -77;
  constructor() { }

  ngOnInit() {

  }

}
