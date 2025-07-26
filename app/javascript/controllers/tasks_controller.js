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
    const listSlug = event.currentTarget.dataset.taskListSlugValue;
    const modalEl = document.getElementById("new-task-modal");
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
    modalEl.querySelector("#task-errors").classList.add("d-none");

    const modal = new bootstrap.Modal(modalEl);
    modal.show();
  }

  resetModal(event) {
    const modalEl = document.getElementById("new-task-modal");
    if (event.detail.success) {
      bootstrap.Modal.getInstance(modalEl)?.hide();
      modalEl.querySelector("form").reset();
    }
  }
}
