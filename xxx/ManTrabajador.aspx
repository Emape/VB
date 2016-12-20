<%@ page language="VB" masterpagefile="~/MasterPage.master" autoeventwireup="false" inherits="ManTrabajador, App_Web_3km2mpsz" title="Trabajadores Independientes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager id="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table>
        <tr>
            <td>
                <asp:TextBox ID="txtBuscar" runat="server" Width="140px"></asp:TextBox><asp:ImageButton
                    ID="btnBuscar" runat="server" ImageUrl="~/Img/BotonBuscar.gif" /></td>
            <td align="right">
                <asp:Button ID="btnCerrar" runat="server" Text="Cerrar" Width="70px" /></td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="grdvBuscar" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    CellPadding="4" Font-Names="Arial" Font-Size="9pt" ForeColor="#333333"
                    PageSize="15" ShowFooter="True" CssClass="generalFont">
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="Ruc" HeaderText="RUC">
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="RazonSocial" HeaderText="Nombre">
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Ok">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" CommandName="Elegir" ImageUrl="~/Img/Elegir1.jpg"
                                    Width="19px" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
            </td>
            <td valign="top">
                <asp:Panel ID="Panel1" runat="server" CssClass="generalFont" BackColor="PaleTurquoise" Visible="False">
    <table>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="Fecha de Nacimiento"></asp:Label></td>
            <td>
            </td>
            <td>
                &nbsp;<asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
<ajaxToolkit:CalendarExtender id="CalendarExtender1" runat="server" TargetControlID="txtFecha" PopupButtonID="ImgFecha" Format="dd/MM/yyyy" __designer:wfdid="w19">
                        </ajaxToolkit:CalendarExtender> <asp:TextBox id="txtFecha" runat="server" Width="112px" __designer:wfdid="w20"></asp:TextBox><IMG id="ImgFecha" src="Img/calendario.gif" /> 
</ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="Sistema Previsional"></asp:Label></td>
            <td>
                <asp:Label ID="Label2" runat="server" Text="S" ForeColor="PaleTurquoise"></asp:Label></td>
            <td>
                <asp:DropDownList ID="cmbCodigoAFP" runat="server" AutoPostBack="True">
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label6" runat="server" Text="Tipo Comisión"></asp:Label></td>
            <td>
            </td>
            <td>
                <asp:DropDownList ID="cmbTipoComision" runat="server" AutoPostBack="True">
                    <asp:ListItem Value="Flujo">Variable Flujo</asp:ListItem>
                    <asp:ListItem Value="Mixta">Variable Mixta</asp:ListItem>
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label7" runat="server" Text="Porcentaje Comisión"></asp:Label></td>
            <td>
            </td>
            <td>
                <asp:TextBox ID="txtComision" runat="server" Enabled="False" Font-Bold="True" Width="88px">0</asp:TextBox></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Porcentaje Aporte Rango"></asp:Label></td>
            <td>
            </td>
            <td>
                <asp:TextBox ID="txtAporteRango" runat="server" Enabled="False" Font-Bold="True" Width="88px">0</asp:TextBox></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label8" runat="server" Text="Porcentaje Aporte"></asp:Label></td>
            <td>
            </td>
            <td>
                <asp:TextBox ID="txtAporte" runat="server" Enabled="False" Font-Bold="True" Width="88px">0</asp:TextBox></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Porcentaje Seguro"></asp:Label></td>
            <td>
            </td>
            <td>
                <asp:TextBox ID="txtSeguro" runat="server" Enabled="False" Font-Bold="True" Width="88px">0</asp:TextBox></td>
        </tr>
        <tr>
            <td align="center" colspan="3">
                <asp:Button ID="btnGuardar" runat="server" Text="Guardar" Width="70px" />
                <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" Width="70px" />
                </td>
        </tr>
    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
</asp:Content>

