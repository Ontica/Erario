<%@ Page language="c#" CodeFile="search.aspx.cs" AutoEventWireup="false" Inherits="Empiria.WebApp.Erario.Budget.Search" %>
<%@ Register TagPrefix="EmpiriaControl" Namespace="Empiria.Workplace.Web.Controls" Assembly = "Empiria.Workplace.Web" %>
<%@ Register TagPrefix="EmpiriaControl" TagName="DataGridNavigator" Src="~/user_controls/data_grid_navigator.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>Barra de herramientas</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="../../css/toolbar.css" type="text/css" rel="stylesheet">
		<script language="javascript">
			<!--
				
				var bSended = false;
				var oViewer = null;
				
				function onkeypress_search() {
					if (window.event.keyCode == 13) {
						doSearch();
						return false;
					}
					return true;
				}

				function doSearch() {
					if (bSended) {
						return;
					}
					if (onvalidate_search()) {
						bSended = true;
						document.body.style.cursor='wait';						
						document.frmToolbar.submit();
					}
				}

				function onvalidate_search() {					
					return true;
				}
				
				function doOperation(operationTag) {
					switch (operationTag) {
						case "Detail":
							if (!bSended) {
								var sOptions = "scrollbars=no,fullscreen=no,location=no,resizable=yes,menubar=no,height=540px,width=660px";
								var sURL = "viewer.aspx?id=" + arguments[1];													
								if (oViewer == null || oViewer.closed) {
									oViewer = window.open(sURL, "_blank", sOptions);
								} else {
									oViewer.focus();
									oViewer.navigate(sURL);
								}
							}
							break;
					}
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
								<td width="100%">Buscar en presupuestos</td>
								<td align="right"><img src="/erario/images/expand.gif"></td>
							</tr>
							<tr>
								<td colspan="2" vAlign="middle" height="40" width="100%">
									<EmpiriaControl:SearchBox id="searchBox" runat="server" />
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td noWrap width="100%" height="100%">
						<table style="WIDTH: 100%" height="100%" cellSpacing="0" cellPadding="0">
							<tr>
								<td>
									<EMPIRIACONTROL:DATAGRIDNAVIGATOR id="empDataGridNavigator" runat="server"></EMPIRIACONTROL:DATAGRIDNAVIGATOR>
								</td>
							</tr>
							<tr>
								<td vAlign="top" width="100%" height="100%" colSpan="2">
									<div style="OVERFLOW: auto; WIDTH: 100%; HEIGHT: 100%">
										<asp:datagrid id="grdItems" tabIndex="-1" runat="server" AutoGenerateColumns="False" Width="100%"
											AllowPaging="True" AllowSorting="True" CssClass="dataGrid">
											<FooterStyle Wrap="False" HorizontalAlign="Right" CssClass="totalsRow"></FooterStyle>
											<SelectedItemStyle VerticalAlign="Top"></SelectedItemStyle>
											<EditItemStyle VerticalAlign="Top"></EditItemStyle>
											<AlternatingItemStyle CssClass="evenRow" VerticalAlign="Top"></AlternatingItemStyle>
											<ItemStyle HorizontalAlign="Right" CssClass="oddRow" VerticalAlign="Top"></ItemStyle>
											<HeaderStyle Wrap="False" HorizontalAlign="Right" CssClass="headerRow"></HeaderStyle>
											<Columns>
												<asp:BoundColumn DataField="ClassifierId" DataFormatString="&lt;img class=imageButton src='/erario/images/icons_sm/document_sm.gif'; onclick=&quot;return doOperation('Detail', {0})&quot;&gt;"></asp:BoundColumn>
												<asp:BoundColumn DataField="ClassifierTag" SortExpression="ClassifierTag ASC, ClassifierName" HeaderText="Cve">
													<HeaderStyle Wrap="False" HorizontalAlign="Left"></HeaderStyle>
													<ItemStyle Wrap="False" HorizontalAlign="Left"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="ClassifierName" SortExpression="ClassifierName ASC, ClassifierTag" HeaderText="Nombre">
													<HeaderStyle Wrap="False" HorizontalAlign="Left"></HeaderStyle>
													<ItemStyle HorizontalAlign="Left"></ItemStyle>
													<FooterStyle Wrap="False" HorizontalAlign="Left"></FooterStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="ClassifierTypeName" SortExpression="ClassifierTypeName ASC, ClassifierName, ClassifierTag"
													HeaderText="Tipo">
													<HeaderStyle HorizontalAlign="Left"></HeaderStyle>
													<ItemStyle HorizontalAlign="Left"></ItemStyle>
													<FooterStyle HorizontalAlign="Left"></FooterStyle>
												</asp:BoundColumn>
											</Columns>
											<PagerStyle Visible="False" Wrap="False"></PagerStyle>
										</asp:datagrid>
									</div>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</TABLE>
		</form>
	</body>
</HTML>
