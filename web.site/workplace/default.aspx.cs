using System;

using Empiria.Workplace;
using Empiria.Workplace.Web;

namespace Empiria.WebApp.Workplace { 

	public partial class DefaultPage : WebView {

    #region Fields
    
    //protected Empiria.Workplace.Web.Controls.BreadcrumbBar breadcrumbBar;
    //protected Empiria.Workplace.Web.Controls.NavigationButtons navigationButtons;
    //protected Empiria.Workplace.Web.Controls.CopyrightBar copyrightBar;
    
    #endregion Fields

    #region Protected methods
    
    protected override void OnLoad(System.EventArgs e) {
      Initialize();
      base.OnLoad(e);
    }

    #endregion Protected methods

		#region Private methods		

    private void Initialize() {

    }

		#endregion Private methods

	} // class DefaultPage

} // namespace Empiria.WebApp.Workplace
