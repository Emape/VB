<%@ page language="VB" masterpagefile="~/MasterPage.master" autoeventwireup="false" inherits="DinamicaContable, App_Web_3km2mpsz" title="Dinamicas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <asp:Label ID="lblTipoCredito" runat="server" Font-Bold="True" ForeColor="DarkGreen" Text="Tipo de Credito" Font-Names="Arial" Font-Size="0.8em"></asp:Label></td>
            <td>
                <asp:DropDownList ID="cmbTipoCredito" runat="server" AutoPostBack="True" Font-Names="Arial" Font-Size="0.8em">
                </asp:DropDownList></td>
            <td align="right">
                <asp:Button ID="btnCerrar" runat="server" Text="Cerrar" Font-Names="Arial" Font-Size="0.8em" /></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblTipoGarantia" runat="server" Font-Bold="True" ForeColor="DarkGreen" Text="Tipo de Garantia" Visible="False" Font-Names="Arial" Font-Size="0.8em"></asp:Label></td>
            <td>
                <asp:DropDownList ID="cmbTipoGarantia" runat="server" Visible="False" AutoPostBack="True" Font-Names="Arial" Font-Size="0.8em">
                </asp:DropDownList></td>
            <td rowspan="4">
                <asp:Panel ID="Panel1" runat="server" HorizontalAlign="Right" Visible="False">
                    <table>
                        <tr>
                            <td style="width: 100px">
                                <asp:Button ID="btnAgregar" runat="server" Text="Agregar" Width="70px" Font-Names="Arial" Font-Size="0.8em" /></td>
                        </tr>
                        <tr>
                            <td style="width: 100px">
                                <asp:Button ID="btnQuitar" runat="server" Text="Quitar" Width="70px" Font-Names="Arial" Font-Size="0.8em" /></td>
                        </tr>
                        <tr>
                            <td style="width: 100px">
                                <asp:Button ID="btnModificar" runat="server" Text="Modificar" Width="70px" Font-Names="Arial" Font-Size="0.8em" /></td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblTratamientoContable" runat="server" Font-Bold="True" ForeColor="DarkGreen" Text="Tratamiento Contable" Font-Names="Arial" Font-Size="0.8em"></asp:Label></td>
            <td>
                <asp:DropDownList ID="cmbTratamientoContable" runat="server" AutoPostBack="True" Font-Names="Arial" Font-Size="0.8em">
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td style="height: 30px">
                <asp:Label ID="lblRangoPagoCuota" runat="server" Font-Bold="True" ForeColor="DarkGreen" Text="Rango Pago cuota" Font-Names="Arial" Font-Size="0.8em"></asp:Label></td>
            <td style="height: 30px">
                <asp:DropDownList ID="cmbRangoPagoCuota" runat="server" AutoPostBack="True" Font-Names="Arial" Font-Size="0.8em">
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblModalidad" runat="server" Font-Bold="True" ForeColor="DarkGreen" Text="Modalidad de Pago" Font-Names="Arial" Font-Size="0.8em"></asp:Label></td>
            <td>
                <asp:DropDownList ID="cmbModalidad" runat="server" AutoPostBack="True" Font-Names="Arial" Font-Size="0.8em">
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                </td>
            <td>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:GridView ID="grdvCuenta" runat="server" AutoGenerateColumns="False" BackColor="White"
                    BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="2" AllowPaging="True" GridLines="Both" PageSize="15" Font-Names="Arial" Font-Size="0.8em">
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                    <Columns>
                        <asp:BoundField DataField="IdTipoCredito" HeaderText="TipCre" >
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="IdTratamientoContable" HeaderText="Trat." >
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="IdRangoPagoCuota" HeaderText="Rango" >
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="IdModalidad" HeaderText="Mod." >
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Item" HeaderText="Item">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Cuenta" HeaderText="Cuenta" />
                        <asp:BoundField DataField="Nombre" HeaderText="Descripcion" />
                        <asp:BoundField DataField="DebeHaber" HeaderText="D/H" >
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="NomEnlace" HeaderText="Enlace" />
                        <asp:TemplateField HeaderText="Ok">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" CommandName="Elegir" ImageUrl="~/Img/Elegir1.jpg"
                                    Width="19px" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <PagerStyle ForeColor="Black" HorizontalAlign="Center" BackColor="#999999" />
                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="Gainsboro" />
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>

