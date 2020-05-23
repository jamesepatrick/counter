import "./counter-up-btn.pcss";

import { sendIncrement } from "client/counter";

window.addEventListener("DOMContentLoaded", () => {
  const btn = document.querySelector(".counter-up-btn");
  if (btn) {
    btn.addEventListener("click", (event) => {
      event.preventDefault();
      sendIncrement(-1);
    });
  }
});
