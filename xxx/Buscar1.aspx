<%@ page language="VB" autoeventwireup="false" inherits="Buscar1, App_Web_eugwuhjx" title="Búsquedas" %>
<%@OutputCache Location="None"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Buscar 1</title>
</head>
<base target="_self"/>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
        <table>
            <tr>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtBuscar" runat="server" Width="140px"></asp:TextBox><asp:ImageButton
                        ID="btnBuscar" runat="server" ImageUrl="~/Img/BotonBuscar.gif" /><asp:GridView ID="grdvBuscar"
                            runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4"
                            Font-Names="Arial" Font-Size="9pt" ForeColor="#333333" GridLines="Both" PageSize="18" ShowFooter="True">
                            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                            <Columns>
                                <asp:BoundField DataField="Codigo" HeaderText="RUC">
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Nombre" HeaderText="Nombre">
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="Ok">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="ImageButton1" runat="server" CommandName="Elegir" ImageUrl="~/Img/Elegir1.jpg"
                                            Width="19px" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:GridView>
                    <asp:TextBox ID="txtCodigo" runat="server" Width="56px" Height="5px"></asp:TextBox>
                    <asp:TextBox ID="txtNombre" runat="server" Width="56px" Height="5px"></asp:TextBox></td>
            </tr>
        </table>
    </form>
</body>
</html>
