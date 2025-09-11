import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = [ "step" ]

    connect() {
        this.currentStep = 0
        this.showStep()
    }

    showStep() {
        this.stepTargets.forEach((step, index) => {
            step.style.display = index === this.currentStep ? "block" : "none"
        })
    }

    nextStep() {
        if (this.currentStep < this.stepTargets.length - 1) {
            this.currentStep++
            this.showStep()
        }
    }

    previousStep() {
        if (this.currentStep > 0) {
            this.currentStep--
            this.showStep()
        }
    }

    submitForm(event) {
        event.preventDefault()
        this.element.submit()
    }
}