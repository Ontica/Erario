<%@ OutputCache Location="None"%>
<%@ Page language="c#" CodeFile="default.aspx.cs" AutoEventWireup="false" Inherits="Empiria.WebApp.DefaultPage" enableViewState="False" EnableSessionState="True" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title><%=Title%></title>
		<META http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
		<meta name="keywords" content="<%=ProductInfo.Keywords%>">
		<meta content="Microsoft Visual Studio 7.0" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<link href='./css/logon.css' type='text/css' rel='stylesheet'>
		<script language="javascript" id="eventHandlers">
		<!--
			var gbSended = false;

			function txtPassword_onkeypress() {
				if ((window.event.keyCode == 13) && (document.frmLogon.txtPassword.value != '')) {
					document.frmLogon.cmdSend.click();
					window.event.returnValue = false;
				}
			}

			function txtUserId_onkeypress() {
				if ((window.event.keyCode == 13) && (document.frmLogon.txtUserId.value != '')) {
					document.frmLogon.txtPassword.focus();
					window.event.returnValue = false;
				}
			}

			function validate() {
				if (document.all.txtUserId.value == '') {
					alert('Para ingresar a este sitio se requiere proporcionar el identificador de acceso.');
					document.all.txtUserId.focus();
					return false;
				}
				if (document.all.txtPassword.value == '') {
					alert('Para ingresar a este sitio se requiere proporcionar la contrase�a de acceso.');
					document.all.txtPassword.focus();
					document.all.loginBtn.className = 'disabledImage';
					document.body.style.cursor = 'default';
					return false;
				}
				return true;
			}
			
			function doLogin() {
				if (gbSended) {
					return;
				}				
				document.body.style.cursor = 'wait';
				document.all.loginBtn.className = 'enabledImage';
				if (validate()) {
					gbSended = true;
					document.all.frmLogon.submit();				
				} else {
					document.all.loginBtn.className = 'disabledImage';
					document.body.style.cursor = 'default';				
				}
				return;
			}

		function window_onload() {
			if (window.parent.frames.length != 0) {
				window.open("/empiria/default.aspx", "_top", null, true);
			}
			<% if (ExceptionMessage.Length != 0) { %>
				alert("<%=ExceptionMessage%>");
				document.all.txtPassword.focus();				
			<% } else { %>				
				document.all.txtUserId.focus();
			<% } %>
			<% if (Request.Url.ToString().StartsWith("http://jmcota/empiria")) { %>
				document.frmLogon.txtUserId.value = "Invitado";
				document.frmLogon.txtPassword.value = "erario";
			<% } %>
			}

		//-->
		</script>
	</HEAD>
	<body MS_POSITIONING="GridLayout" onload="return window_onload();" oncontextmenu="return false;">
		<form id="frmLogon" name="frmLogon" method="post" runat="server">
			<table class="bgGradient" width="100%" height="100%" cellpadding="0" cellspacing="0">
				<tr>
					<td height="25%">
					</td>
				</tr>
				<!-- BEGIN_MAIN_ROW !-->
				<tr>
					<td width="100%" height="420" align="center" valign="middle">
						<table width="660" height="100%" cellpadding="0" cellspacing="0">
							<!-- BEGIN_HEADER_BANNER_ROW !-->
							<tr>
								<td colspan="2" width="100%">
									<table width="100%" cellpadding="0" cellspacing="0">
										<tr>
											<td rowspan=2>
												<img class="headerImage" src="./images/customer/header1.png">
											</td>
											<td class="imageHeaderGradient" width="100%">												
											</td>
											<td>
												<img class="headerImage" src="./images/customer/header2.png" align=absbottom>
											</td>
										</tr>
										<tr>
											<td colspan=2>
												<img class="headerImage" src="./images/customer/header3.png" width="100%" height="13px">
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<!-- END_HEADER_BANNER_ROW !-->
							<!-- BEGIN_DOMAIN_HEADER_ROW !-->
							<tr>
								<td colspan="2" width="100%" nowrap>
									<table cellpadding="2" cellspacing="0" width="100%">
										<tr>
											<td nowrap class="headerTitle" width="40%">								
												Sistema Erario
											</td>
											<td class="subheaderTitle" align="right" width="60%">
												H. C�mara de Diputados
											</td>
										</tr>
									</table>
									<!--BEGIN One Column Right pattern
									<table cellpadding="2" cellspacing="0" width="100%" height=45>
										<tr width="100%" nowrap>
											<td class="headerTitle" align="right" nowrap>
												<A href="">
												<%=ProductInfo.ServerName%>
												<img class="grayedImage" src="./images/dropdown_menu.gif" align="absmiddle"
													   title="Muestra la lista de sitios intranet de la organizaci�n"></A>
											</td>
										</tr>
									</table>
									END One Column Right pattern !-->
								</td>
							</tr>
							<!-- END_DOMAIN_HEADER_ROW !-->
							<!-- BEGIN_CONTENTS_ROW !-->
							<tr>
								<!-- BEGIN_LINKS_TABLE_LEFT_COLUMN !-->
								<td class="initHeaderGradient" height="100%">
									<TABLE class="linksTable" height="100%" cellSpacing="2" cellPadding="4" width="236" border="0">
										<TR>
											<TD><A href="http://www.diputados.gob.mx/"><img src="./images/bullets/green_sq_bullet.gif" vspace="1" hspace="2">C�mara 
													de Diputados</A>
											</TD>
										</TR>
										<TR>
											<TD><A href="http://www.senado.gob.mx/"><img src="./images/bullets/green_sq_bullet.gif" vspace="1" hspace="2">Senado 
													de la Rep�blica</A>
											</TD>
										</TR>
										<TR>
											<TD>
												<A href="http://www.presidencia.gob.mx/"><img src="./images/bullets/green_sq_bullet.gif" vspace="1" hspace="2">Presidencia 
													de la Rep�blica</A>
											</TD>
										</TR>
										<TR>
											<TD>
												<A href="http://www.scjn.gob.mx/"><img src="./images/bullets/green_sq_bullet.gif" vspace="1" hspace="2">Suprema Corte de Justicia<br>
													&nbsp; &nbsp;&nbsp;de la Naci�n</A>
											</TD>
										</TR>										
										<TR>
											<TD>
												<A href="http://www.banxico.org.mx/"><img src="./images/bullets/green_sq_bullet.gif" vspace="1" hspace="2">Banco 
													de M�xico</A>
											</TD>
										</TR>
										<TR>
											<TD>
												<A href="http://www.shcp.gob.mx/index01.html"><img src="./images/bullets/green_sq_bullet.gif" vspace="1" hspace="2">Secretar�a de
													Hacienda y<br>&nbsp; &nbsp;&nbsp;Cr�dito P�blico</A>
											</TD>
										</TR>										
										<TR>
											<TD>
												<A href="http://www.inegi.gob.mx/"><img src="./images/bullets/green_sq_bullet.gif" vspace="1" hspace="2">Instituto 
													Nacional de Estad�stica,<br>
													&nbsp; &nbsp;&nbsp;Geograf�a e Inform�tica</A>
											</TD>
										</TR>
										<TR>
											<TD>
												<A href="http://www.precisa.gob.mx/www.php?categoria=180"><img src="./images/bullets/green_sq_bullet.gif" vspace="1" hspace="2">Peri�dicos 
													y revistas</A>
											</TD>
										</TR>
										<TR>
											<TD>
												<A href="http://www.google.com.mx/"><img src="./images/bullets/green_sq_bullet.gif" vspace="1" hspace="2">B�squeda 
													en Google</A>
											</TD>
										</TR>				
									</TABLE>
								</td>
								<!-- END_LINKS_TABLE_LEFT_COLUMN !-->
								<!-- BEGIN_CREDENTIALS_TABLE_RIGHT_COLUMN !-->
								<td class="endHeaderGradient" align="left">
									<TABLE>
										<tr height="24">
											<td class="welcome" colspan="3" align="left">
												Acceso al sitio
											</td>
										</tr>
										<TR>
											<TD colSpan="3">Para ingresar a este sitio se requiere el nombre del usuario<br>
												 y la contrase�a de acceso:
												<br>
												&nbsp;
											</TD>
										</TR>
										<TR height="25">
											<TD noWrap>&nbsp;</TD>
											<TD>Usuario: &nbsp;</TD>
											<TD align="right">
												<INPUT id="txtUserId" style="WIDTH: 162px;" type="text" maxLength="32" size="24" onkeypress="return txtUserId_onkeypress();"
													name="txtUserId" runat="server">
											</TD>
										</TR>
										<TR>
											<TD noWrap>
												&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
											</TD>
											<TD>Contrase�a:</TD>
											<TD align="right">
												<INPUT id="txtPassword" style="WIDTH: 162px;" type="password" maxLength="32" size="24"
													onkeypress="return txtPassword_onkeypress();" name="txtPassword" runat="server">
											</TD>
										</TR>
										<TR height="32">
											<TD align="right" colSpan="3">
												<a href="javascript:doLogin();" target="_self" 
													 onmouseover="document.frmLogon.loginBtn.className='enabledImage'" onmouseout="document.frmLogon.loginBtn.className='disabledImage'">
													<img id=loginBtn class="grayedImage" src="./images/go_xp.gif" align=absmiddle height=18>Ingresar al sitio</a>
											</TD>
										</TR>
										<tr>
											<TD align="right" colSpan="3">
												<TABLE class="optionsTable" cellpadding="3">
													<TR>
														<TD noWrap><b>Preguntas frecuentes</b></A></TD>
													</TR>
													<TR>
														<TD noWrap><A href="" target="_self"><img src="./images/bullets/green_sq_bullet.gif" vspace="1" hspace="4">�Qu� debo hacer si no recuerdo mi contrase�a?</A></TD>
													</TR>
													<TR>
														<TD noWrap><A href="" target="_self"><img src="./images/bullets/green_sq_bullet.gif" vspace="1" hspace="4">Nunca he ingresado, �c�mo solicito acceso?</A></TD>
													</TR>
													<TR>
														<TD noWrap><A href="" target="_self"><img src="./images/bullets/green_sq_bullet.gif" vspace="1" hspace="4">�C�mo verifico que mi navegador est� bien configurado?</A></TD>
													</TR>																										
												</TABLE>
											</TD>
										</tr>
											<tr height="42px">
											<td colspan="3" align="right">
												<a class="copyright2">Servicio proporcionado por el<br>
													<b><%=ProductInfo.ServiceProvider%></b></a>
											</td>											
										</tr>
									</TABLE>
								</td>
								<!-- END_CREDENTIALS_TABLE_RIGHT_COLUMN !-->
							</tr>
							<!-- END_CONTENTS_ROW !-->
							<!-- BEGIN_COPYRIGHT_ROW !-->
							<tr height="24">
								<TD colspan="2">
									<table width="100%" cellspacing="0" cellpadding="0">
										<tr>
											<td class="copyright">
												<A href="http://empiria.ontica.com.mx/">Sistema Empiria<sup><small>�</small></sup> para Gobiernos</A>
											</td>
											<TD class="copyright" align="right">
												<A href="http://www.ontica.com.mx/">Copyright � M�xico 1999-2005. La V�a �ntica, S.C.</A>
											</TD>
										</tr>
									</table>
								</TD>
							</tr>
							<!-- END_COPYRIGHT_ROW !-->
						</table>
					</td>
				</tr>
				<!-- END_MAIN_ROW !-->
				<tr>
					<td height="75%">
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>
