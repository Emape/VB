<%@ page language="VB" autoeventwireup="false" inherits="Autenticar1, App_Web_eugwuhjx" title="Accesos" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Página sin título</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table cellspacing="5">
            <tr>
                <td colspan="3">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Img/logo2.jpg"
                        Width="500px" /></td>
            </tr>
            <tr>
                <td>
                </td>
                <td colspan="2">
                    <span style="font-size: 15pt; color: #0099ff; font-family: Georgia">Bienvenidos a Logistica
                        Web</span></td>
            </tr>
            <tr>
                <td rowspan="2" align="right">
                    <asp:Image ID="Image2" runat="server" ImageUrl="~/Img/llave.jpg" Width="70px" /></td>
                <td align="right" colspan="">
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Usuario" Width="88px"></asp:Label></td>
                <td colspan="">
                    <asp:TextBox ID="txtIdUsuario" runat="server" MaxLength="10" Rows="1" TabIndex="1"
                        Width="100px"></asp:TextBox></td>
            </tr>
            <tr>
                <td align="right" colspan="">
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="Password" Width="88px"></asp:Label></td>
                <td colspan="">
                    <asp:TextBox ID="txtPassword" runat="server" MaxLength="8" Rows="1" TabIndex="2"
                        TextMode="Password" Width="100px"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                </td>
                <td align="right">
                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="Empresa" Width="88px"></asp:Label></td>
                <td>
                    <asp:DropDownList ID="cmbEmpresa" runat="server">
                        <asp:ListItem Value="02">Municipal</asp:ListItem>
                        <asp:ListItem Value="01">Empresarial</asp:ListItem>
                        <asp:ListItem Value="08">Region</asp:ListItem>
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td>
                </td>
                <td align="right">
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="3" style="background-image: url(Img/back_celda_up1.gif); height: 65px;" valign="middle">
                    <asp:ImageButton ID="btnAceptar" runat="server" Height="24px" ImageUrl="Img/ButtonLogin.gif"
                        Width="64px" /></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
