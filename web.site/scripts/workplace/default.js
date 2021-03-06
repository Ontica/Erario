/* Empiria® **************************************************************************************************
*																																																						 *
*	 Solution  : Empiria® Web																			System   : Workplace												 *
*	 File      : /workplace/default.js														Pattern  : JavaScript Methods Library				 *
*	 Date      : 31/Mar/2005                                      Version  : 2.0      Pattern version: 2.0     *
*																																																						 *
*  Summary   : Contains general methods used in workplace default page.																			 *
*																																																						 *
********************************************************* Copyright © Ontica, sa de cv. México, 1999-2005. **/

// region Public methods

function backHistory() {
	alert("reloading last workarea. Please Wait ....");
}

function forwardHistory() {
	alert("reloading next workarea. Please Wait ....");
}

function loadWorkarea(workarea) {
	alert("loading " + workarea + ". Please Wait ....");
}

function reloadWorkarea() {
	alert("reloading current workarea. Please Wait ....");
}

function workplace_onload() {
	displayDate('oDate', true, true);
}

// endregion Public methods
