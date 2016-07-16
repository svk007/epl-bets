// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
function returnHome() {
  var x = document.getElementById("amountHome").value;
  var y = x * gon.homemul;
  if (y > 0)
  document.getElementById("returnh").innerHTML = "Return: " + Math.round(y);
  else
  document.getElementById("returnh").innerHTML = "";
}

function returnAway() {
  var x = document.getElementById("amountAway").value;
  var y = x * gon.awaymul;
  if (y > 0)
 	document.getElementById("returna").innerHTML = "Return: " + Math.round(y);
 	else
  document.getElementById("returna").innerHTML = "";
}

function returnDraw() {
  var x = document.getElementById("amountDraw").value;
  var y = x * gon.drawmul;
  if (y > 0)
  document.getElementById("returnd").innerHTML = "Return: " + Math.round(y);
  else
  document.getElementById("returnd").innerHTML = "";
}

function isNumber(evt) {
  evt = (evt) ? evt : window.event;
  var charCode = (evt.which) ? evt.which : evt.keyCode;
  if (charCode > 31 && (charCode < 48 || charCode > 57)) {
    return false;
  }
 return true;
}