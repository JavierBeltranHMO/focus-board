import { Controller } from "@hotwired/stimulus";
import Sortable from "sortablejs";
import { put } from "@rails/request.js";

// Connects to data-controller="sortable"
export default class extends Controller {
  static values = { group: String };
  connect() {
    Sortable.create(this.element, {
      onEnd: this.onEnd.bind(this),
      group: this.groupValue,
    });
  }

  onEnd(e) {
    let sortableUpdateUrl = e.item.dataset.sortableUpdateUrl;
    let sortableListId = e.to.dataset.sortableListId;
    put(sortableUpdateUrl, {
      body: JSON.stringify({
        row_order_position: e.newIndex,
        list_id: sortableListId,
      }),
    });
  }
}
