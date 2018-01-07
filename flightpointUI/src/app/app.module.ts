// module includes
import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import {NgbModule} from '@ng-bootstrap/ng-bootstrap';

// apollo


// component includes
import { AppComponent } from './app.component';
import { ZipSearchComponent } from './zip-search/zip-search.component';
import { NavComponent } from './nav/nav.component';
import { FooterComponent } from './footer/footer.component';

import { GraphQLClient } from './graphql.client';

@NgModule({
  declarations: [
    AppComponent, ZipSearchComponent, NavComponent, FooterComponent
  ],
  imports: [
    BrowserModule, FormsModule, NgbModule.forRoot(),
    GraphQLClient
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
