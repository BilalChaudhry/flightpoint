import { Component, OnInit, OnChanges } from '@angular/core';

@Component({
  selector: 'app-zip-map',
  templateUrl: './zip-map.component.html',
  styleUrls: ['./zip-map.component.css']
})
export class ZipMapComponent implements OnInit {
  objectToDetail: any;

  constructor() { }

  details(event) {
    this.objectToDetail = event;
    console.log('zipMap', event);
  }

  ngOnInit() {
  }

}
