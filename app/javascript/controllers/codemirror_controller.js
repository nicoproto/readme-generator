import { Controller } from '@hotwired/stimulus';
import CodeMirror from 'codemirror/lib/codemirror';

export default class extends Controller {
  // Note: On readmes#edit & readmes#new CodeMiror is loaded from 'wizard_controller'
  static targets = ['codefield']

  connect() {
    CodeMirror.fromTextArea(this.element, {
      lineNumbers: true,
      mode: "javascript",
      readOnly: true,
    });
  }
}