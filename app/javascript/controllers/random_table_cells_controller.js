import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="random-table-cells"
export default class extends Controller {
  static targets = ["randomCell"]
  connect() {
    this.selectRandomCells()
  }

  selectRandomCells() {
    const selectedCells = []

    // Loop until we have selected 3 cells
    while (selectedCells.length < 3) {
      const randomIndex = Math.floor(Math.random() * this.randomCellTargets.length)
      const randomCell = this.randomCellTargets[randomIndex]

      // Check if the cell is already selected
      if (!selectedCells.includes(randomCell)) {
        selectedCells.push(randomCell)
        randomCell.classList.add("selected")
      }
    }
  }
}
