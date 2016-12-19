<%@ page title="" language="VB" masterpagefile="~/MasterPage.master" autoeventwireup="false" inherits="OsTerceros, App_Web_js1z4v53" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="panelCab" runat="server" CssClass="generalFont">
    <table>
        <tr>
            <td>
                <asp:ImageButton ID="btnNuevo" runat="server" ImageUrl="~/Img/BotonNuevoItem.gif"
                    ToolTip="Nuevo Documento" Width="19px" />
            </td>
            <td style="width: 1px"></td>
            <td>
                <asp:ImageButton ID="btnImprimir" runat="server" ImageUrl="~/Img/ImprimeLista.jpg" 
                    ToolTip="Imprimir" Width="19px" />
            </td>
            <td style="width: 1px"></td>
            <td>
                <asp:ImageButton ID="btnCerrar" runat="server" Height="17px" ImageUrl="~/Img/Salir.jpg"
                    OnClientClick="return confirm('Desea realmente Cerrar el formulario?');" ToolTip="Cerrar" />
            </td>
        </tr>
    </table>
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" ForeColor="#990000" Text="Requerimiento"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtIdReqConsulta" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="btnConsultar" runat="server" Text="Consultar" />
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:GridView ID="grdvOsTerceros" runat="server" AutoGenerateColumns="False" CellPadding="3" EnableModelValidation="True" ForeColor="#333333">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="DescripCC" HeaderText="Centro Costo" />
                            <asp:BoundField DataField="IdProveedor" HeaderText="Proveedor" />
                            <asp:BoundField DataField="RazonSocial" HeaderText="Nombre" />
                            <asp:BoundField DataField="Descripcion" HeaderText="Objeto" />
                            <asp:BoundField DataField="ValorVenta" HeaderText="Importe" />
                            <asp:TemplateField HeaderText="Imprimir">
                                <ItemTemplate>
                                    <asp:CheckBox ID="CheckBox1" runat="server" />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>



    </asp:Panel>
    <asp:Panel ID="panelDetalle" runat="server">
        <table>
            <tr>
                <td style="width: 287px">
                    <asp:Label ID="Label1" runat="server" CssClass="generalFont" Text="Requerimiento"></asp:Label>
                    <br />
                    <asp:TextBox ID="txtIdRequerimiento" runat="server" CssClass="generalFont"></asp:TextBox>
                </td>
                <td>
                    <asp:Label ID="Label2" runat="server" CssClass="generalFont" Text="Nro. de Meses"></asp:Label>
                    <br />
                    <asp:TextBox ID="txtNroMeses" runat="server" CssClass="generalFont" Width="50px">1</asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" CssClass="generalFont" />
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:GridView ID="grdvReqOsTercero" runat="server" AutoGenerateColumns="False" CellPadding="3" CssClass="generalFont" EnableModelValidation="True" ForeColor="#333333">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="IdNumeroItem" HeaderText="Item" />
                            <asp:BoundField DataField="IdCentroCosto" HeaderText="C.Costo" />
                            <asp:BoundField DataField="NombreCC" HeaderText="Nombre CC" />
                            <asp:BoundField DataField="IdProveedor" HeaderText="Ruc" />
                            <asp:BoundField DataField="RazonSocial" HeaderText="Nombre" />
                            <asp:BoundField DataField="IdBienServicio" HeaderText="Codigo" />
                            <asp:BoundField DataField="Servicio" HeaderText="Servicio" />
                            <asp:BoundField DataField="Importe" HeaderText="Importe" />
                        </Columns>
                        <EditRowStyle BackColor="#7C6F57" />
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td align="right" colspan="3" style="height: 29px">
                    <asp:Label ID="lblTotal" runat="server" CssClass="generalFont" Text="Total" Font-Bold="True" ForeColor="Maroon"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="3" style="height: 29px">
                    <asp:Button ID="btnProceder" runat="server" Text="Proceder" CssClass="generalFont" Visible="False" />
                </td>
            </tr>
            <tr>
                <td style="width: 287px">
                    <asp:HiddenField ID="hdTotal" runat="server" />
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>

