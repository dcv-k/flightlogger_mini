import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["content", "arrow"]
    static values = { expanded: Boolean }

    connect() {
        console.log("cc")
        this.updateDisplay()
    }

    toggle() {
        this.expandedValue = !this.expandedValue
        this.updateDisplay()
    }

    updateDisplay() {
        const content = this.contentTarget
        const arrow = this.arrowTarget
        const row = this.element.querySelector('.exercise-row')

        if (this.expandedValue) {
            content.style.display = "block"
            arrow.textContent = "▼"
            row.classList.add("expanded")
        } else {
            content.style.display = "none"
            arrow.textContent = "▶"
            row.classList.remove("expanded")
        }
    }

    expandedValueChanged() {
        this.updateDisplay()
    }
}