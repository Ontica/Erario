using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using Empiria.Workplace.Web;

namespace Empiria.WebApp.Workplace {

	public partial class ExceptionPage : EmpiriaPage {

    #region Fields
        
    //protected System.Web.UI.HtmlControls.HtmlInputCheckBox chkAlert;
    //protected System.Web.UI.HtmlControls.HtmlInputCheckBox chkSend;
    protected Exception exception = null;
    
    #endregion Fields
    
    #region Protected methods

    protected override void OnInitialize(object sender, System.EventArgs e) {

    }
                    
    protected override void OnFirstLoad(object sender, System.EventArgs e) {
      exception = WebContext.GetLastError();
    }

    protected override void OnPostBackLoad(object sender, System.EventArgs e) {

    }
    
    #endregion Protected methods
        
	} // class StartPage
	
} // namespace Empiria.WebApp.Workplace