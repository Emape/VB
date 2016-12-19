<%@ page language="VB" masterpagefile="~/MasterPage.master" autoeventwireup="false" inherits="rptContabilidad1, App_Web_js1z4v53" title="Reportes Contabilidad" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="background-color: #cccc33">
        <tr>
            <td colspan="2" align="center">
                <asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Underline="True" Text="Reportes del Sistema Contable"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label12" runat="server" ForeColor="DarkRed" Text="Reporte"></asp:Label></td>
            <td>
                <asp:RadioButtonList ID="rdbBalances" runat="server" AutoPostBack="True" RepeatColumns="2">
                    <asp:ListItem Value="AsientoManual">Asientos Ingresados</asp:ListItem>
                    <asp:ListItem>Diario</asp:ListItem>
                    <asp:ListItem Value="CajaBanco">Caja y Bancos</asp:ListItem>
                    <asp:ListItem>Bancos</asp:ListItem>
                    <asp:ListItem Value="Conciliacion">Conciliaci&#243;n Bancaria</asp:ListItem>
                    <asp:ListItem Value="AnalisisCuenta">Analisis de Cuentas</asp:ListItem>
                    <asp:ListItem>Mayor</asp:ListItem>
                    <asp:ListItem Value="BalComprobacion">Balance de Comprobaci&#243;n</asp:ListItem>
                    <asp:ListItem Value="InventarioBalance">Inventarios y Balances</asp:ListItem>
                    <asp:ListItem Value="BalGeneralA">Balance General (Forma A)</asp:ListItem>
                    <asp:ListItem Value="BalGeneralB">Balance General (Forma B)</asp:ListItem>
                    <asp:ListItem Value="Formato131">Inventario permanente valorizado</asp:ListItem>
                    <asp:ListItem Value="InveSiaf">Inventario SIAF</asp:ListItem>
                </asp:RadioButtonList></td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Panel ID="Panel1" runat="server">
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="lblFecha" runat="server" Font-Names="Arial" Font-Size="0.8em" ForeColor="DarkRed"
                                    Text="Fecha" Visible="False"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="txtFecha" runat="server" Width="90px" MaxLength="12" Visible="False"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label13" runat="server" Font-Names="Arial" Font-Size="0.8em" ForeColor="DarkRed"
                                    Text="Año"></asp:Label></td>
                            <td>
                <asp:DropDownList ID="cmbAnno" runat="server">
                </asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label14" runat="server" Font-Names="Arial" Font-Size="0.8em" ForeColor="DarkRed"
                                    Text="Mes"></asp:Label></td>
                            <td>
                <asp:DropDownList ID="cmbMes" runat="server">
                </asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label15" runat="server" Font-Names="Arial" Font-Size="0.8em" ForeColor="DarkRed"
                                    Text="Moneda"></asp:Label></td>
                            <td>
                <asp:DropDownList ID="cmbMoneda" runat="server" Enabled="False">
                    <asp:ListItem Value="N">Nacional</asp:ListItem>
                    <asp:ListItem Value="E">Extranjera</asp:ListItem>
                </asp:DropDownList></td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <asp:Label ID="Label6" runat="server" ForeColor="#CCCC33" Text="..."></asp:Label></td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <asp:Button ID="btnImprimir" runat="server" 
                    Text="Imprimir" />
                <asp:Button ID="btnCerrar" runat="server" 
                    Text="Cerrar" /></td>
        </tr>
    </table>
</asp:Content>

