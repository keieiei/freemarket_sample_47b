function calculate() {
  let input = $("#price_form").val() / 1;

  if (input < 300 || input > 9999999) {
    $("#charge_form").text("-");
    $("#profit_form").text("-");
    return false;
  }

  let charge = parseInt(input / 10);
  if (charge) {
    $("#charge_form").text("¥" + charge.toLocaleString());

    let profit = input - charge;
    $("#profit_form").text("¥" + profit.toLocaleString());
  }
}

$(function () {
  $(document).on('keyup', '#price_form', function () {
    calculate();
  });
});

$(document).on('turbolinks:load', function () {
  calculate();
});