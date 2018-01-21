// module includes
import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import {NgbModule} from '@ng-bootstrap/ng-bootstrap';
import { AgmCoreModule } from '@agm/core';

// apollo
import { GraphQLClient } from './graphql.client';

// component includes
import { AppComponent } from './app.component';
import { ZipSearchComponent } from './zip-search/zip-search.component';
import { NavComponent } from './nav/nav.component';
import { FooterComponent } from './footer/footer.component';
import { MapsComponent } from './maps/maps.component';
import { environment } from '../environments/environment';
import { ZipMapComponent } from './zip-map/zip-map.component';

@NgModule({
  declarations: [
    AppComponent, ZipSearchComponent, NavComponent, FooterComponent, MapsComponent, ZipMapComponent
  ],
  imports: [
    BrowserModule, FormsModule, NgbModule.forRoot(),
    GraphQLClient,
    AgmCoreModule.forRoot({
      apiKey: environment.googleMaps.apiKey
    })
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
