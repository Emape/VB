<%@ page title="" language="VB" masterpagefile="~/MasterPage.master" autoeventwireup="false" inherits="AutorizaPago, App_Web_js1z4v53" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></ajaxToolkit:ToolkitScriptManager>
    <asp:Panel ID="panelCab" runat="server" CssClass="generalFont">
        <table>
            <tr>
                <td>
                    <asp:ImageButton ID="btnGuardar" runat="server" ImageUrl="~/Img/filesave.gif"
                    ToolTip="Guardar" Width="19px" />
                </td>
                <td style="width: 1px"></td>
                <td>
                    <asp:ImageButton ID="btnCancelar" runat="server" ImageUrl="~/Img/BotonReestablecer.gif" 
                    ToolTip="Reestablecer" Width="19px" />
                </td>
                <td style="width: 1px"></td>
                <td>
                    <asp:ImageButton ID="btnCerrar" runat="server" Height="17px" ImageUrl="~/Img/Salir.jpg"
                    OnClientClick="return confirm('Desea realmente Cerrar el formulario?');" ToolTip="Cerrar" />
                </td>
            </tr>
        </table>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>       
            <br />        
               <div style="float:left;width:130px;" align="left">
                   <asp:Label ID="Label1" runat="server" Text="Ingrese Plan de Pago:"></asp:Label>
               </div>
               <div style="float:left;width:120px;" align="left">
                   <asp:TextBox ID="txtNroLote" runat="server" Width="90px"></asp:TextBox>
               </div>
               <div style="float:left;width:100px;" align="left">
                   <asp:Button ID="btnConsultar" runat="server" Text="Consultar" />
               </div>            
                        <div id="a1" style="width:1082px;">
                        </div>
                        <div id="scrollDiv" style="overflow:auto; height:350px; width:1100px;">
                            <asp:GridView ID="grdvPagos" runat="server" AutoGenerateColumns="False" CellPadding="3" CssClass="generalFont" ForeColor="#333333" Width="100%">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="Corre" DataFormatString="{0:N0}" HeaderText="ID">
                                    <ControlStyle Width="30px" />
                                    <HeaderStyle Width="30px" />
                                    <ItemStyle Width="30px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="nroLote" HeaderText="PlanPago">
                                    <ControlStyle Width="50px" />
                                    <HeaderStyle Width="50px" />
                                    <ItemStyle Width="50px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="IdVoucher" HeaderText="Voucher" >
                                    <ControlStyle Width="70px" />
                                    <HeaderStyle Width="70px" />
                                    <ItemStyle Width="70px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="FechaEmision" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Fecha" HtmlEncode="False">
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ControlStyle Width="80px" />
                                    <HeaderStyle Width="80px" />
                                    <ItemStyle Width="80px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Proveedor" HeaderText="Proveedor">
                                    <ControlStyle Width="150px" />
                                    <HeaderStyle Width="150px" />
                                    <ItemStyle Width="150px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Concepto" HeaderText="Concepto" />
                                    <asp:BoundField DataField="MontoCheque" DataFormatString="{0:N2}" HeaderText="Importe" HtmlEncode="False">
                                    <ItemStyle HorizontalAlign="Right" />
                                    <ControlStyle Width="90px" />
                                    <HeaderStyle Width="90px" />
                                    <ItemStyle Width="90px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Pagado" HeaderText="Pagado">
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ControlStyle Width="50px" />
                                    <HeaderStyle Width="50px" />
                                    <ItemStyle Width="50px" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="Autorizar">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Convert.ToBoolean(Eval("flag"))%>' EnableViewState="true" />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                        <HeaderStyle Width="48px" />
                                        <ItemStyle Width="48px" />
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
        </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
</asp:Content>

