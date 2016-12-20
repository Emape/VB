<%@ page language="VB" masterpagefile="~/MasterPage.master" autoeventwireup="false" inherits="ConsultaProveedor, App_Web_3km2mpsz" title="Consulta Locadores" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table>
        <tr>
            <td>
                <asp:TextBox ID="txtBuscar" runat="server" Width="140px"></asp:TextBox><asp:ImageButton
                    ID="btnBuscar" runat="server" ImageUrl="~/Img/BotonBuscar.gif" /></td>
            <td rowspan="2" valign="top">
                <asp:GridView ID="grdvConsultaProveedor" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    CellPadding="4" ForeColor="#333333" PageSize="15" CssClass="generalFont">
                    <RowStyle BackColor="#EFF3FB" />
                    <Columns>
                        <asp:BoundField DataField="IdContrato" HeaderText="Contrato" />
                        <asp:BoundField DataField="DescripTipoContrato" HeaderText="Modalidad" />
                        <asp:BoundField DataField="DescripCentro" HeaderText="Centro Costo" />
                        <asp:BoundField DataField="FechaInicio" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Inicio"
                            HtmlEncode="False" />
                        <asp:BoundField DataField="FechaTermino" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Fin"
                            HtmlEncode="False" />
                        <asp:BoundField DataField="IdSolicitudPago" HeaderText="SolicitudPago" />
                        <asp:BoundField DataField="FechaDocumento" HeaderText="Fecha" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="False" />
                        <asp:BoundField DataField="DescripTipoDoc" HeaderText="TipoDoc" />
                        <asp:BoundField DataField="NumeroDocumento" HeaderText="Numero" />
                        <asp:BoundField DataField="Descripcion" HeaderText="Concepto" />
                        <asp:BoundField DataField="ValorTotalMN" HeaderText="Importe" DataFormatString="{0:N2}" HtmlEncode="False" />
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
        </tr>
    </table>
</asp:Content>

