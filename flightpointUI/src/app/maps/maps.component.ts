import { Component, OnInit, OnChanges, SimpleChanges, Input } from '@angular/core';

@Component({
  selector: 'app-maps',
  templateUrl: './maps.component.html',
  styleUrls: ['./maps.component.css']
})
export class MapsComponent implements OnInit, OnChanges {
  // default to washington, DC (need geolocation api)
  @Input() objectToDetail: any;

  lat = 38;
  lng = -77;
  constructor() { }

  details(event) {
    console.log('maps', event);
  }

  ngOnChanges(changes: SimpleChanges) {
    // changes.prop contains the old and the new value...
    console.log('changes', changes);
  }

  ngOnInit() {

  }

}
