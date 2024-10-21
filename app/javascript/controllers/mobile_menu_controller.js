// app/javascript/controllers/mobile_menu_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu"]

  connect() {
    // Початковий стан (приховуємо меню)
    this.menuTarget.classList.add('hidden')
  }

  toggle() {
    // Перемикання класу 'hidden' для відкриття/закриття меню
    this.menuTarget.classList.toggle('hidden')
  }
}

