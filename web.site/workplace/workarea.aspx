<%@ Page language="c#" CodeFile="workarea.aspx.cs" AutoEventWireup="false" Inherits="Empiria.WebApp.Workplace.Workarea" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>Area de trabajo</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="../css/workarea.css" type="text/css" rel="stylesheet">
		<script language="javascript">
			<!--

			function setRightToolbarContainer() {
				var currentValue = document.all.rightToolbarContainer.style.display;
				
				if (currentValue == 'inline') {
					document.all.rightToolbarContainer.style.display = 'none';
					return 'none';
				} else {
					document.all.rightToolbarContainer.style.display = 'inline';
					return 'inline';
				}
			}
			
			//-->
		</script>
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="oForm" method="post" runat="server">		
			<TABLE id="tblContainer" class="appContainer" cellSpacing="0" cellPadding="0">
				<!--BEGIN_ITEM_INFO_TABLE -->
				<tr>
					<td width="100%" style="display:inline;">
						<!--BEGIN_LEFT_TOOL_BAR_TABLE -->
							<table id="tblAppHeader" cellSpacing="0" cellPadding="0" width="100%" border="0">
								<tr>
									<td vAlign="top">
										<table class="appHeader" cellSpacing="0" cellPadding="0" width="100%" border="0">
											<tr>
												<% if (workareaInfo.Namespace == "Empiria.HomePage") { %>
												<td vAlign="middle">
													<IMG class=decoratorImage src="<%=workareaInfo.ImagePath%>" hspace=8>
												</td>
												<% } %>					
												<td vAlign="top" width="100%">
													<table cellSpacing="0" cellPadding="4" width="100%" border="0">												
														<tr>
															<td class=workareaTitle colSpan="2">
																<%=workareaInfo.Name%>
															</td>
														</tr>
														<% if (workareaInfo.Namespace == "Empiria.HomePage") { %>
														<tr id=itemInfoRow>
															<td width=60% valign=top>
																<!--BEGIN_ITEM_PROPERTIES -->
																<table cellSpacing="0" cellpadding=3>
																	<tr>
																		<td class=propertyName>Mensajes y alertas:</td>
																		<td class=propertyValue>No hay mensajes ni alertas nuevos</td>
																	</tr>
																	<tr>
																		<td class=propertyName>Citas y reuniones:</td>
																		<td class=propertyValue>No hay citas próximas</td>
																	</tr>
																	<tr>
																		<td class=propertyName>Tareas pendientes:</td>
																		<td class=propertyValue>No hay tareas pendientes</td>
																	</tr>
																</table>
																<!--END_ITEM_PROPERTIES -->
															</td>
															<td width=40% nowrap>
																<!--BEGIN_OPERATIONS_TABLE -->
																<table cellSpacing="0" cellpadding=3>
																	<tr>
																		<td nowrap class=propertyValue><IMG src="../images/bullets/green_sq_bullet.gif" hspace=6>Enviar un mensaje</td>
																		<td nowrap>&nbsp;</td>
																	</tr>
																	<tr>
																		<td nowrap class=propertyValue><IMG src="../images/bullets/green_sq_bullet.gif" hspace=6>Revisar mi agenda</td>
																		<td nowrap>&nbsp;</td>
																	</tr>
																	<tr>
																		<td nowrap class=propertyValue><IMG src="../images/bullets/green_sq_bullet.gif" hspace=6>Ver mi libreta de contactos</td>
																		<td nowrap>&nbsp;</td>
																	</tr>
																	<tr>
																		<td nowrap class=propertyValue><IMG src="../images/bullets/green_sq_bullet.gif" hspace=6>Ver mi lista de favoritos</td>
																		<td nowrap>&nbsp;</td>
																	</tr>																	
																</table>
																<!--END_OPERATIONS_TABLE -->
															</td>
														</tr>
														<% } %>
													</table>
												</td>
												<td align=right height=100%>
													<table cellspacing=0 cellpadding=0 height=100%>
														<tr>
															<td valign=top nowrap>
																<IMG class="grayedImage" src="../images/collapse.gif" onclick="return false;" vspace=4 hspace=4 align="top">
															</td>
														</tr>
													</table>
												</td>
											</TR>
										</TABLE>
									</TD>
								</tr>
							</table>
						<!--END_LEFT_TOOL_BAR_TABLE -->
					</td>
				</tr>
				<!--END_ITEM_INFO_TABLE -->
				<tr height="100%">
					<td valign="top" width="100%">
						<!--BEGIN_BODY_TABLE -->
						<table id="tblBody" class="appBody" height="100%" cellSpacing="0" cellPadding="0" width="100%" border="0">
							<tr vAlign="top">
								<td id=leftToolbarContainer nowrap width="172" style="display:<%=workareaInfo.LeftToolbarViewInfo.Path.Length != 0 ? "inline" : "none"%>;">
									<!--BEGIN_LEFT_TOOL_BAR_TABLE -->
									<IFRAME id="ifraLeftToolbar" marginWidth="0" hspace="0" vspace="0" marginHeight="0" src="<%=workareaInfo.LeftToolbarViewInfo.Path%>"
													frameBorder="no" width="100%" height="100%" scrolling="no" tabindex=-1></IFRAME>
									<!--END_LEFT_TOOL_BAR_TABLE -->
								</td>
								<td id=applicationViewerContainer noWrap width="100%">
									<!--BEGIN_APPLICATION_BODY_VIEWER -->
									<IFRAME id="ifraAppViewer" marginWidth="0" hspace="0px" vspace="0" marginHeight="0" src="<%=workareaInfo.ApplicationViewInfo.Path%>"
													frameBorder="no" width="100%" height="100%" scrolling="auto" tabindex=-1>
									</IFRAME>
									<!--END_APPLICATION_BODY_VIEWER -->
								</td>
								<td id=rightToolbarContainer nowrap width="260" style="display:none;">
									<!--BEGIN_RIGHT_TOOL_BAR_TABLE -->
									<IFRAME id="ifraRightToolbar" marginWidth="0" hspace="0" vspace="0" marginHeight="0" src="<%=workareaInfo.RightToolbarViewInfo.Path%>"
													frameBorder="no" width="100%" height="100%" scrolling="no" tabindex=-1></IFRAME>
									<!--END_RIGHT_TOOL_BAR_TABLE -->
								</td>
							</tr>
						</table>
						<!--END_BODY_TABLE -->
					</td>
				</tr>
				<tr>
					<td>
						<table id="tblAppStatusBar" class="statusBar" cellSpacing="0" cellPadding="0" border="0">
							<tr>
								<td>

								</td>
							</tr>
						</table>
					</td>
				</tr>				
			</table>			
		</form>
	</body>
</HTML>