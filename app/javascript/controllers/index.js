import { Application } from "@hotwired/stimulus"

const application = Application.start()

import TabsController from "controllers/tabs_controller"
import PdfModalController from "controllers/pdf_modal_controller"
import CollapsibleController from "controllers/collapsible_controller";
import IndexedbController from "controllers/indexedb_controller";

application.register("tabs", TabsController)
application.register("pdfmodal", PdfModalController)
application.register("collapsible", CollapsibleController)
application.register("indexedb", IndexedbController)

export { application }