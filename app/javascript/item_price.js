window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const tax = 0.1;

    // 販売手数料
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * tax);

    // 販売利益
    const salesProfit = document.getElementById("profit");
    salesProfit.innerHTML = Math.floor(inputValue - addTaxDom.innerHTML);
  })
});

