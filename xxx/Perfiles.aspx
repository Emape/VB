<%@ page language="VB" masterpagefile="~/MasterPage.master" autoeventwireup="false" inherits="Perfiles, App_Web_js1z4v53" title="Perfiles de Usuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table>
        <tr>
            <td>
                <asp:TextBox ID="txtCodigo2" runat="server" onfocus="this.blur();" Width="100px" CssClass="generalFont"></asp:TextBox><asp:Button
                    ID="btnUsuario" runat="server" Font-Bold="True" Text="..." ToolTip="Buscar Usuario" /><asp:TextBox
                        ID="txtNombre2" runat="server" Font-Bold="True" MaxLength="80" onfocus="this.blur();"
                        Width="416px" CssClass="generalFont"></asp:TextBox></td>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Label" ForeColor="White"></asp:Label></td>
            <td>
                <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="generalFont" Enabled="False" /></td>
            <td>
                <asp:Button ID="btnCerrar" runat="server" Text="Cerrar" CssClass="generalFont" /></td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:GridView ID="grdvUsuarioPerfil" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="2" CssClass="generalFont">
                    <RowStyle ForeColor="#000066" />
                    <Columns>
                        <asp:BoundField DataField="IdSistema" HeaderText="Sistema" />
                        <asp:BoundField DataField="IdMenu" HeaderText="Menu" />
                        <asp:BoundField DataField="IdMenuItem" HeaderText="Item" />
                        <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                        <asp:TemplateField HeaderText="Acceso">
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" Text=" " Checked='<%# Convert.ToBoolean(Eval("tenerAcceso")) %>'/>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Todos los Centros">
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBox2" runat="server" Text=" " Checked='<%# Convert.ToBoolean(Eval("flagCentroCosto")) %>'/>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:Button ID="btnServerCode" runat="server" Text="VerPerfil" Visible="False" CssClass="generalFont" /></td>
        </tr>
    </table>
</asp:Content>

