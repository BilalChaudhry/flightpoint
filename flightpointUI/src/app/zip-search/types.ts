export type Author = {
    id: number;
    firstName: string;
    lastName: string;
  }
  
  export type Result = {
    airlines: Object;
    airports: Object;
    zipcodes: Object;
  }
  
  export type Query = {
    zipsearch: Result[];
  }