<%@ page language="VB" masterpagefile="~/MasterPage.master" autoeventwireup="false" inherits="PedidoAlmacen, App_Web_js1z4v53" title="Pedidos Almacén" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager id="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table>
        <tr>
            <td>
    <asp:Panel ID="Panel1" runat="server" BackColor="#C0FFC0" CssClass="generalFont">
        <table>
            <tr>
                <td>
                    <asp:TextBox ID="txtBuscarPedido" runat="server" Width="200px"></asp:TextBox><asp:ImageButton
                        ID="btnBuscarPedido" runat="server" ImageUrl="~/Img/BotonBuscar.gif" /></td>
                <td>
                    <asp:DropDownList ID="cmbCentroCosto" runat="server" AutoPostBack="True" Visible="False">
                    </asp:DropDownList></td>
                <td>
                    <asp:Label ID="Label26" runat="server" BackColor="#C0FFC0" ForeColor="#C0FFC0" Text="Sep"></asp:Label></td>
                <td align="right">
                    <asp:ImageButton ID="btnNuevo" runat="server" ImageUrl="~/Img/btnNuevo.jpg" ToolTip="Nuevo Contrato" /></td>
                <td align="right">
                    </td>
                <td align="right">
                    <asp:ImageButton ID="btnAnular" runat="server" Height="18px" ImageUrl="~/Img/button_cancel.gif"
                        OnClientClick="return confirm('Desea realmente Anular el Contrato?');" ToolTip="Anular Contrato" /></td>
                <td align="right">
                    <asp:ImageButton ID="btnSalir" runat="server" ImageUrl="~/Img/BotonCerrarItem.jpg"
                        ToolTip="Cerrar Formulario" Width="21px" /></td>
            </tr>
            <tr>
                <td colspan="7">
                    <asp:GridView ID="grdvPedido" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                        BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px"
                        CellPadding="4" ForeColor="Black" PageSize="12">
                        <RowStyle BackColor="#F7F7DE" />
                        <Columns>
                            <asp:BoundField DataField="IdRequerimiento" HeaderText="Pedido" />
                            <asp:BoundField DataField="FechaRequerimiento" DataFormatString="{0:dd/MM/yyyy}"
                                HeaderText="Fecha" HtmlEncode="False" />
                            <asp:BoundField DataField="Descripcion" HeaderText="Concepto" />
                            <asp:TemplateField HeaderText="Ok">
                                <ItemTemplate>
                                    <asp:ImageButton ID="ImageButton1" runat="server" CommandName="ItmElegir" ImageUrl="~/Img/Elegir1.jpg"
                                        Width="19px" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" />
                        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td colspan="7">
                    <asp:GridView ID="grdvPedidoDetalle" runat="server" AutoGenerateColumns="False" BackColor="White"
                        BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
                        <RowStyle ForeColor="#000066" />
                        <Columns>
                            <asp:BoundField DataField="IdNumeroItem" HeaderText="Item" />
                            <asp:BoundField DataField="IdBienServicio" HeaderText="Articulo" />
                            <asp:BoundField DataField="DescripUM" HeaderText="U.M." />
                            <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" />
                            <asp:BoundField DataField="CantidadItem" DataFormatString="{0:N2}" HeaderText="Cantidad"
                                HtmlEncode="False" />
                        </Columns>
                        <FooterStyle BackColor="White" ForeColor="#000066" />
                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                </td>
            </tr>
        </table>
    </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="Panel2" runat="server" BackColor="DeepSkyBlue" CssClass="generalFont"
                    Visible="False">
                    <table>
                        <tr>
                            <td>
                                            <asp:Label ID="Label3" runat="server" Font-Bold="True" ForeColor="White" Text="Requerimiento"></asp:Label></td>
                            <td>
                                            <asp:TextBox ID="txtIdRequerimiento" runat="server" Enabled="False"></asp:TextBox></td>
                            <td>
                                            </td>
                            <td>
                                &nbsp;</td>
                            <td>
                                <asp:UpdatePanel id="UpdatePanel3" runat="server">
                                    <contenttemplate>
<ajaxToolkit:CalendarExtender id="CalendarExtender3" runat="server" CssClass="Calendar" Format="dd/MM/yyyy" PopupButtonID="ImgFecha" TargetControlID="txtFecha"></ajaxToolkit:CalendarExtender><asp:TextBox id="txtFecha" runat="server" Width="100px" AutoPostBack="True"></asp:TextBox><IMG id="ImgFecha" src="Img/calendario.gif" /> 
</contenttemplate>
                                </asp:UpdatePanel>
                            </td>
                            <td>
                                </td>
                            <td>
                                <asp:Button ID="btnGuardar" runat="server" Text="Guardar" Width="80px" /></td>
                            <td>
                                <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" Width="80px" /></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label2" runat="server" Font-Bold="True" ForeColor="White" Text="Concepto"></asp:Label></td>
                            <td colspan="7">
                                <asp:TextBox ID="txtDescripcion" runat="server" MaxLength="150" onblur="conMayuscula(this)"
                                    TextMode="MultiLine" Width="800px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                            <asp:Label ID="Label15" runat="server" BackColor="DeepSkyBlue" ForeColor="DeepSkyBlue"
                                                Text="Sep"></asp:Label></td>
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
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label22" runat="server" Font-Bold="True" ForeColor="White" Text="Código"></asp:Label><br />
                                            <asp:TextBox ID="txtCodigo2" runat="server" CssClass="generalFont" onfocus="this.blur();" Width="120px"></asp:TextBox><asp:Button ID="btnProveedor" runat="server" Font-Bold="True"
                                        Text="..." ToolTip="Buscar Proveedor" /></td>
                            <td>
                                <asp:Label ID="Label23" runat="server" Font-Bold="True" ForeColor="White" Text="Descripción"></asp:Label><br />
                                <asp:TextBox ID="txtNombre2" runat="server" CssClass="generalFont" onfocus="this.blur();" Width="220px"></asp:TextBox></td>
                            <td>
                                <asp:Label ID="Label24" runat="server" Font-Bold="True" ForeColor="White" Text="U.M."></asp:Label><br />
                                <asp:TextBox ID="txtUnidadMedida" runat="server" CssClass="generalFont" Enabled="False" Width="56px"></asp:TextBox></td>
                            <td>
                                <asp:Label ID="Label25" runat="server" Font-Bold="True" ForeColor="White" Text="Stock"></asp:Label><br />
                                <asp:TextBox ID="txtStock" runat="server" CssClass="generalFont" Enabled="False" Width="90px">0</asp:TextBox></td>
                            <td>
                                <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="White" Text="Costo"></asp:Label><br />
                                <asp:TextBox ID="txtCostoUnitario" runat="server" CssClass="generalFont" Width="90px">0</asp:TextBox></td>
                            <td>
                                <asp:Label ID="Label35" runat="server" Font-Bold="True" ForeColor="White" Text="Cantidad"></asp:Label><br />
                                <asp:TextBox ID="txtCantidad" runat="server" onkeypress="return numDecimal(event)" CssClass="generalFont" Width="90px">0</asp:TextBox></td>
                            <td align="right">
                                            <asp:ImageButton ID="btnAgregar" runat="server" ImageUrl="~/Img/BotonOk.gif" OnClientClick="return validaAlmaDigitar()" ToolTip="Aceptar" Width="22px" /></td>
                            <td align="right">
                                            <asp:ImageButton ID="btnReestableceDigitar" runat="server" ImageUrl="~/Img/BotonReestablecer.gif" ToolTip="Restablecer" Width="20px" /></td>
                        </tr>
                        <tr>
                            <td colspan="8">
                                <asp:GridView ID="grdvDetalle" runat="server" AutoGenerateColumns="False"
                                    CellPadding="4" ForeColor="#333333">
                                    <RowStyle BackColor="#E3EAEB" />
                                    <Columns>
                                        <asp:BoundField DataField="IdBienServicio" HeaderText="C&#243;digo" />
                                        <asp:BoundField DataField="DescripArti" HeaderText="Descripci&#243;n" />
                                        <asp:BoundField DataField="DescripUM" HeaderText="U.M." />
                                        <asp:BoundField DataField="CantidadItem" DataFormatString="{0:N2}" HeaderText="Cantidad" />
                                        <asp:BoundField DataField="CostoItem" DataFormatString="{0:N4}" HeaderText="Costo Uni.">
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="SubTotalItem" DataFormatString="{0:N2}" HeaderText="SubTotal" />
                                        <asp:TemplateField HeaderText="Ok">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ImageButton2" runat="server" CommandName="Elegir" ImageUrl="~/Img/Elegir3.jpg"
                                                    Width="19px" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Wrap="False" />
                                    <EditRowStyle BackColor="#7C6F57" />
                                    <AlternatingRowStyle BackColor="White" />
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="8">
                    <asp:Button ID="btnServerCode" runat="server" Text="VerStock" Visible="False" /></td>
                        </tr>
                    </table>
                    </asp:Panel>
            </td>
        </tr>
    </table>
</asp:Content>

