<%@ page language="VB" masterpagefile="~/MasterPage.master" autoeventwireup="false" inherits="TasaPrevisional, App_Web_js1z4v53" title="Tasa Previsional" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table>
        <tr>
            <td>
                <asp:Panel ID="Panel1" runat="server" CssClass="generalFont">
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="Label1" runat="server" Text="Año"></asp:Label></td>
                            <td>
                                <asp:DropDownList ID="cmbAnno" runat="server" AutoPostBack="True">
                                </asp:DropDownList>
                                <asp:Label ID="lblAnno" runat="server" Text="lblAnno"></asp:Label>
                                <asp:Label ID="lblMes" runat="server" Text="lblMes"></asp:Label>
                                <asp:Label ID="Label3" runat="server" ForeColor="White" Text="Separador de campos"></asp:Label></td>
                            <td align="right" valign="top">
                                <asp:Button ID="btnCerrar" runat="server" Text="Cerrar" /></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label2" runat="server" Text="Mes"></asp:Label></td>
                            <td>
                                <asp:DropDownList ID="cmbMes" runat="server" AutoPostBack="True">
                                </asp:DropDownList></td>
                                <td align="right">
                                    <asp:Button ID="btnNuevo" runat="server" Text="Nuevo" /></td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:GridView ID="grdvTasa" runat="server" AutoGenerateColumns="False"
                                    BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CellPadding="4" ForeColor="#333333">
                                    <RowStyle BackColor="#EFF3FB" />
                                    <Columns>
                                        <asp:BoundField DataField="IdPrevision" HeaderText="C&#243;digo" />
                                        <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                                        <asp:BoundField DataField="RangoIni" HeaderText="Inicio de Rango" DataFormatString="{0:N2}" HtmlEncode="False" >
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="RangoFin" HeaderText="Fin de Rango" DataFormatString="{0:N2}" HtmlEncode="False" >
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="AporteRango" HeaderText="Aporte Rango" DataFormatString="{0:N2}" HtmlEncode="False" >
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Aporte" HeaderText="Aporte" DataFormatString="{0:N2}" HtmlEncode="False" >
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ComisionFlujo" HeaderText="Comisi&#243;n flujo" DataFormatString="{0:N2}" HtmlEncode="False" >
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ComisionMixta" HeaderText="Comisi&#243;n variable" DataFormatString="{0:N2}" HtmlEncode="False" >
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Seguro" HeaderText="Seguro" DataFormatString="{0:N2}" HtmlEncode="False" >
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="Editar">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Img/Elegir1.jpg" Width="19px" CommandName="itmEditar" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                    </Columns>
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <AlternatingRowStyle BackColor="White" />
                                    <EditRowStyle BackColor="#2461BF" />
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td style="height: 71px">
                <asp:Panel ID="Panel2" runat="server" CssClass="generalFont" BackColor="#C0FFC0">
                    <table>
                        <tr>
                            <td style="height: 16px">
                                <asp:Label ID="Label15" runat="server" Text="Nombre"></asp:Label></td>
                            <td colspan="4" style="height: 16px">
                                <asp:Label ID="lblNombre" runat="server" Font-Bold="True" Text="Nombre"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label8" runat="server" Text="Inicio del Rango S/."></asp:Label></td>
                            <td>
                                <asp:TextBox ID="txtRangoIni" runat="server" onkeypress="return numDecimal(event)" Width="90px">0</asp:TextBox></td>
                            <td>
                            </td>
                            <td>
                                <asp:Label ID="Label11" runat="server" Text="Fin del Rango S/."></asp:Label></td>
                            <td>
                                <asp:TextBox ID="txtRangoFin" runat="server" onkeypress="return numDecimal(event)" Width="90px">0</asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label9" runat="server" Text="Tasa Aporte en el Rango"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="txtAporteRango" runat="server" onkeypress="return numDecimal(event)" Width="90px">0</asp:TextBox></td>
                            <td>
                            </td>
                            <td>
                                <asp:Label ID="Label12" runat="server" Text="Tasa Aporte Monto mayor al Rango"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="txtAporte" runat="server" onkeypress="return numDecimal(event)" Width="90px">0</asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label10" runat="server" Text="Tasa Comisión Flujo"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="txtComisionFlujo" runat="server" onkeypress="return numDecimal(event)" Width="90px">0</asp:TextBox></td>
                            <td>
                            </td>
                            <td>
                                <asp:Label ID="Label13" runat="server" Text="Tasa Comisión Mixta"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="txtComisionMixta" runat="server" onkeypress="return numDecimal(event)" Width="90px">0</asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label14" runat="server" Text="Tasa Seguro"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="txtSeguro" runat="server" onkeypress="return numDecimal(event)" Width="90px">0</asp:TextBox></td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                </td>
                            <td>
                                </td>
                            <td>
                                <asp:Label ID="Label5" runat="server" BackColor="#C0FFC0" ForeColor="#C0FFC0" Text="S"></asp:Label></td>
                            <td>
                                </td>
                            <td>
                                </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="5">
                                <asp:Button ID="btnGuardar" runat="server" Text="Guardar" />
                                <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" /></td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
</asp:Content>

