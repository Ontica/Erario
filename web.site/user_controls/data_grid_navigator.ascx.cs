using System;
using System.Collections;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using Empiria.Integration.Writers;
using Empiria.Workplace.Web.Controls;

namespace Empiria.WebApp.UserControls {

  public abstract partial class DataGridNavigator: System.Web.UI.UserControl {

    //protected System.Web.UI.HtmlControls.HtmlTable tblNavigationButtons;				
    //protected System.Web.UI.HtmlControls.HtmlTable tblNavigationOptions;
    protected DataGridHandler gridHandler = new DataGridHandler();
    //protected System.Web.UI.WebControls.ImageButton imgMoveFirst;    
    //protected System.Web.UI.WebControls.ImageButton imgMovePrevious;    
    //protected System.Web.UI.WebControls.ImageButton imgMoveNext;
    //protected System.Web.UI.WebControls.ImageButton imgMoveLast;        
    //protected System.Web.UI.HtmlControls.HtmlSelect cboDTGExportTech;
    //protected System.Web.UI.HtmlControls.HtmlSelect cboDTGExportFormat;
    //protected System.Web.UI.WebControls.LinkButton btnDoExport;
    protected string title = String.Empty;
    protected string exportFile = String.Empty;           
    protected bool exportable = true;
    private bool binded = false;

		#region Public properties

		public bool AllowSorting {
			get { return gridHandler.AllowSorting; }
			set { gridHandler.AllowSorting = value; }
		}
		
		public DataView DataSource {
			get { return gridHandler.DataSource; }
			set { gridHandler.DataSource = value; }
		}

    public bool Exportable {
      get { return exportable; }   
      set { exportable = value; }
    }

    #endregion Public properties

    #region Public methods
       
		public new void DataBind() {
			gridHandler.DataBind();
		}
		
    public void DataGridBind(System.Web.UI.WebControls.DataGrid grid) {
      binded = true;
      grid.SortCommand += new System.Web.UI.WebControls.DataGridSortCommandEventHandler(gridHandler.Sort);
      gridHandler.Bound(grid, 0, 50);
      if (!IsPostBack) {
				grid.DataSource = new DataTable();
				grid.DataBind();
      }
    }

    public void DataGridBind(System.Web.UI.WebControls.DataGrid grid, string title) {
      binded = true;
      this.title = title;
      grid.SortCommand += new System.Web.UI.WebControls.DataGridSortCommandEventHandler(gridHandler.Sort);
      gridHandler.Bound(grid, 0, 50);
			if (!IsPostBack) {
				grid.DataSource = new DataTable();
				grid.DataBind();
			}
    }

    public void DataGridBind(System.Web.UI.WebControls.DataGrid grid, string title, int defaultSortColumn) {
      binded = true;
      this.title = title;
      if (defaultSortColumn != -1) {
				grid.SortCommand += new System.Web.UI.WebControls.DataGridSortCommandEventHandler(gridHandler.Sort);
				grid.AllowSorting = true;
			} else {
				grid.AllowSorting = false;
			}
      gridHandler.Bound(grid, defaultSortColumn, 50);
			if (!IsPostBack) {
				grid.DataSource = new DataTable();
				grid.DataBind();
			}
    }

		public void DataGridBind(System.Web.UI.WebControls.DataGrid grid, string title, 
														 int defaultSortColumn, int defaultItemsPerPage, int maxItemsPerPage) {
			binded = true;
			this.title = title;
			if (defaultSortColumn != -1) {
				grid.SortCommand += new System.Web.UI.WebControls.DataGridSortCommandEventHandler(gridHandler.Sort);
				grid.AllowSorting = true;
			} else {
				grid.AllowSorting = false;
			}		
			gridHandler.Bound(grid, defaultSortColumn, defaultItemsPerPage);
			if (!IsPostBack) {
				grid.DataSource = new DataTable();
				grid.DataBind();
			}
		}

		public void SetSortColumn(int index, bool showSortMark) {	
			gridHandler.SetSortColumn(index, showSortMark);
		}
		
		public void BoundColumn(int index, string field, string sortExpression, bool show) {
			System.Web.UI.WebControls.BoundColumn column;
			
			column = (System.Web.UI.WebControls.BoundColumn) gridHandler.DataGrid.Columns[index];
			column.DataField = field;
			column.SortExpression = sortExpression;
			column.Visible = show;
		}
		
		public void CascadeColumn(int index) {
			System.Web.UI.WebControls.DataGridItemCollection items = gridHandler.DataGrid.Items;
			string lastValue = String.Empty;
			
			for (int i = 0, j = items.Count; i < j; i++) {
				if (lastValue != items[i].Cells[index].Text) {
					lastValue = items[i].Cells[index].Text;
				} else {
					items[i].Cells[index].Text = String.Empty;
				}
			}		
		}
		
		public void CleanFooter() {
			System.Web.UI.WebControls.DataGridColumnCollection columns = gridHandler.DataGrid.Columns;
			 
			for (int i = 0, j = columns.Count; i < j; i++) {
				columns[i].FooterText = String.Empty;				
			}
		}
		
		public bool IsColumnBounded(int index) {
			System.Web.UI.WebControls.BoundColumn column;
			
			column = (System.Web.UI.WebControls.BoundColumn) gridHandler.DataGrid.Columns[index];
			return (column.DataField != String.Empty);
		}
		
		public void UnboundColumn(int index, bool show) {
			System.Web.UI.WebControls.BoundColumn column;
			
			column = (System.Web.UI.WebControls.BoundColumn) gridHandler.DataGrid.Columns[index];
			if (gridHandler.IsInSortExpression(column.DataField)) {
				gridHandler.SetDefaultSortColumn();
			}
			column.DataField = String.Empty;
			column.Visible = show;
		}
				
    #endregion Public methods
    
    private ArrayList GetGridFieldsForExport() {
      ArrayList fields = new ArrayList();
      DataGrid grid = gridHandler.DataGrid;
      
      for (int i = 0; i < grid.Columns.Count; i++) {
        if (!grid.Columns[i].Visible) {
          continue;
        }
        if (!(grid.Columns[i] is BoundColumn)) {
          continue;
        }
        BoundColumn column  = (BoundColumn) grid.Columns[i];
        if (column.DataFormatString.IndexOf("<img") >= 0) {
          continue;
        }
        fields.Add(column.DataField);
      }
      return fields;
    }
    
    private ArrayList GetGridHeadersForExport() {
      ArrayList headers = new ArrayList();
      DataGrid grid = gridHandler.DataGrid;
      
      for (int i = 0; i < grid.Columns.Count; i++) {
        if (!grid.Columns[i].Visible) {
          continue;
        }
        if (!(grid.Columns[i] is BoundColumn)) {
          continue;
        }
        BoundColumn column  = (BoundColumn) grid.Columns[i];
        if (column.DataFormatString.IndexOf("<img") >= 0) {
          continue;
        }
        headers.Add(column.HeaderText);
      }
      return headers;
    }
    
    #region Event Handlers

		private void Page_Load(object sender, System.EventArgs e) {
		  btnDoExport.Visible = true;
      cboDTGExportTech.Disabled = false;
      cboDTGExportFormat.Disabled = false;
      if (!IsPostBack) {
        tblNavigationOptions.Parent.Page.ClientScript.RegisterHiddenField("hdnDTGOptionsDisplay", "none");
        tblNavigationOptions.Style["display"] = "none";
      } else {
        tblNavigationOptions.Style["display"] = Request.Form["hdnDTGOptionsDisplay"];
        tblNavigationOptions.Parent.Page.ClientScript.RegisterHiddenField("hdnDTGOptionsDisplay", 
                                                                          Request.Form["hdnDTGOptionsDisplay"]);
      }
		}

    private void OnDoExportButton(object sender, System.EventArgs e) {      
      if (gridHandler.DataSource != null && gridHandler.DataSource.Table != null) {
        FileBuilder builder = new FileBuilder();
        builder.OutputDirectory = Server.MapPath("../user_output_files/anonymous/");
        builder.Technology = (FileTechnology) int.Parse(cboDTGExportTech.Value);
        builder.Fields = GetGridFieldsForExport();
        builder.Headers = GetGridHeadersForExport();
        builder.DataSource = gridHandler.DataSource;
        exportFile = "../user_output_files/anonymous/" + builder.CreateFile();
        
        btnDoExport.Visible = false;
        cboDTGExportTech.Disabled = true;
        cboDTGExportFormat.Disabled = true;
      }
    }
    
    private void OnClickNavigationButton(object sender, System.Web.UI.ImageClickEventArgs e) {
      if (binded) {
        switch (((ImageButton) sender).CommandName) {
          case "MoveFirst":
            gridHandler.CurrentPageIndex = 0;
            break;
          case "MovePrevious":
            gridHandler.CurrentPageIndex = Math.Max(gridHandler.CurrentPageIndex - 1, 0);
            break;
          case "MoveNext":
            gridHandler.CurrentPageIndex = Math.Min(gridHandler.CurrentPageIndex + 1, gridHandler.PageCount - 1);
            break;
          case "MoveLast":
            gridHandler.CurrentPageIndex = gridHandler.PageCount - 1;
            break;
          default:
            break;
        }
        if (gridHandler.DataSource != null) {
					gridHandler.DataBind();
				}
      }
    }

    #endregion Event Handlers

		#region Web Form Designer generated code

		override protected void OnInit(EventArgs e) {
			InitializeComponent();
			btnDoExport.Attributes["onclick"] = "return validateDTGOptionsExport();";
			base.OnInit(e);
		}
				
		private void InitializeComponent() {
      this.imgMoveFirst.Click += new System.Web.UI.ImageClickEventHandler(this.OnClickNavigationButton);
      this.imgMovePrevious.Click += new System.Web.UI.ImageClickEventHandler(this.OnClickNavigationButton);
      this.imgMoveNext.Click += new System.Web.UI.ImageClickEventHandler(this.OnClickNavigationButton);
      this.imgMoveLast.Click += new System.Web.UI.ImageClickEventHandler(this.OnClickNavigationButton);
      this.btnDoExport.Click += new System.EventHandler(this.OnDoExportButton);
      this.Load += new System.EventHandler(this.Page_Load);
    }

		#endregion Web Form Designer generated code

	} // class DataGridNavigator

} // namespace EmpiriaWeb.FSM.UserControls
