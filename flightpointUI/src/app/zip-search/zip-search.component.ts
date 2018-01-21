import { Component, OnInit, EventEmitter, Output } from '@angular/core';
import { Apollo } from 'apollo-angular';
import { Observable } from 'rxjs/Observable';

import 'rxjs/add/operator/distinctUntilChanged';
import 'rxjs/add/operator/debounceTime';

import gql from 'graphql-tag';

@Component({
  selector: 'app-zip-search',
  templateUrl: './zip-search.component.html',
  styleUrls: ['./zip-search.component.css']
})

export class ZipSearchComponent implements OnInit {
  loading: boolean;
  resultsReady: boolean;
  results: any;
  queryChangeObserver;
  @Output() showSearchDetails = new EventEmitter<any>();

  constructor(private apollo: Apollo) {}

  ngOnInit() {
    this.resultsReady = false;
    this.loading = false;
  }


  onQueryChange(q: string) {

    if (!this.queryChangeObserver) {
      Observable.create(observer => {
        this.queryChangeObserver = observer;
      })
        .debounceTime(300) // wait 300ms after the last event before emitting last event
        .distinctUntilChanged() // only emit if value is different from previous value
        .subscribe(query => { this.postQuery(query); });
    }

    this.queryChangeObserver.next(q);
  }

  show(type: string, object) {
    console.log(type, object);

    this.showSearchDetails.emit({type: type, object: object});
  }

  postQuery(query) {
    this.loading = false;
    this.results = this.apollo.watchQuery<any>({
      query: gql`
        query allPosts {
          zipsearch(q: "${query}") {
            airports {
              id
              name
              icao
              iata
            }
            zipcodes {
              id
              name
              city
              state
            }
            airlines {
              id
              name
              icao
              iata
            }
          }
        }
      `
    }).valueChanges
    .subscribe(({data}) => {
      this.loading = data.loading;
      this.results = data.zipsearch;
      this.resultsReady = true;
      // console.log(this.loading, this.results);
    });
  }
}
