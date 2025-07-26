import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["button", "content"]

    connect() {
        this.showTab(this.buttonTargets[0])
    }

    switchTab(event) {
        event.preventDefault()
        this.showTab(event.currentTarget)
    }

    showTab(selectedButton) {
        this.buttonTargets.forEach(button => {
            button.classList.toggle("active", button === selectedButton)
        })

        this.contentTargets.forEach(content => {
            content.hidden = content.dataset.tab !== selectedButton.dataset.tab
        })
    }
}
