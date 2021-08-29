function itemPrice(){
  const profit = document.getElementById('profit');
  const addTaxDom = document.getElementById('add-tax-price');
  const priceInput = document.getElementById('item-price');

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value
    const salesCommission = Math.floor(inputValue * 0.1)
    addTaxDom.innerHTML = salesCommission
    profit.innerHTML = Math.floor(inputValue - salesCommission)
  });
}
window.addEventListener('load', itemPrice);