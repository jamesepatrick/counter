import createChannel from "client/cable";

let callback; // declaring a variable that will hold a function later

const chat2 = createChannel("CountChannel", {
  received({ message }) {
    if (callback) callback.call(null, message);
  },
});

const sendIncrement = (message) => chat2.perform("increment", { message });
const sendDecrement = (message) => chat2.perform("decrement", { message });

// Getting a message: this callback will be invoked once we receive
// something over ChatChannel
const setCallback = (fn) => {
  callback = fn;
};

export { sendIncrement, sendDecrement, setCallback };
