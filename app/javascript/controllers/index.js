import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Manually import each controller
import TabsController from "controllers/tabs_controller"
import PdfModalController from "controllers/pdf_modal_controller"

// Register controllers
application.register("tabs", TabsController)
application.register("pdfmodal", PdfModalController)

export { application }