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

	public partial class HeaderPage : System.Web.UI.Page {

    protected Empiria.Workplace.Web.Controls.SearchBox searchBox;
        
		private void Page_Load(object sender, System.EventArgs e) {

		}

		#region Código generado por el Diseñador de Web Forms
		
		override protected void OnInit(EventArgs e) {
			InitializeComponent();
			base.OnInit(e);
		}
		
		private void InitializeComponent() {    
      this.Load += new System.EventHandler(this.Page_Load);

    }
		
		#endregion
		
	} // class ToolbarPage
		
} // namespace Empiria.WebApp.Workplace