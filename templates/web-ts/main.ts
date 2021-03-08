"use strict";

window.addEventListener("load", main);

function main() {
  fetchDadJoke("https://icanhazdadjoke.com/");
}

async function fetchDadJoke(url) {
  try {
    const response = await fetch(url, {
      method: "GET",
      headers: {
        Accept: "application/json",
      },
    });
    const joke = await response.json();
    displayDadJoke(joke.joke);
  } catch (err) {
    console.error(err);
  }
}

function displayDadJoke(joke) {
  const jokeText = id("joke");
  jokeText.textContent = joke;
}

/* -------------- Helper Functions  -------------- */

function id(idName) {
  return document.getElementById(idName);
}

function qs(query) {
  return document.querySelector(query);
}

function qsa(query) {
  return document.querySelectorAll(query);
}

function create(element) {
  return document.createElement(element);
}
