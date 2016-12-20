<%@ page language="VB" masterpagefile="~/MasterPage.master" autoeventwireup="false" inherits="SolicitudPago, App_Web_3km2mpsz" title="Pasajes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table>
        <tr>
            <td>
                <asp:Panel ID="panelCabecera" runat="server" BackColor="#C0FFC0" CssClass="generalFont">
                    <table>
                        <tr>
                            <td>
                                <asp:TextBox ID="txtBuscaSolicitud" runat="server" Width="200px"></asp:TextBox><asp:ImageButton
                                    ID="btnBuscarContrato" runat="server" ImageUrl="~/Img/BotonBuscar.gif" /></td>
                            <td>
                </td>
                            <td>
                                <asp:ImageButton ID="btnNuevo" runat="server" ImageUrl="~/Img/btnNuevo.jpg" ToolTip="Nueva Solicitud" />
                                &nbsp;&nbsp;
                                <asp:ImageButton ID="btnInsertar" runat="server" ImageUrl="~/Img/Insertar.png" Width="23px" /></td>
                            <td>
                                <asp:ImageButton ID="btnAnular" runat="server" ImageUrl="~/Img/button_cancel.gif"
                                    OnClientClick="return confirm('Desea realmente Anular la Solicitud?');" ToolTip="Anular Solicitud" Height="18px" /></td>
                            <td>
                                <asp:ImageButton ID="btnCerrar" runat="server" ImageUrl="~/Img/BotonCerrarItem.jpg"
                                    ToolTip="Cerrar Formulario" Width="21px" /></td>
                        </tr>
                        <tr>
                            <td colspan="5">
                                <asp:GridView ID="grdvSolicitudPago" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                    BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px"
                                    CellPadding="2" ForeColor="Black" GridLines="Vertical" PageSize="12">
                                    <RowStyle BackColor="#F7F7DE" />
                                    <Columns>
                                        <asp:BoundField DataField="IdSolicitudPago" HeaderText="Solicitud" />
                                        <asp:BoundField DataField="FechaSolicitudPago" HeaderText="Fecha" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="False" />
                                        <asp:BoundField DataField="Modalidad" HeaderText="Modalidad" />
                                        <asp:BoundField DataField="RazonSocial" HeaderText="Proveedor" />
                                        <asp:BoundField DataField="Descripcion" HeaderText="Concepto" />
                                        <asp:BoundField DataField="ValorTotalMN" HeaderText="Importe" DataFormatString="{0:N2}" HtmlEncode="False" />
                                        <asp:BoundField DataField="ValorVentaMN" HeaderText="Valor" DataFormatString="{0:N2}" HtmlEncode="False" />
                                        <asp:BoundField DataField="Impuesto1" HeaderText="Impuesto" DataFormatString="{0:N2}" HtmlEncode="False" />
                                        <asp:BoundField DataField="DescripSituacion" HeaderText="Situaci&#243;n" >
                                            <ItemStyle HorizontalAlign="Left" />
                                            <ControlStyle ForeColor="Red" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="Imprimir">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ImageButton2" runat="server" CommandName="itmImprimir" ImageUrl="~/Img/ImprimeLista.jpg"
                                                    Width="19px"/>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Ok">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ImageButton1" runat="server" CommandName="itmElegir" ImageUrl="~/Img/Elegir1.jpg"
                                                    Width="19px" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Modifica">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ImageButton3" runat="server" CommandName="itmModifica" ImageUrl="~/Img/edit.gif"
                                                    Width="15px" />
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
                            <td colspan="5">
                                <asp:GridView ID="grdvSolicitudPagoItem" runat="server" AutoGenerateColumns="False"
                                    BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px"
                                    CellPadding="2">
                                    <RowStyle ForeColor="#000066" />
                                    <Columns>
                                        <asp:BoundField DataField="IdItems" HeaderText="Item" />
                                        <asp:BoundField DataField="DescripTipoDoc" HeaderText="TipoDoc" />
                                        <asp:BoundField DataField="NumeroDocumento" HeaderText="NumeroDoc" />
                                        <asp:BoundField DataField="FechaDocumento" HeaderText="FechaDoc" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="False" />
                                        <asp:BoundField DataField="RazonSocial" HeaderText="Proveedor" />
                                        <asp:BoundField DataField="IdRequerimiento" HeaderText="Requerimiento" />
                                        <asp:BoundField DataField="DescripCentro" HeaderText="Centro Costo" />
                                        <asp:BoundField DataField="NroSuspension" HeaderText="Suspensi&#243;n" />
                                        <asp:BoundField DataField="FechaSuspension" HeaderText="F.Suspension" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="False" />
                                        <asp:BoundField DataField="BaseImponibleMN" DataFormatString="{0:N2}" HeaderText="Valor" HtmlEncode="False" />
                                        <asp:BoundField DataField="Impuesto1MN" HeaderText="Impuesto" DataFormatString="{0:N2}" HtmlEncode="False" />
                                        <asp:BoundField DataField="ValorTotalMN" HeaderText="Importe" DataFormatString="{0:N2}" HtmlEncode="False" />
                                        <asp:TemplateField HeaderText="Modifica">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ImageButton4" runat="server" CommandName="Modifica" ImageUrl="~/Img/edit.gif"
                                                    Width="15px" />
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
                <asp:Panel ID="panelMovimiento" runat="server" BackColor="AliceBlue" Visible="False" CssClass="generalFont">
                    &nbsp;<table cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label6" runat="server" Text="Solicitud "></asp:Label><asp:TextBox ID="txtIdSolicitud" runat="server" Width="110px" Enabled="False" Font-Bold="True"></asp:TextBox></td>
                                        <td>
                                            <asp:UpdatePanel id="UpdatePanel3" runat="server">
                                                <contenttemplate>
<ajaxToolkit:CalendarExtender id="CalendarExtender3" runat="server" TargetControlID="txtFechaSolicitud" PopupButtonID="ImgFechaSolicitud" Format="dd/MM/yyyy"></ajaxToolkit:CalendarExtender> <asp:Label id="Label60" runat="server" Text="Fecha"></asp:Label>&nbsp;<asp:TextBox id="txtFechaSolicitud" runat="server" Width="110px"></asp:TextBox><IMG id="ImgFechaSolicitud" src="Img/calendario.gif" /> 
</contenttemplate>
                                            </asp:UpdatePanel></td>
                                        <td align="right">
                                            <asp:Button ID="btnGuardar" runat="server" Text="Guardar" Width="80px" />&nbsp;
                <asp:Button ID="btnAbandonar" runat="server" Text="Abandonar" Width="80px" /></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                <asp:TextBox ID="txtDescripcion" runat="server" TextMode="MultiLine" onblur="conMayuscula(this)" Width="1000px" MaxLength="240"></asp:TextBox></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="txtBuscaProveedor" runat="server" Width="200px" Visible="False"></asp:TextBox><asp:ImageButton
                                    ID="btnBuscaProveedor" runat="server" ImageUrl="~/Img/BotonBuscar.gif" Visible="False" /><br />
                <asp:GridView ID="grdvPedidos" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="1"
                    Font-Names="Arial" Font-Size="8pt" ForeColor="Black" PageSize="8" CellSpacing="1">
                    <Columns>
                        <asp:BoundField DataField="Orden" HeaderText="Orden" >
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="IdRequerimiento" HeaderText="Requerimiento" />
                        <asp:BoundField DataField="Descripcion" HeaderText="Concepto">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="IdNumeroItem" HeaderText="Item" >
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="IdCentroCosto" HeaderText="Cod. CC" />
                        <asp:BoundField DataField="DescripCentro" HeaderText="Centro Costo" />
                        <asp:BoundField DataField="IdProveedor" HeaderText="Proveedor" />
                        <asp:BoundField DataField="RazonSocial" HeaderText="Nombre" />
                        <asp:BoundField DataField="SaldoCosto" DataFormatString="{0:N2}" HeaderText="Saldo" HtmlEncode="False">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="SubTotalItem" DataFormatString="{0:N2}" HeaderText="Importe Pago" >
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Pagar">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" CommandName="Elegir" ImageUrl="~/Img/Elegir1.jpg"
                                    Width="19px" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="Tan" />
                    <PagerStyle BackColor="Goldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                    <HeaderStyle BackColor="Tan" Font-Bold="True" />
                    <AlternatingRowStyle BackColor="PaleGoldenrod" />
                </asp:GridView>
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label4" runat="server" BackColor="AliceBlue" ForeColor="Red"
                                                Text="Acumulados--->"></asp:Label></td>
                                        <td>
                                            <asp:Label ID="Label23" runat="server" BackColor="AliceBlue" ForeColor="AliceBlue"
                                                Text="Sep"></asp:Label></td>
                                        <td>
                                            <asp:Label ID="Label24" runat="server" BackColor="AliceBlue" ForeColor="Red"
                                                Text="Items"></asp:Label></td>
                                        <td>
                                            <asp:TextBox ID="txtTotalItems" runat="server" Enabled="False" Font-Bold="True" Font-Names="Calibri"
                                                Font-Size="10pt" Width="60px">0</asp:TextBox></td>
                                        <td>
                                            <asp:Label ID="Label13" runat="server" BackColor="AliceBlue" ForeColor="AliceBlue"
                                                Text="Sep"></asp:Label></td>
                                        <td>
                                            <asp:Label ID="Label14" runat="server" BackColor="AliceBlue" ForeColor="Red"
                                                Text="Valor"></asp:Label></td>
                                        <td>
                                            <asp:TextBox ID="txtTotalValor" runat="server" Enabled="False" Font-Bold="True" Width="110px" Font-Names="Calibri" Font-Size="10pt">0</asp:TextBox></td>
                                        <td>
                                            <asp:Label ID="Label17" runat="server" BackColor="AliceBlue" ForeColor="AliceBlue"
                                                Text="Sep"></asp:Label></td>
                                        <td>
                                            <asp:Label ID="Label16" runat="server" BackColor="AliceBlue" ForeColor="Red"
                                                Text="Impuesto"></asp:Label></td>
                                        <td>
                                            <asp:TextBox ID="txtTotalImpuesto" runat="server" Enabled="False" Font-Bold="True" Width="80px" Font-Names="Calibri" Font-Size="10pt">0</asp:TextBox></td>
                                        <td>
                                            <asp:Label ID="Label20" runat="server" BackColor="AliceBlue" ForeColor="AliceBlue"
                                                Text="Sep"></asp:Label></td>
                                        <td>
                                            <asp:Label ID="Label19" runat="server" BackColor="AliceBlue" ForeColor="Red"
                                                Text="Total"></asp:Label></td>
                                        <td>
                                            <asp:TextBox ID="txtTotal" runat="server" Enabled="False" Font-Bold="True" Font-Names="Calibri"
                                                Font-Size="10pt" Width="110px">0</asp:TextBox></td>
                                        <td>
                                            <asp:Label ID="Label18" runat="server" BackColor="AliceBlue" ForeColor="AliceBlue"
                                                Text="Sep"></asp:Label></td>
                                        <td>
                                            <asp:Label ID="Label21" runat="server" BackColor="AliceBlue" ForeColor="Red"
                                                Text="Inafecto"></asp:Label></td>
                                        <td>
                                            <asp:TextBox ID="txtTotalInafecto" runat="server" Enabled="False" Font-Bold="True"
                                                Font-Names="Calibri" Font-Size="10pt" Width="80px">0</asp:TextBox></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                <asp:Panel ID="Panel1" runat="server" BackColor="LightCyan" Visible="False" CssClass="generalFont">
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                <asp:Label ID="Label12" runat="server" Text="Proveedor"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="txtCodigo1" runat="server" onfocus="this.blur();" Width="100px"></asp:TextBox><asp:Button
                                    ID="btnProveedor" runat="server" Font-Bold="True" Text="..." ToolTip="Buscar Proveedor" /></td>
                            <td>
                            </td>
                            <td colspan="5">
                                <asp:TextBox ID="txtNombre1" runat="server" Font-Bold="True" MaxLength="80" onfocus="this.blur();"
                                    Width="416px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label2" runat="server" Text="Partida"></asp:Label></td>
                            <td colspan="5">
                                <asp:Label ID="lblPartida" runat="server" Text="Partida"></asp:Label></td>
                            <td>
                                <asp:Label ID="Label8" runat="server" Text="Tipo Documento"></asp:Label></td>
                            <td>
                                <asp:DropDownList ID="cmbTipoDoc" runat="server" CssClass="generalFont">
                            </asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label1" runat="server" Text="Documento"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="txtSerie" runat="server" onBlur="rellenarCeros(this,3)" Width="30px" MaxLength="3"></asp:TextBox>-<asp:TextBox ID="txtIdDocumento" runat="server" onBlur="rellenarCeros(this,10)" Width="90px"></asp:TextBox></td>
                            <td>
                            </td>
                            <td>
                                <asp:Label ID="Label10" runat="server" Text="Fecha Doc."></asp:Label></td>
                            <td>
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
<ajaxToolkit:CalendarExtender id="CalendarExtender1" runat="server" Format="dd/MM/yyyy" PopupButtonID="ImgFechaDoc" TargetControlID="txtFechaDoc"></ajaxToolkit:CalendarExtender> <asp:TextBox id="txtFechaDoc" runat="server" Width="110px"></asp:TextBox> <IMG id="ImgFechaDoc" src="Img/calendario.gif" /> 
</ContentTemplate>
                                </asp:UpdatePanel></td>
                            <td>
                            </td>
                            <td>
                                &nbsp;<asp:Label ID="Label11" runat="server" Text="Afecto"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="txtAfecto" runat="server" Enabled="False" Font-Bold="True" Width="110px">0</asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label40" runat="server" Text="Inafecto"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="txtInafecto" runat="server" Font-Bold="True" Width="110px">0</asp:TextBox></td>
                            <td>
                            </td>
                            <td>
                                <asp:Label ID="lblImpuesto" runat="server" Text="Impuesto"></asp:Label></td>
                            <td>
                                &nbsp;<asp:TextBox ID="txtImpuesto" runat="server" Enabled="False" Font-Bold="True" Width="110px">0</asp:TextBox></td>
                            <td>
                            </td>
                            <td>
                                <asp:Label ID="lblNeto" runat="server" Text="Total"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="txtSubTotal" runat="server" Font-Bold="True" Width="110px">0</asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblObservacion" runat="server" ForeColor="Red" Text="Observación"></asp:Label></td>
                            <td colspan="7">
                                <asp:TextBox ID="txtObservacion" runat="server" onblur="conMayuscula(this)" Width="608px" TextMode="MultiLine" MaxLength="100"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="height: 16px">
                                </td>
                            <td style="height: 16px">
                                <asp:Label ID="lblNuevo" runat="server" Text="Nuevo"></asp:Label></td>
                            <td style="height: 16px">
                                <asp:Label ID="Label3" runat="server" BackColor="LightCyan" ForeColor="White" Text="Sep"></asp:Label></td>
                            <td style="height: 16px">
                            </td>
                            <td style="height: 16px">
                            </td>
                            <td style="height: 16px">
                                <asp:Label ID="Label5" runat="server" BackColor="LightCyan" ForeColor="White" Text="Sep"></asp:Label></td>
                            <td style="height: 16px">
                            </td>
                            <td style="height: 16px">
                                <asp:Label ID="lblCuentaBanco" runat="server" Text="CuentaBanco"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="center" colspan="8">
                                <asp:Button ID="btnCalcular" runat="server" Text="Calcular" Width="80px" />
                                <asp:Button ID="btnAceptar" runat="server" OnClientClick ="return validaSolicitud()" Text="Aceptar" Width="80px" />
                                <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" Width="80px" /></td>
                        </tr>
                    </table>
                    <br />
                </asp:Panel>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="panelModCab" runat="server" BackColor="DeepSkyBlue" Visible="False" CssClass="generalFont">
                    <table>
                        <tr>
                            <td align="center" colspan="3">
                                <asp:Label ID="Label33" runat="server" Font-Bold="True" ForeColor="White" Text="Modificar Cabecera de Solicitud"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label25" runat="server" ForeColor="White" Text="Solicitud"></asp:Label></td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="cabSolicitud" runat="server" Enabled="False" Font-Bold="True" Width="110px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label26" runat="server" ForeColor="White" Text="Centro de Costo"></asp:Label></td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="cabCentroCosto" runat="server" Enabled="False" Font-Bold="True"
                                    Width="496px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label27" runat="server" ForeColor="White" Text="Fecha Solicitud"></asp:Label></td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="cabFecha" runat="server" Font-Bold="True" Width="110px"></asp:TextBox>
                                <img id="cabImg" src="Img/calendario.gif" /></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label28" runat="server" ForeColor="White" Text="Modalidad"></asp:Label></td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="cabModalidad" runat="server" Enabled="False" Font-Bold="True" Width="496px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label29" runat="server" ForeColor="White" Text="Proveedor"></asp:Label></td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="cabProveedor" runat="server" Enabled="False" Font-Bold="True" Width="496px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label30" runat="server" ForeColor="White" Text="Concepto"></asp:Label></td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="cabConcepto" runat="server" MaxLength="240" onblur="conMayuscula(this)"
                                    TextMode="MultiLine" Width="900px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label31" runat="server" ForeColor="White" Text="Importe"></asp:Label></td>
                            <td>
                                <asp:Label ID="Label32" runat="server" BackColor="DeepSkyBlue" ForeColor="DeepSkyBlue" Text="Sep"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="cabImporte" runat="server" Enabled="False" Font-Bold="True" Width="144px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td align="center" colspan="3">
                                <asp:Button ID="cabGuardar" runat="server" Text="Guardar" Width="70px" />
                                <asp:Button ID="cabCancelar" runat="server" Text="Cancelar" Width="70px" /></td>
                        </tr>
                    </table>
                    <ajaxToolkit:CalendarExtender ID="CalendarExtender4" runat="server" Format="dd/MM/yyyy"
                        PopupButtonID="cabImg" TargetControlID="cabFecha">
                    </ajaxToolkit:CalendarExtender>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="panelModItem" runat="server" BackColor="CadetBlue" CssClass="generalFont" Visible="False"><table>
                    <tr>
                        <td align="center" colspan="3">
                            <asp:Label ID="Label34" runat="server" Font-Bold="True" ForeColor="White" Text="Modificar Cabecera de Documento"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label35" runat="server" ForeColor="White" Text="Solicitud"></asp:Label></td>
                        <td>
                        </td>
                        <td>
                            <asp:TextBox ID="itmSolicitud" runat="server" Enabled="False" Font-Bold="True" Width="110px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label36" runat="server" ForeColor="White" Text="Número Item"></asp:Label></td>
                        <td>
                        </td>
                        <td>
                            <asp:TextBox ID="itmItem" runat="server" Enabled="False" Font-Bold="True" Width="50px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label37" runat="server" ForeColor="White" Text="Fecha Documento"></asp:Label></td>
                        <td>
                        </td>
                        <td>
                            <asp:TextBox ID="itmFecha" runat="server" Font-Bold="True" Width="110px"></asp:TextBox>
                            <img id="itmImg" src="Img/calendario.gif" /></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label38" runat="server" ForeColor="White" Text="Número Documento"></asp:Label></td>
                        <td>
                        </td>
                        <td>
                            <asp:TextBox ID="itmSerie" runat="server" MaxLength="3" onblur="rellenarCeros(this,3)"
                                Width="30px"></asp:TextBox>-<asp:TextBox ID="itmDocumento" runat="server" onblur="rellenarCeros(this,10)"
                                    Width="90px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label39" runat="server" ForeColor="White" Text="Importe"></asp:Label></td>
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
                    <ajaxToolkit:CalendarExtender ID="CalendarExtender5" runat="server" Format="dd/MM/yyyy"
                        PopupButtonID="itmImg" TargetControlID="itmFecha">
                    </ajaxToolkit:CalendarExtender>
                </asp:Panel>
            </td>
        </tr>
    </table>
    <br />
    &nbsp;<br />
    <br />
    &nbsp;
</asp:Content>

