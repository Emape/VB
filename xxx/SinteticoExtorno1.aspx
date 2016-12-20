<%@ page language="VB" masterpagefile="~/MasterPage.master" autoeventwireup="false" inherits="SinteticoExtorno1, App_Web_js1z4v53" title="Conciliación Bancaria" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table>
        <tr>
            <td>
                <asp:Panel ID="Panel1" runat="server" BackColor="DodgerBlue" BorderColor="Transparent">
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="Label1" runat="server" Font-Names="Arial" Font-Size="8pt" ForeColor="White"
                                    Text="Nro.Sintetico"></asp:Label></td>
                            <td style="border-right: #ffffff thin solid; border-top: #ffffff thin solid; border-left: #ffffff thin solid; border-bottom: #ffffff thin solid">
                                <asp:TextBox ID="txtSintetico" runat="server" Width="80px"></asp:TextBox>&nbsp;<asp:Button
                                    ID="btnActivos" runat="server" Text="Activos" />
                                <asp:Button ID="btnExtornados" runat="server" Text="Extornados" /></td>
                            <td align="right">
                <asp:Button ID="btnGuardar" runat="server" Text="Guardar" Font-Names="Arial" Font-Size="8pt" Width="75px" /></td>
                            <td align="right">
                                <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" Font-Names="Arial" Font-Size="8pt" Width="75px" /></td>
                            <td align="right">
                                <asp:Button ID="btnCerrar" runat="server" Text="Cerrar" Font-Names="Arial" Font-Size="8pt" Width="75px" /></td>
                        </tr>
                        <tr>
                            <td colspan="5">
                <asp:GridView ID="grdvActivos" runat="server" AutoGenerateColumns="False" CellPadding="0" AllowPaging="True" BackColor="White" BorderColor="#CC9966" BorderWidth="1px" Font-Names="Arial" Font-Size="8pt" PageSize="20" BorderStyle="None" GridLines="Both">
                    <Columns>
                        <asp:BoundField DataField="Correlativo" HeaderText="Item" />
                        <asp:BoundField DataField="Detalle" HeaderText="Concepto" />
                        <asp:BoundField DataField="DocInterno" HeaderText="Doc.Interno" />
                        <asp:BoundField DataField="Auxiliar" HeaderText="Auxiliar" >
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Nombre" HeaderText="Nombre" >
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Documento" HeaderText="Documento" />
                        <asp:BoundField DataField="Fecha" HeaderText="Fecha" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="False" />
                        <asp:BoundField DataField="Monto" HeaderText="Monto" DataFormatString="{0:N2}" HtmlEncode="False" >
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Extornar">
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" EnableViewState="true" Checked='<%# Convert.ToBoolean(Eval("flagExtorno")) %>'/>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                    <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#FFCC66" ForeColor="#663399" Font-Bold="True" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                    <AlternatingRowStyle BackColor="White" />
                    <RowStyle BackColor="White" ForeColor="#330099" />
                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="5">
                                <asp:GridView ID="grdvExtornados" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" AllowPaging="True" Font-Names="Arial" Font-Size="8pt" PageSize="15" GridLines="Both">
                                    <RowStyle BackColor="#E3EAEB" />
                                    <Columns>
                                        <asp:BoundField DataField="Correlativo" HeaderText="Item" />
                                        <asp:BoundField DataField="Detalle" HeaderText="Concepto" />
                                        <asp:BoundField DataField="DocInterno" HeaderText="Doc.Interno" />
                                        <asp:BoundField DataField="Auxiliar" HeaderText="Auxiliar" >
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Nombre" HeaderText="Nombre" >
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Documento" HeaderText="Documento" />
                                        <asp:BoundField DataField="Fecha" HeaderText="Fecha" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="False" />
                                        <asp:BoundField DataField="Monto" HeaderText="Monto" DataFormatString="{0:N2}" HtmlEncode="False" >
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                    </Columns>
                                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="#C5BBAF" ForeColor="#333333" Font-Bold="True" />
                                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                    <EditRowStyle BackColor="#7C6F57" />
                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <asp:Button ID="btnMarcaTodo" runat="server" OnClientClick="return confirm('Realmente desea Marcar todo?');" Text="Marca Todos" Visible="False" /></td>
                            <td colspan="2">
                            
                            <td>
                                <asp:Button ID="btnDesmarcaTodo" runat="server" OnClientClick="return confirm('Realmente desea Desmarcar todo?');" Text="Desmarca Todos" Visible="False" /></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label3" runat="server" BackColor="DodgerBlue" ForeColor="DodgerBlue"
                                    Text="..."></asp:Label></td>
                            <td>
                                <asp:Label ID="Label4" runat="server" BackColor="DodgerBlue" ForeColor="DodgerBlue"
                                    Text="..."></asp:Label></td>
                            <td>
                                <asp:Label ID="Label5" runat="server" BackColor="DodgerBlue" ForeColor="DodgerBlue"
                                    Text="..."></asp:Label></td>
                            <td>
                                <asp:Label ID="Label6" runat="server" BackColor="DodgerBlue" ForeColor="DodgerBlue"
                                    Text="..."></asp:Label></td>
                            <td>
                                <asp:Label ID="Label7" runat="server" BackColor="DodgerBlue" ForeColor="DodgerBlue"
                                    Text="..."></asp:Label></td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
</asp:Content>

