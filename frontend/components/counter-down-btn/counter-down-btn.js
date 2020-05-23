import "./counter-down-btn.pcss";

import { sendDecrement } from "client/counter";

window.addEventListener("DOMContentLoaded", () => {
  const btn = document.querySelector(".counter-down-btn");
  if (btn) {
    btn.addEventListener("click", (event) => {
      event.preventDefault();
      sendDecrement(1);
    });
  }
});
