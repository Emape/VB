<%@ page language="VB" masterpagefile="~/MasterPage.master" autoeventwireup="false" inherits="ServiciosLocacion, App_Web_js1z4v53" title="Servicios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table>
        <tr>
            <td>
                <table>
                    <tr>
                        <td>
                                <asp:Label ID="Label11" runat="server" Text="Tipo de Servicio"></asp:Label></td>
                        <td>
                                <asp:DropDownList ID="cmbTipoServicio" runat="server" AutoPostBack="True">
                                </asp:DropDownList></td>
                        <td>
                            <asp:Label ID="Label9" runat="server" BackColor="White" ForeColor="White" Text="Sep"></asp:Label></td>
                        <td>
                                <asp:Button ID="btnNuevo" runat="server" Text="Nuevo" /></td>
                        <td>
                                <asp:Button ID="btnCerrar" runat="server" Text="Cerrar" /></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td>
                <asp:Panel ID="Panel1" runat="server" CssClass="generalFont">
                    <table>
                        <tr>
                            <td colspan="6">
                                <asp:GridView ID="grdvServicio" runat="server" AutoGenerateColumns="False" CellPadding="1"
                                    ForeColor="#333333" AllowPaging="True" PageSize="16">
                                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                                    <Columns>
                                        <asp:BoundField DataField="IdServicioLocacion" HeaderText="C&#243;digo" />
                                        <asp:BoundField DataField="Descripcion" HeaderText="Descripci&#243;n" />
                                        <asp:TemplateField HeaderText="Modificar">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Img/BotonEditarItem.gif"
                                                    Width="19px" CommandName="Modificar" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Anular">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/Img/BotonQuitarItem.gif"
                                                    Width="14px" CommandName="Anular" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                    </Columns>
                                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                    <AlternatingRowStyle BackColor="White" />
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                </td>
                            <td>
                                </td>
                            <td>
                                </td>
                            <td>
                            </td>
                            <td>
                                </td>
                            <td>
                                </td>
                        </tr>
                    </table>
                </asp:Panel>
                        </td>
                        <td>
                            &nbsp;<asp:Panel ID="Panel2" runat="server" Visible="False" CssClass="generalFont">
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="Label1" runat="server" Text="Tipo de Servicio"></asp:Label></td>
                            <td>
                                <asp:Label ID="Label4" runat="server" BackColor="White" ForeColor="White" Text="Sep"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="txtTipoServicio" runat="server" Enabled="False" Font-Bold="True"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label2" runat="server" Text="Código"></asp:Label></td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtCodigo" runat="server" Enabled="False" Font-Bold="True" Width="50px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label3" runat="server" Text="Descripción"></asp:Label></td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtDescripcion" runat="server" onblur="conMayuscula(this)" Width="300px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td align="center" colspan="3"><asp:Button ID="btnAceptar" runat="server" Text="Aceptar" />
                                <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" /></td>
                        </tr>
                    </table>
                </asp:Panel>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <br />
</asp:Content>

