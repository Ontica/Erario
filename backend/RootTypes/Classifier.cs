using System;
using System.Data;

using Empiria.Erario.Data;

namespace Empiria.Erario {

  public enum ClassifierStatus {
    Active = 'A',
    Deleted = 'D',
    Canceled = 'C',
    Historic = 'H',
  }
  
	public sealed class Classifier {

    #region Fields
    
    private int id = 0;
    private ClassifierType classifierType = null;
    private string tag = String.Empty;
    private string name = String.Empty;
    private string description = String.Empty;
    private string keywords = String.Empty;
    private Classifier parent = null;
    private Classifier replacedBy = null;
    private ClassifierStatus status = ClassifierStatus.Active;
    
    #endregion Fields
    
		#region Constructors and parsers

		private Classifier() {
      // Direct object creation of this type not allowed
		}

    static public Classifier Parse(int classifierId) {
      Classifier classifier = new Classifier();
      
      classifier.Load(classifierId);
      return classifier;
    }

    static public DataView Search(string keywords) {
      return StructureReader.SearchDataView(keywords);
    }
    
		#endregion Constructors and parsers

    #region Public properties
    
    public bool HasParent {
      get { return (parent != null); }
    }

    public int Id {
      get { return id; }
    }

    public bool IsReplaced {
      get { return (replacedBy != null); }
    }

    public ClassifierType ClassifierType {
      get { return classifierType; }
    }

    public string Tag {
      get { return tag; }
    }

    public string Name {
      get { return name; }
    }

    public string Description {
      get { return description; }
    }

    public string Keywords {
      get { return keywords; }
    }

    public Classifier Parent {
      get { return parent; }
    }

    public Classifier ReplacedBy {
      get { return replacedBy; }
    }

    public ClassifierStatus Status {
      get { return status; }
    }

    #endregion Public properties

    #region Private methods

    private void Load(int classifierId) {
      DataRow dataRow = StructureReader.GetClassifier(classifierId); 
      if (dataRow == null) {
        ErarioException exception = 
                        new ErarioException(ErarioException.Msg.ClassifierIdNotFound, classifierId);
        exception.Publish();
        throw exception;
      }
      LoadFields(dataRow);
    }

    private void LoadFields(DataRow dataRow) {
      id = (int) dataRow["ClassifierId"];
      classifierType = ClassifierType.Parse((int) dataRow["ClassifierTypeId"]);
      tag = (string) dataRow["ClassifierTag"];
      name = (string) dataRow["ClassifierName"];
      description = (string) dataRow["Description"];
      keywords = (string) dataRow["Keywords"];
      if ((int) dataRow["ParentId"] != 0) {
        parent = Classifier.Parse((int) dataRow["ParentId"]);
      }
      if ((int) dataRow["ReplacedById"] != 0) {
        replacedBy = Classifier.Parse((int) dataRow["ReplacedById"]);
      }
      status = (ClassifierStatus) Convert.ToChar((string) dataRow["ClassifierStatus"]);
    }

    #endregion Private methods

	} // class Classifier

} // namespace Empiria.Erario