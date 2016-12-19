<%@ page language="VB" masterpagefile="~/MasterPage.master" autoeventwireup="false" inherits="TDRbase1, App_Web_js1z4v53" title="Proveedor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
function s()
{
var t = document.getElementById("<%=grdvBase.ClientID%>");
var t2 = t.cloneNode(true)
for(i = t2.rows.length -1;i > 0;i--)
t2.deleteRow(i)
t.deleteRow(0)
a.appendChild(t2)
}

function validaProveedorEmape1() {
var nError = 1;
var otex = 'ctl00_ContentPlaceHolder1_';
var correo = document.getElementById(otex+'txtEmail').value;
var correoRep = document.getElementById(otex+'txtEmailRepresentante').value;
    //expr = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    /*
    if ( !expr.test(correo) ) {
       alert('Ingrese un correo valido.');
       document.getElementById(otex+'txtEmail').focus();
    } else if ( !expr.test(correoRep) ) {  
       alert('El correo del representante no es valido.');
       document.getElementById(otex+'txtEmailRepresentante').focus();    
    */
    if (document.getElementById(otex+'txtApPaterno').value=='') {
       alert('Ingrese Apellido Paterno.');
       document.getElementById(otex+'txtApPaterno').focus();
    } else if (document.getElementById(otex+'txtApMaterno').value=='') {
       alert('Ingrese Apellido Materno.');
       document.getElementById(otex+'txtApMaterno').focus();
    } else if (document.getElementById(otex+'txtNombres').value=='') {
       alert('Ingrese Nombres(s) del Proveedor.');
       document.getElementById(otex+'txtNombres').focus();
    } else if (document.getElementById(otex+'cmbEmpresa1').value=='') {
       alert('Seleccione una Empresa.');
       document.getElementById(otex+'cmbEmpresa1').focus();
    } else if (document.getElementById(otex+'cmbCentroCosto1').value=='') {
       alert('Seleccione un Centro de Costo.');
       document.getElementById(otex+'cmbCentroCosto1').focus();
    } else if (document.getElementById(otex+'cmbGerencia').value=='') {
       alert('Seleccione una Gerencia.');
       document.getElementById(otex+'cmbGerencia').focus();                     
    } else { nError = 0; }
   
   if (nError == 0) {   
      return true;
   }
   else {   
      return false;
   }    
}

function conMayuscula1(pTexto) {
//document.getElementById('ctl00_ContentPlaceHolder1_'+pTexto).value=document.getElementById('ctl00_ContentPlaceHolder1_'+pTexto).value.toUpperCase();
pTexto.value = pTexto.value.toUpperCase();
}

function numEntero1(e) {
    tecla = (document.all) ? e.keyCode : e.which; // 2
    if (tecla==8) return true; // 3   tecla retroceso para borrar
    patron =/[0123456789]/; // 4
    //patron = /\d/; // Solo acepta números 
    te = String.fromCharCode(tecla); // 5
    return patron.test(te); // 6         
}

function numTelefono1(e)
{
   tecla = (document.all) ? e.keyCode : e.which; // 2
   if (tecla==8) return true; // 3
   patron =/[-0123456789\s]/; // 4
   te = String.fromCharCode(tecla); // 5
   return patron.test(te); // 6         
}

function numDecimal1(e) {
    tecla = (document.all) ? e.keyCode : e.which; // 2
    if (tecla==8) return true; // 3
    patron =/[.0123456789]/; // 4
    //patron=^\d\.\d{2,0}$;
    te = String.fromCharCode(tecla); // 5
    return patron.test(te); // 6         
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
                <asp:ImageButton ID="btnCancelar" runat="server" Height="16px" ImageUrl="~/Img/BotonReestablecer.gif"
                    Style="width: 20px" ToolTip="Cancelar" />
            </td>
            <td style="width: 1px">
            </td>
            <td>
                <asp:ImageButton ID="btnGuardar" runat="server" OnClientClick="return validaProveedorEmape1();" ImageUrl="~/Img/filesave.gif" 
                    Style="height: 17px" ToolTip="Guardar" />
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
                <asp:ImageButton ID="btnCerrar" runat="server" Height="17px" ImageUrl="~/Img/Salir.jpg"
                    OnClientClick="return confirm('Desea realmente Cerrar el formulario?');" ToolTip="Cerrar" />
            </td>
        </tr>
    </table>
    <asp:Panel ID="panelCab" runat="server" CssClass="generalFont">
        <table>
            <tr>
                <td>
                    Tipo Proveedor<br />
                    <asp:DropDownList ID="cmbTipoProveedor" runat="server">
                        <asp:ListItem Value="TER">Terceros</asp:ListItem>
                        <asp:ListItem Value="EXT">Externo</asp:ListItem>
                    </asp:DropDownList></td>
                <td>
                    Actividad<br />
                    <asp:DropDownList ID="cmbActividad" runat="server" AutoPostBack="True">
                    </asp:DropDownList></td>
                <td>
                    Tarea<br />
                    <asp:DropDownList ID="cmbTarea" runat="server">
                    </asp:DropDownList>
                </td>
                <td style="width: 3px">
                    Concepto<asp:DropDownList ID="cmbTipoConcepto" runat="server">
                        <asp:ListItem Value="SER">Servicios</asp:ListItem>
                        <asp:ListItem Value="REQ">Requisitos</asp:ListItem>
                        <asp:ListItem Value="PEN">Penalidades</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:ImageButton ID="btnBuscar" runat="server" ImageUrl="~/Img/BotonBuscar.gif" style="width: 19px" /></td>
            </tr>
        </table>
            <div id="a" style="width:700px;">
            </div>
            <div style="overflow:auto; height:300px; width:718px;">
                    <asp:GridView ID="grdvBase" runat="server" CellPadding="4" ForeColor="#333333" AutoGenerateColumns="False" Width="100%" EnableModelValidation="True">
                        <RowStyle BackColor="#EFF3FB" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#2461BF" />
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="ItemTDRbase" HeaderText="Item">
                                <ControlStyle Width="60px" />
                            <HeaderStyle Width="60px" />
                            <ItemStyle Width="60px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="IdUnidadMedida" HeaderText="U.M." >
                                <ControlStyle Width="60px" />
                            <HeaderStyle Width="60px" />
                            <ItemStyle Width="60px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" >
                            <ControlStyle Width="500px" />
                            <HeaderStyle Width="500px" />
                            <ItemStyle Width="500px" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Ok">
                                <ItemTemplate>
                                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Img/Elegir1.jpg" Width="19px" CommandName="itmModi" />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
            </div>
    </asp:Panel>
    <asp:Panel ID="panelIng" runat="server" CssClass="generalFont">
        <table>
            <tr>
                <td style="height: 26px"><asp:Label ID="Label1" runat="server" Text="Item"></asp:Label></td>
                <td style="height: 26px"><asp:TextBox ID="txtItemTDRbase" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Unidad Medida"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="cmbIdUnidadMedida" runat="server">
                        <asp:ListItem Value="UNI">Unidad</asp:ListItem>
                        <asp:ListItem Value="ML">Metro Lineal</asp:ListItem>
                        <asp:ListItem Value="M2">Metro Cuadro</asp:ListItem>
                        <asp:ListItem Value="M3">Metro Cubico</asp:ListItem>
                    </asp:DropDownList>
                    <asp:HiddenField ID="hdInsert" runat="server" />
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="Label2" runat="server" Text="Descripcion"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtDescripcion" runat="server" onblur="conMayuscula1(this)" Width="500px"></asp:TextBox>
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>

