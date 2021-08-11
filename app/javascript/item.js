window.addEventListener('load', () => {
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("input", () => {
    const itemPriceValue = itemPrice.value;
    const addTaxPrice = document.getElementById("add-tax-price");
    const addTaxPriceValue = Math.floor(itemPriceValue * 0.1);
    addTaxPrice.innerHTML = addTaxPriceValue;
    const profit = document.getElementById("profit");
    profit.innerHTML = itemPriceValue - addTaxPriceValue;
  });
});
