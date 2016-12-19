<%@ page language="VB" masterpagefile="~/MasterPage.master" autoeventwireup="false" inherits="rptComparativo, App_Web_3km2mpsz" title="Comparativo Contrato-Pagos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager id="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="Tipo de Reporte"></asp:Label></td>
            <td>
                <asp:RadioButtonList ID="rdbOpcion" runat="server" BorderStyle="Solid" BorderWidth="1px">
                    <asp:ListItem Value="Locacion">Locaci&#243;n</asp:ListItem>
                    <asp:ListItem Value="Asociante">Asociante</asp:ListItem>
                    <asp:ListItem Value="xlsLocacion">Excel Locaci&#243;n</asp:ListItem>
                    <asp:ListItem Value="xlsReq">Requerimiento vs Pago</asp:ListItem>
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
                <asp:Label ID="Label3" runat="server" Text="Detalle o Resumen"></asp:Label></td>
            <td>
                <asp:RadioButtonList ID="rdbTipoReporte" runat="server" BorderStyle="Solid" BorderWidth="1px" AutoPostBack="True">
                    <asp:ListItem Selected="True">Detalle</asp:ListItem>
                    <asp:ListItem>Resumen</asp:ListItem>
                </asp:RadioButtonList></td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Panel ID="panelRango" runat="server" BackColor="Transparent" BorderStyle="Solid" BorderWidth="1px">
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="Label5" runat="server" Text="Fecha Inicial"></asp:Label></td>
                            <td>
                                <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" PopupButtonID="ImgFechaIni" TargetControlID="txtFechaIni" Format="dd/MM/yyyy">
                                </ajaxToolkit:CalendarExtender>
                                <asp:TextBox ID="txtFechaIni" runat="server" Width="110px"></asp:TextBox><img id="ImgFechaIni"
                                    src="Img/calendario.gif" /></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label6" runat="server" Text="Fecha Final"></asp:Label></td>
                            <td>
                                <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" PopupButtonID="ImgFechaFin" TargetControlID="txtFechaFin" Format="dd/MM/yyyy">
                                </ajaxToolkit:CalendarExtender>
                                <asp:TextBox ID="txtFechaFin" runat="server" Width="110px"></asp:TextBox><img id="ImgFechaFin"
                                    src="Img/calendario.gif" /></td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label14" runat="server" BackColor="White" ForeColor="White" Text="Sep"></asp:Label></td>
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
</asp:Content>

