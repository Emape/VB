<%@ page language="VB" masterpagefile="~/MasterPage.master" autoeventwireup="false" inherits="rptLocacion, App_Web_3km2mpsz" title="Reportes Varios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager id="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="Tipo de Salida"></asp:Label></td>
            <td>
                <asp:RadioButtonList ID="rdbOpcion" runat="server" AutoPostBack="True" BorderStyle="Solid"
                    BorderWidth="1px">
                    <asp:ListItem Value="Aportes">Excel Aportes Previsionales</asp:ListItem>
                    <asp:ListItem Value="RangoFecha">Excel Rango de Fechas</asp:ListItem>
                    <asp:ListItem Value="Proveedor">Excel Padron Locadores y Asociantes</asp:ListItem>
                    <asp:ListItem Value="Periodo">Reporte por Periodo</asp:ListItem>
                    <asp:ListItem Value="Seace">Excel O/C y O/S para SEACE</asp:ListItem>
                    <asp:ListItem Value="Estadistica">Estadistica de Ordenes</asp:ListItem>
                </asp:RadioButtonList></td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label7" runat="server" BackColor="White" ForeColor="White" Text="Sep"></asp:Label></td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="panelRango" runat="server" BackColor="Transparent" BorderStyle="Solid"
                    BorderWidth="1px">
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="Label5" runat="server" Text="Fecha Inicial"></asp:Label></td>
                            <td>
                                <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd/MM/yyyy"
                                    PopupButtonID="ImgFechaIni" TargetControlID="txtFechaIni">
                                </ajaxToolkit:CalendarExtender>
                                <asp:TextBox ID="txtFechaIni" runat="server" Width="110px"></asp:TextBox><img id="ImgFechaIni"
                                    src="Img/calendario.gif" /></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label6" runat="server" Text="Fecha Final"></asp:Label></td>
                            <td>
                                <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" Format="dd/MM/yyyy"
                                    PopupButtonID="ImgFechaFin" TargetControlID="txtFechaFin">
                                </ajaxToolkit:CalendarExtender>
                                <asp:TextBox ID="txtFechaFin" runat="server" Width="110px"></asp:TextBox><img id="ImgFechaFin"
                                    src="Img/calendario.gif" /></td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td>
            </td>
            <td>
                <asp:Panel ID="panelPeriodo" runat="server" BorderStyle="Solid" BorderWidth="1px" Visible="False">
                    <table>
                        <tr>
                            <td>
                <asp:Label ID="Label1" runat="server" Text="Año"></asp:Label></td>
                            <td>
                <asp:DropDownList ID="cmbAnno" runat="server">
                </asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td>
                <asp:Label ID="Label2" runat="server" Text="Mes"></asp:Label></td>
                            <td>
                <asp:DropDownList ID="cmbMes" runat="server">
                </asp:DropDownList></td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td style="height: 71px">
                <asp:Label ID="lblTipoReporte" runat="server" Text="Tipo de Reporte" Visible="False"></asp:Label></td>
            <td style="height: 71px">
                <asp:RadioButtonList ID="rdbTipoReporte" runat="server" Visible="False">
                    <asp:ListItem Selected="True">Detalle</asp:ListItem>
                    <asp:ListItem>Resumen</asp:ListItem>
                </asp:RadioButtonList></td>
            <td style="height: 71px">
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="3">
                <asp:Button ID="btnImprimir" runat="server" Text="Imprimir" Width="70px" />
                <asp:Button ID="btnSalir" runat="server" Text="Salir" Width="70px" /></td>
        </tr>
    </table>
    <br />
</asp:Content>

