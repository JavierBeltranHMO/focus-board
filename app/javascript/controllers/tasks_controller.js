// app/javascript/controllers/tasks_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["container", "template"];
  connect() {}

  add(event) {
    event.preventDefault();

    const content = this.templateTarget.innerHTML.replace(
      /NEW_TASK/g,
      new Date().getTime()
    );
    this.containerTarget.insertAdjacentHTML("beforeend", content);
  }
}
