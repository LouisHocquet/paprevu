import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="loader"
export default class extends Controller {
  static targets = [
    "title",
    "pendingImg",
    "successImg",
    "successAction"
  ]

  connect() {
    // console.log("hello from loader_controller.js :)")
    setTimeout(() => {
      this.switchToLoaderSuccessState()
    }, 5000);

  }

  switchToLoaderSuccessState() {
    // console.log("hello from switchToLoaderSuccessState")
    const newTitle = "Ça y est on a trouvé une super activité !";
    this.titleTarget.innerText = newTitle;
    this.pendingImgTarget.style.display = "none";
    this.successImgTarget.style.display = "block";
    this.successActionTarget.style.display = "flex";
  };
}
