<%@ page language="VB" autoeventwireup="false" inherits="Buscar, App_Web_eugwuhjx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Página sin título</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox ID="txtBuscar" runat="server" Width="140px"></asp:TextBox><asp:ImageButton
            ID="btnBuscar" runat="server" ImageUrl="~/Img/BotonBuscar.gif" /><asp:GridView ID="grdvBuscar"
                runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4"
                Font-Names="Arial" Font-Size="9pt" ForeColor="#333333" GridLines="None" PageSize="12"
                Width="380px">
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
        &nbsp;</div>
    </form>
</body>
</html>
