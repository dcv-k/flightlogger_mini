import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["modal", "viewer"]

    connect() {
        // just for debugging
        console.log("PDF Modal controller connected");

        // document.querySelectorAll('[data-action="click->pdfmodal#open"]').forEach(el => {
        //     console.log("Found clickable PDF link:", el);
        // });
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
