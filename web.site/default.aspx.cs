/* Empiria® **************************************************************************************************
*																																																						 *
*	 Solution  : Empiria® Web Application                         System   : Empiria Web Workplace             *
*	 Namespace : Empiria.WebApp                                   Assembly : Empiria.WebApp.dll                *
*	 Type      : LogonPage                                        Pattern  : View                              *
*	 Date      : 31/Mar/2005                                      Version  : 2.0      Pattern version: 2.0     *
*																																																						 *
*  Summary   : Gets user credentials using forms authentication and redirects users to the workplace.        *
*																																																						 *
********************************************************* Copyright © Ontica, sa de cv. México, 1999-2005. **/
using System;

using Empiria.Workplace.Web;

namespace Empiria.WebApp {
	
	/// <summary>Gets user credentials using forms authentication and redirects users to the workplace.</summary>
  public partial class DefaultPage : LogonPage {

    #region Fields

    #endregion Fields

    #region Protected methods

    protected override void OnPostBackLoad(object sender, System.EventArgs e) {
      txtUserId.Value = txtUserId.Value.Trim();
      txtPassword.Value = txtPassword.Value.Trim();
      
      if (Attempt(txtUserId.Value, txtPassword.Value)) {
        Response.Redirect(Configuration.WorkplaceURL);
        //GoToPage(Configuration.WorkplaceURL);
      } else {
        txtPassword.Value = String.Empty;
      }
    }

    #endregion Protected methods

	} // class DefaultPage

} //namespace Empiria.WebApp