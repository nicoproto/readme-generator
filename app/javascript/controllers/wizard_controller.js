import { Controller } from '@hotwired/stimulus';
import CodeMirror from 'codemirror/lib/codemirror';

export default class extends Controller {
  static targets = ['step', 'codefield']

  goToNext(event) {
    const nextStep = event.target.dataset.nextStep - 1;
    const actualStep = event.target.dataset.nextStep;

    this.stepTargets[nextStep].classList.add("hidden");
    this.stepTargets[actualStep].classList.remove("hidden");
    this.loadCodeMirror();
  }

  goToPrevious(event) {
    const previousStep = event.target.dataset.previousStep - 1;
    const actualStep = event.target.dataset.previousStep;

    this.stepTargets[actualStep].classList.add("hidden");
    this.stepTargets[previousStep].classList.remove("hidden");
    this.loadCodeMirror();
  }

  loadCodeMirror() {
    // Note: This should only load for readmes#new & readmes#edit
    if (document.querySelector('.CodeMirror')) {
      document.querySelector('.CodeMirror').remove();
    }

    const codeEditor = CodeMirror.fromTextArea(this.codefieldTarget, {
      lineNumbers: true,
      mode: "javascript"
    });

    if (this.codefieldTarget.value == "") {
      codeEditor.setValue(`# Please add here \n# any commands\n# to run\n# on setup\n# 😃
      `);
    }

    CodeMirror.on(codeEditor, 'blur', () => {
      this.codefieldTarget.value = codeEditor.getValue();
    });
  }
}