<%@ page language="VB" masterpagefile="~/MasterPage.master" autoeventwireup="false" inherits="SolicitudPago, App_Web_js1z4v53" title="Solicitud Pago" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
</ajaxToolkit:ToolkitScriptManager>

<script type="text/javascript">
    jQuery(document).ready(function () {
      $("#txtPrueba").autocomplete({
        source: function (request, response) {
          PageMethods.ObtListaIdentificacion(request.term,
            function (data) {
              var ciudades = (typeof data) == 'string' ? eval('(' + data + ')') : data;
              response(ciudades);
            },
            fnLlamadaError);
        },
        minLength: 2
      });
    });
 
   function fnLlamadaError(excepcion) {
      alert('Ha ocurrido un error interno: ' + excepcion.get_message()); 
    }
  </script>

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
                                <asp:Label ID="Label41" runat="server" BackColor="#C0FFC0" ForeColor="#C0FFC0"
                                    Text="S"></asp:Label></td>
                            <td>
                                <asp:CheckBox ID="chkPorSolicitud" runat="server" Text="Por Solicitud" AutoPostBack="True" /></td>
                            <td>
                                <asp:Label ID="Label43" runat="server" BackColor="#C0FFC0" ForeColor="#C0FFC0"
                                    Text="Sep"></asp:Label></td>
                            <td>
                <asp:DropDownList ID="cmbCentroCosto" runat="server" AutoPostBack="True">
                </asp:DropDownList>
                                <asp:Label ID="Label46" runat="server" BackColor="#C0FFC0" ForeColor="#C0FFC0" Text="Sep"></asp:Label></td>
                            <td>
                                <asp:ImageButton ID="btnNuevo" runat="server" ImageUrl="~/Img/btnNuevo.jpg" ToolTip="Nueva Solicitud" /></td>
                            <td>
                                &nbsp;<asp:Label ID="Label53" runat="server" BackColor="#C0FFC0" ForeColor="#C0FFC0"
                                    Text="Sep"></asp:Label></td>
                            <td align="right">
                                <asp:ImageButton ID="btnInsertar" runat="server" ImageUrl="~/Img/Insertar.png" Width="23px" /></td>
                            <td align="right">
                                <asp:ImageButton ID="btnAnular" runat="server" ImageUrl="~/Img/button_cancel.gif"
                                    OnClientClick="return confirm('Desea realmente Anular la Solicitud?');" ToolTip="Anular Solicitud" Height="18px" /></td>
                            <td align="right">
                                <asp:ImageButton ID="btnCerrar" runat="server" ImageUrl="~/Img/BotonCerrarItem.jpg"
                                    ToolTip="Cerrar Formulario" Width="21px" /></td>
                        </tr>
                        <tr>
                            <td>
                                <ajaxToolkit:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" enabled="True"
                                servicepath="~/WebService/BuscarCC.asmx" minimumprefixlength="1" servicemethod="ObtListaIdentificacion"
                                enablecaching="true" targetcontrolid="txtPrueba" usecontextkey="True" completionsetcount="10"
                                completioninterval="0" >
                                </ajaxToolkit:AutoCompleteExtender>
                                &nbsp;
                                <asp:TextBox ID="txtPrueba" runat="server"></asp:TextBox></td>
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
                            <td align="right">
                            </td>
                            <td align="right">
                            </td>
                            <td align="right">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="10">
                                <asp:GridView ID="grdvSolicitudPago" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                    BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px"
                                    CellPadding="2" ForeColor="Black" GridLines="Vertical" PageSize="12">
                                    <RowStyle BackColor="#F7F7DE" />
                                    <Columns>
                                        <asp:BoundField DataField="IdSolicitudPago" HeaderText="Solicitud" />
                                        <asp:BoundField DataField="FechaSolicitudPago" HeaderText="Fecha" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="False" />
                                        <asp:BoundField DataField="DescripTipo" HeaderText="Modalidad" />
                                        <asp:BoundField DataField="RazonSocial" HeaderText="Proveedor" />
                                        <asp:BoundField DataField="Descripcion" HeaderText="Concepto" />
                                        <asp:BoundField DataField="ValorTotalMN" HeaderText="Importe" DataFormatString="{0:N2}" HtmlEncode="False" />
                                        <asp:BoundField DataField="ValorVentaMN" HeaderText="Valor" DataFormatString="{0:N2}" HtmlEncode="False" />
                                        <asp:BoundField DataField="Impuesto1" HeaderText="Impuesto" DataFormatString="{0:N2}" HtmlEncode="False" />
                                        <asp:BoundField DataField="DescripSituacion" HeaderText="Situaci&#243;n" >
                                            <ItemStyle HorizontalAlign="Left" />
                                            <ControlStyle ForeColor="Red" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Iniciales" HeaderText="USR" />
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
                            <td colspan="10">
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
                                        <asp:BoundField DataField="IdContrato" HeaderText="Contrato" />
                                        <asp:BoundField DataField="NroSuspension" HeaderText="Suspensi&#243;n" />
                                        <asp:BoundField DataField="FechaSuspension" HeaderText="F.Suspension" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="False" />
                                        <asp:BoundField DataField="DescripServicio" HeaderText="Servicio" />
                                        <asp:BoundField DataField="BaseImponibleMN" DataFormatString="{0:N2}" HeaderText="Valor" HtmlEncode="False" />
                                        <asp:BoundField DataField="Impuesto1MN" HeaderText="Impuesto" DataFormatString="{0:N2}" HtmlEncode="False" />
                                        <asp:BoundField DataField="ValorTotalMN" HeaderText="Importe" DataFormatString="{0:N2}" HtmlEncode="False" />
                                        <asp:TemplateField HeaderText="Modifica">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ImageButton4" runat="server" CommandName="ItmModifica" ImageUrl="~/Img/edit.gif"
                                                    Width="15px" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Anula">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ImageButton5" runat="server" OnClientClick="return confirm('Desea realmente Anular el Item de la Solicitud?');" CommandName="ItmAnular" ImageUrl="~/Img/BotonQuitarItem.gif"
                                                    Width="18px" />
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
                <asp:Panel ID="panelMovimiento" runat="server" BackColor="AliceBlue" Visible="False" CssClass="generalFont" GroupingText="SOLICITUD NUEVA">
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label6" runat="server" Text="Solicitud "></asp:Label><asp:TextBox ID="txtIdSolicitud" runat="server" Width="110px" Enabled="False" Font-Bold="True" ForeColor="Red"></asp:TextBox></td>
                                        <td>
                                            <asp:UpdatePanel id="UpdatePanel3" runat="server">
                                                <contenttemplate>
<ajaxToolkit:CalendarExtender id="CalendarExtender3" runat="server" CssClass="Calendar" TargetControlID="txtFechaSolicitud" PopupButtonID="ImgFechaSolicitud" Format="dd/MM/yyyy"></ajaxToolkit:CalendarExtender> <asp:Label id="Label60" runat="server" Text="Fecha"></asp:Label>&nbsp;<asp:TextBox id="txtFechaSolicitud" runat="server" Width="110px"></asp:TextBox><IMG id="ImgFechaSolicitud" src="Img/calendario.gif" /> 
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
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label7" runat="server" Text="Centro Costo"></asp:Label><asp:DropDownList ID="cmbCentroCosto1" runat="server" AutoPostBack="True">
            </asp:DropDownList></td>
                                        <td>
                                            <asp:Label ID="Label9" runat="server" Text="Modalidad"></asp:Label><asp:DropDownList ID="cmbTipoContrato" runat="server" AutoPostBack="True">
                </asp:DropDownList>
                                            <asp:Label ID="lblNuevo" runat="server" Text="Nuevo"></asp:Label></td>
                                        <td align="right">
                                <asp:Label ID="Label8" runat="server" Text="Tipo Documento"></asp:Label><asp:DropDownList ID="cmbTipoDoc" runat="server" AutoPostBack="True">
                            </asp:DropDownList></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="txtBuscaProveedor" runat="server" Width="200px"></asp:TextBox><asp:ImageButton
                                    ID="btnBuscaProveedor" runat="server" ImageUrl="~/Img/BotonBuscar.gif" /><asp:Label
                                        ID="FlagFecNac" runat="server" Text="FechaNacimientoParaAFP" Visible="False"></asp:Label><br />
                <asp:GridView ID="grdvContratos" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="1"
                    Font-Names="Arial" Font-Size="8pt" ForeColor="Black" PageSize="8" CellSpacing="1">
                    <Columns>
                        <asp:BoundField DataField="Orden" HeaderText="Orden" >
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="IdContrato" HeaderText="Contrato" />
                        <asp:BoundField DataField="IdProveedor" HeaderText="Proveedor" />
                        <asp:BoundField DataField="RazonSocial" HeaderText="Nombre" />
                        <asp:BoundField DataField="FechaInicio" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Fecha Inicio"
                            HtmlEncode="False" />
                        <asp:BoundField DataField="FechaTermino" HeaderText="Fecha Fin" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="False">
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Objeto" HeaderText="Objeto">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ItemContrato" HeaderText="Item" >
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Descripcion" HeaderText="Servicio" />
                        <asp:BoundField DataField="Porcentaje" DataFormatString="{0:N2}" HeaderText="%"
                            HtmlEncode="False" >
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="MontoTurno" DataFormatString="{0:N2}" HeaderText="Imp.Turno"
                            HtmlEncode="False" />
                        <asp:BoundField DataField="MontoHora" DataFormatString="{0:N2}" HeaderText="Imp.Hora"
                            HtmlEncode="False" />
                        <asp:BoundField DataField="SaldoContrato" DataFormatString="{0:N2}" HeaderText="Saldo" HtmlEncode="False">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ValorTotalMN" DataFormatString="{0:N2}" HeaderText="Importe Pago" >
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
                                            <asp:Label ID="lblSep1" runat="server" BackColor="Transparent" ForeColor="Transparent"
                                                Text="Sep"></asp:Label></td>
                                        <td>
                                            <asp:Label ID="Label24" runat="server" BackColor="AliceBlue" ForeColor="Red"
                                                Text="Items"></asp:Label></td>
                                        <td>
                                            <asp:TextBox ID="txtTotalItems" runat="server" Enabled="False" Font-Bold="True" Font-Names="Calibri"
                                                Font-Size="10pt" Width="60px">0</asp:TextBox></td>
                                        <td>
                                            <asp:Label ID="lblSep2" runat="server" BackColor="Transparent" ForeColor="Transparent"
                                                Text="Sep"></asp:Label></td>
                                        <td>
                                            <asp:Label ID="Label14" runat="server" BackColor="AliceBlue" ForeColor="Red"
                                                Text="Valor"></asp:Label></td>
                                        <td>
                                            <asp:TextBox ID="txtTotalValor" runat="server" Enabled="False" Font-Bold="True" Width="110px" Font-Names="Calibri" Font-Size="10pt">0</asp:TextBox></td>
                                        <td>
                                            <asp:Label ID="lblSep3" runat="server" BackColor="Transparent" ForeColor="Transparent"
                                                Text="Sep"></asp:Label></td>
                                        <td>
                                            <asp:Label ID="Label16" runat="server" BackColor="AliceBlue" ForeColor="Red"
                                                Text="Impuesto"></asp:Label></td>
                                        <td>
                                            <asp:TextBox ID="txtTotalImpuesto" runat="server" Enabled="False" Font-Bold="True" Width="80px" Font-Names="Calibri" Font-Size="10pt">0</asp:TextBox></td>
                                        <td>
                                            <asp:Label ID="lblSep4" runat="server" BackColor="Transparent" ForeColor="Transparent"
                                                Text="Sep"></asp:Label></td>
                                        <td>
                                            <asp:Label ID="Label19" runat="server" BackColor="AliceBlue" ForeColor="Red"
                                                Text="Total"></asp:Label></td>
                                        <td>
                                            <asp:TextBox ID="txtTotal" runat="server" Enabled="False" Font-Bold="True" Font-Names="Calibri"
                                                Font-Size="10pt" Width="110px">0</asp:TextBox></td>
                                        <td>
                                            <asp:Label ID="lblSep5" runat="server" BackColor="Transparent" ForeColor="Transparent"
                                                Text="Sep"></asp:Label></td>
                                        <td>
                                            <asp:Label ID="Label21" runat="server" BackColor="AliceBlue" ForeColor="Red"
                                                Text="Desctos"></asp:Label></td>
                                        <td>
                                            <asp:TextBox ID="txtTotalDescuento" runat="server" Enabled="False" Font-Bold="True"
                                                Font-Names="Calibri" Font-Size="10pt" Width="80px">0</asp:TextBox></td>
                                        <td>
                                            <asp:Label ID="lblSep6" runat="server" BackColor="Transparent" ForeColor="Transparent"
                                                Text="Sep"></asp:Label></td>
                                        <td>
                                            <asp:Label ID="Label22" runat="server" BackColor="AliceBlue" ForeColor="Red"
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
<ajaxToolkit:CalendarExtender id="CalendarExtender1" runat="server" CssClass="Calendar" TargetControlID="txtFechaDoc" PopupButtonID="ImgFechaDoc" Format="dd/MM/yyyy"></ajaxToolkit:CalendarExtender> <asp:TextBox id="txtFechaDoc" runat="server" Width="110px"></asp:TextBox><IMG id="ImgFechaDoc" src="Img/calendario.gif" /> 
</ContentTemplate>
                                </asp:UpdatePanel></td>
                            <td>
                            </td>
                            <td>
                                <asp:Label ID="Label2" runat="server" Text="Partida"></asp:Label>&nbsp;</td>
                            <td>
                                <asp:Label ID="lblPartida" runat="server" Text="Partida"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label12" runat="server" Text="Nro.Atenciones"></asp:Label></td>
                            <td>
                                <strong>
                                <asp:TextBox ID="txtNumeroAtenciones" runat="server" onkeypress="return numDecimal(event)" Font-Bold="True" Width="110px">0</asp:TextBox></strong></td>
                            <td>
                            </td>
                            <td>
                                </td>
                            <td>
                </td>
                            <td>
                            </td>
                            <td>
                                <asp:Label ID="lblTipoContrato" runat="server" Text="lbl Tipo"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="txtTipoContrato" runat="server" onkeypress="return numDecimal(event)" Width="110px">0</asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label11" runat="server" Text="Importe"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="txtImporteDoc" runat="server" Width="110px" Enabled="False" Font-Bold="True">0</asp:TextBox></td>
                            <td>
                            </td>
                            <td>
                                <asp:Label ID="lblImpuesto" runat="server" Text="Impuesto"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="txtImpuesto" runat="server" Enabled="False" Font-Bold="True" Width="110px">0</asp:TextBox></td>
                            <td>
                                </td>
                            <td>
                                <asp:Label ID="lblNeto" runat="server" Text="Neto"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="txtNeto" runat="server" Enabled="False" Font-Bold="True" Width="110px">0</asp:TextBox></td>
                        </tr>
                        <tr>
                            <td colspan="8">
                                <asp:Panel ID="panelHonorario" runat="server" BackColor="LightCyan">
                                    <table style="border-right: black thin solid; border-top: black thin solid; border-left: black thin solid; border-bottom: black thin solid; background-color: whitesmoke">
                                        <tr>
                                            <td>
                                <asp:Label ID="lblSuspension" runat="server" Text="Suspensión"></asp:Label></td>
                                            <td>
                                <asp:TextBox ID="txtSuspension" runat="server" Width="110px"></asp:TextBox></td>
                                            <td>
                                                <asp:Label ID="Label48" runat="server" BackColor="WhiteSmoke" ForeColor="White" Text="Separ"></asp:Label></td>
                                            <td>
                                <asp:Label ID="lblFecSuspension" runat="server" Text="Fec. Suspensión"></asp:Label></td>
                                            <td>
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>
<ajaxToolkit:CalendarExtender id="CalendarExtender2" runat="server" CssClass="Calendar" TargetControlID="txtFecSuspension" PopupButtonID="ImgFecSuspension" Format="dd/MM/yyyy"></ajaxToolkit:CalendarExtender> <asp:TextBox id="txtFecSuspension" runat="server" Width="110px"></asp:TextBox><IMG id="ImgFecSuspension" src="Img/calendario.gif" /> 
</ContentTemplate>
                                </asp:UpdatePanel></td>
                                            <td>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblPagoAnterior" runat="server" Text="Pagos anteriores" BorderColor="Blue" BorderStyle="Solid" BorderWidth="1px"></asp:Label></td>
                                            <td>
                                                <asp:TextBox ID="txtPagoAnterior" runat="server" Enabled="False" Font-Bold="True"
                                                    Width="110px">0</asp:TextBox></td>
                                            <td>
                                                <asp:Label ID="Label52" runat="server" BackColor="WhiteSmoke" ForeColor="White" Text="Separ"></asp:Label></td>
                                            <td rowspan="2">
                                                <asp:RadioButtonList ID="rdbDescontar" runat="server">
                                                    <asp:ListItem Value="Menor">Descontar con MENOR tasa</asp:ListItem>
                                                    <asp:ListItem Value="Mayor">Descontar con MAYOR tasa</asp:ListItem>
                                                </asp:RadioButtonList></td>
                                        </tr>
                                        <tr>
                                            <td>
                                <asp:Label ID="Label40" runat="server" Text="Aporte"></asp:Label></td>
                                            <td>
                                <asp:TextBox ID="txtAporte" runat="server" Enabled="False" Font-Bold="True" Width="110px">0</asp:TextBox></td>
                                            <td>
                                                </td>
                                            <td>
                                <asp:Label ID="Label42" runat="server" Text="Seguro"></asp:Label></td>
                                            <td>
                                <asp:TextBox ID="txtSeguro" runat="server" Enabled="False" Font-Bold="True" Width="110px">0</asp:TextBox></td>
                                            <td>
                                                <asp:Label ID="Label63" runat="server" BackColor="WhiteSmoke" ForeColor="White" Text="Separ"></asp:Label></td>
                                            <td>
                                <asp:Label ID="Label44" runat="server" Text="Comisión"></asp:Label></td>
                                            <td>
                                <asp:TextBox ID="txtComision" runat="server" Enabled="False" Font-Bold="True" Width="48px">0</asp:TextBox></td>
                                            <td>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="8">
                                <asp:Panel ID="panelFactura" runat="server" BackColor="LightCyan" Visible="False"><table style="border-right: black thin solid; border-top: black thin solid; border-left: black thin solid; border-bottom: black thin solid; background-color: whitesmoke">
                                    <tr>
                                        <td>
                                <asp:Label ID="lblPorcentajeDetraccion" runat="server" ForeColor="Red" Text="% de Detracción"></asp:Label></td>
                                        <td>
                                <asp:TextBox ID="txtPorcentajeDetraccion" runat="server" Font-Bold="True" Width="110px" Enabled="False">0</asp:TextBox></td>
                                        <td>
                                            <asp:Label ID="Label56" runat="server" BackColor="WhiteSmoke" ForeColor="White" Text="Sep"></asp:Label></td>
                                        <td>
                                <asp:Label ID="lblDetraccion" runat="server" ForeColor="Red" Text="Monto Detracción"></asp:Label></td>
                                        <td>
                                <asp:TextBox ID="txtDetraccion" runat="server" Enabled="False" Font-Bold="True" Width="110px">0</asp:TextBox></td>
                                        <td>
                                            <asp:Label ID="Label45" runat="server" BackColor="WhiteSmoke" ForeColor="White" Text="Sep"></asp:Label></td>
                                        <td>
                                            <asp:Label ID="Label47" runat="server" BackColor="WhiteSmoke" ForeColor="White" Text="Sep"></asp:Label></td>
                                        <td>
                                            <asp:Label ID="Label49" runat="server" BackColor="WhiteSmoke" ForeColor="White" Text="Sep"></asp:Label></td>
                                    </tr>
                                </table>
                                </asp:Panel>
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
                            <td>
                                </td>
                            <td>
                                <asp:CheckBox ID="chkImpuesto" runat="server" Text="Impuesto" /></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblDescuentoJudicial" runat="server" Text="Dscto.Judicial" ForeColor="Red"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="txtDescuentoJudical" runat="server" onkeypress="return numDecimal(event)" Font-Bold="False"
                                    Width="110px">0</asp:TextBox></td>
                            <td>
                                <asp:Label ID="lbl3Meses" runat="server" BackColor="LightCyan" ForeColor="White"
                                    Text="Sep"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblTresMeses" runat="server" Text="Dscto 3 Prim.Meses" ForeColor="Red"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="txt3Meses" runat="server" onkeypress="return numDecimal(event)" Font-Bold="True" Width="110px">0</asp:TextBox></td>
                            <td>
                            </td>
                            <td>
                                <asp:Label ID="lblDesctoCajaMuni" runat="server" ForeColor="Red" Text="Otros Desctos"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="txtDesctoCajaMuni" runat="server" onkeypress="return numDecimal(event)" Font-Bold="True" Width="110px">0</asp:TextBox></td>
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
                            <td>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblObservacion" runat="server" ForeColor="Red" Text="Observación"></asp:Label></td>
                            <td colspan="7">
                                <asp:TextBox ID="txtObservacion" runat="server" onblur="conMayuscula(this)" Width="608px" TextMode="MultiLine" MaxLength="100"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                </td>
                            <td>
                                </td>
                            <td>
                                <asp:Label ID="Label3" runat="server" BackColor="LightCyan" ForeColor="White" Text="Sep"></asp:Label></td>
                            <td>
                            </td>
                            <td>
                                <asp:Label ID="lblFlagPasarAFP" runat="server" Text="PasarAFP"></asp:Label></td>
                            <td>
                                <asp:Label ID="Label5" runat="server" BackColor="LightCyan" ForeColor="White" Text="Sep"></asp:Label></td>
                            <td>
                            </td>
                            <td>
                                <asp:Label ID="lblCuentaBanco" runat="server" Text="CuentaBanco"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="center" colspan="8">
                                <asp:Button ID="btnCalcular" runat="server" Text="Calcular" Width="80px" />
                                <asp:Button ID="btnAceptar" runat="server" OnClientClick ="return validaSolicitud()" Text="Aceptar" Width="80px" />
                                <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" Width="80px" /></td>
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
                        PopupButtonID="itmImg" TargetControlID="itmFecha" CssClass="Calendar">
                    </ajaxToolkit:CalendarExtender>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="panelImprimir" runat="server" BackColor="DarkGoldenrod" Visible="False">
                    <table>
                        <tr>
                            <td align="center">
                                <asp:RadioButtonList ID="rdbImprimir" runat="server" RepeatDirection="Horizontal" ForeColor="White">
                                    <asp:ListItem Value="Imprimir">Imprimir</asp:ListItem>
                                    <asp:ListItem Value="Previsualizar">Vista previa</asp:ListItem>
                                </asp:RadioButtonList></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Panel ID="Panel3" runat="server">
                                    <table cellpadding="2" cellspacing="2">
                                        <tr>
                                            <td>
                                                <asp:Label ID="Label50" runat="server" Text="Seleccione Impresora" ForeColor="White"></asp:Label></td>
                                            <td>
                                                <asp:DropDownList ID="cmbImpresoras" runat="server">
                                                </asp:DropDownList></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="Label51" runat="server" Text="Número de copias" ForeColor="White"></asp:Label></td>
                                            <td>
                                                <asp:TextBox ID="txtNumeroCopias" runat="server" MaxLength="1" Width="40px">1</asp:TextBox></td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <asp:Button ID="btnImprimir" runat="server" Text="Aceptar" BackColor="White" Width="65px" />&nbsp;<asp:Button
                                    ID="Button1" runat="server" BackColor="White" Text="Cancelar" Width="65px" /></td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <br />
    &nbsp;<br />
    <br />
    &nbsp;
</asp:Content>

