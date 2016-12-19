<%@ page language="VB" masterpagefile="~/MasterPage.master" autoeventwireup="false" inherits="DinamicaCalcum, App_Web_js1z4v53" title="Certificados Plazo" %>
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
                <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Underline="True" Text="Proceso Renovacion de Cuentas a Plazos"></asp:Label></td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:Label ID="Label5" runat="server" ForeColor="White" Text="..."></asp:Label></td>
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
            </td>
            <td>
            </td>
            <td>
                <asp:Label ID="lblPeriodoAnterior" runat="server" Text="Label"></asp:Label></td>
            <td>
                <asp:Label ID="Label4" runat="server" ForeColor="White" Text="..."></asp:Label></td>
        </tr>
        <tr>
            <td align="center" colspan="4">
                <asp:Button ID="btnProcesar" runat="server" OnClientClick="return confirm('Desea Procesar Cuentas a Plazos?');"
                    Text="Procesar" /></td>
        </tr>
        <tr>
            <td align="center" colspan="4">
                <asp:Label ID="Label9" runat="server" ForeColor="White" Text="..."></asp:Label></td>
        </tr>
    </table>
</asp:Content>

