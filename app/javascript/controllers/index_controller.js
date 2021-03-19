import { Controller } from 'stimulus'; 
export default class extends Controller {
  connect() {
    console.log("Stimulus")
  }
  helloWorld() {
    console.log("hello World")
  }
}