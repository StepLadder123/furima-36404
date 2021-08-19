window.addEventListener('load', () => {
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("input", () => {
    const itemPriceValue = itemPrice.value;
    const addTaxPrice = document.getElementById("add-tax-price");
    if (gon.currentUserSellCount >= 5) {
      var rankCoef = 0.05;
    } else if (gon.currentUserSellCount >= 3) {
      var rankCoef = 0.08;
    } else {
      var rankCoef = 0.1;
    }
    const addTaxPriceValue = Math.floor(itemPriceValue * rankCoef);
    addTaxPrice.innerHTML = addTaxPriceValue;
    const profit = document.getElementById("profit");
    profit.innerHTML = itemPriceValue - addTaxPriceValue;
  });
});
