import { Controller } from '@hotwired/stimulus';
import $ from 'jquery';
import 'select2';

export default class extends Controller {
  static values = { options: Object }

  connect() {
     $(this.element).select2({
       ...this.optionsValue,
       ajax: {
        url: function (params) {
          return `http://localhost:3000/api/v1/gems?query=${params.term}`;
        },
        dataType: 'json',
        processResults: function (data) {

          return {
            results: data.map((x) => {
              return {
                text: x['name'],
                slug: x['name'],
                id: x['name'],
              }
            } )
          };
        },
        cache: true,
        delay: 500,
       }
      });
     console.log('connected');
  }
}