<%@ Page language="c#" CodeFile="toolbar.aspx.cs" AutoEventWireup="false" Inherits="Empiria.WebApp.Workplace.Toolbar" %>
<%@ Register TagPrefix="EmpiriaControl" Namespace="Empiria.Workplace.Web.Controls" Assembly = "Empiria.Workplace.Web" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>Barra de herramientas</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="../css/toolbar.css" type="text/css" rel="stylesheet">
		<script language="javascript">
			<!--

				function onkeypress_search() {
					if (window.event.keyCode == 13) {
						doSearch();
						return false;
					}
					return true;
				}
			  
				function doSearch() {
					alert("El servicio de localización instantánea de entidades por ahora está deshabilitado.\n\nPor favor, inténtelo más tarde. Gracias.");
				}

				function doAdvancedSearch() {
					loadApplicationInSearchFrame("Empiria.SearchEngine.AdvancedSearch");
				}

			//-->
		</script>
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="frmToolbar" method="post" runat="server">
			<TABLE class="toolbarGradient" width="100%" height="100%" align="center" border="0" cellpadding="0"
				cellSpacing="0">
				<tr>
					<td>
						<table class="menuContainer" cellpadding="0" cellspacing="0">
							<tr class="menuContainerTitle">
								<td width="100%">Búsqueda</td>
								<td align="right"><img src="../images/expand.gif"></td>
							</tr>
							<tr>
								<td colspan="2" vAlign="middle" height="40" width="100%">
									<EmpiriaControl:SearchBox id="searchBox" runat="server" />
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<!--
				<tr>
					<td height="8"></td>
				</tr>				
				<tr>
					<td>
						<table class="menuContainer" cellpadding="0" cellspacing="0">
							<tr class="menuContainerTitle">
								<td width="100%">Tareas frecuentes</td>
								<td align="right"><img src="../images/collapse.gif"></td>
							</tr>
							<tr class="menuContainerBody">
								<td colspan="2">
									<table cellpadding="3" cellspacing="0">
										<tr vAlign="top">
											<td class="bullet"><img src="../images/freq_task.gif"></td>
											<td>
												Análisis presupuestal
											</td>
										</tr>
										<tr vAlign="top">
										</tr>
										<tr vAlign="top">
											<td class="bullet"><img src="../images/freq_task.gif"></td>
											<td colspan="2">
												Documentos enviados por la SHCP
											</td>
										</tr>
										<tr vAlign="top">
											<td class="bullet"><img src="../images/freq_task.gif"></td>
											<td>
												Administración de usuarios
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				!-->
				<tr>
					<td height="100%">
						&nbsp;
					</td>
				</tr>
			</TABLE>
		</form>
	</body>
</HTML>
