// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener("DOMContentLoaded", () => {
  const responseDiv = document.getElementById("response");
  const button1 = document.getElementById("request1");

  button1.addEventListener("click", () => {
    fetch("https://fakerapi.it/api/v1/companies?_quantity=5")
      .then((response) => response.text())
      .then((text) => (responseDiv.innerHTML = text));
  });

  const button2 = document.getElementById("request2");

  button2.addEventListener("click", () => {
    fetch("https://fakerapizzz.it/api/v1/companies?_quantity=5")
      .then((response) => response.text())
      .then((text) => (responseDiv.innerHTML = text));
  });
});

