<%@ page language="VB" masterpagefile="~/MasterPage.master" autoeventwireup="false" inherits="Orden1, App_Web_js1z4v53" title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
                    Año<br />
                    <asp:DropDownList ID="cmbAnno" runat="server">
                    </asp:DropDownList>
                </td>
                <td>
                    Orden<br />
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
                    <asp:BoundField DataField="FechaRequerimiento" HeaderText="Fecha" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="False">
                    <ControlStyle Width="70px" />
                    <HeaderStyle Width="70px" />
                    <ItemStyle Width="70px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Descripcion" HeaderText="Concepto" />
                    <asp:BoundField DataField="TipoCambio" HeaderText="TC">
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
    <asp:Panel ID="panelIng" runat="server"></asp:Panel>
</asp:Content>

