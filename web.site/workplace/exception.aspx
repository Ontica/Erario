<%@ Page language="c#"  CodeFile="exception.aspx.cs" AutoEventWireup="false" Inherits="Empiria.WebApp.Workplace.ExceptionPage" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>Problema en la aplicación</title>
		<meta content="Microsoft Visual Studio 7.0" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../css/exception.css" type="text/css" rel="stylesheet">
		<script language="javascript">
		<!--			
			var bSended = false;
			var oViewer = null;
			
			function doAction(action) {				
				switch (action) {
					case 'send':
						send();
						break;
					case 'showDetails':
						showDetails();
						break;
					default:
						alert("El controlador de la operación '" + action + "' no ha sido definido en el programa.");
						break;
				}
			}
						
			function send() {
				var msg = '';
				
				if (!document.all.chkSend.checked && document.all.chkAlert.checked) {
					document.all.chkSend.checked = true;
				}				
				if (document.all.chkSend.checked && document.all.chkAlert.checked) {
					msg  = "¿Envío el problema al área de soporte técnico y una vez que\n";
					msg += "sea resuelto le mando un mensaje de aviso a su buzón?";
				}
				if (document.all.chkSend.checked && !document.all.chkAlert.checked) {
					msg = "¿Envío el problema al área de soporte técnico para su revisión?";
				}
				if (msg != '') {
					if (!(confirm(msg))) {
						return;
					}
				}
				document.body.style.cursor = 'wait';
				document.frmEditor.submit();
			}
			
			function showDetails() {
				document.body.style.cursor = 'wait';
				var isExpanded = (document.all.tblDetails.style.display == 'inline');
				
				if (isExpanded) {
					document.all.tblDetails.style.display = 'none';
					document.all.ancDetails.innerHTML = "<img src='../images/expand.gif' align=absmiddle>Mostrar detalles";
				} else {
					document.all.tblDetails.style.display = 'inline';
					document.all.ancDetails.innerHTML = "<img src='../images/collapse.gif' align=absmiddle>Ocultar detalles";
				}
				document.body.style.cursor = 'default';
			}
			
		//-->
		</script>
	</HEAD>
	<body oncontextmenu="return false;" MS_POSITIONING="GridLayout">
		<form id="frmEditor" method="post" runat="server">
			<table cellSpacing="0" cellPadding="0" width="100%">
				<tr vAlign="top">
					<td class="titleRow"><IMG src="../images/icons/error.gif" align="absMiddle"></td>
					<td class="titleRow" align="left" width="100%">Tengo un problema</td>
				</tr>
			</table>
			<table cellSpacing="0" cellPadding="0" width="100%">
				<tr>
					<td height="16"></td>
				</tr>
				<tr>
					<td class="description">
						<%=exception.Message%><br><br>		
						<% if (Request.QueryString["page"] != null) { %>
							<b><%=Request.QueryString["page"]%></b>
						<% } else { %>
							<b><%=Request.UrlReferrer.AbsolutePath%></b>
						<% } %>
						<br>&nbsp;
						</td>
				</tr>
				<tr>
					<td colspan="2">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="2">
						<a id=ancDetails href="javascript:doAction('showDetails');"><img src="../images/expand.gif">Mostrar detalles</a>
					</td>
				</tr>
			</table>
			<table id="tblDetails" style="DISPLAY:none" cellSpacing="0" cellPadding="0" width="100%">
				<% if (exception is Empiria.EmpiriaException) { %>
				<tr>
					<td class="propertyName">Servidor:</td>
				</tr>
				<tr>
					<td class="propertyValue"><%=((Empiria.EmpiriaException) exception).ServerName%></td>
				</tr>
				<% } %>
				<tr>
					<td class="propertyName">Tipo de excepción:</td>
				</tr>
				<tr>
					<td class="propertyValue"><%=exception.GetType()%></td>
				</tr>
				<tr>
					<td class="propertyName">Originado en:</td>
				</tr>
				<tr>
					<td class="propertyValue"><%=exception.Source%></td>
				</tr>
				<tr>
					<td class="propertyName">Detalles de la ejecución:</td>
				</tr>
				<tr>
					<td class="propertyValue"><%=exception.StackTrace.Trim().Replace(" at ", "<br>at ")%></td>
				</tr>
			</table>
			<table cellSpacing="0" cellPadding="0">
				<tr>
					<td class="description" colspan="2">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="2">&nbsp;</td>
				</tr>
				<tr height=24px>
					<td valign="top"><INPUT class="checkBox" type="checkbox" id="chkSend" name="chkSend" runat="server"></td>
					<td valign="top" width="100%">Enviar el problema al área de soporte técnico para 
						su revisión</td>
				</tr>
				<tr height=24px>
					<td valign="top"><INPUT class="checkBox" type="checkbox" id="chkAlert" name="chkAlert" runat="server"></td>
					<td valign="top" width="100%">Avisarme cuando el problema sea resuelto</td>
				</tr>
				<tr>
					<td colspan="2" class="description">&nbsp;</td>
				</tr>
				<tr>				
					<td colspan="2" nowrap align="right" height=32px valign=bottom>
						<a href="javascript:doAction('send');"><img src="../images/go_xp.gif" height="18" align="absMiddle">Continuar</a> &nbsp;&nbsp;
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>
