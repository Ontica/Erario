/* Empiria® **************************************************************************************************
*																																																						 *
*	 Solution  : Empiria® Goverment														    System   : Erario						                 *
*	 Namespace : Empiria.Erario.Data                              Assembly : empiria.erario.dll                *
*	 Type      : StructureReader																  Pattern  : Data Services Static Class				 *
*	 Date      : 31/Mar/2005                                      Version  : 2.0      Pattern version: 2.0     *
*																																																						 *
*  Summary   : Provides data read methods for budget structure.													                     *
*																																																						 *
********************************************************* Copyright © Ontica, sa de cv. México, 1999-2005. **/
using System;
using System.Data;

using Empiria.Data;

namespace Empiria.Erario.Data {

	internal sealed class StructureReader {
    
		#region Constructors

		private StructureReader() {
			// Instance creation of this type not allowed
		}

		#endregion Constructors

		#region Public methods

    static public DataRow GetClassifier(int classifierId) {
      return DataReader.GetDataRow(DataOperation.Parse("qryClassifier", classifierId));
    }
    
    static public DataRow GetClassifierType(int classifierTypeId) {
      return DataReader.GetDataRow(DataOperation.Parse("qryClassifierType", classifierTypeId));
    }

    static public DataTable GetClassifiersTypes() {
      return DataReader.GetDataTable(DataOperation.Parse("qryClassifierTypes"));
    }

    static public DataView SearchDataView(string keywords) {
      keywords = Empiria.Searching.SearchExpression.ParseANDLike("Keywords", keywords.Split(' '));
      return DataReader.GetDataView(DataOperation.Parse("@qrySearchClassifiers", keywords));
    }

		#endregion Public methods
 
	} // class StructureReader

} // namespace Empiria.Erario.Data