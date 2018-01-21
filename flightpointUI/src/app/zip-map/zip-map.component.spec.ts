import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ZipMapComponent } from './zip-map.component';

describe('ZipMapComponent', () => {
  let component: ZipMapComponent;
  let fixture: ComponentFixture<ZipMapComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ZipMapComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ZipMapComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
