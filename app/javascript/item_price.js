window.addEventListener('turbo:load', () => {

  const priceInput = document.getElementById("item-price");
  priceInput.addEventLister("input",() => {console.log("priceInputイベント発火");

  const taxInput = document.getElementById("add-tax-price");
  priceInput.addEventLister("input",() => {console.log("add-tax-priceイベント発火");

  const profitInput = document.getElementById("profit");
  priceInput.addEventLister("input",() => {console.log("profitInputイベント発火");

});