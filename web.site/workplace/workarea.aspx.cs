using System;

using Empiria.Workplace;
using Empiria.Workplace.Web;

namespace Empiria.WebApp.Workplace {

	public partial class Workarea : WebView {

    #region Fields

    protected WorkareaInfo workareaInfo = null;

    #endregion Fields

    #region Protected methods

    protected override void OnLoad(System.EventArgs e) {
      Initialize();
      base.OnLoad(e);
    }

    #endregion Protected methods

		#region Private methods

    private void Initialize() {
      if (Request.QueryString["urlns"] != null) {
        workareaInfo = WorkareaManager.GetWorkareaInfo(Request.QueryString["urlns"]);
      } else if (Request.QueryString["url"] != null) {
        workareaInfo = WorkareaManager.GetWorkareaInfoForExternalURL(Request.QueryString["url"]);
      } else {
        workareaInfo = WorkareaManager.DefaultWorkareaInfo;
      }
    }

    #endregion Private methods

	} // class Workarea

} // namespace Empiria.WebApp.Workplace