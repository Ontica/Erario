using System;
using System.Data;

using Empiria.Erario.Data;

namespace Empiria.Erario {

	public class BudgetAnalysis {

    #region Fields

    private ClassifierType[] classifierTypes = null;
    private Classifier classifier = null;
    private string filter = String.Empty;
    
    #endregion Fields

    #region Constructors and parsers

		public BudgetAnalysis() {
      
		}

		#endregion Constructors and parsers

    #region Public properties

    public Classifier Classifier {
      get { return classifier; }
      set { classifier = value; }
    }
    
    public ClassifierType[] ClassifierTypes {
      get { return classifierTypes; }
      set { classifierTypes = value; }
    }
    
    public string Filter {
      get { return filter; }
      set { filter = value; }
    }
        
    #endregion Public properties
    
    #region Public methods
    
    public DataView Execute() {
      DataTable table = null;
      
      if (classifier != null) {
        table = GetClassifierDataTable();
      } else {
        table = GetDataTable();       
      }
      if (filter.Length != 0) {
        return new DataView(table, this.filter, String.Empty, DataViewRowState.CurrentRows);
      } else {
        return new DataView(table, String.Empty, String.Empty, DataViewRowState.CurrentRows);
      }
    }
   
    public decimal[] GetTotals() {
      DataTable table = null;
      decimal[] totals = new decimal[6];

      if (classifier != null) {
        table = AnalysisReader.OneClassFilteredGroup(classifierTypes[0].StructureField,
                                                     GetClassifierFilter());
      } else {
        table = AnalysisReader.OneClassGroup(classifierTypes[0].StructureField);
      }
      object value = table.Compute("SUM([Apr2005])", filter);
      if (value != System.DBNull.Value) {
        totals[0] = Convert.ToDecimal(value);
        totals[1] = Convert.ToDecimal(table.Compute("SUM([Pry2006])", filter));
        totals[2] = Convert.ToDecimal(table.Compute("SUM([Amp2006])", filter));
        totals[3] = Convert.ToDecimal(table.Compute("SUM([Red2006])", filter));
        totals[4] = Convert.ToDecimal(table.Compute("SUM([Apr2006])", filter));
        totals[5] = Convert.ToDecimal(table.Compute("SUM([Comp20062005])", filter));
      }
      return totals;
    }

    #endregion Public methods

    #region Private methods

    private DataTable GetClassifierDataTable() {
      string classifierFilter = GetClassifierFilter();
      
      switch (classifierTypes.Length) {
        case 1:
          return AnalysisReader.OneClassFilteredGroup(classifierTypes[0].StructureField, 
                                                      classifierFilter);
        case 2:
          return AnalysisReader.TwoClassFilteredGroup(classifierTypes[0].StructureField, 
                                                      classifierTypes[1].StructureField,
                                                      classifierFilter);
        case 3:
          return AnalysisReader.ThreeClassFilteredGroup(classifierTypes[0].StructureField, 
                                                        classifierTypes[1].StructureField,
                                                        classifierTypes[2].StructureField,
                                                        classifierFilter);
        case 4:
          return AnalysisReader.FourClassFilteredGroup(classifierTypes[0].StructureField, 
                                                       classifierTypes[1].StructureField,
                                                       classifierTypes[2].StructureField, 
                                                       classifierTypes[3].StructureField, 
                                                       classifierFilter);
        default:
          return AnalysisReader.OneClassFilteredGroup(classifierTypes[0].StructureField,
                                                      classifierFilter);
      }
    }

    private string GetClassifierFilter() {
      string classFilter = String.Empty;
      
      classFilter = "BMStructures." + 
                    classifier.ClassifierType.StructureField + " = " +
                    classifier.Id;
      
      return classFilter;
    }
    
    private DataTable GetDataTable() {
      switch (classifierTypes.Length) {
        case 1:
          return AnalysisReader.OneClassGroup(classifierTypes[0].StructureField);
        case 2:
          return AnalysisReader.TwoClassGroup(classifierTypes[0].StructureField, 
                                              classifierTypes[1].StructureField);
        case 3:
          return AnalysisReader.ThreeClassGroup(classifierTypes[0].StructureField, 
                                                classifierTypes[1].StructureField,
                                                classifierTypes[2].StructureField);
        case 4:
          return AnalysisReader.FourClassGroup(classifierTypes[0].StructureField, 
                                               classifierTypes[1].StructureField,
                                               classifierTypes[2].StructureField, 
                                               classifierTypes[3].StructureField);
        default:
          return AnalysisReader.OneClassGroup(classifierTypes[0].StructureField);
      }
    }
    
    
    #endregion Private methods

	} // class BudgetAnalysis

} // namespace Empiria.Erario