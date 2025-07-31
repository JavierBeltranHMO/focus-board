// app/javascript/controllers/board_form_controller.js

import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["idField", "nameField", "title", "form"];

  connect() {
    this.modal = new bootstrap.Modal(document.getElementById("board-modal"));
  }

  new(event) {
    event.preventDefault();

    this.titleTarget.textContent = "New Board";
    this.idFieldTarget.value = "";
    this.nameFieldTarget.value = "";

    this.formTarget.action = this.formTarget.dataset.newUrl;
    this.formTarget.method = "post";

    // const modal = bootstrap.Modal.getOrCreateInstance(
    //   document.getElementById("board-modal")
    // );
    this.modal.show();
  }

  edit(event) {
    event.preventDefault();

    const data = JSON.parse(event.currentTarget.dataset.board);

    this.titleTarget.textContent = "Change Name";
    this.idFieldTarget.value = data.id;
    this.nameFieldTarget.value = data.name;

    this.formTarget.action = data.url;
    this.formTarget.method = "post";

    const methodInput = document.createElement("input");
    methodInput.type = "hidden";
    methodInput.name = "_method";
    methodInput.value = "patch";
    this.formTarget.appendChild(methodInput);

    this.modal.show();
  }
}
