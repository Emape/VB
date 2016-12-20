<%@ page language="VB" masterpagefile="~/MasterPage.master" autoeventwireup="false" inherits="Conciliarbanco, App_Web_js1z4v53" title="Conciliación Bancaria" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table>
        <tr>
            <td>
                <asp:Panel ID="Panel1" runat="server" BackColor="DodgerBlue" BorderColor="Transparent">
                    <table>
                        <tr>
                            <td>
                <asp:Label ID="Label9" runat="server" Font-Names="Arial" Font-Size="8pt" ForeColor="White"
                    Text="Cuenta"></asp:Label></td>
                            <td>
                <asp:DropDownList ID="cmbBanco" runat="server" AutoPostBack="True" Font-Names="Arial" Font-Size="8pt">
                </asp:DropDownList></td>
                            <td align="right">
                <asp:Button ID="btnGuardar" runat="server" Text="Guardar" Font-Names="Arial" Font-Size="8pt" Width="75px" /></td>
                            <td align="right"><asp:Button ID="btnCancelar" runat="server" Text="Cancelar" Font-Names="Arial" Font-Size="8pt" Width="75px" /></td>
                            <td align="right"><asp:Button ID="btnCerrar" runat="server" Text="Cerrar" Font-Names="Arial" Font-Size="8pt" Width="75px" /></td>
                        </tr>
                        <tr>
                            <td colspan="5">
                <asp:GridView ID="grdvConciliar" runat="server" AutoGenerateColumns="False" CellPadding="0" ForeColor="Black" AllowPaging="True" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" Font-Names="Arial" Font-Size="8pt" PageSize="20" GridLines="Both">
                    <Columns>
                        <asp:BoundField DataField="Correlativo" HeaderText="Correlativo" />
                        <asp:BoundField DataField="IdAsiento" HeaderText="Documento" />
                        <asp:BoundField DataField="Item" HeaderText="Item" />
                        <asp:BoundField DataField="Referencia" HeaderText="Documento" />
                        <asp:BoundField DataField="FechaDocumento" HeaderText="Fecha" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="False" />
                        <asp:BoundField DataField="Glosa" HeaderText="Concepto" >
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Auxiliar" HeaderText="Auxiliar" >
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Socio" HeaderText="Nombre" >
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Debe" HeaderText="Debe" DataFormatString="{0:N2}" HtmlEncode="False" >
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Haber" HeaderText="Haber" DataFormatString="{0:N2}" HtmlEncode="False" >
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Ok">
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" EnableViewState="true" Checked='<%# Convert.ToBoolean(Eval("flagConcilBanco")) %>'/>
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

