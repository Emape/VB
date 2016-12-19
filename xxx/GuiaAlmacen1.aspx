<%@ page title="" language="VB" masterpagefile="~/MasterPage.master" autoeventwireup="false" inherits="GuiaAlmacen1, App_Web_3km2mpsz" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Tipo"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtTipo" runat="server" Width="46px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Numero Guia"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtGuia" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="height: 23px"></td>
            <td style="height: 23px"></td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <asp:Button ID="btnImprimir" runat="server" Text="Imprimir" />
            </td>
        </tr>
    </table>
</asp:Content>

