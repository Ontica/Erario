<%@ Page language="c#" CodeFile="default.aspx.cs" AutoEventWireup="false" Inherits="Empiria.WebApp.Workplace.DefaultPage" %>
<%@ Register TagPrefix="EmpiriaWebControl" Namespace="Empiria.Workplace.Web.Controls" Assembly = "Empiria.Workplace.Web" %>
<%@ OutputCache Location="None"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title><%=Title%></title>
		<meta name="vs_snapToGrid" content="False">
		<meta content="Microsoft Visual Studio 7.0" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../css/workplace.css" type="text/css" rel="stylesheet">
		<script language="JavaScript" src="../scripts/tools/clock.js"></script>
		<script language="JavaScript" src="../scripts/workplace/default.js"></script>
	</HEAD>
	<BODY scroll="no" onload="return workplace_onload();">
		<form id="frmEditor" method="post" runat="server">
			<!--BEGIN_CONTAINER_TABLE -->
			<TABLE id="tblContainer" class=containerTable cellSpacing="0" cellpadding="0">
				<!--BEGIN_MAIN_NAVIGATION_ROW -->
				<tr>
					<td>
						<img class="decoratorImage" src="../images/customer/pleca.png" width=100% height=12px>
						<TABLE cellSpacing="0" cellPadding="4" width="100%" border="0">
							<TR height="36">
							<td width=10px><img class="decoratorImage" src="../images/customer/escudo_nacional.png" hspace=4 alt=""></td>
								<td class="initBgGradient" vAlign="middle" width="75%">
									<table cellSpacing="0" cellpadding=0 width="100%" border="0">
										<tr>
											<td nowrap width=100%>
												<A href="javascript:window.location.href=window.location.href;" style="FONT-SIZE: 22pt;" title="Actualiza el contenido de esta página" tabIndex="-1" runat="server">
												<%=ProductInfo.ServerName%></A>
											</td>
										</tr>
										<tr>
											<td class=breadcrumbBar>
												<EmpiriaWebControl:BreadcrumbBar id="breadcrumbBar" runat="server" />
											</td>
										</tr>
									</table>
								</td>
								<td class="endBgGradient" nowrap vAlign="middle" align="right" width="25%">
									<TABLE cellSpacing="1" cellPadding="1" border="0" style="margin-right:6px">
										<tr>
									    <td noWrap align="right"><b><%=EmpiriaUser.UserName%></b></td>
										</tr>
										<tr>
											<td noWrap align="right" style="BORDER-BOTTOM: #a9a9a9 1px solid">
													<span id="oDate">&nbsp;</span></A>
											</td>
									</tr>
									<tr vAlign="bottom">
										<td align=right>
											<EmpiriaWebControl:NavigationButtons id="navigationButtons" runat="server" />
										</td>
									</tr>
								</TABLE>
							</td>
							</TR>
						</TABLE>
					</td>					
				</tr>
				<!--END_MAIN_NAVIGATION_ROW -->
				<!--BEGIN_WORKAREA_FRAME_ROW -->
				<tr height="100%">
					<td valign="top" width="100%" height="100%">
						<IFRAME id="ifraWorkarea" src="../workplace/workarea.aspx<%=Request.Url.Query%>" marginWidth="0" marginHeight="0" hspace="0" vspace="0"
										frameBorder="no" width="100%" height="100%" scrolling="no" tabindex=-1>
						</IFRAME>
					</td>
				</tr>
				<!--END_WORKAREA_FRAME_ROW -->
				<!--BEGIN_COPYRIGHT_ROW -->
				<tr>
					<td width="100%">
						<EmpiriaWebControl:CopyrightBar id="copyrightBar" runat="server" />
					</td>
				</tr>
				<!--END_COPYRIGHT_ROW -->
			</TABLE>
			<!--END_CONTAINER_TABLE -->
		</form>
	</BODY>
</HTML>
