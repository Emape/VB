<%@ page language="VB" masterpagefile="~/MasterPage.master" autoeventwireup="false" inherits="rptCreditos, App_Web_js1z4v53" title="Reportes Creditos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="background-color: #cccc33">
        <tr>
            <td colspan="5" align="center">
                <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Underline="True" Text="Reportes del Sistema de Creditos"></asp:Label><asp:Label ID="Label5" runat="server" BackColor="#CCCC33" ForeColor="#CCCC33" Text="..."></asp:Label></td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <asp:Label ID="Label22" runat="server" BackColor="#CCCC33" ForeColor="#CCCC33" Text="..."></asp:Label></td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" ForeColor="DarkRed" Text="Elegir Tipo de Reporte"></asp:Label></td>
            <td colspan="4">
                <asp:RadioButtonList ID="rdbTipoRep" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" BorderWidth="1px">
                    <asp:ListItem Value="Rango" Selected="True">Por Rango</asp:ListItem>
                    <asp:ListItem Value="Periodo">Por Periodo</asp:ListItem>
                    <asp:ListItem Value="Sintetico">Por Sintetico</asp:ListItem>
                </asp:RadioButtonList></td>
        </tr>
        <tr>
            <td valign="top">
                <asp:Panel ID="panelRango" runat="server" GroupingText="Rango">
                    <table>
                        <tr>
                            <td colspan="2">
                    <asp:RadioButtonList ID="rdbRango" runat="server" AutoPostBack="True" BorderColor="Olive" BorderStyle="Solid" BorderWidth="2px" RepeatColumns="1" Font-Names="Arial" Font-Size="0.8em">
                        <asp:ListItem Value="SolCredito">Solicitud de Credito</asp:ListItem>
                        <asp:ListItem Value="Prestamo">Prestamo</asp:ListItem>
                        <asp:ListItem Value="EstadoCuenta">Estado de Cuenta</asp:ListItem>
                    </asp:RadioButtonList></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblCodigoIni" runat="server" ForeColor="DarkRed" Text="Codigo Inicio" Font-Names="Arial" Font-Size="0.8em"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="txtCodigoIni" runat="server" Width="80px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblCodigoFin" runat="server" ForeColor="DarkRed" Text="Codigo Fin" Font-Names="Arial" Font-Size="0.8em"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="txtCodigoFin" runat="server" Width="80px"></asp:TextBox></td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td>
            </td>
            <td>
                <asp:Panel ID="panelPeriodo" runat="server" GroupingText="Periodo" Enabled="False">
                    <table>
                        <tr>
                            <td colspan="2">
                    <asp:RadioButtonList ID="rdbPeriodo" AutoPostBack="true" runat="server" BorderColor="Olive" BorderStyle="Solid" BorderWidth="2px" RepeatColumns="1" Font-Names="Arial" Font-Size="0.8em">
                        <asp:ListItem>Desembolso</asp:ListItem>
                        <asp:ListItem Value="PagoCuota">Pago de Cuotas</asp:ListItem>
                        <asp:ListItem Value="CrediCargo">CrediCargo</asp:ListItem>
                        <asp:ListItem Value="CrediCargoRechazo">CrediCargo Rechazos</asp:ListItem>
                        <asp:ListItem Value="CrediCargoTXT">CrediCargo TXT</asp:ListItem>
                        <asp:ListItem Value="OperacionSocio">Operacion Socios</asp:ListItem>
                        <asp:ListItem Value="CarteraCredito">Cartera de Credito</asp:ListItem>
                    </asp:RadioButtonList></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                    <table>
                                        <tr>
                                            <td>
                <asp:Label ID="Label7" runat="server" Font-Names="Arial" Font-Size="0.8em" ForeColor="DarkRed"
                    Text="Año" Width="50px"></asp:Label></td>
                                            <td>
                <asp:DropDownList ID="cmbAnno" runat="server" AutoPostBack="True" Width="100px">
                </asp:DropDownList></td>
                                        </tr>
                                        <tr>
                                            <td>
                <asp:Label ID="Label8" runat="server" Font-Names="Arial" Font-Size="0.8em" ForeColor="DarkRed"
                    Text="Mes" Width="50px"></asp:Label></td>
                                            <td>
                <asp:DropDownList ID="cmbMes" runat="server" AutoPostBack="True" Width="100px">
                </asp:DropDownList></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="Label11" runat="server" Font-Names="Arial" Font-Size="0.8em" ForeColor="DarkRed"
                                                    Text="Moneda" Width="50px"></asp:Label></td>
                                            <td>
                <asp:DropDownList ID="cmbMoneda" runat="server" AutoPostBack="True" Width="100px">
                    <asp:ListItem Value="N">Nacional</asp:ListItem>
                    <asp:ListItem Value="E">Extranjera</asp:ListItem>
                </asp:DropDownList></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <asp:CheckBox ID="chkPasarMN" runat="server" Font-Names="Arial" Font-Size="0.8em"
                    Text="Expresado en MN" Visible="False" ForeColor="DarkRed" /></td>
                                        </tr>
                                    </table>
                                </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                &nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td>
                <asp:Label ID="Label4" runat="server" BackColor="#CCCC33" ForeColor="#CCCC33" Text="..."></asp:Label></td>
            <td valign="top">
                <asp:Panel ID="panelSintetico" runat="server" GroupingText="Sintetico" Enabled="False">
                    &nbsp;<table>
                        <tr>
                            <td colspan="2">
                                <asp:RadioButtonList ID="rdbSintetico" runat="server" BorderColor="Olive" BorderStyle="Solid" BorderWidth="2px" RepeatColumns="1" Font-Names="Arial" Font-Size="0.8em">
                    <asp:ListItem Value="DesembolsoSintetico">Desembolso</asp:ListItem>
                    <asp:ListItem Value="PagoCuotaSinteticoGen">Pago de Cuotas</asp:ListItem>
                    <asp:ListItem Value="CrediCargoSintetico">CrediCargo</asp:ListItem>
                                    <asp:ListItem Value="Refinanciacion">Refinanciacion</asp:ListItem>
                    <asp:ListItem Value="OperacionSocio">Operacion Socios</asp:ListItem>
                </asp:RadioButtonList></td>
                        </tr>
                        <tr>
                            <td style="width: 100px">
                                                <asp:Label ID="Label3" runat="server" Font-Names="Arial" Font-Size="0.8em" ForeColor="DarkRed"
                                                    Text="Nro.Sintetico" Width="50px"></asp:Label></td>
                            <td style="width: 100px">
                                                <asp:TextBox ID="txtSintetico" runat="server" Width="80px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:CheckBox ID="chkMonedaOrigen" runat="server" Font-Names="Arial" Font-Size="0.8em"
                                    Text="En Moneda de Origen" Visible="False" /></td>
                        </tr>
                        <tr>
                            <td style="width: 100px">
                                <asp:Label ID="Label9" runat="server" Font-Names="Arial" Font-Size="0.8em" ForeColor="DarkRed"
                                    Text="Moneda" Width="50px"></asp:Label></td>
                            <td style="width: 100px">
                                <asp:DropDownList ID="cmbMoneSintetico" runat="server" AutoPostBack="True" Width="100px">
                                    <asp:ListItem Value="0">General</asp:ListItem>
                                    <asp:ListItem Value="N">Nacional</asp:ListItem>
                                    <asp:ListItem Value="E">Extranjera</asp:ListItem>
                                </asp:DropDownList></td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                </td>
            <td>
                <asp:Label ID="Label1" runat="server" BackColor="#CCCC33" ForeColor="#CCCC33" Text="..."></asp:Label></td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="5">
                <asp:Button ID="btnImprimir" runat="server" Text="Imprimir" Width="70px" />
            <asp:Button
                    ID="btnCerrar" runat="server" Text="Cerrar" Width="70px" /></td>
        </tr>
    </table>
    <br />
</asp:Content>

