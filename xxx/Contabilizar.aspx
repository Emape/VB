<%@ page language="VB" masterpagefile="~/MasterPage.master" autoeventwireup="false" inherits="Contabilizar, App_Web_js1z4v53" title="Contabilizacion" culture="auto" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager id="ScriptManager1" EnableScriptGlobalization="true" EnableScriptLocalization="True" runat="server">
    </asp:ScriptManager>
    <table>
        <tr>
            <td align="center">
                <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="0.8em"
                    ForeColor="DarkGreen" Text="Sinteticos Contables"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="Panel1" runat="server">
                    <table>
                        <tr>
                            <td colspan="3">
                                <table>
                                    <tr>
                                        <td>
                                <asp:Label ID="lblFecha" runat="server" ForeColor="#004000" Text="Fecha Sintetico"></asp:Label></td>
                                        <td>
                                        <asp:UpdatePanel id="UpdatePanel1" runat="server">
                                    <contenttemplate>
<ajaxToolkit:CalendarExtender id="CalendarExtender1" runat="server" TargetControlID="txtFechaContable" PopupButtonID="btnFechaContable" Format="dd/MM/yyyy" __designer:wfdid="w3"></ajaxToolkit:CalendarExtender> <asp:TextBox id="txtFechaContable" runat="server" Width="110px" __designer:wfdid="w4"></asp:TextBox><IMG id="btnFechaContable" src="Img/calendario.gif" /> 
</contenttemplate>
                                </asp:UpdatePanel>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                <asp:TextBox ID="txtBuscar" runat="server" Width="200px"></asp:TextBox><asp:ImageButton
                    ID="btnBuscar" runat="server" ImageUrl="~/Img/BotonBuscar.gif" /></td>
                            <td>
                                </td>
                            <td align="right">
                <asp:ImageButton ID="btnCerrar" runat="server" ImageUrl="~/Img/BotonCerrarItem.jpg"
                    ToolTip="Cerrar Formulario" Width="21px" /></td>
                        </tr>
                        <tr>
                            <td colspan="3">
                <asp:GridView ID="grdvSintetico" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    BorderColor="DarkRed" BorderStyle="Solid" BorderWidth="1px" CellPadding="2" Font-Names="Arial"
                    Font-Size="9pt" ForeColor="#333333" PageSize="15">
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="IdSintetico" HeaderText="Num.Sintetico" />
                        <asp:BoundField DataField="FechaSintetico" HeaderText="Fecha" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="False" />
                        <asp:BoundField DataField="TC" DataFormatString="{0:N2}" HeaderText="Tipo Cambio"
                            HtmlEncode="False">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="AudUsuario" HeaderText="Usuario" />
                        <asp:BoundField DataField="flagContabilizado" HeaderText="Contabilizado">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Integrado">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" CommandName="Imprimir" Height="14px"
                                    ImageUrl="~/Img/ImprimeLista.jpg" Width="21px" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="M.Nacional">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton4" runat="server" CommandName="ImprimirSoles" Height="14px"
                                    ImageUrl="~/Img/ImprimeLista.jpg" Width="21px" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="M.Extranjera">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton5" runat="server" CommandName="ImprimirDolares" Height="14px"
                                    ImageUrl="~/Img/ImprimeLista.jpg" Width="21px" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Contabilizar">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton3" runat="server" CommandName="Contabilizar" ImageUrl="~/Img/BotonOk.gif"
                                    Width="19px" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Anular">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton2" runat="server" CommandName="Anular" ImageUrl="~/Img/editdelete.gif" />
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
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Label ID="Label6" runat="server" ForeColor="White" Text="..."></asp:Label></td>
        </tr>
        <tr>
            <td align="center">
                <asp:Button ID="btnGenerar" runat="server" Text="Generar Nuevo" />&nbsp;
                </td>
        </tr>
    </table>
    <br />
    <table>
        <tr>
            <td align="center" colspan="3">
                <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <RowStyle BackColor="#EFF3FB" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                </td>
        </tr>
        <tr>
            <td>
                </td>
            <td>
            </td>
            <td align="right">
                </td>
        </tr>
        <tr>
            <td colspan="3"></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label9" runat="server" Font-Names="Arial" Font-Size="0.8em" ForeColor="DarkGreen"
                    Text="Total Desembolsos" Visible="False"></asp:Label></td>
            <td>
                <asp:Label ID="Label13" runat="server" ForeColor="White" Text="..." Visible="False"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtDesembolsos" runat="server" Font-Bold="True" Width="112px" Enabled="False" Visible="False">0</asp:TextBox></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Font-Names="Arial" Font-Size="0.8em" ForeColor="DarkGreen"
                    Text="Total Pago de Cuotas" Visible="False"></asp:Label></td>
            <td>
                <asp:Label ID="Label3" runat="server" ForeColor="White" Text="..." Visible="False"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtPagos" runat="server" Font-Bold="True" Width="112px" Enabled="False" Visible="False">0</asp:TextBox></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Font-Names="Arial" Font-Size="0.8em" ForeColor="DarkGreen"
                    Text="Total Movimientos pendientes" Visible="False"></asp:Label></td>
            <td>
                <asp:Label ID="Label4" runat="server" ForeColor="White" Text="..." Visible="False"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtTotal" runat="server" Font-Bold="True" Width="112px" Enabled="False" Visible="False">0</asp:TextBox></td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <asp:Label ID="Label5" runat="server" ForeColor="White" Text="..."></asp:Label></td>
            <td>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="3">
                </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                </td>
            <td>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Label ID="lblMensaje" runat="server" Font-Names="Arial" Font-Size="0.8em" ForeColor="DarkRed"
                    Text="** No se puede Contabilizar por que el Total de Movimiento es cero." Visible="False"></asp:Label></td>
        </tr>
    </table>
</asp:Content>

