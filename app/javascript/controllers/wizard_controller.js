import { Controller } from '@hotwired/stimulus';
import $ from 'jquery';
import CodeMirror from 'codemirror/lib/codemirror';

export default class extends Controller {
  static targets = ['step', 'codefield']

  goToNext(event) {
    console.log(this.codefieldTarget);
    const nextStep = event.target.dataset.nextStep - 1;
    const actualStep = event.target.dataset.nextStep;

    this.stepTargets[nextStep].classList.add("hidden");
    this.stepTargets[actualStep].classList.remove("hidden");
    this.loadCodeMirror();
  }

  loadCodeMirror() {
    if (document.querySelector('.CodeMirror')) {
      document.querySelector('.CodeMirror').remove();
    }

    const codeEditor = CodeMirror.fromTextArea(this.codefieldTarget, {
      lineNumbers: true,
      value: "function myScript(){return 100;}\n",
      mode: "javascript"
    });

    CodeMirror.on(codeEditor, 'blur', () => {
      this.codefieldTarget.value = codeEditor.getValue();
      console.log(this.codefieldTarget.value);
    });
  }
}