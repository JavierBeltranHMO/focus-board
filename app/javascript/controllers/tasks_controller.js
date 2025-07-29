// app/javascript/controllers/tasks_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["modal", "listIdField"];
  static values = { listId: Number };
  // connect() {}

  markComplete(event) {
    event.preventDefault();
    const taskItem = event.target.closest(".task-item");
    if (taskItem) {
      taskItem.classList.toggle("text-decoration-line-through");
      taskItem.classList.toggle("opacity-50");
    }
  }

  modal(event) {
    // console.log("hnotello");
    const listSlug = event.currentTarget.dataset.taskListSlugValue;
    const modalEl = this.modalTarget;
    const listIdField = modalEl.querySelector(
      '[data-tasks-target="listIdField"]'
    );
    const form = modalEl.querySelector("form");
    const boardSlug = modalEl.dataset.boardSlug;

    listIdField.value = listSlug;
    form.action = `/boards/${boardSlug}/lists/${listSlug}/tasks`;
    form.method = "post";

    modalEl.querySelector("#task-id-field").value = "";
    modalEl.querySelector("input[name='task[name]']").value = "";
    modalEl.querySelector("textarea[name='task[description]']").value = "";

    modalEl.querySelector(".modal-title").textContent = "New Task";
    modalEl.querySelector("input[name='_method']")?.remove();

    const idField = modalEl.querySelector('[data-tasks-target="idField"]');
    if (idField) {
      idField.disabled = true;
      idField.value = "";
    }

    const modal = new bootstrap.Modal(modalEl);
    modal.show();
  }

  editModal(event) {
    const modalEl = this.modalTarget;
    const form = modalEl.querySelector("form");

    const { id, name, description, listId } = event.currentTarget.dataset;

    modalEl.querySelector("input[name='task[name]']").value = name;
    modalEl.querySelector("textarea[name='task[description]']").value =
      description;
    this.listIdFieldTarget.value = listId;
    form.action = `/tasks/${id}`;
    form.method = "post";

    let methodInput = form.querySelector("input[name='_method']");
    if (!methodInput) {
      methodInput = document.createElement("input");
      methodInput.type = "hidden";
      methodInput.name = "_method";
      form.appendChild(methodInput);
    }
    methodInput.value = "patch";

    modalEl.querySelector(".modal-title").textContent = "Edit Task";
    this.listIdFieldTarget.disabled = false;
    this.listIdFieldTarget.value = listId;

    const modal = new bootstrap.Modal(modalEl);
    modal.show();
  }

  resetModal(event) {
    const modalEl = this.modalTarget;
    if (event.detail.success) {
      bootstrap.Modal.getInstance(modalEl)?.hide();
      modalEl.querySelector("form").reset();
    }
  }
}
