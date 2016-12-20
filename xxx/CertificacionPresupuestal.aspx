<%@ page title="Requerimientos" language="VB" masterpagefile="~/MasterPage.master" autoeventwireup="false" inherits="CertificacionPresupuestal, App_Web_3km2mpsz" %>
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
                    ToolTip="Nuevo Documento" Width="19px" Visible="False" /></td>
            <td style="width: 1px"></td>
            <td><asp:ImageButton ID="btnModificar" runat="server" ImageUrl="~/Img/edit.gif"
                    ToolTip="Modificar Documento" Width="19px" style="height: 19px" /></td>
            <td style="width: 1px"></td>
            <td><asp:ImageButton ID="btnAnular" runat="server" ImageUrl="~/Img/button_cancel.gif"
                OnClientClick="return confirm('Desea realmente Anular la el Requerimiento?');" ToolTip="Anular Requerimiento" Height="15px" Visible="False" /></td>
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
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate> 
        <table>
            <tr>
                <td>
                    Tipo<br />
                    <asp:DropDownList ID="cmbTipoReq" runat="server">
                        <asp:ListItem Value="B">Bien</asp:ListItem>
                        <asp:ListItem Value="S">Servicio</asp:ListItem>
                        <asp:ListItem Value="P">Ampliacion</asp:ListItem>
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
        <div id="a1" style="width:1100px;">
        </div>
        <div id="scrollDiv" style="overflow:auto; height:150px; width:1118px;">
            <asp:GridView ID="grdvRequerimiento" runat="server" AutoGenerateColumns="False" BorderStyle="Solid" BorderWidth="1px" CellPadding="2" CssClass="generalFont" ForeColor="#333333" Width="100%" BorderColor="Black">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Siglas" HeaderText="Gerencia">
                    <ControlStyle Width="50px" />
                    <HeaderStyle Width="50px" />
                    <ItemStyle Width="50px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="IdRequerimiento" HeaderText="Requerimiento">
                    <ControlStyle Width="95px" />
                    <HeaderStyle Width="95px" />
                    <ItemStyle Width="95px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="BienServicio" HeaderText="Tipo">
                    <ControlStyle Width="15px" />
                    <HeaderStyle Width="15px" />
                    <ItemStyle Width="15px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="IdTipoRequerimiento" HeaderText="Modalidad">
                    <ControlStyle Width="80px" />
                    <HeaderStyle Width="80px" />
                    <ItemStyle Width="80px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="FechaRequerimiento" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Fecha" HtmlEncode="False">
                    <ControlStyle Width="90px" />
                    <HeaderStyle Width="90px" />
                    <ItemStyle Width="90px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Descripcion" HeaderText="Concepto" />
                    <asp:BoundField DataField="CostoTotal" DataFormatString="{0:N2}" HeaderText="Importe" HtmlEncode="False">
                    <ControlStyle Width="80px" />
                    <HeaderStyle Width="80px" />
                    <ItemStyle Width="80px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="DesFlagEvaluado" HeaderText="Evaluado">
                    <ControlStyle Width="85px" />
                    <HeaderStyle Width="85px" />
                    <ItemStyle Width="85px" />
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
            <asp:GridView ID="grdvRequerimientoDetalle" runat="server" AutoGenerateColumns="False" CellPadding="2" EnableModelValidation="True" ForeColor="#333333" BorderStyle="Solid" BorderWidth="1px" CssClass="generalFont" BorderColor="Black">
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
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Requerimiento"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtIdRequerimiento" runat="server" Enabled="False"></asp:TextBox>
                </td>
                <td>
                    <asp:HiddenField ID="HiddenInsert" runat="server" />
                </td>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="Fecha"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtFecha" runat="server" Enabled="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label5" runat="server" Text="Concepto"></asp:Label>
                </td>
                <td colspan="4">
                    <asp:TextBox ID="txtConcepto" runat="server" Height="40px" MaxLength="254" onblur="conMayuscula(this)" TextMode="MultiLine" Width="700px" ReadOnly="True"></asp:TextBox>
                </td>
            </tr>
        </table>
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <asp:Panel ID="panelPartida" runat="server" Visible="False">                       
                <div id="b1" style="width:600px;">
                </div>
                <div style="overflow:auto; float:left; height:100px; width:618px;">
                    <asp:GridView ID="grdvClasificador" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" GridLines="Vertical" Width="100%">
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
                     <table>
                         <tr>
                             <td>
                                 <asp:Label ID="Label6" runat="server" Text="C. Costo"></asp:Label>
                                 <asp:DropDownList ID="cmbCentroCosto" runat="server" AutoPostBack="True">
                                 </asp:DropDownList>
                             </td>
                         </tr>
                         <tr>
                             <td>
                                 <asp:Button ID="btnUpdateItem" runat="server" Text="Actualizar Item" />
                             </td>
                         </tr>
                         <tr>
                             <td>
                                 <asp:Button ID="btnCancelarItem" runat="server" Text="Cancelar" />
                             </td>
                         </tr>
                     </table>
                </div>        
                <div id="b2" style="width:870px;">
                </div>
                <div style="overflow:auto; height:150px; width:888px;">
                        <asp:GridView ID="grdvActiFinaliMeta" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" Width="100%">
                            <AlternatingRowStyle BackColor="#CCCCCC" />
                            <Columns>
                                <asp:BoundField DataField="IdCentroCosto" HeaderText="C.Costo">
                                <ControlStyle Width="60px" />
                                <HeaderStyle Width="60px" />
                                <ItemStyle Width="60px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Descripcion" HeaderText="Descripción" />
                                <asp:BoundField DataField="IdProyecto" HeaderText="Activi.">
                                <ControlStyle Width="60px" />
                                <HeaderStyle Width="60px" />
                                <ItemStyle Width="60px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="IdFinalidad" HeaderText="Finalidad">
                                <ControlStyle Width="60px" />
                                <HeaderStyle Width="60px" />
                                <ItemStyle Width="60px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Meta" HeaderText="Meta">
                                <ControlStyle Width="40px" />
                                <HeaderStyle Width="40px" />
                                <ItemStyle Width="40px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="IdTarea" HeaderText="Tarea">
                                <ControlStyle Width="40px" />
                                <HeaderStyle Width="40px" />
                                <ItemStyle Width="40px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="ClasificadorFuncional" HeaderText="CL">
                                <ControlStyle Width="80px" />
                                <HeaderStyle Width="80px" />
                                <ItemStyle Width="80px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="IdTipo" HeaderText="Tipo">
                                <ControlStyle Width="30px" />
                                <HeaderStyle Width="30px" />
                                <ItemStyle Width="30px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="IdFuenteFinanciamiento" HeaderText="Fuente">
                                <ControlStyle Width="45px" />
                                <HeaderStyle Width="45px" />
                                <ItemStyle Width="45px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="IdSubEspecifica" HeaderText="SubEsp.">
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
            <div>
                <asp:GridView ID="grdvItem" runat="server" AutoGenerateColumns="False" CellPadding="4" CssClass="generalFont" ForeColor="#333333" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="IdNumeroItem" HeaderText="Item" />
                        <asp:BoundField DataField="DescripCC" HeaderText="C.Costo" />
                        <asp:BoundField DataField="IdBienServicio" HeaderText="Código" />
                        <asp:BoundField DataField="DescripcionUM" HeaderText="U.M." />
                        <asp:BoundField DataField="Descripcion" HeaderText="Descripción" />
                        <asp:BoundField DataField="PartidaPresupuestal" HeaderText="Partida" />
                        <asp:TemplateField HeaderText="Cantidad">
                            <ItemTemplate>
                                <asp:TextBox ID="Cantidad" runat="server" AutoPostBack="true" OnTextChanged="tbPref_TextChanged" TabIndex="14" Text='<%# Eval("CantidadItem", "{0:N3}")%>' Width="70px" Wrap="False"></asp:TextBox>
                            </ItemTemplate>
                            <ItemStyle Width="80px" />
                            <HeaderStyle Width="80px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Costo">
                            <ItemTemplate>
                                <asp:TextBox ID="Costo" runat="server" AutoPostBack="true" OnTextChanged="tbPref_TextChanged" TabIndex="15" Text='<%# Eval("CostoItem", "{0:N4}")%>' Width="70px" Wrap="False"></asp:TextBox>
                            </ItemTemplate>
                            <ItemStyle Width="80px" />
                            <HeaderStyle Width="80px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="SubTotalItem" DataFormatString="{0:N2}" HeaderText="SubTotal" />
                        <asp:TemplateField HeaderText="Ok">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton6" runat="server" CommandName="itmCertifica" ImageUrl="~/Img/Elegir1.jpg" TabIndex="22" Width="19px" />
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
            </div>
            <asp:Panel ID="panelTransferencia" runat="server" Visible="False">
                <table style="width: 100%">
                    <tr>
                        <td>
                            <asp:GridView ID="grdvCadena" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="Partida1" HeaderText="Cadena" />
                                    <asp:BoundField DataField="Importe" DataFormatString="{0:N2}" HeaderText="Importe" HtmlEncode="False" />
                                    <asp:BoundField DataField="IdNroSolReq" HeaderText="Nro Transferencia" />
                                    <asp:BoundField DataField="cItems" HeaderText="Item Transferencia" />
                                    <asp:TemplateField HeaderText="Ok">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButton9" runat="server" ImageUrl="~/Img/Elegir1.jpg" Width="19px" />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                </Columns>
                                <FooterStyle BackColor="#CCCC99" />
                                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                <RowStyle BackColor="#F7F7DE" />
                                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                                <SortedAscendingHeaderStyle BackColor="#848384" />
                                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                                <SortedDescendingHeaderStyle BackColor="#575357" />
                            </asp:GridView>
                        </td>
                        <td colspan="2">
                            &nbsp;
                            <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
                                <AlternatingRowStyle BackColor="#F7F7F7" />
                                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                                <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                                <SortedAscendingCellStyle BackColor="#F4F4FD" />
                                <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                                <SortedDescendingCellStyle BackColor="#D8D8F0" />
                                <SortedDescendingHeaderStyle BackColor="#3E3277" />
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:Button ID="btnRechazar" runat="server" Text="Cancelar" />
                        </td>
                        <td>&nbsp;</td>
                        <td align="center">
                            <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
</asp:Content>
