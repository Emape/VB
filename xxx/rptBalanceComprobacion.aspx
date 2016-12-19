<%@ page language="VB" masterpagefile="~/MasterPage.master" autoeventwireup="false" inherits="rptBalanceComprobacion, App_Web_js1z4v53" title="Balance Comprobación" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="background-color: #ccffff">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" ForeColor="White" Text="..."></asp:Label></td>
            <td>
            </td>
            <td>
                <asp:Label ID="Label2" runat="server" ForeColor="White" Text="..."></asp:Label></td>
            <td>
                <asp:Label ID="Label3" runat="server" ForeColor="White" Text="..."></asp:Label></td>
        </tr>
        <tr>
            <td align="center" colspan="4">
                <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Underline="True" Text="Reportes de Balances"></asp:Label></td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:Label ID="Label5" runat="server" ForeColor="White" Text="..."></asp:Label></td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:RadioButtonList ID="rdbBalances" runat="server">
                    <asp:ListItem Value="BalComprobacion">Balance de Comprobaci&#243;n</asp:ListItem>
                    <asp:ListItem Value="EstadoResultado">Estado de Resultados</asp:ListItem>
                    <asp:ListItem Value="InventarioBalance">Inventarios y Balances</asp:ListItem>
                </asp:RadioButtonList></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label7" runat="server" Font-Names="Arial" Font-Size="0.8em" ForeColor="DarkRed"
                    Text="Año"></asp:Label></td>
            <td>
            </td>
            <td>
                <asp:DropDownList ID="cmbAnno" runat="server" AutoPostBack="True">
                </asp:DropDownList></td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label8" runat="server" Font-Names="Arial" Font-Size="0.8em" ForeColor="DarkRed"
                    Text="Mes"></asp:Label></td>
            <td>
            </td>
            <td>
                <asp:DropDownList ID="cmbMes" runat="server" AutoPostBack="True">
                </asp:DropDownList></td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label11" runat="server" Font-Names="Arial" Font-Size="0.8em" ForeColor="DarkRed"
                    Text="Moneda"></asp:Label></td>
            <td>
            </td>
            <td>
                <asp:DropDownList ID="cmbMoneda" runat="server" AutoPostBack="True">
                    <asp:ListItem Value="N">Nacional</asp:ListItem>
                    <asp:ListItem Value="E">Extranjera</asp:ListItem>
                </asp:DropDownList></td>
            <td>
                </td>
        </tr>
        <tr>
            <td align="center" colspan="4">
                <asp:Label ID="Label4" runat="server" ForeColor="White" Text="..."></asp:Label></td>
        </tr>
        <tr>
            <td align="center" colspan="4">
                <asp:Button ID="btnImprimir" runat="server" 
                    Text="Imprimir" /></td>
        </tr>
        <tr>
            <td align="center" colspan="4">
                <asp:Label ID="Label9" runat="server" ForeColor="White" Text="..."></asp:Label></td>
        </tr>
    </table>
</asp:Content>

