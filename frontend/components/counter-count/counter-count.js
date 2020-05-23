import "./counter-count.pcss";

import { setCallback } from "client/counter";

window.addEventListener("DOMContentLoaded", () => {
  const currentCount = document.querySelector(".count");
  if (currentCount) {
    setCallback((message) => {
      currentCount.innerHTML = message;
    });
  }
});
