import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["modal", "viewer"]

    connect() {
        console.log("pdf controller connected")
    }

    open(event) {
        event.preventDefault();
        const filename = event.currentTarget.dataset.filename;
        this.viewerTarget.src = `/pdfs/${filename}.pdf`;
        this.modalTarget.classList.add("active"); // show modal
    }

    close() {
        console.log("fsddfs")
        this.modalTarget.classList.remove("active"); // hide modal
        this.viewerTarget.src = "";
    }
}
