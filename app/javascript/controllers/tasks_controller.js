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
}
