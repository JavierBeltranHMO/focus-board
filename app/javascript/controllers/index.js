//app/javascript/controllers/index
import { Application } from "@hotwired/stimulus";

import BoardFormController from "./board_form_controller";
import HelloController from "./hello_controller";
import ListFormController from "./list_form_controller";
import SortableController from "./sortable_controller";
import TasksController from "./tasks_controller";

const application = Application.start();

application.register("board-form", BoardFormController);
application.register("hello", HelloController);
application.register("list-form", ListFormController);
application.register("sortable", SortableController);
application.register("tasks", TasksController);

export default application;
