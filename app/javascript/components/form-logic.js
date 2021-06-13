
const formLogic = () => {
  let checkIn = document.getElementById('booking_check_in');

  if ( checkIn ){
    let checkOut = document.getElementById('booking_check_out');
    const pricePerNight = document.getElementById('price-p-night').textContent;
    const totalPrice = document.getElementById('total-price');
    const totalP = document.getElementById('booking_total_price');
    let dateIn = "";
    let dateOut = "";
    let finalPrice = 0;

    checkIn.addEventListener('blur', (event) => {
      checkIn = event.target.value.toString().split('-');
      dateIn = new Date(checkIn[0], checkIn[1]-1, checkIn[2]);
    });

    checkOut.addEventListener('blur', (event) => {
      checkOut = event.target.value.toString().split('-');
      dateOut = new Date(checkOut[0], checkOut[1]-1, checkOut[2]);
      let difference = dateOut.getTime() - dateIn.getTime();
      let days = Math.ceil(difference / (1000 * 3600 * 24));
      finalPrice = pricePerNight * days;
      totalP.value = finalPrice;
      totalPrice.innerHTML =  finalPrice;
      
      console.log(totalP)
    });
  }
}


export { formLogic };