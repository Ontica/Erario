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

using Empiria.Erario;
using Empiria.Searching;
using Empiria.Workplace.Web;

namespace Empiria.WebApp.Erario.Budget {

	public partial class ViewerPage : System.Web.UI.Page {
	
	  #region Fields

    //protected Empiria.WebApp.UserControls.DataGridNavigator empDataGridNavigator;
    //protected System.Web.UI.WebControls.DataGrid grdItems;
    //protected System.Web.UI.HtmlControls.HtmlSelect cboBudgets;
    //protected System.Web.UI.HtmlControls.HtmlSelect cboGroup1;
    //protected System.Web.UI.HtmlControls.HtmlSelect cboGroup2;
    //protected System.Web.UI.HtmlControls.HtmlSelect cboGroup3;
    //protected System.Web.UI.HtmlControls.HtmlSelect cboGroup4;    
    //protected System.Web.UI.HtmlControls.HtmlInputText txtFilter;
    //protected System.Web.UI.HtmlControls.HtmlInputCheckBox chkAllKeywords;
    protected Classifier classifier = null;
    protected BudgetAnalysis analysis = new BudgetAnalysis();
    
    #endregion Fields

		private void Page_Load(object sender, System.EventArgs e) {
			Initialize();
			if (!IsPostBack) {
			  SetDefaultValues();
			} else {
        LoadGrid();
			}
		}

    private void SetDefaultValues() {

    }
    
		private void Initialize() {
		  classifier = Classifier.Parse(int.Parse(Request.QueryString["id"]));
      empDataGridNavigator.DataGridBind(grdItems, "Análisis presupuestal", 1, 500, 1000);
		}
	
    private void LoadGrid() {      
      ClassifierType[] classifierTypes = GetClassifierTypes();
      if (classifierTypes == null) {
        return;
      }
      analysis.ClassifierTypes = classifierTypes;
      SetDataGridColumns();
      analysis.Classifier = classifier;
      analysis.Filter = GetFilter();
      empDataGridNavigator.DataSource = analysis.Execute();
      empDataGridNavigator.DataBind();
    }
	      		
		private string GetFilter() {
		  string filter = txtFilter.Value.Trim();

      if (filter == String.Empty) {
        return String.Empty;
      }
      if (chkAllKeywords.Checked) {
        return SearchExpression.ParseANDLike("ClassKeywords", filter.Split(' '));
		  } else {
        return SearchExpression.ParseORLike("ClassKeywords", filter.Split(' '));
		  }
		}
		
		private void SetDataGridColumns() {
		  switch (analysis.ClassifierTypes.Length) {
		    case 1:
		      grdItems.Columns[1].HeaderText = analysis.ClassifierTypes[0].Abbreviation;
		      grdItems.Columns[2].Visible = false;
		      grdItems.Columns[3].Visible = false;
		      grdItems.Columns[4].Visible = false;
		      break;
		    case 2:
		      grdItems.Columns[1].HeaderText = analysis.ClassifierTypes[0].Abbreviation;
		      grdItems.Columns[2].Visible = true;
		      grdItems.Columns[2].HeaderText = analysis.ClassifierTypes[1].Abbreviation;
		      grdItems.Columns[3].Visible = false;
		      grdItems.Columns[4].Visible = false;
		      break;
		    case 3:
		      grdItems.Columns[1].HeaderText = analysis.ClassifierTypes[0].Abbreviation;
          grdItems.Columns[2].HeaderText = analysis.ClassifierTypes[1].Abbreviation;		    
		      grdItems.Columns[2].Visible = true;
          grdItems.Columns[3].HeaderText = analysis.ClassifierTypes[2].Abbreviation;
		      grdItems.Columns[3].Visible = true;
		      grdItems.Columns[4].Visible = false;
		      break;
        case 4:
          grdItems.Columns[1].HeaderText = analysis.ClassifierTypes[0].Abbreviation;
          grdItems.Columns[2].HeaderText = analysis.ClassifierTypes[1].Abbreviation;		    
          grdItems.Columns[2].Visible = true;
          grdItems.Columns[3].HeaderText = analysis.ClassifierTypes[2].Abbreviation;          	      
          grdItems.Columns[3].Visible = true;
          grdItems.Columns[4].HeaderText = analysis.ClassifierTypes[3].Abbreviation;          	      
          grdItems.Columns[4].Visible = true;        
          break;		      
		  }
		}

    private ClassifierType[] GetClassifierTypes() {
      if (cboGroup4.Value != String.Empty) {
        return new ClassifierType[] { ClassifierType.Parse(int.Parse(cboGroup1.Value)), 
                                      ClassifierType.Parse(int.Parse(cboGroup2.Value)),                                       
                                      ClassifierType.Parse(int.Parse(cboGroup3.Value)), 
                                      ClassifierType.Parse(int.Parse(cboGroup4.Value)) };
      }    
      if (cboGroup3.Value != String.Empty) {
        return new ClassifierType[] { ClassifierType.Parse(int.Parse(cboGroup1.Value)), 
                                      ClassifierType.Parse(int.Parse(cboGroup2.Value)), 
                                      ClassifierType.Parse(int.Parse(cboGroup3.Value)) };
      }
      if (cboGroup2.Value != String.Empty) {
        return new ClassifierType[] { ClassifierType.Parse(int.Parse(cboGroup1.Value)), 
                                      ClassifierType.Parse(int.Parse(cboGroup2.Value)) };      
      }
      if (cboGroup1.Value != String.Empty) {
        return new ClassifierType[] { ClassifierType.Parse(int.Parse(cboGroup1.Value)) };      
      }
      return null;
    }
    
    private void SetTotals(DataGridItem footer) {
      if (!IsPostBack) {
        return;
      }

      decimal[] totals = analysis.GetTotals();
      footer.Cells[5].Text = "Totales:";
      footer.Cells[6].Text = totals[0].ToString("N0");
      footer.Cells[7].Text = totals[1].ToString("N0");
      footer.Cells[8].Text = totals[2].ToString("N0");
      footer.Cells[9].Text = totals[3].ToString("N0");  
      footer.Cells[10].Text = totals[4].ToString("N0");
      footer.Cells[11].Text = totals[5].ToString("N0");
    }
    
		#region Web Form Designer generated code

    private void OnItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e) {
      DataGridItem item = e.Item;
			
      switch (item.ItemType) {
        case ListItemType.AlternatingItem:
        case ListItemType.Item:
          item.CssClass = (item.ItemType == ListItemType.AlternatingItem) ? "evenRow" : "oddRow";
          switch (analysis.ClassifierTypes.Length) {
            case 1:
              break;            
            case 2:
              if (item.Cells[2].Text == "&nbsp;") {
                item.CssClass += "H2";
              }
              break;            
            case 3:
              if (item.Cells[2].Text == "&nbsp;") {
                item.CssClass += "H2";
              } else if (item.Cells[3].Text == "&nbsp;") {
                item.CssClass += "H3";
              }
              break;
            case 4:
              if (item.Cells[2].Text == "&nbsp;") {
                item.CssClass += "H1";
              } else if (item.Cells[3].Text == "&nbsp;") {
                item.CssClass += "H2";
              } else if (item.Cells[4].Text == "&nbsp;") {
                item.CssClass += "H3";                
              }
              break;
          }          
          break;
        case ListItemType.Footer:
          SetTotals(item);
          break;
      }
    }
    
		override protected void OnInit(EventArgs e) {
			InitializeComponent();
			this.grdItems.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(this.OnItemDataBound);
			base.OnInit(e);
		}

		private void InitializeComponent() {
      this.Load += new System.EventHandler(this.Page_Load);

    }

		#endregion Web Form Designer generated code

	} // class ViewerPage
	
} // namespace EmpiriaWeb.Erario.Budget