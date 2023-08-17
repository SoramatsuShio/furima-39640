window.addEventListener('load', function(){
  const itemPrice = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  const taxRate = 0.1; // 10%の税率（例として設定）

  itemPrice.addEventListener("input", () => {
    const inputValue = parseInt(itemPrice.value);

    // 販売手数料（税込み価格 - 税抜き価格）
    const calculatedTax = Math.floor(inputValue * taxRate);

    // 利益計算（税抜き価格 - 販売手数料）
    const calculatedProfit = Math.floor(inputValue - calculatedTax);

    addTaxPrice.textContent = ` ${calculatedTax}`;
    profit.textContent = ` ${calculatedProfit}`;
  });
});
