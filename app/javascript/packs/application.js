import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";

Rails.start();
Turbolinks.start();

document.addEventListener("turbolinks:load", () => {
  const notification = document.querySelector(".global-notification");

  if (notification) {
    window.setTimeout(() => {
      notification.style.display = "none";
    }, 3000);
  }
});
