<%@ Page language="c#" CodeFile="viewer.aspx.cs" AutoEventWireup="false" Inherits="Empiria.WebApp.Erario.Budget.ViewerPage" %>
<%@ Register TagPrefix="EmpiriaControl" TagName="DataGridNavigator" Src="~/user_controls/data_grid_navigator.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>Análisis presupuestal</title>
		<meta content="Microsoft Visual Studio 7.0" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../css/worksheet.css" type="text/css" rel="stylesheet">
		<script language="javascript">
		<!--			
			var bSended = false;
			var oViewer = null;
			
			function doOperation(operationTag) {
				switch (operationTag) {
					case "Generate":
						if (!bSended) {
							if (validate()) {
								bSended = true;
								document.body.style.cursor='wait';
								document.frmEditor.submit();
							}
						}
						break;
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
					case "ViewConditions":
						var sOptions = "scrollbars=no,fullscreen=no,location=no,resizable=yes,menubar=no,height=540px,width=460px";
						var sURL = "transactions_viewer.aspx?productId=" + arguments[1] + "&organizationId=" + arguments[2] + "&conditionId=" + arguments[3];
						
						sURL += "&fromDate=" + document.frmEditor.txtFromDate.value + "&toDate=" + document.frmEditor.txtToDate.value;
						if (oViewer == null || oViewer.closed) {
							oViewer = window.open(sURL, "_blank", sOptions);
						} else {
							oViewer.focus();
							oViewer.navigate(sURL);
						}
						break;
					default:
						alert("La operación solicitada todavía no ha sido definida en el programa.");
						break;
				}
				return;				
			}
			
			function validate() {
				var oForm = document.frmEditor;
				if (oForm.cboGroup1.value == "") {
					alert("Requiero se seleccione alguna de las formas de agrupación.");
					oForm.cboGroup1.focus();
					return false;
				}
				if (oForm.cboGroup1.value != "" && oForm.cboGroup1.value == oForm.cboGroup2.value) {
					alert("Las agrupaciones uno y dos son la misma.");
					oForm.cboGroup2.focus();
					return false;
				}
				if (oForm.cboGroup1.value != "" && oForm.cboGroup1.value == oForm.cboGroup3.value) {
					alert("Las agrupaciones uno y tres son la misma.");
					oForm.cboGroup3.focus();
					return false;
				}
				if (oForm.cboGroup1.value != "" && oForm.cboGroup1.value == oForm.cboGroup4.value) {
					alert("Las agrupaciones uno y cuatro son la misma.");
					oForm.cboGroup4.focus();
					return false;
				}				
				if (oForm.cboGroup2.value != "" && oForm.cboGroup2.value == oForm.cboGroup3.value) {
					alert("Las agrupaciones dos y tres son la misma.");
					oForm.cboGroup3.focus();
					return false;
				}
				if (oForm.cboGroup2.value != "" && oForm.cboGroup2.value == oForm.cboGroup4.value) {
					alert("Las agrupaciones dos y cuatro son la misma.");
					oForm.cboGroup4.focus();
					return false;
				}
				if (oForm.cboGroup3.value != "" && oForm.cboGroup3.value == oForm.cboGroup4.value) {
					alert("Las agrupaciones tres y cuatro son la misma.");
					oForm.cboGroup4.focus();
					return false;
				}					
				if (oForm.cboGroup3.value == "" && oForm.cboGroup4.value != "") {
					oForm.cboGroup3.value = oForm.cboGroup4.value;
					oForm.cboGroup4.value = "";
				}
				if (oForm.cboGroup2.value == "" && oForm.cboGroup3.value != "") {
					oForm.cboGroup2.value = oForm.cboGroup3.value;
					oForm.cboGroup3.value = "";
				}
				return true;
			}
			
		//-->
		</script>
	</HEAD>
	<body oncontextmenu="return true;" MS_POSITIONING="GridLayout">
		<form id="frmEditor" method="post" runat="server">
			<table height="100%" cellSpacing="0" cellPadding="0" width="100%">
				<tr>
					<td noWrap width="100%">
						<table style="WIDTH: 100%" cellSpacing="2" cellPadding="2">
							<TR>
								<TD noWrap colSpan="5" width="100%" style="BORDER-BOTTOM: #669999 1px solid">
									<table cellSpacing="0" cellPadding="0" width="100%">
										<tr>
											<td valign="top" nowrap style="FONT-SIZE: 10pt; FONT-FAMILY: Tahoma">
												<%=classifier.ClassifierType.Name%>
												<b>
													<%=classifier.Tag%>
												</b>-&nbsp;
											</td>
											<td width="100%" style="FONT-SIZE: 10pt; FONT-FAMILY: Tahoma"><b><%=classifier.Name%></b></td>
										</tr>
									</table>
								</TD>
							</TR>
							<TR height="10">
								<TD noWrap>Grupo presupuestal:</TD>
								<TD style="WIDTH: 162px; HEIGHT: 17px" vAlign="top" noWrap align="left"><SELECT id="cboBudgets" style="WIDTH: 192px" name="cboBudgets" runat="server">
										<OPTION value="">( Seleccionar )</OPTION>
										<OPTION value="1" selected>» Presupuesto 2006</OPTION>
									</SELECT>&nbsp;
								</TD>
								<td style="HEIGHT: 17px" noWrap>Filtrar por:
								</td>
								<TD style="HEIGHT: 17px" noWrap align="left" colSpan="1" rowSpan="1"><INPUT id="txtFilter" style="WIDTH: 144px; HEIGHT: 19px" type="text" size="18" name="txtFilter"
										runat="server"><INPUT class="checkBoxControl" id="chkAllKeywords" type="checkbox" CHECKED name="chkAllKeywords"
										runat="server">Todas</TD>
								<td style="HEIGHT: 17px" noWrap align="left" width="100%"><A href="javascript:doOperation('Generate');"><IMG hspace="6" src="/erario/images/detail.gif" align="absMiddle">Generar</A>
								</td>
							</TR>
							<TR>
								<TD style="WIDTH: 72px; HEIGHT: 22px" noWrap>Agrupación 1:</TD>
								<TD style="HEIGHT: 22px" vAlign="top" noWrap><SELECT id="cboGroup1" style="WIDTH: 192px" name="cboGroup1" runat="server">
										<OPTION value="" selected>( Seleccionar )</OPTION>
										<OPTION value="1">» Ramo</OPTION>
										<OPTION value="2">» Unidad responsable</OPTION>
										<OPTION value="3">» Grupo funcional</OPTION>
										<OPTION value="4">» Función</OPTION>
										<OPTION value="5">» Subfunción</OPTION>
										<OPTION value="6">» Programa</OPTION>
										<OPTION value="7">» Actividad institucional</OPTION>
										<OPTION value="8">» Id Actividad prioritaria</OPTION>
										<OPTION value="9">» Actividad prioritaria</OPTION>
										<OPTION value="10">» Capítulo</OPTION>
										<OPTION value="11">» Concepto</OPTION>
										<OPTION value="12">» Partida</OPTION>
										<OPTION value="13">» Tipo de gasto</OPTION>
										<OPTION value="14">» Fuente de financiamiento</OPTION>
									</SELECT></TD>
								<TD style="HEIGHT: 22px" vAlign="baseline" noWrap>Agrupación 3:&nbsp;</TD>
								<TD style="HEIGHT: 22px" noWrap><SELECT id="cboGroup3" style="WIDTH: 192px" name="cboGroup3" runat="server">
										<OPTION value="" selected>( No agrupar )</OPTION>
										<OPTION value="1">» Ramo</OPTION>
										<OPTION value="2">» Unidad responsable</OPTION>
										<OPTION value="3">» Grupo funcional</OPTION>
										<OPTION value="4">» Función</OPTION>
										<OPTION value="5">» Subfunción</OPTION>
										<OPTION value="6">» Programa</OPTION>
										<OPTION value="7">» Actividad institucional</OPTION>
										<OPTION value="8">» Id Actividad prioritaria</OPTION>
										<OPTION value="9">» Actividad prioritaria</OPTION>
										<OPTION value="10">» Capítulo</OPTION>
										<OPTION value="11">» Concepto</OPTION>
										<OPTION value="12">» Partida</OPTION>
										<OPTION value="13">» Tipo de gasto</OPTION>
										<OPTION value="14">» Fuente de financiamiento</OPTION>
									</SELECT></TD>
								<TD style="HEIGHT: 22px" noWrap></TD>
							</TR>
							<TR>
								<td style="WIDTH: 72px" noWrap>Agrupación 2:
								</td>
								<td vAlign="top" noWrap><SELECT id="cboGroup2" style="WIDTH: 192px" name="cboGroup2" runat="server">
										<OPTION value="" selected>( No agrupar )</OPTION>
										<OPTION value="1">» Ramo</OPTION>
										<OPTION value="2">» Unidad responsable</OPTION>
										<OPTION value="3">» Grupo funcional</OPTION>
										<OPTION value="4">» Función</OPTION>
										<OPTION value="5">» Subfunción</OPTION>
										<OPTION value="6">» Programa</OPTION>
										<OPTION value="7">» Actividad institucional</OPTION>
										<OPTION value="8">» Id Actividad prioritaria</OPTION>
										<OPTION value="9">» Actividad prioritaria</OPTION>
										<OPTION value="10">» Capítulo</OPTION>
										<OPTION value="11">» Concepto</OPTION>
										<OPTION value="12">» Partida</OPTION>
										<OPTION value="13">» Tipo de gasto</OPTION>
										<OPTION value="14">» Fuente de financiamiento</OPTION>
									</SELECT></td>
								<td vAlign="baseline" noWrap>Agrupación 4:&nbsp;
								</td>
								<TD noWrap><SELECT id="cboGroup4" style="WIDTH: 192px" name="cboGroup4" runat="server">
										<OPTION value="" selected>( No agrupar )</OPTION>
										<OPTION value="1">» Ramo</OPTION>
										<OPTION value="2">» Unidad responsable</OPTION>
										<OPTION value="3">» Grupo funcional</OPTION>
										<OPTION value="4">» Función</OPTION>
										<OPTION value="5">» Subfunción</OPTION>
										<OPTION value="6">» Programa</OPTION>
										<OPTION value="7">» Actividad institucional</OPTION>
										<OPTION value="8">» Id Actividad prioritaria</OPTION>
										<OPTION value="9">» Actividad prioritaria</OPTION>
										<OPTION value="10">» Capítulo</OPTION>
										<OPTION value="11">» Concepto</OPTION>
										<OPTION value="12">» Partida</OPTION>
										<OPTION value="13">» Tipo de gasto</OPTION>
										<OPTION value="14">» Fuente de financiamiento</OPTION>
									</SELECT></TD>
								<td noWrap></td>
							</TR>
						</table>
					</td>
				</tr>
				<tr>
					<td><EMPIRIACONTROL:DATAGRIDNAVIGATOR id="empDataGridNavigator" runat="server"></EMPIRIACONTROL:DATAGRIDNAVIGATOR></td>
				</tr>
				<tr>
					<td noWrap width="100%" height="100%">
						<table style="WIDTH: 100%" height="100%" cellSpacing="0" cellPadding="0">
							<tr>
								<td vAlign="top" width="100%" colSpan="2">
									<div style="OVERFLOW: auto; WIDTH: 100%; HEIGHT: 100%"><asp:datagrid id="grdItems" tabIndex="-1" runat="server" AutoGenerateColumns="False" Width="100%"
											AllowPaging="True" AllowSorting="True" CssClass="dataGrid" ShowFooter="True">
											<FooterStyle Wrap="False" HorizontalAlign="Right" CssClass="totalsRow"></FooterStyle>
											<SelectedItemStyle VerticalAlign="Top"></SelectedItemStyle>
											<EditItemStyle VerticalAlign="Top"></EditItemStyle>
											<AlternatingItemStyle CssClass="evenRow" VerticalAlign="Top"></AlternatingItemStyle>
											<ItemStyle HorizontalAlign="Right" CssClass="oddRow" VerticalAlign="Top"></ItemStyle>
											<HeaderStyle Wrap="False" HorizontalAlign="Right" CssClass="headerRow"></HeaderStyle>
											<Columns>
												<asp:BoundColumn DataField="ClassId" DataFormatString="&lt;img class=imageButton src='/erario/images/icons_sm/document_sm.gif'; onclick=&quot;return doOperation('Detail', {0})&quot;&gt;"></asp:BoundColumn>
												<asp:BoundColumn DataField="ClassTag01" SortExpression="ClassTag01 ASC, ClassTag02, ClassTag03, ClassTag04">
													<HeaderStyle Wrap="False" HorizontalAlign="Left"></HeaderStyle>
													<ItemStyle Wrap="False" HorizontalAlign="Left"></ItemStyle>
													<FooterStyle Wrap="False" HorizontalAlign="Left"></FooterStyle>
												</asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="ClassTag02" SortExpression="ClassTag01, ClassTag02 ASC, ClassTag03, ClassTag04">
													<HeaderStyle Wrap="False" HorizontalAlign="Left"></HeaderStyle>
													<ItemStyle Wrap="False" HorizontalAlign="Left"></ItemStyle>
													<FooterStyle HorizontalAlign="Left"></FooterStyle>
												</asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="ClassTag03" SortExpression="ClassTag01, ClassTag02, ClassTag03 ASC, ClassTag04">
													<HeaderStyle Wrap="False" HorizontalAlign="Left"></HeaderStyle>
													<ItemStyle Wrap="False" HorizontalAlign="Left"></ItemStyle>
													<FooterStyle Wrap="False" HorizontalAlign="Left"></FooterStyle>
												</asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="ClassTag04" SortExpression="ClassTag01, ClassTag02, ClassTag03, ClassTag04 ASC">
													<HeaderStyle Wrap="False" HorizontalAlign="Left"></HeaderStyle>
													<ItemStyle Wrap="False" HorizontalAlign="Left"></ItemStyle>
													<FooterStyle Wrap="False" HorizontalAlign="Left"></FooterStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="ClassName" SortExpression="ClassName ASC" HeaderText="Denominaci&#243;n">
													<HeaderStyle Wrap="False" HorizontalAlign="Left" Width="65%"></HeaderStyle>
													<ItemStyle HorizontalAlign="Left"></ItemStyle>
													<FooterStyle Wrap="False" HorizontalAlign="Right"></FooterStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="Apr2005" SortExpression="Apr2005 ASC" HeaderText="Aprobado 2005" DataFormatString="{0:N0}">
													<HeaderStyle Wrap="False"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="Pry2006" SortExpression="Pry2006 ASC" HeaderText="Proyecto 2006" DataFormatString="{0:N0}">
													<HeaderStyle Wrap="False"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="Amp2006" SortExpression="Amp2006 ASC" HeaderText="Ampliaciones" DataFormatString="{0:N0}">
													<HeaderStyle Wrap="False"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="Red2006" SortExpression="Red2006 ASC" HeaderText="Reducciones" DataFormatString="{0:N0}">
													<HeaderStyle Wrap="False"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="Apr2006" SortExpression="Apr2006 ASC" HeaderText="Aprobado 2006" DataFormatString="{0:N0}">
													<HeaderStyle Wrap="False"></HeaderStyle>
													<ItemStyle Wrap="False"></ItemStyle>
													<FooterStyle Wrap="False"></FooterStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="Comp20062005" SortExpression="Comp20062005 ASC" HeaderText="Comp 2006-2005" DataFormatString="{0:N0}">
													<HeaderStyle Wrap="False"></HeaderStyle>
													<ItemStyle Wrap="False"></ItemStyle>
													<FooterStyle Wrap="False"></FooterStyle>
												</asp:BoundColumn>												
											</Columns>
											<PagerStyle Visible="False" Wrap="False"></PagerStyle>
										</asp:datagrid></div>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>
