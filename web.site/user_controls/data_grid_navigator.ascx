<%@ Control Language="c#" AutoEventWireup="false" CodeFile="data_grid_navigator.ascx.cs" Inherits="Empiria.WebApp.UserControls.DataGridNavigator" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<script language="javascript">
<!--
	function showDataGridOptionsMenu() {
		var oControl = document.all.<%=tblNavigationOptions.ClientID%>;
		if (oControl.style.display == "none") {
			oControl.style.display = "inline";			
		} else {
			oControl.style.display = "none";
		}
		document.all.hdnDTGOptionsDisplay.value = oControl.style.display;
	}
	
	function validateDTGOptionsExport() {
		if (document.all.<%=cboDTGExportTech.ClientID%>.value == "") {		
			alert("Necesito la tecnología del archivo que se desea obtener.");
			document.all.<%=cboDTGExportTech.ClientID%>.focus();
			return false;
		}
		if (document.all.<%=cboDTGExportFormat.ClientID%>.value == "") {
			alert("Necesito el formato del archivo que se desea obtener.");
			document.all.<%=cboDTGExportFormat.ClientID%>.focus();
			return false;
		}
		return true;
	}
//-->
</script>
<TABLE id="tblNavigationButtons" class="dataGridHandler" height="24" cellSpacing="0" width="100%"
	runat="server">
	<TR valign="middle">
		<TD noWrap width="100%">
			<% if (Exportable) { %>
			<img class="imageButton" src='/erario/images/ms_office.gif' align="absMiddle" alt='Opciones de configuración y exportación de los elementos encontrados'
				onclick='showDataGridOptionsMenu();'>
			<% } %>
				<b><%=title%></b>
		</TD>
		<TD noWrap align="right">
			<asp:imagebutton id="imgMoveFirst" BorderStyle="None" runat="server" Height="16px" TabIndex="-1"
				ImageUrl="../images/move_first.gif" ImageAlign="AbsMiddle" CommandName="MoveFirst" CausesValidation="False"></asp:imagebutton><asp:imagebutton id="imgMovePrevious" BorderStyle="None" runat="server" Height="16px" ImageUrl="../images/back.gif"
				ImageAlign="AbsMiddle" TabIndex="-1" CommandName="MovePrevious" CausesValidation="False"></asp:imagebutton>&nbsp;Página
			<%=gridHandler.CurrentPageIndex + 1%>
			de
			<%=gridHandler.PageCount.ToString("N0")%>
			<asp:imagebutton id="imgMoveNext" BorderStyle="None" runat="server" Height="16px" TabIndex="-1" ImageUrl="../images/forward.gif"
				ImageAlign="AbsMiddle" CommandName="MoveNext" CausesValidation="False"></asp:imagebutton><asp:imagebutton id="imgMoveLast" BorderStyle="None" runat="server" Height="16px" TabIndex="-1" ImageUrl="../images/move_last.gif"
				ImageAlign="AbsMiddle" CommandName="MoveLast" CausesValidation="False"></asp:imagebutton>
		</TD>
	</TR>
</TABLE>
<TABLE id="tblNavigationOptions" class="dataGridHandler" cellSpacing="0" width="100%" runat="server">
	<TR valign="top">
		<TD noWrap width="100%">
			<table width="100%">
				<tr width="100%">
					<td colspan="6"><b>Exportación:</b></td>
				</tr>
				<tr>
					<td nowrap>
						Tecnología: &nbsp;
					</td>
					<td>
						<SELECT id="cboDTGExportTech" name="cboDTGExportTech" runat="server" style="WIDTH: 192px">
							<OPTION value="" selected>( Seleccionar la tecnología )</OPTION>
							<OPTION value="1">» Archivo de texto plano</OPTION>
							<OPTION value="2">» Documento XML</OPTION>
							<OPTION value="3">» Microsoft Excel</OPTION>
						</SELECT>									
					</td>
					<td nowrap>
						&nbsp; Formato: &nbsp;
					</td>
					<td>
						<SELECT id="cboDTGExportFormat" name="cboDTGExportFormat" runat="server" style="WIDTH: 168px">
							<OPTION value="" selected>( Seleccionar el formato )</OPTION>
							<OPTION value="1">» Predeterminado</OPTION>
						</SELECT>
					</td>
					<td nowrap>
						<asp:LinkButton id="btnDoExport" runat="server"><img src="../images/detail.gif" align="absMiddle" hspace="4">Crear el 
						archivo</asp:HyperLink></asp:LinkButton>
					</td>
					<td width=100%>
						<% if (exportFile.Length != 0) { %>
							<a href="<%=exportFile%>" onclick="return false"><img src="../images/icons_sm/document_sm.gif" align=absmiddle hspace=4>El archivo está listo</a>
						<% } %>
					</td>
				</tr>
			</table>
		</TD>
	</TR>
</TABLE>
