// 2 make another function "updateForm"
function updateForm() {

  const splitbutton = document.getElementById("splitEvenButton");

    //2.1.   find the value
    const number1 = document.getElementById("bill_amount").value;
    console.log(parseFloat(number1))
    if (number1 instanceof String || typeof number1 === "string") {
      var parsedNumber = parseFloat(number1.replace(',', '.'))
    } else {
      var parsedNumber = number1
    }
    // 2.2.  find the nr of users
    const number2 = splitbutton.dataset.memberships;

    // 2.3. split the account and save the value
    const math = parsedNumber / number2;
    console.log(math)
    // 2.4. find the inputs of users
    const inputs = document.querySelectorAll(".membership-bill-value");
    console.log(inputs)
    // 2.5.  for each inputs -> insert the values
    inputs.forEach( input => {
      input.value = math;
        });
 }


function addEventSplitButton() {
  //1.1 find button splitEvenButton
  const splitbutton = document.getElementById("splitEvenButton");

  //1.2 do a addeventlistener click
  if  (splitbutton) {
    splitbutton.addEventListener('click', () => updateForm() );
  }
}

export {addEventSplitButton};
