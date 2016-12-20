<%@ page language="VB" masterpagefile="~/MasterPage.master" autoeventwireup="false" inherits="Contrato1, App_Web_js1z4v53" title="Contrato Locación" %>
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
                                <asp:TextBox ID="txtBuscarContrato" runat="server" Width="200px"></asp:TextBox><asp:ImageButton
                                    ID="btnBuscarContrato" runat="server" ImageUrl="~/Img/BotonBuscar.gif" /></td>
                            <td>
                                <asp:DropDownList ID="cmbCentroCosto" runat="server" AutoPostBack="True">
                                </asp:DropDownList></td>
                            <td>
                                            <asp:Label ID="Label26" runat="server" BackColor="#C0FFC0" ForeColor="#C0FFC0" Text="Sep"></asp:Label></td>
                            <td align="right">
                                <asp:ImageButton ID="btnNuevo" runat="server" ImageUrl="~/Img/btnNuevo.jpg"
                                    ToolTip="Nuevo Contrato" /></td>
                            <td align="right">
                                            <asp:ImageButton ID="btnCerrar" runat="server" ImageUrl="~/Img/btnCandado.bmp"
                                                OnClientClick="return confirm('Desea realmente Cerrar el Contrato?');" Width="28px" ToolTip="Cerrar Contrato" Height="23px" /></td>
                            <td align="right">
                                <asp:ImageButton ID="btnAnular" runat="server" ImageUrl="~/Img/button_cancel.gif"
                                    OnClientClick="return confirm('Desea realmente Anular el Contrato?');" ToolTip="Anular Contrato" Height="18px" /></td>
                            <td align="right">
                                <asp:ImageButton ID="btnSalir" runat="server" ImageUrl="~/Img/BotonCerrarItem.jpg"
                                    ToolTip="Cerrar Formulario" Width="21px" /></td>
                        </tr>
                        <tr>
                            <td colspan="7">
                                <asp:GridView ID="grdvContrato" runat="server" AutoGenerateColumns="False" CellPadding="0" ForeColor="Black" AllowPaging="True" PageSize="12" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" GridLines="Vertical">
                                    <RowStyle BackColor="#F7F7DE" />
                                    <Columns>
                                        <asp:BoundField DataField="IdContrato" HeaderText="Contrato" />
                                        <asp:BoundField DataField="NumeroAddendum" HeaderText="Addendum" />
                                        <asp:BoundField DataField="Descripcion" HeaderText="Tipo" />
                                        <asp:BoundField DataField="FechaContrato" HeaderText="Fecha" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="False" />
                                        <asp:BoundField DataField="FechaInicio" HeaderText="Inicio" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="False" />
                                        <asp:BoundField DataField="FechaTermino" HeaderText="Fin" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="False" />
                                        <asp:BoundField DataField="Objeto" HeaderText="Objeto" />
                                        <asp:BoundField DataField="RazonSocial" HeaderText="Nombre" />
                                        <asp:BoundField DataField="Cerrado" HeaderText="Cerrado">
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="Ok">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Img/Elegir1.jpg" Width="19px" CommandName="ModElegir" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Imprimir">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ModImprimir" runat="server" CommandName="ModImprimir" ImageUrl="~/Img/ImprimeLista.jpg"
                                                    Width="18px" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Modifica">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ImageButton2" runat="server" CommandName="ModEditar" ImageUrl="~/Img/edit.gif"
                                                    Width="17px" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
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
                                <asp:GridView ID="grdvContratoDetalle" runat="server" AutoGenerateColumns="False" BackColor="White"
                                    BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
                                <RowStyle ForeColor="#000066" />
                                <Columns>
                                    <asp:BoundField DataField="IdContrato" HeaderText="Contrato" />
                                    <asp:BoundField DataField="ItemContrato" HeaderText="Item" />
                                    <asp:BoundField DataField="DescripCentro" HeaderText="CentroCosto" />
                                    <asp:BoundField DataField="IdRequerimiento" HeaderText="Requerimiento" />
                                    <asp:BoundField DataField="IdServicioLocacion" HeaderText="C&#243;digo" />
                                    <asp:BoundField DataField="Descripcion" HeaderText="Descripci&#243;n" />
                                    <asp:BoundField DataField="Monto" HeaderText="Monto" DataFormatString="{0:N2}" HtmlEncode="False" />
                                    <asp:BoundField DataField="Porcentaje" HeaderText="Porcentaje" DataFormatString="{0:N2}" HtmlEncode="False" />
                                    <asp:BoundField DataField="MontoTurno" HeaderText="Turno" DataFormatString="{0:N2}" HtmlEncode="False" />
                                    <asp:BoundField DataField="MontoHora" HeaderText="Hora" DataFormatString="{0:N2}" HtmlEncode="False" />
                                    <asp:TemplateField HeaderText="Modifica">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButton4" runat="server" CommandName="Modifica" ImageUrl="~/Img/edit.gif" />
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
                    </table>
                    </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="Panel2" runat="server" BackColor="#C0FFFF" Visible="False" CssClass="generalFont">
                    <table>
                        <tr>
                            <td>
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td colspan="4">
                                            <asp:GridView ID="grdvRequerimiento" runat="server" AutoGenerateColumns="False"
                                                CellPadding="4" Font-Names="Arial" Font-Size="9pt" ForeColor="#333333" GridLines="None" AllowPaging="True" PageSize="2">
                                                <RowStyle BackColor="#EFF3FB" />
                                                <Columns>
                                                    <asp:BoundField DataField="IdRequerimiento" HeaderText="Requerimiento" />
                                                    <asp:BoundField DataField="FechaRequerimiento" HeaderText="Fecha" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="False" />
                                                    <asp:BoundField DataField="Descripcion" HeaderText="Concepto" />
                                                    <asp:BoundField DataField="SaldoCostoContrato" DataFormatString="{0:N2}" HeaderText="SaldoRequerimiento"
                                                        HtmlEncode="False" />
                                                    <asp:TemplateField HeaderText="Ok">
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="ImageButton3" runat="server" CommandName="Elegir" ImageUrl="~/Img/Elegir3.jpg"
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
                                        <td colspan="4">
                                            <asp:GridView ID="grdvRequerimientoDetalle" runat="server" AutoGenerateColumns="False" BorderWidth="1px"
                                                CellPadding="3" Font-Names="Arial" Font-Size="9pt" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" GridLines="Horizontal">
                                                <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                                                <Columns>
                                                    <asp:BoundField DataField="IdNumeroItem" HeaderText="Item" />
                                                    <asp:BoundField DataField="DescripCentro" HeaderText="CentroCosto" />
                                                    <asp:BoundField DataField="IdBienServicio" HeaderText="C&#243;digo" />
                                                    <asp:BoundField DataField="Descripcion" HeaderText="Descripci&#243;n" />
                                                    <asp:BoundField DataField="PartidaPresupuestal" HeaderText="Partida" />
                                                    <asp:BoundField DataField="IdTransaccion" HeaderText="Transaccion" />
                                                    <asp:BoundField DataField="SaldoCostoContrato" HeaderText="SaldoItem" HtmlEncode="False" DataFormatString="{0:N2}" />
                                                    <asp:TemplateField HeaderText="Ok">
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="ImageButton3" runat="server" CommandName="Elegir" ImageUrl="~/Img/Elegir3.jpg"
                                                                Width="19px" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                                                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                                                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                                                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                                                <AlternatingRowStyle BackColor="#F7F7F7" />
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
                                            .......</td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                <asp:Label ID="Label1" runat="server" Text="Contrato"></asp:Label></td>
                                        <td>
                                <asp:TextBox ID="txtIdContrato" runat="server" Width="100px" Enabled="False" Font-Bold="True"></asp:TextBox></td>
                                        <td>
                                        </td>
                                        <td>
                                <asp:Label ID="Label2" runat="server" Text="Modalidad"></asp:Label></td>
                                        <td>
                                <asp:DropDownList ID="cmbTipoContrato" runat="server" AutoPostBack="True">
                                </asp:DropDownList></td>
                                        <td>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label13" runat="server" Text="Tipo Locador"></asp:Label></td>
                                        <td>
                                            <asp:DropDownList ID="cmbTipoLocador" runat="server">
                                            </asp:DropDownList></td>
                                    </tr>
                                    <tr>
                                        <td>
                                <asp:Label ID="Label6" runat="server" Text="Tipo Doc. Sustentatorio"></asp:Label></td>
                                        <td>
                                <asp:DropDownList ID="cmbTipoDocSustentatorio" runat="server">
                                </asp:DropDownList></td>
                                        <td>
                                        </td>
                                        <td>
                                <asp:Label ID="Label7" runat="server" Text="Documento"></asp:Label></td>
                                        <td>
                                            <asp:TextBox ID="txtDocSustentatorio" runat="server" Width="100px"></asp:TextBox>
                                            <asp:TextBox ID="txtAddendum" runat="server" Width="40px" Visible="False"></asp:TextBox></td>
                                        <td>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label8" runat="server" Text="Fecha Doc."></asp:Label></td>
                                        <td>
                                            <asp:UpdatePanel id="UpdatePanel2" runat="server">
                                                <contenttemplate>
<ajaxToolkit:CalendarExtender id="CalendarExtender2" runat="server" Format="dd/MM/yyyy" PopupButtonID="ImgFechaDoc" TargetControlID="txtFechaDoc" CssClass="Calendar"></ajaxToolkit:CalendarExtender><asp:TextBox id="txtFechaDoc" runat="server" Width="100px" AutoPostBack="True"></asp:TextBox><IMG id="ImgFechaDoc" src="Img/calendario.gif" /> 
</contenttemplate>
                                            </asp:UpdatePanel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label31" runat="server" Text="FechaSuscripcion"></asp:Label></td>
                                        <td>
<asp:UpdatePanel id="UpdatePanel1" runat="server">
    <contenttemplate>
<ajaxToolkit:CalendarExtender id="CalendarExtender10" runat="server" Format="dd/MM/yyyy" PopupButtonID="imgFecha" TargetControlID="txtFechaSuscripcion" CssClass="Calendar"></ajaxToolkit:CalendarExtender> <asp:TextBox id="txtFechaSuscripcion" runat="server" Width="100px"></asp:TextBox><IMG id="imgFecha" src="Img/calendario.gif" /> 
</contenttemplate>
</asp:UpdatePanel>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label33" runat="server" Text="FechaInicio"></asp:Label></td>
                                        <td>
                                            <asp:UpdatePanel id="UpdatePanel3" runat="server">
                                                <contenttemplate>
<ajaxToolkit:CalendarExtender id="CalendarExtender3" runat="server" Format="dd/MM/yyyy" PopupButtonID="ImgFechaIni" TargetControlID="txtFechaInicio" CssClass="Calendar"></ajaxToolkit:CalendarExtender><asp:TextBox id="txtFechaInicio" runat="server" Width="100px" AutoPostBack="True"></asp:TextBox><IMG id="ImgFechaIni" src="Img/calendario.gif" /> 
</contenttemplate>
                                            </asp:UpdatePanel>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label3" runat="server" Text="FechaFin"></asp:Label></td>
                                        <td>
                                            <asp:UpdatePanel id="UpdatePanel4" runat="server">
                                                <contenttemplate>
<ajaxToolkit:CalendarExtender id="CalendarExtender4" runat="server" Format="dd/MM/yyyy" PopupButtonID="ImgFechaFin" TargetControlID="txtFechaFin" CssClass="Calendar"></ajaxToolkit:CalendarExtender><asp:TextBox id="txtFechaFin" runat="server" Width="100px" AutoPostBack="True"></asp:TextBox><IMG id="ImgFechaFin" src="Img/calendario.gif" /> 
</contenttemplate>
                                            </asp:UpdatePanel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label9" runat="server" Text="Proveedor"></asp:Label></td>
                                        <td colspan="4">
                                            <asp:TextBox ID="txtCodigo1" runat="server" onfocus="this.blur();" Width="100px"></asp:TextBox>
                                <asp:Button ID="btnProveedor" runat="server" Font-Bold="True" Text="..." ToolTip="Buscar Proveedor" /><asp:TextBox ID="txtNombre1" runat="server" onfocus="this.blur();" Width="416px" Font-Bold="True" MaxLength="80"></asp:TextBox></td>
                                        <td>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label4" runat="server" Text="DNI_Represen."></asp:Label></td>
                                        <td>
                                            <asp:TextBox ID="txtDniFirmante" runat="server" Width="100px" MaxLength="8"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label5" runat="server" Text="Objeto"></asp:Label></td>
                                        <td colspan="4">
                                            <asp:TextBox ID="txtObjeto" runat="server" onblur="conMayuscula(this)" MaxLength="200" TextMode="MultiLine" Width="552px"></asp:TextBox></td>
                                        <td>
                                        </td>
                                        <td>
                                            </td>
                                        <td>
                                            <asp:CheckBox ID="chkRequerimiento" runat="server" Text="Solo Requerimiento" Font-Bold="True" ForeColor="Red" /></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label11" runat="server" BackColor="#C0FFFF" ForeColor="#C0FFFF" Text="Sep"></asp:Label></td>
                                        <td>
                                            </td>
                                        <td>
                                            <asp:Label ID="Label20" runat="server" BackColor="#C0FFFF" ForeColor="#C0FFFF" Text="Sep"></asp:Label></td>
                                        <td>
                                            <asp:Label ID="Label21" runat="server" BackColor="#C0FFFF" ForeColor="#C0FFFF" Text="Sep"></asp:Label></td>
                                        <td>
                                            <asp:Label ID="Label22" runat="server" BackColor="#C0FFFF" ForeColor="#C0FFFF" Text="Sep"></asp:Label></td>
                                        <td>
                                            <asp:Label ID="Label24" runat="server" BackColor="#C0FFFF" ForeColor="#C0FFFF" Text="Sep"></asp:Label></td>
                                        <td>
                                            <asp:Label ID="Label23" runat="server" BackColor="#C0FFFF" ForeColor="#C0FFFF" Text="Sep"></asp:Label>
                                            <asp:Label ID="Label10" runat="server" Text="Servicio a prestar" Visible="False"></asp:Label></td>
                                        <td>
                                            <asp:Label ID="Label25" runat="server" BackColor="#C0FFFF" ForeColor="#C0FFFF" Text="Sep"></asp:Label>
                                            <asp:TextBox ID="txtCargo" runat="server" onblur="conMayuscula(this)" MaxLength="50" Width="184px" Visible="False"></asp:TextBox></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table>
                                    <tr>
                                        <td>
                                            Código<br />
                                            <asp:TextBox ID="txtCodigo2" runat="server" onfocus="this.blur();" Width="90px" Font-Bold="True"></asp:TextBox><asp:Button ID="btnIdBienServicio" runat="server" Font-Bold="True" Text="..." ToolTip="Buscar Servicio" /></td>
                                        <td>
                                            Descripción<br />
                                            <asp:TextBox ID="txtNombre2" runat="server" onfocus="this.blur();" Width="224px" Font-Bold="False" Font-Names="Arial" Font-Size="0.65em"></asp:TextBox></td>
                                        <td>
                                            Centro Costo<br />
                                            <asp:DropDownList ID="cmbCentroCostoDetalle" runat="server" AutoPostBack="True" Font-Names="Arial" Font-Size="0.65em">
                                            </asp:DropDownList></td>
                                        <td>
                                            Monto<br />
                                            <asp:TextBox ID="txtMonto" runat="server" onkeypress="return numDecimal(event)" onblur="formatoNum('txtMonto')" Width="90px">0</asp:TextBox></td>
                                        <td>
                                            Porcentaje (%)<br />
                                            <asp:TextBox ID="txtPorcentaje" runat="server" onkeypress="return numDecimal(event)" Width="90px">0</asp:TextBox></td>
                                        <td>
                                            Importe_x_Turno<br />
                                            <asp:TextBox ID="txtTurno" runat="server" onkeypress="return numDecimal(event)" onblur="formatoNum('txtTurno')" Width="90px">0</asp:TextBox></td>
                                        <td>
                                            Importe_x_Hora<br />
                                            <asp:TextBox ID="txtHora" runat="server" onkeypress="return numDecimal(event)" onblur="formatoNum('txtHora')" Width="90px">0</asp:TextBox></td>
                                        <td rowspan="2">
                                            <asp:Button ID="btnAgregar" runat="server" OnClientClick ="return validaContratoDetalle()" Text="Agregar" Width="60px" /><br />
                                            <asp:Button ID="btnQuitar" runat="server" Text="Quitar" Width="60px" /></td>
                                    </tr>
                                    <tr>
                                        <td colspan="7">
                                            <asp:GridView ID="grdvItem" runat="server" AutoGenerateColumns="False" BorderWidth="1px"
                                                CellPadding="4" Font-Names="Arial" Font-Size="9pt" ForeColor="#333333">
                                                <RowStyle BackColor="#E3EAEB" />
                                                <Columns>
                                                    <asp:BoundField DataField="IdRequerimiento" HeaderText="Requerimiento" />
                                                    <asp:BoundField DataField="ItemRequerimiento" HeaderText="Item" />
                                                    <asp:BoundField DataField="IdBienServicio" HeaderText="C&#243;digo" />
                                                    <asp:BoundField DataField="Descripcion" HeaderText="Descripci&#243;n" />
                                                    <asp:BoundField DataField="DescripCentro" HeaderText="Centro Costo" />
                                                    <asp:BoundField DataField="PartidaPresupuestal" HeaderText="Partida" />
                                                    <asp:BoundField DataField="IdTransaccionPedido" HeaderText="Transacci&#243;n" />
                                                    <asp:BoundField DataField="servicioLocacion" HeaderText="Servicio Locaci&#243;n" />
                                                    <asp:BoundField DataField="Monto" HeaderText="Monto" HtmlEncode="False" DataFormatString="{0:N2}" />
                                                    <asp:BoundField DataField="Porcentaje" DataFormatString="{0:N2}" HeaderText="Porcentaje"
                                                        HtmlEncode="False">
                                                        <ItemStyle HorizontalAlign="Right" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="MontoTurno" DataFormatString="{0:N2}" HeaderText="Turno" HtmlEncode="False">
                                                        <ItemStyle HorizontalAlign="Right" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="MontoHora" HeaderText="Hora" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                    <asp:TemplateField HeaderText="Ok">
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="ImageButton3" runat="server" CommandName="Elegir" ImageUrl="~/Img/Elegir3.jpg"
                                                                Width="19px" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                                <EditRowStyle BackColor="#7C6F57" />
                                                <AlternatingRowStyle BackColor="White" />
                                            </asp:GridView>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="8" align="center">
                                                        <asp:Button ID="btnGuardar" runat="server" OnClientClick ="return validaContrato()" Text="Guardar" /><asp:Button ID="btnCancelar" runat="server" Text="Cancelar" /></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label12" runat="server" BackColor="#C0FFFF" ForeColor="#C0FFFF" Text="Sep"></asp:Label></td>
                                        <td>
                                            <asp:Label ID="Label14" runat="server" BackColor="#C0FFFF" ForeColor="#C0FFFF" Text="Sep"></asp:Label></td>
                                        <td>
                                            <asp:Label ID="Label15" runat="server" BackColor="#C0FFFF" ForeColor="#C0FFFF" Text="Sep"></asp:Label></td>
                                        <td>
                                            <asp:Label ID="Label16" runat="server" BackColor="#C0FFFF" ForeColor="#C0FFFF" Text="Sep"></asp:Label></td>
                                        <td>
                                            <asp:Label ID="Label17" runat="server" BackColor="#C0FFFF" ForeColor="#C0FFFF" Text="Sep"></asp:Label></td>
                                        <td>
                                            <asp:Label ID="Label18" runat="server" BackColor="#C0FFFF" ForeColor="#C0FFFF" Text="Sep"></asp:Label></td>
                                        <td>
                                            <asp:Label ID="Label19" runat="server" BackColor="#C0FFFF" ForeColor="#C0FFFF" Text="Sep"></asp:Label></td>
                                        <td>
                                            <asp:Label ID="Label35" runat="server" BackColor="#C0FFFF" ForeColor="#C0FFFF" Text="Sep"></asp:Label></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="panelModificar" runat="server" BackColor="DodgerBlue" CssClass="generalFon" Visible="False">
                    <table>
                        <tr>
                            <td colspan="3" align="center">
                                <asp:Label ID="Label32" runat="server" ForeColor="White" Text="Modificar cabecera de Contrato" Font-Bold="True"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label30" runat="server" ForeColor="White" Text="Contrato"></asp:Label></td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtModContrato" runat="server" Enabled="False" Font-Bold="True" Width="128px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label38" runat="server" ForeColor="White" Text="Nombre"></asp:Label></td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtModNombre" runat="server" Enabled="False" Font-Bold="True" TextMode="MultiLine" Width="600px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label34" runat="server" ForeColor="White" Text="Fecha Inicio"></asp:Label></td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtModFechaIni" runat="server" Width="128px"></asp:TextBox>
                                <img id="Img1" src="Img/calendario.gif" />
                                <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd/MM/yyyy"
                                    PopupButtonID="Img1" TargetControlID="txtModFechaIni" CssClass="Calendar">
                                </ajaxToolkit:CalendarExtender>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label36" runat="server" ForeColor="White" Text="Fecha Fin"></asp:Label></td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtModFechaFin" runat="server" Width="128px"></asp:TextBox>
                                <img id="Img2" src="Img/calendario.gif" />
                                <ajaxToolkit:CalendarExtender ID="CalendarExtender5" runat="server" Format="dd/MM/yyyy"
                                    PopupButtonID="Img2" TargetControlID="txtModFechaFin">
                                </ajaxToolkit:CalendarExtender>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label37" runat="server" ForeColor="White" Text="Objeto"></asp:Label></td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtModObjeto" runat="server" onblur="conMayuscula(this)" TextMode="MultiLine" Width="600px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                </td>
                            <td>
                                <asp:Label ID="Label28" runat="server" BackColor="DodgerBlue" ForeColor="DodgerBlue" Text="Sep"></asp:Label></td>
                            <td>
                                </td>
                        </tr>
                        <tr>
                            <td colspan="3" align="center">
                                <asp:Button ID="btnModGuardar" runat="server" Text="Guardar" />
                                <asp:Button ID="btnModCancelar" runat="server" Text="Cancelar" /></td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="panelModItem" runat="server" BackColor="CadetBlue" CssClass="generalFont"
                    Visible="False">
                    <table>
                        <tr>
                            <td align="center" colspan="3">
                                <asp:Label ID="Label27" runat="server" Font-Bold="True" ForeColor="White" Text="Modificar Cabecera de Documento"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label29" runat="server" ForeColor="White" Text="Contrato"></asp:Label></td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="itmSolicitud" runat="server" Enabled="False" Font-Bold="True" Width="110px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label39" runat="server" ForeColor="White" Text="Número Item"></asp:Label></td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="itmItem" runat="server" Enabled="False" Font-Bold="True" Width="50px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label40" runat="server" ForeColor="White" Text="Importe"></asp:Label></td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox1" runat="server" Enabled="False" Font-Bold="True" Width="144px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label41" runat="server" ForeColor="White" Text="Importe"></asp:Label></td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox2" runat="server" Enabled="False" Font-Bold="True" Width="144px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label43" runat="server" ForeColor="White" Text="Importe"></asp:Label></td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox3" runat="server" Enabled="False" Font-Bold="True" Width="144px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label42" runat="server" ForeColor="White" Text="Importe"></asp:Label></td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="itmImporte" runat="server" Enabled="False" Font-Bold="True" Width="144px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td align="center" colspan="3">
                                <asp:Button ID="itmAceptar" runat="server" Text="Guardar" Width="70px" />
                                <asp:Button ID="itmCancelar" runat="server" Text="Cancelar" Width="70px" /></td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
</asp:Content>

