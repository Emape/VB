<%@ page language="VB" masterpagefile="~/MasterPage.master" autoeventwireup="false" inherits="Proveedor1, App_Web_js1z4v53" title="Terceros" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></ajaxToolkit:ToolkitScriptManager>
<script type="text/javascript">
function s()
{
var t = document.getElementById("<%=grdvProveedor.ClientID%>");
var t2 = t.cloneNode(true)
for(i = t2.rows.length -1;i > 0;i--)
t2.deleteRow(i)
t.deleteRow(0)
a.appendChild(t2)
}
</script>
    <table>
        <tr>
            <td>
                <asp:ImageButton ID="btnNuevo" runat="server" ImageUrl="~/Img/BotonNuevoItem.gif"
                    ToolTip="Nuevo Documento" Width="19px" />
            </td>
            <td style="width: 1px">
            </td>
            <td>
                <asp:ImageButton ID="btnCancelar" runat="server" Height="17px" ImageUrl="~/Img/BotonReestablecer.gif"
                    Style="width: 20px" ToolTip="Cancelar" />
            </td>
            <td style="width: 1px">
            </td>
            <td>
                <asp:ImageButton ID="btnGuardar" runat="server" OnClientClick="return validaProveedorEmape(1);" ImageUrl="~/Img/filesave.gif" ToolTip="Guardar" />
            </td>
            <td style="width: 1px">
            </td>
            <td>
                <asp:ImageButton ID="btnImprimir" runat="server" ImageUrl="~/Img/ImprimeLista.jpg" 
                    ToolTip="Imprimir" Width="19px" />
            </td>
            <td style="width: 1px">
            </td>
            <td>
                <asp:ImageButton ID="btnExcel" runat="server" ImageUrl="~/Img/btnExcel.png" 
                    ToolTip="Importar a Excel" Width="19px" style="height: 19px" />
            </td>
            <td style="width: 1px">
            </td>
            <td>
                <asp:ImageButton ID="btnCerrar" runat="server" Height="17px" ImageUrl="~/Img/Salir.jpg"
                    OnClientClick="return confirm('Desea realmente Cerrar el formulario?');" ToolTip="Cerrar" />
            </td>
        </tr>
    </table>
    <asp:Panel ID="panelCab" runat="server" CssClass="generalFont">
        <table>
            <tr>
                <td>
                    Recurso<br />
                    <asp:DropDownList ID="cmbEmpresa" runat="server">
                    </asp:DropDownList></td>
                <td>
                    Centro de Costo<br />
                    <asp:DropDownList ID="cmbCentroCosto" runat="server">
                    </asp:DropDownList></td>
                <td>
                    Nombre<br />
                    <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox></td>
                <td style="width: 3px">
                    Control<br />
                    <asp:TextBox ID="txtControl" runat="server" Width="50px"></asp:TextBox></td>
                <td>
                    <asp:CheckBox ID="chkLocadores" runat="server" Text="Locadores" Width="90px"/>
                </td>
                <td>
                    <asp:ImageButton ID="btnBuscar" runat="server" ImageUrl="~/Img/BotonBuscar.gif" style="height: 14px" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                    
                </td>
            </tr>
        </table>
            <div id="a" style="width:1100px;">
            </div>
            <div style="overflow:auto; height:300px; width:1118px;">
                    <asp:GridView ID="grdvProveedor" runat="server" CellPadding="4" ForeColor="#333333" AutoGenerateColumns="False" Width="100%" EnableModelValidation="True">
                        <RowStyle BackColor="#EFF3FB" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#2461BF" />
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="item" HeaderText="Itm">
                                <ControlStyle Width="40px" />
                                <HeaderStyle Width="40px" />
                                <ItemStyle Width="40px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="IdProveedor" HeaderText="Ruc" >
                                <ControlStyle Width="110px" />
                                <HeaderStyle Width="110px" />
                                <ItemStyle Width="110px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Razonsocial" HeaderText="Nombre" />
                            <asp:BoundField DataField="Direccion" HeaderText="Direccion" />
                            <asp:BoundField DataField="Ubicacion" HeaderText="Distrito" >
                                <ControlStyle Width="140px" />
                                <HeaderStyle Width="140px" />
                                <ItemStyle Width="140px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="DescripEmp" HeaderText="Recurso" >
                                <ControlStyle Width="90px" />
                                <HeaderStyle Width="90px" />
                                <ItemStyle Width="90px" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="DescripCC" HeaderText="Centro de Costo" >
                                <ControlStyle Width="110px" />
                                <HeaderStyle Width="110px" />
                                <ItemStyle Width="110px" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="flagUsoGG" HeaderText="Control">
                                <ControlStyle Width="25px" />
                                <HeaderStyle Width="25px" />
                                <ItemStyle HorizontalAlign="Center" Width="25px" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Ok">
                                <ItemTemplate>
                                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Img/Elegir1.jpg" Width="19px" CommandName="itmModi" />
                                </ItemTemplate>
                                <HeaderStyle Width="40px" />
                                <ItemStyle HorizontalAlign="Center" Width="40px" />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
            </div>
    </asp:Panel>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    <asp:Panel ID="panelIng" runat="server" CssClass="generalFont">        
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label10" runat="server" Text="RUC"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtIdProveedor" runat="server" onkeypress="return numEntero(event)" onblur="validaRUC(this,1)" MaxLength="11"></asp:TextBox></td>
                <td>
                    <asp:Label ID="Label4" runat="server" Text=". . ." ForeColor="White"></asp:Label></td>
                <td>
                    <asp:Label ID="Label11" runat="server" Text="Razon Social"></asp:Label></td>
                <td colspan="4">
                    <asp:TextBox ID="txtRazonSocial" runat="server" onblur="conMayuscula(this)" Width="500px"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label12" runat="server" Text="A.Paterno"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtApPaterno" runat="server" onblur="conMayuscula(this)"></asp:TextBox></td>
                <td>
                </td>
                <td>
                    <asp:Label ID="Label13" runat="server" Text="A.Materno"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtApMaterno" runat="server" onblur="conMayuscula(this)"></asp:TextBox></td>
                <td>
                    <asp:Label ID="Label7" runat="server" Text=". . ." ForeColor="White"></asp:Label></td>
                <td>
                    <asp:Label ID="Label14" runat="server" Text="Nombres"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtNombres" runat="server" onblur="conMayuscula(this)"></asp:TextBox>&nbsp;<asp:CheckBox ID="chkLocador" runat="server" Text="Locador" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label25" runat="server" Text="Sigla comercial"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtSiglaComercial" runat="server" onblur="conMayuscula(this)"></asp:TextBox></td>
                <td>
                </td>
                <td>
                    <asp:Label ID="Label16" runat="server" Text="Direccion"></asp:Label></td>
                <td colspan="4" style="height: 17px">
                    <asp:TextBox ID="txtDireccion" runat="server" onblur="conMayuscula(this)" Width="500px"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label31" runat="server" Text="Departamento"></asp:Label></td>
                <td>
                    <asp:DropDownList ID="cmbDepartamento" runat="server" AutoPostBack="True">
                    </asp:DropDownList></td>
                <td>
                </td>
                <td>
                    <asp:Label ID="Label32" runat="server" Text="Provincia"></asp:Label></td>
                <td>
                    <asp:DropDownList ID="cmbProvincia" runat="server" AutoPostBack="True">
                    </asp:DropDownList></td>
                <td>
                </td>
                <td>
                    <asp:Label ID="Label15" runat="server" Text="Distrito"></asp:Label></td>
                <td>
                    <asp:DropDownList ID="cmbDistrito" runat="server">
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label17" runat="server" Text="Telefono 1"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtTelefonoEmpresa1" runat="server" onkeypress="return numTelefono(event)"></asp:TextBox></td>
                <td>
                </td>
                <td>
                    <asp:Label ID="Label18" runat="server" Text="Telefono 2"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtTelefonoEmpresa2" runat="server" onkeypress="return numTelefono(event)"></asp:TextBox></td>
                <td>
                </td>
                <td>
                    <asp:Label ID="Label19" runat="server" Text="e-Mail"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server" ></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label20" runat="server" Text="DNI"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtDni" runat="server" onkeypress="return numEntero(event)"></asp:TextBox></td>
                <td>
                </td>
                <td>
                    <asp:Label ID="Label21" runat="server" Text="Representante"></asp:Label></td>
                <td colspan="4">
                    <asp:TextBox ID="txtRepresentante" runat="server" onblur="conMayuscula(this)" Width="500px"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Cargo Representante"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtCargoRepresentante" runat="server" onblur="conMayuscula(this)"></asp:TextBox></td>
                <td>
                </td>
                <td>
                    <asp:Label ID="Label22" runat="server" Text="e-Mail Representante"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtEmailRepresentante" runat="server"></asp:TextBox></td>
                <td>
                </td>
                <td>
                    <asp:Label ID="Label23" runat="server" Text="Tel. 1 Rep."></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtTelefonoRepresentante1" runat="server" onkeypress="return numTelefono(event)"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label24" runat="server" Text="Tel. 2 Rep."></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtTelefonoRepresentante2" runat="server" onkeypress="return numTelefono(event)"></asp:TextBox></td>
                <td>
                </td>
                <td>
                    <asp:Label ID="Label26" runat="server" Text="Banco"></asp:Label></td>
                <td>
                    <asp:DropDownList ID="cmbBanco" runat="server">
                    </asp:DropDownList></td>
                <td>
                </td>
                <td>
                    <asp:Label ID="Label27" runat="server" Text="Cta. Bancaria"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtNumeroCuenta" runat="server" onkeypress="return numEntero(event)"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label28" runat="server" Text="CCI"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtCCI" runat="server" onkeypress="return numEntero(event)"></asp:TextBox></td>
                <td>
                </td>
                <td>
                    <asp:Label ID="Label29" runat="server" Text="Empresa"></asp:Label></td>
                <td>
                    <asp:DropDownList ID="cmbEmpresa1" runat="server">
                    </asp:DropDownList>
                    <asp:DropDownList ID="cmbServicio" runat="server" Visible="False">
                    </asp:DropDownList>
                </td>
                <td>
                </td>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Importe"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtImporte" runat="server" onkeypress="return numDecimal(event)"></asp:TextBox>
                    <asp:HiddenField ID="hdInsert" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label30" runat="server" Text="Centro Costo " Visible="False"></asp:Label></td>
                <td><asp:DropDownList ID="cmbCentroCosto1" runat="server" Visible="False">
                </asp:DropDownList></td>
                <td>
                </td>
                <td>
                    <asp:Label ID="Label33" runat="server" Text="Servicio"></asp:Label>
                    </td>
                <td>
                    <asp:TextBox ID="txtIdBienServicio" runat="server" Enabled="False"></asp:TextBox>
                    <asp:Button ID="btnServicio" runat="server" Font-Bold="True" Text="..." />
                    </td>
                <td>
                </td>
                <td colspan="2">
                    <asp:TextBox ID="txtDescripServicio" runat="server" Enabled="False" TextMode="MultiLine" Width="300px"></asp:TextBox>
                    </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Gerencia"></asp:Label></td>
                <td>
                    <asp:DropDownList ID="cmbGerencia" runat="server" AutoPostBack="True">
                    </asp:DropDownList></td>
                <td>
                </td>
                <td>
                    <asp:Label ID="Label5" runat="server" Text="Sub Gerencia"></asp:Label></td>
                <td>
                    <asp:DropDownList ID="cmbSubGerencia" runat="server" AutoPostBack="True">
                    </asp:DropDownList></td>
                <td>
                </td>
                <td>
                    <asp:Label ID="Label6" runat="server" Text="Departamento"></asp:Label></td>
                <td>
                    <asp:DropDownList ID="cmbOficina" runat="server">
                    </asp:DropDownList></td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Panel ID="panelServicio" runat="server" Visible="False" CssClass="generalFont">
        <div>
            <asp:Label ID="Label8" runat="server" Text="Buscar Servicio"> </asp:Label> <asp:TextBox ID="txtBuscarServicio" runat="server"></asp:TextBox> <asp:ImageButton ID="btnBuscarServicio" runat="server" ImageUrl="~/Img/BotonBuscar.gif" />
            &nbsp;
            <asp:Button ID="btnCancelarBuscar" runat="server" Text="Cancelar" />
        </div>
        <div>
            <asp:GridView ID="grdvBuscaServi" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="IdBienServicio" HeaderText="Código" />
                    <asp:BoundField DataField="Descripcion" HeaderText="Descripción" />
                    <asp:TemplateField HeaderText="Ok">
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButton2" runat="server" CommandName="itmBuscar" ImageUrl="~/Img/Elegir1.jpg" Width="19px" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                <SortedAscendingCellStyle BackColor="#FDF5AC" />
                <SortedAscendingHeaderStyle BackColor="#4D0000" />
                <SortedDescendingCellStyle BackColor="#FCF6C0" />
                <SortedDescendingHeaderStyle BackColor="#820000" />
            </asp:GridView>
        </div>
    </asp:Panel>
    </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

