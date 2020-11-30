window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue1 = priceInput.value;
    // console.log(inputValue);
    const addTaxDom = document.getElementById("add-tax-price");
      const inputValue2 = Math.floor(inputValue1 / 10);
      //console.log(addTaxDom);
      addTaxDom.innerHTML = inputValue2
      const addProfit = document.getElementById("profit");
      addProfit.innerHTML = Math.floor(inputValue1 - inputValue2);
      console.log(addProfit);
  })
});