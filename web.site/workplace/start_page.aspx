<%@ Page language="c#" CodeFile="start_page.aspx.cs" AutoEventWireup="false" Inherits="Empiria.WebApp.Workplace.StartPage" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>An�lisis de condiciones financieras</title>
		<meta content="Microsoft Visual Studio 7.0" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../css/start_page.css" type="text/css" rel="stylesheet">
		<base target="_top">
		<script language="javascript">
		<!--			
			var bSended = false;
			var oViewer = null;
			
			function doOperation(operationTag) {
		
			}
			
			function validate() {
				var oForm = document.frmEditor;
				return true;
			}
			
		//-->
		</script>
	</HEAD>
	<body MS_POSITIONING="GridLayout" oncontextmenu="return true;">
		<form id="frmEditor" method="post" runat="server">
			<table cellSpacing="0" cellPadding="10" width="100%">
				<tr>
					<td class="titleRow" noWrap colspan="2" width="100%">
						Servicios proporcionados por el sistema Erario<sup>*</sup>
					</td>
				</tr>
			</table>
			<table cellSpacing="0" cellPadding="6" width="100%">
				<tr>
					<td noWrap width="50%" valign="top">
						<table>
							<tr>
								<td rowspan="6" valign="top">
									<img src="../images/icons/analysis.gif">
								</td>
								<td class="subTitle">
									An�lisis y simulaci�n presupuestal
								</td>
							</tr>
							<tr>
								<td>
									<a href="default.aspx?urlns=Empiria.Erario.Budget.Analysis"><img src="../images/bullets/green_sq_bullet.gif" hspace="6" align="absMiddle">Analizar 
										presupuestos</a></td>
							</tr>
							<tr>
								<td class=underConstruction>
									<a tag="default.aspx?urlns=Empiria.Erario.Budget.Simulation"><img src="../images/bullets/green_sq_bullet.gif" hspace="6" align="absMiddle">Editar 
										y simular presupuestos</a></td>
							</tr>
							<tr>
								<td class=underConstruction>
									<a tag="default.aspx?urlns=Empiria.Erario.Budget.StructureMatch"><img src="../images/bullets/green_sq_bullet.gif" hspace="6" align="absMiddle">Homologar 
									estructuras presupuestales</a></td>
							</tr>
							<tr>
								<td class=underConstruction>
									<a tag="default.aspx?urlns=Empiria.Erario.Budget.Import"><img src="../images/bullets/green_sq_bullet.gif" hspace="6" align="absMiddle">Importar&nbsp;informaci�n 
									presupuestal</a></td>
							</tr>
							<tr>
								<td class=underConstruction>
									<a tag="default.aspx?urlns=Empiria.Erario.Budget.StructureDesign"><img src="../images/bullets/green_sq_bullet.gif" hspace="6" align="absMiddle">Dise�ar 
									estructuras presupuestales</a></td>
							</tr>
						</table>
					</td>
					<td nowrap width="50%" valign="top">
						<table>
							<tr>
								<td rowspan="5" valign="top">
									<img src="../images/icons/library.gif">
								</td>
								<td class="subTitle">
									Servicio de referencia
								</td>
							</tr>
							<tr>
								<td class=underConstruction><img src="../images/bullets/gray_sq_bullet.gif" hspace="6" align="absMiddle">Consultar peticiones</td>
							</tr>							
							<tr>
								<td class=underConstruction><img src="../images/bullets/gray_sq_bullet.gif" hspace="6" align="absMiddle">Registrar una nueva petici�n</td>
							</tr>
							<tr>
								<td class=underConstruction><img src="../images/bullets/gray_sq_bullet.gif" hspace="6" align="absMiddle">Dar seguimiento a peticiones</td>
							</tr>						
							<tr>
								<td class=underConstruction><img src="../images/bullets/gray_sq_bullet.gif" hspace="6" align="absMiddle">Medici�n y estad�sticas del servicio</td>
							</tr>							
						</table>
					</td>
				</tr>
				<tr>
					<td nowrap width="50%" valign="top">
						<table>
							<tr>
								<td rowspan="6" valign="top">
									<img src="../images/icons/documents.gif">
								</td>
								<td class="subTitle">
									Fondo documental
								</td>
							</tr>
							<tr>
								<td class=underConstruction><img src="../images/bullets/gray_sq_bullet.gif" hspace="6" align="absMiddle">Consultar el cat�logo de documentos</td>
							</tr>
							<tr>
								<td class=underConstruction><img src="../images/bullets/gray_sq_bullet.gif" hspace="6" align="absMiddle">Solicitar un documento</td>
							</tr>
							<tr>
								<td class=underConstruction><img src="../images/bullets/gray_sq_bullet.gif" hspace="6" align="absMiddle">Reproducir y publicar documentos</td>
							</tr>
							<tr>
								<td class=underConstruction><img src="../images/bullets/gray_sq_bullet.gif" hspace="6" align="absMiddle">Dise�ar el cat�logo de documentos</td>
							</tr>
							<tr>
								<td class=underConstruction><img src="../images/bullets/gray_sq_bullet.gif" hspace="6" align="absMiddle">Medici�n y estad�sticas del servicio</td>
							</tr>
						</table>
					</td>
					<td nowrap width="50%" valign="top">
						<table>
							<tr>
								<td rowspan="7" valign="top">
									<img src="../images/icons/learning.gif">
								</td>
								<td class="subTitle">
									Servicios de capacitaci�n
								</td>
							</tr>
							<tr>
								<td class=underConstruction><img src="../images/bullets/gray_sq_bullet.gif" hspace="6" align="absMiddle">Calendario de capacitaci�n e inscripciones</td>
							</tr>
							<tr>
								<td class=underConstruction><img src="../images/bullets/gray_sq_bullet.gif" hspace="6" align="absMiddle">Solicitar un servicio de capacitaci�n</td>
							</tr>													
							<tr>
								<td class=underConstruction><img src="../images/bullets/gray_sq_bullet.gif" hspace="6" align="absMiddle">Sala de capacitaci�n en l�nea</td>
							</tr>
							<tr>
								<td class=underConstruction><img src="../images/bullets/gray_sq_bullet.gif" hspace="6" align="absMiddle">Consultar y obtener materiales</td>
							</tr>
							<tr>
								<td class=underConstruction><img src="../images/bullets/gray_sq_bullet.gif" hspace="6" align="absMiddle">Evaluaci�n de la capacitaci�n</td>
							</tr>
							<tr>
								<td class=underConstruction><img src="../images/bullets/gray_sq_bullet.gif" hspace="6" align="absMiddle">Medici�n y estad�sticas del servicio</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td nowrap width="50%" valign="top">
						<table>
							<tr>
								<td rowspan="5" valign="top">
									<img src="../images/icons/research.gif">
								</td>
								<td class="subTitle">
									Proyectos de investigaci�n
								</td>
							</tr>
							<tr>
								<td class=underConstruction><img src="../images/bullets/gray_sq_bullet.gif" hspace="6" align="absMiddle">Consultar proyectos de investigaci�n</td>
							</tr>
							<tr>
								<td class=underConstruction><img src="../images/bullets/gray_sq_bullet.gif" hspace="6" align="absMiddle">Solicitud de nuevos proyectos de investigaci�n</td>
							</tr>
							<tr>
								<td class=underConstruction><img src="../images/bullets/gray_sq_bullet.gif" hspace="6" align="absMiddle">Planeaci�n y ejecuci�n de proyectos</td>
							<tr>
								<td class=underConstruction><img src="../images/bullets/gray_sq_bullet.gif" hspace="6" align="absMiddle">Medici�n y estad�sticas del servicio</td>
							</tr>
						</table>
					</td>
					<td nowrap width="50%" valign="top">
						<table>
							<tr>
								<td rowspan="5" valign="top">
									<img src="../images/icons/info_room.gif">
								</td>
								<td class="subTitle">
									Sala de sesiones informativas
								</td>
							</tr>
							<tr>
								<td class=underConstruction><img src="../images/bullets/gray_sq_bullet.gif" hspace="6" align="absMiddle">Consultar almacenes de datos</td>
							</tr>							
							<tr>
								<td class=underConstruction><img src="../images/bullets/gray_sq_bullet.gif" hspace="6" align="absMiddle">Servicios de econometr�a</td>
							</tr>
							<tr>
								<td class=underConstruction><img src="../images/bullets/green_sq_bullet.gif" hspace="6" align="absMiddle">Servicios de geograf�a ( INEGI - Iris )</td>
							</tr>
							<tr>
								<td class=underConstruction><img src="../images/bullets/gray_sq_bullet.gif" hspace="6" align="absMiddle">Administrar almacenes de datos</td>
						</table>
					</td>
				</tr>
				<tr>
					<td noWrap colspan="2" width="100%">
						<table>
							<tr>
								<td class="titleRow">&nbsp;</td>
							</tr>
							<tr>
								<td>* En la Roma antigua, el Senado ten�a el control supremo sobre las finanzas 
									p�blicas, pues no s�lo manejaba el tesoro p�blico (<i>aerarium Saturni</i>) 
									sino que tambi�n tomaba las decisiones finales sobre el gasto p�blico y los 
									impuestos.</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>
