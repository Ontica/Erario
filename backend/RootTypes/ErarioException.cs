/* Empiria® Framework ****************************************************************************************
*																																																						 *
*	 Solution  : Empiria® Government														  System   : Budget Management                 *
*	 Namespace : Empiria.Erario																    Assembly : empiria.erario.dll                *
*	 Type      : ErarioException												          Pattern  : Empiria Exception Class           *
*	 Date      : 31/Mar/2005                                      Version  : 2.0      Pattern version: 2.0     *
*																																																						 *
*  Summary   : The exception that is thrown when a Erario System problem occurs.														 *
*																																																						 *
********************************************************* Copyright © Ontica, sa de cv. México, 1999-2005. **/
using System;
using System.Resources;
using System.Reflection;
using System.Runtime.Serialization;

namespace Empiria.Erario {

 /// <summary>The exception that is thrown when a Erario System problem occurs.</summary>
  [Serializable]
  public sealed class ErarioException: EmpiriaException {

		public enum Msg {
		  ClassifierIdNotFound,
      ClassifierTypeIdNotFound
		}    

		static private string resourceBaseName = "Empiria.Erario.RootTypes.ErarioExceptionMsg";
    
		#region Constructors

    /// <summary>Initializes a new instance of ErarioException class.</summary>
    public ErarioException() {
		  
    }

    /// <summary>Initializes a new instance of ErarioException class with a specified error 
    /// message.</summary>
    /// <param name="message">Used to indicate the description of the exception.</param>
    /// <param name="args">An optional array of objects to format into the exception message.</param>
    public ErarioException(Msg message, params object[] args) : base(GetMessage(message), args) {

    }

    /// <summary>Initializes a new instance of ErarioException class with a specified error
    ///  message and a reference to the inner exception that is the cause of this exception.</summary>
    /// <param name="message">Used to indicate the description of the exception.</param>
    /// <param name="innerException">This is the inner exception.</param>
    /// <param name="args">An optional array of objects to format into the exception message.</param>
    public ErarioException(Msg message, Exception innerException, 
                             params object[] args) : base(GetMessage(message), innerException, args) {
      
    }
    
    /// <summary>Initializes a new instance of the ErarioException class with 
    /// serialized data.</summary>
    /// <param name="info">The SerializationInfo that holds the serialized object data about the
    /// exception being thrown.</param>
    /// <param name="context">The StreamingContext that contains contextual information about the 
    /// source or destination.</param>
    public ErarioException(SerializationInfo info, StreamingContext context) : base(info, context) {
      
    }
    
    #endregion Constructors
    
		#region Private methods

		static private string GetMessage(Msg message, params object[] args) {
			return GetResourceMessage(message.ToString(), resourceBaseName, Assembly.GetExecutingAssembly(), args);
		}

		#endregion Private methods

  } // class ErarioException

} // namespace Empiria.Erario