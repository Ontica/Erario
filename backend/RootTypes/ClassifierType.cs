using System;
using System.Data;

using Empiria.Erario.Data;

namespace Empiria.Erario {

	public sealed class ClassifierType {

    #region Fields
		
		private int id = 0;
		private string name = String.Empty;
		private string abbreviation = String.Empty;
		private string description = String.Empty;
		private string structureField = String.Empty;
		private ClassifierType parentType = null;

    #endregion Fields

		#region Constructors and parsers

		private ClassifierType() {
      // Direct object creation of this type not allowed
		}

    static public ClassifierType Parse(int id) {
      ClassifierType classifierType = new ClassifierType();      
      classifierType.Load(id);
      
      return classifierType;
    }
    
		#endregion Constructors and parsers
		
		#region Public properties
		
    public int Id {
      get{ return id; }
    }

    public string Abbreviation {
      get{ return abbreviation; }    
    }
    
    public string Name {
      get{ return name; }
    }

    public string Description {
      get{ return description; }
    }

    public bool HasParent {
      get{ return (parentType != null); }
    }

    public string StructureField {
      get{ return structureField; }
    }

    public ClassifierType ParentType {
      get{ return parentType; }
    }

    #endregion Public properties
    
    #region Private methods

    private void Load(int classifierTypeId) {
      DataRow dataRow = StructureReader.GetClassifierType(classifierTypeId); 
      if (dataRow == null) {
        ErarioException exception = 
                        new ErarioException(ErarioException.Msg.ClassifierTypeIdNotFound, classifierTypeId);
        exception.Publish();
        throw exception;
      }
      LoadFields(dataRow);    
    }

    private void LoadFields(DataRow dataRow) {
      id = (int) dataRow["ClassifierTypeId"];    
		  name = (string) dataRow["ClassifierTypeName"];
		  abbreviation = (string) dataRow["Abbreviation"];
		  description = (string) dataRow["Description"];
		  structureField = (string) dataRow["StructureField"];
		  if ((int) dataRow["ParentTypeId"] != 0) {
		    parentType = ClassifierType.Parse((int) dataRow["ParentTypeId"]);
		  }
    }

    #endregion Private methods

	} // class ClassifierType

} // namespace Empiria.Erario