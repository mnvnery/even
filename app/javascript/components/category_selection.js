function categorySelect() {
  const rent = document.querySelector("#rent");
  const gas = document.querySelector("#gas");
  const electricity = document.querySelector("#electricity");
  const internet = document.querySelector("#internet");
  const water = document.querySelector("#water");
  const input = document.querySelector("#bill_category");

  if (rent) {
    rent.addEventListener('click', function (){
        input.value = "rent";
        rent.style.opacity = "1"
        gas.style.opacity = "0.5"
        electricity.style.opacity = "0.5"
        internet.style.opacity = "0.5"
        water.style.opacity = "0.5"
    })
  }
  if (gas) {
    gas.addEventListener('click', function (){
        input.value = "gas";
        rent.style.opacity = "0.5"
        gas.style.opacity = "1"
        electricity.style.opacity = "0.5"
        internet.style.opacity = "0.5"
        water.style.opacity = "0.5"
    })
  }
  if (electricity) {
    electricity.addEventListener('click', function (){
        input.value = "electricity";
        rent.style.opacity = "0.5"
        gas.style.opacity = "0.5"
        electricity.style.opacity = "1"
        internet.style.opacity = "0.5"
        water.style.opacity = "0.5"
    })
  }
  if (internet){
    internet.addEventListener('click', function (){
        input.value = "internet";
        rent.style.opacity = "0.5"
        gas.style.opacity = "0.5"
        electricity.style.opacity = "0.5"
        internet.style.opacity = "1"
        water.style.opacity = "0.5"
    })
  }
  if (water) {
    water.addEventListener('click', function (){
        input.value = "water";
        input.value = "internet";
        rent.style.opacity = "0.5"
        gas.style.opacity = "0.5"
        electricity.style.opacity = "0.5"
        internet.style.opacity = "0.5"
        water.style.opacity = "1"
    })
  }
}

export {categorySelect};
