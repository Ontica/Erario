/* Empiria® **************************************************************************************************
*																																																						 *
*	 Solution  : Empiria® Goverment														    System   : Erario						                 *
*	 Namespace : Empiria.Erario.Data                              Assembly : empiria.erario.dll                *
*	 Type      : AnalysisReader																    Pattern  : Data Services Static Class				 *
*	 Date      : 31/Mar/2005                                      Version  : 2.0      Pattern version: 2.0     *
*																																																						 *
*  Summary   : Provides data read methods for budget analysis.													                     *
*																																																						 *
********************************************************* Copyright © Ontica, sa de cv. México, 1999-2005. **/
using System;
using System.Data;

using Empiria.Data;

namespace Empiria.Erario.Data {

	internal sealed class AnalysisReader {
    
		#region Constructors

		private AnalysisReader() {
			// Instance creation of this type not allowed
		}

		#endregion Constructors

		#region Public methods

    static public DataTable OneClassFilteredGroup(string className, string filter) {
      return DataReader.GetDataTable(DataOperation.Parse("@qryOneClassFilteredGroup", className, filter));
    }

    static public DataTable OneClassGroup(string className) {
      return DataReader.GetDataTable(DataOperation.Parse("@qryOneClassGroup", className));
    }

    static public DataTable TwoClassFilteredGroup(string className1, string className2, string filter) {
      return DataReader.GetDataTable(DataOperation.Parse("@qryTwoClassFilteredGroup", 
                                                          className1, className2, filter));
    }
    
    static public DataTable TwoClassGroup(string className1, string className2) {
      return DataReader.GetDataTable(DataOperation.Parse("@qryTwoClassGroup", className1, className2));
    }

    static public DataTable ThreeClassFilteredGroup(string className1, string className2, 
                                                    string className3, string filter) {
      return DataReader.GetDataTable(DataOperation.Parse("@qryThreeClassFilteredGroup",
                                                          className1, className2, className3, filter));
    }
    
    static public DataTable ThreeClassGroup(string className1, string className2, string className3) {
      return DataReader.GetDataTable(DataOperation.Parse("@qryThreeClassGroup", 
                                                          className1, className2, className3));
    }

    static public DataTable FourClassFilteredGroup(string className1, string className2, 
                                                   string className3, string className4, string filter) {
      return DataReader.GetDataTable(DataOperation.Parse("@qryFourClassFilteredGroup",
                                                          className1, className2, className3, 
                                                          className4, filter));
    }

    static public DataTable FourClassGroup(string className1, string className2, string className3, string className4) {
      return DataReader.GetDataTable(DataOperation.Parse("@qryFourClassGroup", className1, className2, 
        className3, className4));
    }
            
		#endregion Public methods
 
	} // class ValuesReader

} // namespace Empiria.Erario.Data