import { Controller } from 'stimulus'; 
export default class extends Controller {
  static targets = [
    "label",
    "input"
  ]
  connect() {
    console.log("Stimulus");
  }
  onInputChange() {
    console.log(this.inputTarget.value);
    const year = parseInt(this.inputTarget.value);
    const now = new Date();
    const age = now.getFullYear() - year;
    console.log(age);
    if (isNaN(age) || age < 0) {
      this.labelTarget.innerHTML = 'Age: Invalid';
      this.labelTarget.classList.add("text-red-500");
      return;
    }
    if (age < 18) {
      console.log(this.labelTarget.classList);
      this.labelTarget.classList.add("text-red-500");
    } else {
      this.labelTarget.classList.remove("text-red-500");
    }
    this.labelTarget.innerHTML = `Age: ${age}`;
  }
}