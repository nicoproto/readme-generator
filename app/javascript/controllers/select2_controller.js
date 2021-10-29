import { Controller } from '@hotwired/stimulus';
import $ from 'jquery';
import 'select2';

export default class extends Controller {
  static values = { options: Object }

  connect() {
    var endpoint_url = "http://localhost:3000/api/v1/";

    if (this.element.name.includes("gem")) {
      endpoint_url += "gems?query=";
    }

    if (this.element.name.includes("package")) {
      endpoint_url += "packages?query=";
    }

    $(this.element).select2({
      ...this.optionsValue,
      minimumInputLength: 3,
      ajax: {
        url: function (params) {
          return `${endpoint_url}${params.term}`;
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

    if (this.element.dataset.selected) {
      this.preselect();
    }
  }

  preselect() {
    const selectedValues = JSON.parse(this.element.dataset.selected);

    selectedValues.forEach((tool) => {
      var newOption = new Option(tool['name'], tool['id'], false, true);
      $(this.element).append(newOption);
    });

    $(this.element).trigger('change');
  }
}