﻿<%@ page language="VB" masterpagefile="~/MasterPage.master" autoeventwireup="false" inherits="RequerimientoBolsaTicket, App_Web_js1z4v53" title="Requerimiento Bolsa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></ajaxToolkit:ToolkitScriptManager>
<script type="text/javascript">
    /*
    var yPos;
    //var xPos;
    var prm = Sys.WebForms.PageRequestManager.getInstance();
    prm.add_beginRequest(BeginRequestHandler);
    prm.add_endRequest(EndRequestHandler);
    function BeginRequestHandler(sender, args) {
        //xPos = $get('scrollDiv').scrollLeft;
        yPos = $get('scrollDiv').scrollTop;
    }
    function EndRequestHandler(sender, args) {
        //$get('scrollDiv').scrollLeft = xPos;
        $get('scrollDiv').scrollTop = yPos;
    }
    */
</script>
        <table>
        <tr>
            <td><asp:ImageButton ID="btnNuevo" runat="server" ImageUrl="~/Img/BotonNuevoItem.gif"
                    ToolTip="Nuevo Documento" Width="19px" /></td>
            <td style="width: 1px"></td>
            <td><asp:ImageButton ID="btnModificar" runat="server" ImageUrl="~/Img/edit.gif"
                    ToolTip="Modificar Documento" Width="19px" style="height: 19px" /></td>
            <td style="width: 1px"></td>
            <td><asp:ImageButton ID="btnAnular" runat="server" ImageUrl="~/Img/button_cancel.gif"
                OnClientClick="return confirm('Desea realmente Anular la el Requerimiento?');" ToolTip="Anular Requerimiento" Height="15px" /></td>
            <td style="width: 1px"></td>
            <td><asp:ImageButton ID="btnCancelar" runat="server" Height="17px" ImageUrl="~/Img/BotonReestablecer.gif"
                    Style="width: 20px" ToolTip="Cancelar" /></td>
            <td style="width: 1px"></td>
            <td><asp:ImageButton ID="btnGuardar" runat="server" OnClientClick="return validaRequerimiento();" ImageUrl="~/Img/filesave.gif" 
                    Style="height: 17px" ToolTip="Guardar" /></td>
            <td style="width: 1px"></td>
            <td><asp:ImageButton ID="btnImprimir" runat="server" ImageUrl="~/Img/ImprimeLista.jpg" 
                    ToolTip="Imprimir" Width="19px" /></td>
            <td style="width: 1px"></td>
            <td><asp:ImageButton ID="btnCerrar" runat="server" Height="17px" ImageUrl="~/Img/Salir.jpg"
                    OnClientClick="return confirm('Desea realmente Cerrar el formulario?');" ToolTip="Cerrar" style="width: 16px" /></td>
        </tr>
    </table>
    <asp:Panel ID="panelCab" runat="server" CssClass="generalFont">
        <table>
            <tr>
                <td>
                    Año<br />
                    <asp:DropDownList ID="cmbAnno" runat="server">
                    </asp:DropDownList>
                </td>
                <td>
                    Requerimiento<br />
                    <asp:TextBox ID="txtRequerimiento" runat="server"></asp:TextBox>
                </td>
                <td>
                    Concepto<br />
                    <asp:TextBox ID="txtDescripcion" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:ImageButton ID="btnBuscarReq" runat="server" ImageUrl="~/Img/BotonBuscar.gif" />
                </td>
            </tr>
        </table>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate> 
        <div id="a1" style="width:1100px;">
        </div>
        <div id="scrollDiv" style="overflow:auto; height:150px; width:1118px;">
            <asp:GridView ID="grdvRequerimiento" runat="server" CellPadding="2" ForeColor="#333333" AutoGenerateColumns="False" BorderStyle="Solid" BorderWidth="1px" CssClass="generalFont" Width="100%">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Siglas" HeaderText="Gerencia" >
                    <ControlStyle Width="50px" />
                    <HeaderStyle Width="50px" />
                    <ItemStyle Width="50px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="IdRequerimiento" HeaderText="Requerimiento">
                    <ControlStyle Width="95px" />
                    <HeaderStyle Width="95px" />
                    <ItemStyle Width="95px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="BienServicio" HeaderText="Tipo" >
                    <ControlStyle Width="15px" />
                    <HeaderStyle Width="15px" />
                    <ItemStyle Width="15px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="FechaRequerimiento" HeaderText="Fecha" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="False">
                    <ControlStyle Width="90px" />
                    <HeaderStyle Width="90px" />
                    <ItemStyle Width="90px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="IdContrato" HeaderText="Contrato" >
                    <ControlStyle Width="80px" />
                    <HeaderStyle Width="80px" />
                    <ItemStyle Width="80px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="IdContratoClase" HeaderText="Clase" >
                    <ControlStyle Width="50px" />
                    <HeaderStyle Width="50px" />
                    <ItemStyle Width="50px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Descripcion" HeaderText="Concepto" />
                    <asp:BoundField DataField="CostoTotal" HeaderText="Importe" DataFormatString="{0:N2}" HtmlEncode="False">
                    <ControlStyle Width="50px" />
                    <HeaderStyle Width="50px" />
                    <ItemStyle Width="50px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="DesFlagEvaluado" HeaderText="Evaluado">
                    <ControlStyle Width="90px" />
                    <HeaderStyle Width="90px" />
                    <ItemStyle Width="90px" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Ok">
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButton2" runat="server" CommandName="itmVer" ImageUrl="~/Img/Elegir1.jpg" Width="19px" />
                        </ItemTemplate>
                        <HeaderStyle Width="20px" />
                        <ItemStyle Width="20px" />
                    </asp:TemplateField>
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            </asp:GridView>
        </div>
            <asp:GridView ID="grdvRequerimientoDetalle" runat="server" AutoGenerateColumns="False" CellPadding="2" EnableModelValidation="True" ForeColor="#333333" BorderStyle="Solid" BorderWidth="1px" CssClass="generalFont">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="IdNumeroItem" HeaderText="Item" />
                    <asp:BoundField DataField="IdBienServicio" HeaderText="Código" />
                    <asp:BoundField DataField="DescripcionCorta" HeaderText="U.M." />
                    <asp:BoundField DataField="DescripcionBienServicio" HeaderText="Descripción" />
                    <asp:BoundField DataField="CantidadItem" HeaderText="Cantidad" DataFormatString="{0:N3}" HtmlEncode="False" />
                    <asp:BoundField DataField="CostoItem" HeaderText="Costo" DataFormatString="{0:N3}" HtmlEncode="False" />
                    <asp:BoundField DataField="SubTotal" HeaderText="SubTotal" DataFormatString="{0:N2}" HtmlEncode="False" />
                </Columns>
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            </asp:GridView>        
        </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>    
    <asp:Panel ID="panelIng" runat="server" CssClass="generalFont" Visible="False">
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
        <table style="width: 100%">
            <tr>
                <td>
                    <table style="width: 100%">
                        <tr>
                            <td>
                                <asp:Label ID="Label1" runat="server" Text="Requerimiento"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtIdRequerimiento" runat="server" Enabled="False"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label2" runat="server" Text="Fecha"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtFecha" runat="server"></asp:TextBox>
                                <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd/MM/yyyy" PopupButtonID="txtFecha" TargetControlID="txtFecha" CssClass="Calendar"></ajaxToolkit:CalendarExtender>
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 19px">
                                <asp:Label ID="Label3" runat="server" Text="TC"></asp:Label>
                            </td>
                            <td style="height: 19px">
                                <asp:TextBox ID="txtTC" runat="server" Enabled="False"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label4" runat="server" Text="Moneda"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="cmbMoneda" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" colspan="2" style="height: 30px">
                                <asp:Label ID="Label5" runat="server" Text="Concepto"></asp:Label>
                                <br />
                                <asp:TextBox ID="txtConcepto" runat="server" onblur="conMayuscula(this)" Height="70px" TextMode="MultiLine" Width="230px" MaxLength="254"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2" style="height: 30px">
                                <asp:HiddenField ID="HiddenInsert" runat="server" />
                            </td>
                        </tr>
                    </table>
                </td>
                <td align ="left">
                   <asp:Panel ID="panelContrato" runat="server" HorizontalAlign="Left">
                       <div id="a2" style="width:800px;">
                      </div>
                      <div style="overflow:auto; height:200px; width:818px;">
                        <asp:GridView ID="grdvContrato" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="100%">
                            <AlternatingRowStyle BackColor="#DCDCDC" />
                            <Columns>
                                <asp:BoundField DataField="fkContrato" HeaderText="Key" >
                                <ControlStyle Width="70px" />
                                <HeaderStyle Width="70px" />
                                <ItemStyle Width="70px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="idContrato" HeaderText="Contrato">
                                <ControlStyle Width="95px" />
                                <HeaderStyle Width="95px" />
                                <ItemStyle Width="95px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="IdContratoClase" HeaderText="Clase">
                                <ControlStyle Width="50px" />
                                <HeaderStyle Width="50px" />
                                <ItemStyle Width="50px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="idTipocontrato" HeaderText="Tipo" >
                                <ControlStyle Width="50px" />
                                <HeaderStyle Width="50px" />
                                <ItemStyle Width="50px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="IdCentroCosto" HeaderText="C.Costo">
                                <ControlStyle Width="70px" />
                                <HeaderStyle Width="70px" />
                                <ItemStyle Width="70px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Objeto" HeaderText="Objeto" />
                                <asp:BoundField DataField="ValorContrato" DataFormatString="{0:N2}" HeaderText="Importe" HtmlEncode="False" >
                                <ControlStyle Width="85px" />
                                <HeaderStyle Width="85px" />
                                <ItemStyle Width="85px" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="Ok">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/Img/Elegir1.jpg" Width="19px" CommandName="itmDetalle" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                    <HeaderStyle Width="20px" />
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                            </Columns>
                            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#0000A9" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#000065" />
                        </asp:GridView>
                      </div>
                       <asp:GridView ID="grdvContratoItem" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333">
                           <AlternatingRowStyle BackColor="White" />
                           <Columns>
                               <asp:BoundField DataField="pkContrato" HeaderText="Key" />
                               <asp:BoundField DataField="IdBienServicio" HeaderText="Código" />
                               <asp:BoundField DataField="DescripcionUM" HeaderText="U.M." />
                               <asp:BoundField DataField="DescripcionBien" HeaderText="Descripción" />
                               <asp:BoundField DataField="RedVial" HeaderText="Via" />
                               <asp:BoundField DataField="idUnidadMedidaVia" HeaderText="Medida" />
                               <asp:BoundField DataField="TramoIni" HeaderText="Tramo Ini" />
                               <asp:BoundField DataField="TramoFin" HeaderText="Tramo Fin" />
                               <asp:BoundField DataField="CantidadItem" DataFormatString="{0:N2}" HeaderText="Cantidad" HtmlEncode="False" />
                               <asp:BoundField DataField="CostoItem" DataFormatString="{0:N2}" HeaderText="Costo unitario" HtmlEncode="False" />
                               <asp:BoundField DataField="SubTotalItem" DataFormatString="{0:N2}" HeaderText="SubTotal" HtmlEncode="False" />
                               <asp:BoundField DataField="idMovimiento" HeaderText="Reserva" />
                               <asp:TemplateField HeaderText="Ok">
                                   <ItemTemplate>
                                       <asp:ImageButton ID="ImageButton7" runat="server" ImageUrl="~/Img/Elegir1.jpg" Width="19px" CommandName="itmPartida" />
                                   </ItemTemplate>
                               </asp:TemplateField>
                           </Columns>
                           <EditRowStyle BackColor="#2461BF" />
                           <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                           <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                           <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                           <RowStyle BackColor="#EFF3FB" />
                           <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                           <SortedAscendingCellStyle BackColor="#F5F7FB" />
                           <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                           <SortedDescendingCellStyle BackColor="#E9EBEF" />
                           <SortedDescendingHeaderStyle BackColor="#4870BE" />
                       </asp:GridView>
                   </asp:Panel>
                   <asp:Panel ID="panelPartida" runat="server" Visible="False">                       
                      <div id="b1" style="width:600px;">
                      </div>
                      <div style="overflow:auto; float:left; height:150px; width:618px;">
                          <asp:GridView ID="grdvClasificador" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" Width="100%">
                              <AlternatingRowStyle BackColor="#DCDCDC" />
                              <Columns>
                                  <asp:BoundField DataField="ClasificadorNew" HeaderText="Clasificador">
                                  <ControlStyle Width="95px" />
                                  <HeaderStyle Width="95px" />
                                  <ItemStyle Width="95px" />
                                  </asp:BoundField>
                                  <asp:BoundField DataField="Descripcion" HeaderText="Descripción" />
                                  <asp:TemplateField HeaderText="Ok">
                                      <ItemTemplate>
                                          <asp:ImageButton ID="ImageButton7" runat="server" CommandName="Select" ImageUrl="~/Img/Elegir1.jpg" Width="19px" />
                                      </ItemTemplate>
                                      <ItemStyle HorizontalAlign="Center" />
                                      <HeaderStyle Width="20px" />
                                      <ItemStyle Width="20px" />
                                  </asp:TemplateField>
                              </Columns>
                              <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                              <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                              <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                              <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                              <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                              <SortedAscendingCellStyle BackColor="#F1F1F1" />
                              <SortedAscendingHeaderStyle BackColor="#0000A9" />
                              <SortedDescendingCellStyle BackColor="#CAC9C9" />
                              <SortedDescendingHeaderStyle BackColor="#000065" />
                          </asp:GridView>
                      </div>
                       <div style="float:left; width:160px;">
                           C.Costo <asp:DropDownList ID="cmbCentroCosto" runat="server" AutoPostBack="True"></asp:DropDownList>
                           <asp:Button ID="btnAgregarItem" runat="server" Text="Agregar al Detalle" />
                           <asp:Button ID="btnCancelarItem" runat="server" Text="Cancelar" />
                       </div>        
                      <div id="b2" style="width:870px;">
                      </div>
                      <div style="overflow:auto; height:150px; width:888px;">
                          <asp:GridView ID="grdvActiFinaliMeta" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Width="100%">
                              <AlternatingRowStyle BackColor="#CCCCCC" />
                              <Columns>
                                  <asp:BoundField DataField="IdCentroCosto" HeaderText="C.Costo">
                                  <ControlStyle Width="60px" />
                                  <HeaderStyle Width="60px" />
                                  <ItemStyle Width="60px" />
                                  </asp:BoundField>
                                  <asp:BoundField DataField="Descripcion" HeaderText="Descripción" />
                                  <asp:BoundField DataField="IdProyecto" HeaderText="Activi." >
                                  <ControlStyle Width="60px" />
                                  <HeaderStyle Width="60px" />
                                  <ItemStyle Width="60px" />
                                  </asp:BoundField>
                                  <asp:BoundField DataField="IdFinalidad" HeaderText="Finalidad" >
                                  <ControlStyle Width="60px" />
                                  <HeaderStyle Width="60px" />
                                  <ItemStyle Width="60px" />
                                  </asp:BoundField>
                                  <asp:BoundField DataField="Meta" HeaderText="Meta" >
                                  <ControlStyle Width="40px" />
                                  <HeaderStyle Width="40px" />
                                  <ItemStyle Width="40px" />
                                  </asp:BoundField>
                                  <asp:BoundField DataField="IdTarea" HeaderText="Tarea" >
                                  <ControlStyle Width="40px" />
                                  <HeaderStyle Width="40px" />
                                  <ItemStyle Width="40px" />
                                  </asp:BoundField>
                                  <asp:BoundField DataField="ClasificadorFuncional" HeaderText="CL" >
                                  <ControlStyle Width="80px" />
                                  <HeaderStyle Width="80px" />
                                  <ItemStyle Width="80px" />
                                  </asp:BoundField>
                                  <asp:BoundField DataField="IdTipo" HeaderText="Tipo" >
                                  <ControlStyle Width="30px" />
                                  <HeaderStyle Width="30px" />
                                  <ItemStyle Width="30px" />
                                  </asp:BoundField>
                                  <asp:BoundField DataField="IdFuenteFinanciamiento" HeaderText="Fuente" >
                                  <ControlStyle Width="45px" />
                                  <HeaderStyle Width="45px" />
                                  <ItemStyle Width="45px" />
                                  </asp:BoundField>
                                  <asp:BoundField DataField="IdSubEspecifica" HeaderText="SubEsp." >
                                  <ControlStyle Width="45px" />
                                  <HeaderStyle Width="45px" />
                                  <ItemStyle Width="45px" />
                                  </asp:BoundField>
                                  <asp:TemplateField HeaderText="Ok">
                                      <ItemTemplate>
                                          <asp:ImageButton ID="ImageButton8" runat="server" CommandName="Select" ImageUrl="~/Img/Elegir1.jpg" Width="19px" />
                                      </ItemTemplate>
                                      <ItemStyle HorizontalAlign="Center" />
                                      <HeaderStyle Width="20px" />
                                      <ItemStyle Width="20px" />
                                  </asp:TemplateField>
                              </Columns>
                              <FooterStyle BackColor="#CCCCCC" />
                              <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                              <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                              <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                              <SortedAscendingCellStyle BackColor="#F1F1F1" />
                              <SortedAscendingHeaderStyle BackColor="#808080" />
                              <SortedDescendingCellStyle BackColor="#CAC9C9" />
                              <SortedDescendingHeaderStyle BackColor="#383838" />
                          </asp:GridView>
                      </div>
                   </asp:Panel>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:GridView ID="grdvItem" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" CssClass="generalFont">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="IdNumeroItem" HeaderText="Item" />
                            <asp:BoundField DataField="idBienServicio" HeaderText="Código" />
                            <asp:BoundField DataField="DescripcionUM" HeaderText="U.M." />
                            <asp:BoundField DataField="Descripcion" HeaderText="Descripción" />
                            <asp:BoundField DataField="PartidaPresupuestal" HeaderText="Partida" />
                            <asp:BoundField DataField="idUnidadMedidaVia" HeaderText="Medida" />
                            <asp:BoundField DataField="RedVial" HeaderText="Via" />
                            <asp:BoundField DataField="TramoIni" HeaderText="Tramo Inicial" />
                            <asp:BoundField DataField="TramoFin" HeaderText="Tramo Final" />
                            <asp:TemplateField HeaderText="Cantidad">
                                <ItemTemplate>
                                    <asp:TextBox ID="Cantidad" runat="server" Text='<%# Eval("CantidadItem", "{0:N3}")%>' Width="70px" Wrap="False" OnTextChanged="tbPref_TextChanged" AutoPostBack ="true" TabIndex="14"></asp:TextBox>
                                </ItemTemplate>
                                <ItemStyle Width="80px" />
                                <HeaderStyle Width="80px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Costo">
                                <ItemTemplate>
                                    <asp:TextBox ID="Costo" runat="server" TabIndex="15" Text='<%# Eval("CostoItem", "{0:N4}")%>' Width="70px" Wrap="False" OnTextChanged="tbPref_TextChanged" AutoPostBack ="true"></asp:TextBox>
                                </ItemTemplate>
                                <ItemStyle Width="80px" />
                                <HeaderStyle Width="80px" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="SubTotalItem" DataFormatString="{0:N2}" HeaderText="SubTotal" />
                            <asp:BoundField DataField="ReservaBolsa" HeaderText="Reserva" />
                            <asp:TemplateField HeaderText="Quitar">
                                <ItemTemplate>
                                    <asp:ImageButton ID="ImageButton6" runat="server" OnClientClick="return confirm('Desea realmente Quitar el Item del detalle?');" CommandName="itmQuitar" ImageUrl="~/Img/BotonQuitarItem.gif" Width="13px" TabIndex="22" />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    </asp:GridView>
                </td>
            </tr>
        </table>
        </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
</asp:Content>
