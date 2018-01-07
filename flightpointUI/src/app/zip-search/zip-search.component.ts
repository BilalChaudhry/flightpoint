import { Component, OnInit } from '@angular/core';
import { Apollo } from 'apollo-angular';
import { Observable } from 'rxjs/Observable';

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
  constructor(private apollo: Apollo) {}

  ngOnInit() {
    this.resultsReady = false;
    this.loading = false;
  }

  postQuery(query) {
    this.resultsReady = false;
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
      console.log(this.results);
    });
  }
}
