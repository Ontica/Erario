using System;

using Empiria.Erario;
using Empiria.Workplace.Web;

namespace Empiria.WebApp.Erario.Budget {

	public partial class Search : System.Web.UI.Page {

	  #region Fields
	  
    //protected Empiria.WebApp.UserControls.DataGridNavigator empDataGridNavigator;	  
    //protected System.Web.UI.WebControls.DataGrid grdItems;
    //protected Empiria.Workplace.Web.Controls.SearchBox searchBox;

    #endregion Fields

    #region Protected methods
  
    private void Initialize() {
      empDataGridNavigator.Exportable = false;
      empDataGridNavigator.DataGridBind(grdItems, String.Empty, 2, 500, 1000);
    }
    
    private void LoadGrid() {
      if (searchBox.Text != String.Empty) {
        empDataGridNavigator.DataSource = Classifier.Search(searchBox.Text);
        empDataGridNavigator.DataBind();
        empDataGridNavigator.Visible = true;
        grdItems.Visible = true;
      } else {            
        empDataGridNavigator.Visible = false;
        grdItems.Visible = false;
      }
    }

    private void Page_Load(object sender, System.EventArgs e) {
      Initialize();
      if (!IsPostBack) {
        // no-op
      } else {
        LoadGrid();
      }
    }

    override protected void OnInit(EventArgs e) {
      InitializeComponent();
      base.OnInit(e);
    }

    private void InitializeComponent() {
      this.Load += new System.EventHandler(this.Page_Load);

    }

    #endregion Protected methods

	} // class Search

} // namespace Empiria.WebApp.Erario.Budget