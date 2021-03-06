/* Empiria® **************************************************************************************************
*																																																						 *
*	 Solution  : Empiria® Web																			System   : Web Core Library									 *
*	 File      : clock.js																					Pattern  : JavaScript Methods Library				 *
*	 Date      : 31/Mar/2005                                      Version  : 2.0      Pattern version: 2.0     *
*																																																						 *
*  Summary   : Displays the client system date-time in an html item.                                         *
*																																																						 *
********************************************************* Copyright © Ontica, sa de cv. México, 1999-2005. **/

// region Public methods

function displayDate(itemName, useSpanish, useMilitar) {
  var aMonthsSpanish = new Array("enero", "febrero", "marzo", "abril", "mayo", "junio", "julio", "agosto", "septiembre", "octubre", "noviembre", "diciembre");
  var aMonthsEnglish = new Array("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December");
  var aDaysSpanish   = new Array("Domingo", "Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado");
  var aDaysEnglish   = new Array("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday");
  var today          = new Date();

  if (useSpanish) {
    document.all[itemName].innerText = aDaysSpanish[today.getDay()] + " " + today.getDate() + " de " + aMonthsSpanish[today.getMonth()] + " / " + getTime(useMilitar);
  } else {
    document.all[itemName].innerText = aDaysEnglish[today.getDay()] + ", " + aMonthsEnglish[today.getMonth()] + " " + today.getDate() + " / " + getTime(useMilitar);
  }
  window.setTimeout("displayDate('" + itemName + "', " + useSpanish + ", " + useMilitar + ");", 999);
}

// endregion Public methods

// region Private methods

function getTime(useMilitar) {
  var hours, minutes, ap;
  var intHours, intMinutes;
  var today;
  today      = new Date();
  intHours   = today.getHours();
  intMinutes = today.getMinutes();

  if (!useMilitar) { 
      if (intHours == 0) {
       hours = "12";
       ap = "a.m.";
    } else if (intHours < 12) { 
       hours = intHours;
       ap = "a.m.";
    } else if (intHours == 12) {
       hours = "12";
       ap = "p.m.";
    } else {
       intHours = intHours - 12;
       hours = intHours;
       ap = "p.m.";
    }
    minutes = intMinutes;
  } else {
     hours = intHours;
     minutes = intMinutes;
     ap = "hrs";
  }

  if (intHours < 10 && intHours != 0) {
    hours = "0" + hours;
  }

  if (intMinutes < 10) {
    minutes = "0" + minutes;
  }    
  return (hours + ":" + minutes + ' ' + ap);
}

// endregion Private methods
