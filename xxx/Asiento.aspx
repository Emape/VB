<%@ page language="VB" masterpagefile="~/MasterPage.master" autoeventwireup="false" inherits="Asiento, App_Web_js1z4v53" title="Asiento Manual" culture="auto" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager id="ScriptManager1" EnableScriptGlobalization="true" EnableScriptLocalization="True" runat="server">
    </asp:ScriptManager>
    <table cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <asp:Panel ID="Panel1" runat="server" BackColor="PaleTurquoise">
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                <asp:TextBox ID="txtBuscar" runat="server" Width="200px"></asp:TextBox>
                                <asp:ImageButton ID="btnBuscar" runat="server" ImageUrl="~/Img/BotonBuscar.gif" />
                                <asp:Label ID="Label7" runat="server" ForeColor="PeachPuff" Text="..."></asp:Label></td>
                            <td align="left">
                                &nbsp;<asp:ImageButton ID="btnNuevo" runat="server" ImageUrl="~/Img/btnNuevo.jpg"
                                    ToolTip="Nuevo Asiento" /></td>
                            <td>
                                <asp:ImageButton ID="btnModificar" runat="server" ImageUrl="~/Img/BotonEditarItem.gif"
                                    ToolTip="Modificar Asiento" Width="30px" /></td>
                            <td align="right">
                                <asp:ImageButton ID="btnCerrar" runat="server" ImageUrl="~/Img/Salir.jpg"
                                    ToolTip="Cerrar Formulario" Width="25px" /></td>
                        </tr>
                        <tr>
                            <td colspan="4" align="center">
                                <asp:GridView ID="grdvAsiento" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                    BorderColor="DarkRed" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" Font-Names="Arial"
                                    Font-Size="8pt" ForeColor="#333333" PageSize="14">
                                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                                    <Columns>
                                        <asp:BoundField DataField="IdAsiento" HeaderText="Num.Asiento" />
                                        <asp:BoundField DataField="TipoAsiento" HeaderText="Tipo Asiento" />
                                        <asp:BoundField DataField="Fecha" HeaderText="Fecha" />
                                        <asp:BoundField DataField="TipoDocumento" HeaderText="TipoDoc" />
                                        <asp:BoundField DataField="IdDocumento" HeaderText="NumeroDoc" />
                                        <asp:BoundField DataField="FechaDocumento" HeaderText="FechaDoc" />
                                        <asp:BoundField DataField="Moneda" HeaderText="Moneda">
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="AuxiliarCtb" HeaderText="Codigo" />
                                        <asp:BoundField DataField="Referencia" HeaderText="Referencia" />
                                        <asp:BoundField DataField="Glosa" HeaderText="Glosa" >
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="Ok">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ImageButton2" runat="server" CommandName="Elegir" ImageUrl="~/Img/Elegir1.jpg" Width="19px" />
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
                                <asp:GridView ID="grdvAsientoItem" runat="server" AutoGenerateColumns="False" BorderWidth="1px"
                                    CellPadding="2" Font-Names="Arial" Font-Size="9pt" ForeColor="Black" BackColor="LightGoldenrodYellow" BorderColor="Tan">
                                    <Columns>
                                        <asp:BoundField DataField="Cuenta" HeaderText="Cuenta" />
                                        <asp:BoundField DataField="Nombre" HeaderText="Nombre" >
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Debe" DataFormatString="{0:N2}" HeaderText="Debe" HtmlEncode="False">
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Haber" DataFormatString="{0:N2}" HeaderText="Haber" HtmlEncode="False" >
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                    </Columns>
                                    <FooterStyle BackColor="Tan" />
                                    <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                                    <HeaderStyle BackColor="Tan" Font-Bold="True" />
                                    <AlternatingRowStyle BackColor="PaleGoldenrod" />
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="Panel2" runat="server" BackColor="LightSkyBlue" Visible="False">
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td colspan="3">
                            <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label1" runat="server" Text="Tipo Asiento" Font-Names="Arial" Font-Size="0.8em"></asp:Label></td>
                                        <td>
                                            <asp:DropDownList ID="cmbTipoAsiento" runat="server" AutoPostBack="True" Font-Names="Arial" Font-Size="0.8em">
                                            </asp:DropDownList></td>
                                        <td>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label2" runat="server" Text="Fecha asiento" Font-Names="Arial" Font-Size="0.8em"></asp:Label></td>
                                        <td>
                                            <asp:UpdatePanel id="UpdatePanel1" runat="server">
                                                <contenttemplate>
<ajaxToolkit:CalendarExtender id="CalendarExtender1" runat="server" PopupButtonID="imgFecha" TargetControlID="txtFecha" Format="dd/MM/yyyy"></ajaxToolkit:CalendarExtender><asp:TextBox onblur="validaFecha('txtFecha')" id="txtFecha" runat="server" Width="104px"></asp:TextBox><IMG id="imgFecha" src="Img/calendario.gif" /> 
</contenttemplate>
                                            </asp:UpdatePanel></td>
                                        <td>
                                        </td>
                                        <td style="width: 50px">
                                            <asp:Label ID="Label3" runat="server" Text="Moneda" Font-Names="Arial" Font-Size="0.8em"></asp:Label></td>
                                        <td>
                                            <asp:DropDownList ID="cmbMoneda" runat="server" AutoPostBack="True">
                                                <asp:ListItem Value="N">Nacional</asp:ListItem>
                                                <asp:ListItem Value="E">Extranjera</asp:ListItem>
                                            </asp:DropDownList></td>
                                        <td align="right">
                                            <asp:Label ID="Label10" runat="server" BackColor="LightSkyBlue" ForeColor="LightSkyBlue"
                                                Text="..."></asp:Label>
                                            <asp:Button ID="btnGuardar" runat="server" Text="Guardar" Width="75px" Enabled="False" /></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label4" runat="server" Text="Tipo Doc" Font-Names="Arial" Font-Size="0.8em"></asp:Label></td>
                                        <td>
                                            <asp:DropDownList ID="cmbTipoDoc" runat="server" AutoPostBack="True" Font-Names="Arial" Font-Size="0.8em">
                                            </asp:DropDownList></td>
                                        <td>
                                            <asp:Label ID="Label19" runat="server" BackColor="LightSkyBlue" ForeColor="LightSkyBlue" Text="..."></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label5" runat="server" Text="Num Doc" Font-Names="Arial" Font-Size="0.8em"></asp:Label></td>
                                        <td>
                                            <asp:TextBox ID="txtNumDoc" runat="server" Font-Names="Arial" Font-Size="0.8em"></asp:TextBox></td>
                                        <td>
                                            <asp:Label ID="Label9" runat="server" BackColor="LightSkyBlue" ForeColor="LightSkyBlue"
                                                Text="..."></asp:Label></td>
                                        <td style="width: 50px">
                                            <asp:Label ID="Label13" runat="server" Font-Names="Arial" Font-Size="0.8em" Text="Fecha Doc."></asp:Label></td>
                                        <td><asp:UpdatePanel id="UpdatePanel2" runat="server">
                                            <contenttemplate>
<ajaxToolkit:CalendarExtender id="CalendarExtender2" runat="server" PopupButtonID="imgFechaDoc" TargetControlID="txtFechaDoc" Format="dd/MM/yyyy"></ajaxToolkit:CalendarExtender><asp:TextBox id="txtFechaDoc" runat="server" onblur="validaFecha('txtFechaDoc')" Width="104px"></asp:TextBox><IMG id="imgFechaDoc" src="Img/calendario.gif" /> 
</contenttemplate>
                                        </asp:UpdatePanel>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label11" runat="server" BackColor="LightSkyBlue" ForeColor="LightSkyBlue"
                                                Text="..."></asp:Label>
                                            <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" Width="75px" /></td>
                                    </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label8" runat="server" Font-Names="Arial" Font-Size="0.8em" Text="Glosa"></asp:Label></td>
                                    <td colspan="7">
                                            <asp:TextBox ID="txtGlosa" runat="server" onblur="conMayuscula('txtGlosa')" TextMode="MultiLine" Width="528px" Font-Names="Arial" Font-Size="0.8em"></asp:TextBox></td>
                                    <td colspan="1">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 25px">
                                        <asp:Label ID="Label6" runat="server" Font-Names="Arial" Font-Size="0.8em" Text="Proveedor"></asp:Label></td>
                                    <td colspan="6" style="height: 25px">
                                        <asp:TextBox ID="txtProveedor" runat="server" Enabled="False" Font-Bold="True" Width="400px"></asp:TextBox>
                                        <asp:Button ID="btnProveedor" runat="server" Text=". . ." /></td>
                                    <td style="height: 25px">
                                        </td>
                                    <td style="height: 25px">
                                    </td>
                                </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label12" runat="server" Font-Names="Arial" Font-Size="0.8em" Text="Cheque"></asp:Label></td>
                                        <td colspan="7">
                                            <asp:TextBox ID="txtReferencia" runat="server" Width="144px"></asp:TextBox></td>
                                        <td colspan="1">
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td rowspan="3">
                                            <asp:Panel ID="panelAuxi1" runat="server" BackColor="RosyBrown" Visible="False">
                                <asp:TextBox ID="txtBuscarAuxi" runat="server" Width="140px"></asp:TextBox><asp:ImageButton
                                    ID="btnBuscarAuxi" runat="server" ImageUrl="~/Img/BotonBuscar.gif" /><br />
                                                <asp:GridView
                                        ID="grdvAuxiliarCTB" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                        CellPadding="4" Font-Names="Arial" Font-Size="9pt" ForeColor="#333333" GridLines="None"
                                        PageSize="13">
                                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                                        <Columns>
                                            <asp:BoundField DataField="Auxiliar" HeaderText="C&#243;digo" />
                                            <asp:BoundField DataField="Ruc" HeaderText="Ruc">
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
                                            </asp:Panel>
                                        </td>
                                        <td rowspan="3">
                                            <asp:Panel ID="panelCta1" runat="server" BackColor="Sienna" Visible="False">
                                                <asp:TextBox ID="txtBuscarCta" runat="server" Width="140px"></asp:TextBox><asp:ImageButton
                                    ID="btnBuscarCta" runat="server" ImageUrl="~/Img/BotonBuscar.gif" /><br />
                                                <asp:GridView
                                        ID="grdvCuenta" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                        CellPadding="4" Font-Names="Arial" Font-Size="9pt" ForeColor="#333333" GridLines="None"
                                        PageSize="13">
                                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                                        <Columns>
                                            <asp:BoundField DataField="Cuenta" HeaderText="Cuenta">
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
                                            </asp:Panel>
                                        </td>
                                        <td>
                                            <asp:Panel ID="panelConDina" runat="server" BackColor="SpringGreen" Visible="False">
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label27" runat="server" Text="Gasto"></asp:Label></td>
                                                        <td>
                                                            <asp:DropDownList ID="cmbGastoFin" runat="server">
                                                            </asp:DropDownList></td>
                                                        <td>
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label28" runat="server" Text="Banco"></asp:Label></td>
                                                        <td>
                                                            <asp:DropDownList ID="cmbBanco" runat="server">
                                                            </asp:DropDownList></td>
                                                        <td>
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label29" runat="server" Text="Importe"></asp:Label></td>
                                                        <td>
                                                            <asp:TextBox ID="txtImporteGasto" runat="server" onkeypress="return numDecimal(event)" onblur="formatoNum('txtImporteGasto')" Width="100px">0</asp:TextBox></td>
                                                        <td>
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center" colspan="2">
                                                            <asp:Button ID="btnConDinamica" runat="server" Text="Aceptar" /></td>
                                                        <td>
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="height: 21px">
                                                            <asp:Label ID="Label14" runat="server" BackColor="SpringGreen" ForeColor="SpringGreen"
                                                                Text="..."></asp:Label></td>
                                                        <td style="height: 21px">
                                                            <asp:Label ID="Label20" runat="server" BackColor="SpringGreen" ForeColor="LightSkyBlue"
                                                                Text="..."></asp:Label></td>
                                                        <td style="height: 21px">
                                                            <asp:Label ID="Label21" runat="server" BackColor="SpringGreen" ForeColor="LightSkyBlue"
                                                                Text="..."></asp:Label></td>
                                                        <td style="height: 21px">
                                                            <asp:Label ID="Label25" runat="server" BackColor="SpringGreen" ForeColor="LightSkyBlue"
                                                                Text="..."></asp:Label></td>
                                                        <td style="height: 21px">
                                                            <asp:Label ID="Label26" runat="server" BackColor="SpringGreen" ForeColor="LightSkyBlue"
                                                                Text="..."></asp:Label></td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Panel ID="panelSinDina" runat="server" BackColor="OliveDrab">
                                                <table>
                                                    <tr>
                                                        <td>
                                            <asp:Button ID="btnNuevaCta" runat="server" Text="Nuevo Item" /></td>
                                                        <td>
                                            <asp:Button ID="btnQuitarCta" runat="server" Text="Quitar Item" Visible="False" /></td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            </td>
                                                        <td>
                                                            </td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Panel ID="panelItem1" runat="server" BackColor="DarkOrange" Visible="False">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label15" runat="server" Text="Imp.Debe" Font-Bold="True"></asp:Label></td>
                                        <td>
                                            <asp:Label ID="Label16" runat="server" Text="Imp.Haber" Font-Bold="True"></asp:Label></td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtDebe" runat="server" onkeypress="return numDecimal(event)" onblur="formatoNum('txtDebe')" Width="100px">0</asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="txtHaber" runat="server" onkeypress="return numDecimal(event)" onblur="formatoNum('txtHaber')" Width="100px">0</asp:TextBox></td>
                                        <td align="right">
                                            <asp:Button ID="btnInsertar" runat="server" Text="Actualizar" /></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                <asp:GridView ID="grdvDetalle" runat="server" AutoGenerateColumns="False" BorderWidth="1px"
                                    CellPadding="4" Font-Names="Arial" Font-Size="9pt" ForeColor="#333333">
                                    <RowStyle BackColor="#E3EAEB" />
                                    <Columns>
                                        <asp:BoundField DataField="ItemAsiento" HeaderText="Item" />
                                        <asp:BoundField DataField="Cuenta" HeaderText="Cuenta" />
                                        <asp:BoundField DataField="Nombre" HeaderText="Nombre" HtmlEncode="False" />
                                        <asp:BoundField DataField="Debe" DataFormatString="{0:N2}" HeaderText="Debe" HtmlEncode="False">
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Haber" DataFormatString="{0:N2}" HeaderText="Haber" HtmlEncode="False" >
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
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
                                        <td>
                                            <asp:Label ID="Label17" runat="server" Text="Total Debe" Font-Bold="True"></asp:Label></td>
                                        <td>
                                            <asp:Label ID="lblDebe" runat="server" Text="lblDebe" Font-Bold="True"></asp:Label></td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="height: 21px">
                                            <asp:Label ID="Label18" runat="server" Text="Total Haber" Font-Bold="True"></asp:Label></td>
                                        <td align="left" style="height: 21px">
                                            <asp:Label ID="lblHaber" runat="server" Text="lblHaber" Font-Bold="True"></asp:Label></td>
                                        <td align="center" style="height: 21px"></td>
                                    </tr>
                                </table>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="height: 28px">
                                            <asp:Label ID="Label22" runat="server" BackColor="LightSkyBlue" ForeColor="LightSkyBlue"
                                                Text="..."></asp:Label></td>
                                        <td style="height: 28px">
                                            <asp:Label ID="Label23" runat="server" BackColor="LightSkyBlue" ForeColor="LightSkyBlue"
                                                Text="..."></asp:Label></td>
                                        <td style="height: 28px">
                                            <asp:Label ID="Label24" runat="server" BackColor="LightSkyBlue" ForeColor="LightSkyBlue"
                                                Text="..."></asp:Label></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:Panel ID="Panel3" runat="server">
                                </asp:Panel>
                            </td>
                        </tr>
                                    &nbsp;
                                    &nbsp;
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

