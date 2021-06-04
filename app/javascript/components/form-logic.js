
const formLogic = () => {
  let checkIn = document.getElementById('booking_check_in');

  if ( checkIn ){
    let checkOut = document.getElementById('booking_check_out');
    let pricePerNight = document.getElementById('price-p-night').textContent;
    const totalPrice = document.getElementById('total-price');
    const totalP = document.getElementById('booking_total_price');
    let cIn = "";
    let out ="";

    checkIn.addEventListener('blur', (event) => {
      checkIn = event.target.value;
      cIn = checkIn.toString().replace(/-/g, "");
      
    });
    checkOut.addEventListener('blur', (event) => {
      checkOut = event.target.value;
      out = checkOut.toString().replace(/-/g, "");
      const finalPrice = (out - cIn) * pricePerNight;
      // totalPrice.innerText = "Total Price: £ " + finalPrice;
      totalP.value =  finalPrice;
      totalPrice.innerHTML =  finalPrice;
    });
  }



}


export { formLogic };