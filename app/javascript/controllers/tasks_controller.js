// app/javascript/controllers/tasks_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["container", "template", "modal", "listIdField"];
  static values = { listId: Number };
  // connect() {}

  add(event) {
    event.preventDefault();
    const content = this.templateTarget.innerHTML.replace(
      /NEW_TASK/g,
      new Date().getTime()
    );
    this.containerTarget.insertAdjacentHTML("beforeend", content);
  }

  removeTask(event) {
    event.preventDefault();
    const taskItem =
      event.target.closest(".nested-task") ||
      event.target.closest(".task-item");
    if (taskItem) {
      const destroyField = taskItem.querySelector('input[name*="_destroy"]');
      if (destroyField) {
        destroyField.value = "1";
        taskItem.style.display = "none";
      } else {
        taskItem.remove();
      }
    }
  }

  markComplete(event) {
    event.preventDefault();
    const taskItem = event.target.closest(".task-item");
    if (taskItem) {
      taskItem.classList.toggle("text-decoration-line-through");
      taskItem.classList.toggle("opacity-50");
    }
  }

  modal(event) {
    console.log("nope");
    const listId = event.currentTarget.dataset.taskListIdValue;
    this.listIdFieldTarget.value = listId;
    const modal = new bootstrap.Modal(this.modalTarget);
    modal.show();

    const form = this.modalTarget.querySelector("form");
    const boardId = this.modalTarget.dataset.boardId;
    if (form && boardId && listId) {
      form.action = `/boards/${boardId}/lists/${listId}/tasks`;
    }
  }
}
