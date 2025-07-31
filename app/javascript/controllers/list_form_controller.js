// app/javascript/controllers/list_form_controller.js

import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["idField", "nameField", "title"];

  connect() {
    this.modal = new bootstrap.Modal(document.getElementById("list-modal"));
  }

  new(event) {
    event.preventDefault();
  }

  edit(event) {
    event.preventDefault();
    console.log("hello");
    const data = JSON.parse(event.currentTarget.dataset.list);

    this.titleTarget.textContent = "Change Name";
    this.idFieldTarget.value = data.id;
    this.nameFieldTarget.value = data.name;

    const form = document.getElementById("list-form");
    form.action = data.url;
    form.method = "post";

    const methodInput = document.createElement("input");
    methodInput.type = "hidden";
    methodInput.name = "_method";
    methodInput.value = "patch";
    form.appendChild(methodInput);

    this.modal.show();
  }
}
