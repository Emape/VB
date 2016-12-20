<%@ page language="VB" masterpagefile="~/MasterPage.master" autoeventwireup="false" inherits="Almacen, App_Web_js1z4v53" title="Almacén" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager id="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table>
        <tr>
            <td>
                <asp:Panel ID="Panel1" runat="server" CssClass="generalFont">
                    <table>
                        <tr>
                            <td>
                                            <asp:TextBox ID="txtBuscarNota" runat="server" Width="200px"></asp:TextBox><asp:ImageButton
                                                ID="btnBuscarNota" runat="server" ImageUrl="~/Img/BotonBuscar.gif" /></td>
                            <td align="right">
                            </td>
                            <td align="right">
                                            <asp:ImageButton ID="btnNuevo" runat="server" ImageUrl="~/Img/btnNuevo.jpg" ToolTip="Nueva Nota Almacén" /></td>
                            <td align="right">
                                            <asp:ImageButton ID="btnAnular" runat="server" ImageUrl="~/Img/button_cancel.gif"
                                                OnClientClick="return confirm('Desea realmente Anular el Contrato?');" ToolTip="Anular Nota Almacén" style="height: 16px" /></td>
                            <td align="right">
                                            <asp:ImageButton ID="btnCerrar" runat="server" ImageUrl="~/Img/BotonCerrarItem.jpg"
                                                ToolTip="Cerrar Formulario" Width="21px" /></td>
                        </tr>
                        <tr>
                            <td colspan="5">
                                <asp:GridView ID="grdvIngresoSalida" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                    CellPadding="2" ForeColor="#333333" BorderStyle="Solid" BorderWidth="1px" Font-Size="Smaller">
                                    <RowStyle BackColor="#EFF3FB" />
                                    <Columns>
                                        <asp:BoundField DataField="IdGuia" HeaderText="Nota" />
                                        <asp:BoundField DataField="FechaGuia" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Fecha"
                                            HtmlEncode="False" />
                                        <asp:BoundField DataField="IdOrdenCompra" HeaderText="O.Compra" />
                                        <asp:BoundField DataField="GuiaProveedor" HeaderText="Guia Remisi&#243;n" />
                                        <asp:BoundField DataField="FechaGuiaProveedor" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Fecha GR"
                                            HtmlEncode="False" />
                                        <asp:BoundField DataField="DescripTransaccion" HeaderText="Transacci&#243;n" />
                                        <asp:BoundField DataField="Observacion" HeaderText="Concepto" />
                                        <asp:TemplateField HeaderText="Imprimir">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/Img/ImprimeLista.jpg"
                                                    Width="21px" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Ok">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ImageButton1" runat="server" CommandName="Elegir" ImageUrl="~/Img/Elegir1.jpg"
                                                    Width="19px" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <AlternatingRowStyle BackColor="White" />
                                    <EditRowStyle BackColor="#2461BF" />
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="5">
                                <asp:GridView ID="grdvIngresoSalidaDetalle" runat="server" AutoGenerateColumns="False"
                        BackColor="White" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px"
                        CellPadding="2">
                                    <RowStyle ForeColor="#000066" />
                                    <Columns>
                                        <asp:BoundField DataField="NumeroItem" HeaderText="Item" />
                                        <asp:BoundField DataField="IdBienServicio" HeaderText="C&#243;digo" />
                                        <asp:BoundField DataField="DescripBien" HeaderText="Descripci&#243;n" />
                                        <asp:BoundField DataField="DescripUM" HeaderText="UM" />
                                        <asp:BoundField DataField="Cantidad" DataFormatString="{0:N2}" HeaderText="Cantidad" HtmlEncode="False" />
                                        <asp:BoundField DataField="CostoUnitario" DataFormatString="{0:N2}" HeaderText="Costo"
                                HtmlEncode="False" />
                                        <asp:BoundField DataField="TotalCostoItem" DataFormatString="{0:N2}" HeaderText="Valor"
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
                <asp:Panel ID="Panel2" runat="server" Visible="False">
                    <table>
                        <tr>
                            <td>
                                <asp:Panel ID="panelCabecera" runat="server" CssClass="generalFont">
                                    <table style="border-right: green thin solid; border-top: green thin solid; border-left: green thin solid; border-bottom: green thin solid" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td rowspan="2">
                                                <asp:Label ID="Label12" runat="server" Text="Fecha"></asp:Label></td>
                                            <td rowspan="2">
                                                <asp:TextBox ID="txtFechaGuia" runat="server" Width="90px" CssClass="generalFont"></asp:TextBox><img id="imgFecha"
                                                    src="Img/calendario.gif" /></td>
                                            <td rowspan="2">
                                                <asp:Label ID="Label3" runat="server" BackColor="White" ForeColor="White" Text="Sep"></asp:Label></td>
                                            <td rowspan="2">
                                                <asp:Label ID="Label13" runat="server" Text="Operación"></asp:Label></td>
                                            <td rowspan="2">
                                            <asp:DropDownList
                                    ID="cmbTransaccion" runat="server" AutoPostBack="True" CssClass="generalFont">
                                </asp:DropDownList></td>
                                            <td rowspan="2">
                                                <asp:Label ID="Label4" runat="server" BackColor="White" ForeColor="White" Text="Sep"></asp:Label></td>
                                            <td colspan="5">
                                                <asp:Panel ID="panelIngresoCab" runat="server" BackColor="#C0FFC0">
                                                    <table>
                                                        <tr>
                                                            <td>
                                                <asp:Label ID="lblGRP" runat="server" Text="G.R.P."></asp:Label>
                                                <asp:TextBox ID="txtGRproveedor" runat="server" Width="90px" CssClass="generalFont"></asp:TextBox></td>
                                                            <td>
                                                                <asp:Label ID="Label6" runat="server" BackColor="White" ForeColor="White" Text="Sep"></asp:Label></td>
                                                            <td style="width: 187px">
                                                                &nbsp;<asp:Label ID="lblFechaGRP" runat="server" Text="Fecha G.R.P."></asp:Label><asp:TextBox ID="txtFechaGRproveedor" runat="server" Width="90px" CssClass="generalFont"></asp:TextBox><img id="imgFechaGR"
                                                    src="Img/calendario.gif" /></td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="5">
                                                <asp:Panel ID="panelSalidaCab" runat="server" BackColor="#C0FFFF">
                                                    <asp:Label ID="Label2" runat="server" Text="Destino"></asp:Label>
                                                    <asp:DropDownList
                                    ID="cmbDestino" runat="server" CssClass="generalFont">
                                                </asp:DropDownList></asp:Panel>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="4">
                                                <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd/MM/yyyy"
                                                    PopupButtonID="imgFecha" TargetControlID="txtFechaGuia" CssClass="Calendar">
                                                </ajaxToolkit:CalendarExtender>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td colspan="4">
                                                <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" Format="dd/MM/yyyy"
                                                    PopupButtonID="imgFechaGR" TargetControlID="txtFechaGRproveedor" CssClass="Calendar">
                                                </ajaxToolkit:CalendarExtender>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="Label1" runat="server" Text="Concepto"></asp:Label></td>
                                            <td colspan="10">
                                                <asp:TextBox ID="txtObservacion" runat="server" Width="800px" BorderStyle="Solid" BorderWidth="1px" CssClass="generalFont"></asp:TextBox></td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Panel ID="panelObtener" runat="server" BackColor="LightBlue" Visible="False" CssClass="generalFont">
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="txtBuscaDocObtener" runat="server" Width="90px"></asp:TextBox><asp:ImageButton
                                                ID="btnBuscaDocObtener" runat="server" ImageUrl="~/Img/BotonBuscar.gif" /><asp:Label ID="lblFlagUpdateItem" runat="server" Text="flagUpdateItem"></asp:Label><br />
                                                <asp:GridView ID="grdvObtener" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                    CellPadding="2" ForeColor="#333333" PageSize="8">
                                                <RowStyle BackColor="#E3EAEB" />
                                                <Columns>
                                                    <asp:BoundField DataField="IdGuia" HeaderText="Guia" />
                                                    <asp:BoundField DataField="DescripTipoMov" HeaderText="Tipo" >
                                                        <ItemStyle Wrap="False" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="FechaGuia" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Fecha"
                                            HtmlEncode="False" />
                                                    <asp:BoundField DataField="IdOrdenCompra" HeaderText="O/C" />
                                                    <asp:BoundField DataField="Observacion" HeaderText="Concepto" />
                                                    <asp:TemplateField HeaderText="Ok">
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="ImageButton1" runat="server" CommandName="Elegir" ImageUrl="~/Img/Elegir1.jpg" Width="19px" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
                                                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                                <AlternatingRowStyle BackColor="White" />
                                                    <EditRowStyle BackColor="#7C6F57" />
                                            </asp:GridView>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Panel ID="panelDetalle" runat="server" BackColor="#C0FFFF">
                                                    <table>
                                                        <tr>
                                                            <td>
                                <asp:GridView ID="grdvObtenerDetalle" runat="server" AutoGenerateColumns="False"
                        CellPadding="2" ForeColor="#333333" Font-Names="Calibri" Font-Size="X-Small">
                                    <RowStyle BackColor="#EFF3FB" />
                                    <Columns>
                                        <asp:BoundField DataField="NumeroItem" HeaderText="Item" />
                                        <asp:BoundField DataField="IdBienServicio" HeaderText="C&#243;digo" />
                                        <asp:BoundField DataField="DescripBien" HeaderText="Descripci&#243;n" />
                                        <asp:BoundField DataField="DescripUM" HeaderText="U.M." />
                                        <asp:BoundField DataField="CostoUnitario" DataFormatString="{0:N2}" HeaderText="Costo Uni."
                                            HtmlEncode="False" />
                                        <asp:BoundField DataField="CantidadRemitida" DataFormatString="{0:N2}" HeaderText="Cantidad Remitida" HtmlEncode="False" >
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Cantidad" DataFormatString="{0:N2}" HeaderText="Cantidad Recibida" >
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="LoteNumero" HeaderText="Lote Nro" />
                                        <asp:BoundField DataField="LoteVencimiento" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Lote Vencimiento"
                                            HtmlEncode="False" />
                                        <asp:TemplateField HeaderText="Ok">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ImageButton2" runat="server" CommandName="Elegir" ImageUrl="~/Img/Elegir3.jpg"
                                                    Width="19px" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" Wrap="False" />
                                    <EditRowStyle BackColor="#2461BF" />
                                    <AlternatingRowStyle BackColor="White" />
                                </asp:GridView>
                                                            </td>
                                                            <td>
                                                                <asp:Panel ID="panelCantidad" runat="server" BackColor="CadetBlue" Visible="False">
                                                                    <table>
                                                                        <tr>
                                                                            <td>
                                                            <asp:Label ID="lblCantidadRecepcionada" runat="server" Text="Cantidad Recepcionada" ForeColor="White"></asp:Label></td>
                                                                            <td>
                                                                                <asp:TextBox ID="txtCantidadRecepcionada" runat="server" onkeypress="return numDecimal(event)" Width="70px">0</asp:TextBox></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td align="center">
                                                            <asp:ImageButton ID="btnReestablecer" runat="server" ImageUrl="~/Img/BotonReestablecer.gif"
                                                                ToolTip="Restablecer" Width="20px" /></td>
                                                                            <td align="center">
                                                            <asp:ImageButton ID="btnAceptar" runat="server" ImageUrl="~/Img/BotonOk.gif"
                                                                ToolTip="Aceptar" Width="22px" /></td>
                                                                        </tr>
                                                                    </table>
                                                                </asp:Panel>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Panel ID="panelDigitar" runat="server" BackColor="LightGoldenrodYellow" Visible="False" CssClass="generalFont">
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:Label ID="Label22" runat="server" Text="Código"></asp:Label><br />
                                                <asp:TextBox ID="txtCodigo2" runat="server" onfocus="this.blur();" Width="120px" CssClass="generalFont"></asp:TextBox><asp:Button ID="btnProveedor" runat="server" Font-Bold="True" Text="..." ToolTip="Buscar Proveedor" /></td>
                                            <td>
                                                <asp:Label ID="Label23" runat="server" Text="Descripción"></asp:Label><br />
                                                <asp:TextBox ID="txtNombre2" runat="server" onfocus="this.blur();" CssClass="generalFont" Width="220px"></asp:TextBox></td>
                                            <td>
                                                <asp:Label ID="Label24" runat="server" Text="U.M."></asp:Label><br />
                                                <asp:TextBox ID="txtUnidadMedida" runat="server" Enabled="False" Width="56px" CssClass="generalFont"></asp:TextBox></td>
                                            <td>
                                                <asp:Label ID="Label25" runat="server" Text="Stock"></asp:Label><br />
                                                <asp:TextBox ID="txtStock" runat="server" Enabled="False" Width="90px" CssClass="generalFont">0</asp:TextBox></td>
                                            <td>
                                                <asp:Label ID="Label26" runat="server" Text="Costo"></asp:Label><br />
                                                <asp:TextBox ID="txtCostoUnitario" runat="server" onkeypress="return numDecimal(event)" Width="90px" CssClass="generalFont">0</asp:TextBox></td>
                                            <td>
                                                <asp:Label ID="Label35" runat="server" Text="Cantidad"></asp:Label><br />
                                                <asp:TextBox ID="txtCantidad" runat="server" onkeypress="return numDecimal(event)" Width="90px" AutoPostBack="True" CssClass="generalFont">0</asp:TextBox></td>
                                            <td>
                                                <asp:Label ID="Label36" runat="server" Text="SubTotal"></asp:Label><br />
                                                <asp:TextBox ID="txtTotalCostoItem" runat="server" Enabled="False" Width="90px" CssClass="generalFont">0</asp:TextBox></td>
                                            <td>
                                                <asp:ImageButton ID="btnAgregaDigitar" runat="server" ImageUrl="~/Img/BotonOk.gif"
                                                                ToolTip="Aceptar" Width="22px" OnClientClick="return validaAlmaDigitar()" /></td>
                                            <td>
                                                <asp:ImageButton ID="btnReestableceDigitar" runat="server" ImageUrl="~/Img/BotonReestablecer.gif"
                                                                ToolTip="Restablecer" Width="20px" /></td>
                                        </tr>
                                        <tr>
                                            <td colspan="9">
                                            <asp:GridView ID="grdvDigitarDetalle" runat="server" AutoGenerateColumns="False"
                        CellPadding="2" ForeColor="Black" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderStyle="Solid" BorderWidth="1px">
                                                <Columns>
                                                    <asp:BoundField DataField="IdBienServicio" HeaderText="C&#243;digo" />
                                                    <asp:BoundField DataField="DescripArti" HeaderText="Descripci&#243;n" />
                                                    <asp:BoundField DataField="DescripUM" HeaderText="U.M." />
                                                    <asp:BoundField DataField="Stock" DataFormatString="{0:N2}" HeaderText="Stock" HtmlEncode="False" >
                                                        <ItemStyle HorizontalAlign="Right" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="CostoUnitario" DataFormatString="{0:N2}" HeaderText="Costo Uni." >
                                                        <ItemStyle HorizontalAlign="Right" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="Cantidad" DataFormatString="{0:N2}" HeaderText="Cantidad" />
                                                    <asp:BoundField DataField="TotalCostoItem" DataFormatString="{0:N2}" HeaderText="SubTotal" />
                                                    <asp:TemplateField HeaderText="Ok">
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="ImageButton2" runat="server" CommandName="Elegir" ImageUrl="~/Img/Elegir3.jpg"
                                                    Width="19px" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <FooterStyle BackColor="Tan" />
                                                <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                                                <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                                                <HeaderStyle BackColor="Tan" Font-Bold="True" Wrap="False" />
                                                <AlternatingRowStyle BackColor="PaleGoldenrod" />
                                            </asp:GridView>
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:Button ID="btnServerCode" runat="server" Text="VerStock" Visible="False" /></asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <asp:Button ID="btnGuardar" runat="server" Text="Guardar" Width="75px" OnClientClick="return validaAlmaGuardar()" />
                                &nbsp;<asp:Button ID="btnCancelar" runat="server" Text="Cancelar" Width="75px" /></td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
</asp:Content>

