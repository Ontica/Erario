/* Empiria® .NET *********************************************************************************************
*																																																						 *
*	 Solution  : Empiria® .NET                                    System   : Empiria Web Core Pages            *
*	 Namespace : EmpiriaWeb                                       Assembly : empiria.web.dll                   *
*	 Type      : Global										                        Pattern  : Global ASA Class                  *
*	 Date      : 31/Dec/2002                                      Version  : 2.0      Pattern version: 2.0     *
*																																																						 *
*  Summary   : Defines the methods, properties, and events common to all application objects within the      *
*              Empiria® ASP.NET platform.                                                                    *
*																																																						 *
********************************************************* Copyright © Ontica, sa de cv. México, 1999-2003. **/
using System;

using Empiria.Workplace.Web;

namespace EmpiriaWeb {

  /// <summary>Defines the methods, properties, and events common to all application objects within
  /// the Empiria® ASP.NET platform.</summary>
  public class GlobalASAX : WebApplication {

    public GlobalASAX() {

    }

    protected void Application_Start(Object sender, EventArgs e) {
      OnStart(sender, e);
    }

    protected void Application_AuthenticateRequest(Object sender, EventArgs e) {
      OnAuthenticateRequest(sender, e);
    }

    protected void Application_End(Object sender, EventArgs e) {
      OnEnd(sender, e);
    }
    
    protected void Application_Error(Object sender, EventArgs e) {
      //OnError(sender, e);
    }

    protected void Session_End(Object sender, EventArgs e) {
      OnSessionEnd(sender, e);
    }
    
    protected void Session_Start(Object sender, EventArgs e) {
      OnSessionStart(sender, e);
    }

  } // class Global

} // namespace EmpiriaWeb