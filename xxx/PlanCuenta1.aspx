<%@ page language="VB" masterpagefile="~/MasterPage.master" autoeventwireup="false" inherits="PlanCuenta1, App_Web_3km2mpsz" title="Plan Contable" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:ScriptManager id="ScriptManager1" EnableScriptGlobalization="true" EnableScriptLocalization="True" runat="server">
    </asp:ScriptManager>
    <table>
        <tr>
            <td rowspan="3">
                <div style="overflow: auto; width: 600px; height: 500px">
                    <asp:TreeView ID="TreeView1" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="0.8em"
                        ImageSet="Msdn" NodeIndent="10" Target="_self">
                        <ParentNodeStyle Font-Bold="False" />
                        <HoverNodeStyle BackColor="#CCCCCC" BorderColor="#888888" BorderStyle="Solid" Font-Underline="True" />
                        <SelectedNodeStyle BackColor="White" BorderColor="#888888" BorderStyle="Solid" BorderWidth="1px"
                            Font-Underline="False" HorizontalPadding="3px" VerticalPadding="1px" />
                        <NodeStyle Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" HorizontalPadding="5px"
                            NodeSpacing="1px" VerticalPadding="2px" />
                    </asp:TreeView>
                </div>
            </td>
            <td valign="top">
                <table>
                    <tr>
                        <td style="height: 95px">
                            <asp:Panel ID="Panel1" runat="server" Width="500px">
                                <table>
                                    <tr>
                                        <td>
                                            <table>
                                                <tr>
                                                    <td>
                            <asp:Button ID="btnNuevo" runat="server" Text="Nuevo" Width="80px" Font-Bold="True" /></td>
                                                    <td>
                            <asp:Button ID="btnModificar" runat="server" Text="Modificar" Width="80px" Font-Bold="True" /></td>
                                                    <td>
                            <asp:Button ID="btnAnular" runat="server" Text="Anular" Width="80px" Font-Bold="True" /></td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td align="right">
                            <asp:Button ID="btnSalir" runat="server" Text="Salir" Width="80px" Font-Bold="True" /></td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Panel ID="Panel2" runat="server" Visible="False">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label2" runat="server" BackColor="White" ForeColor="White" Text="..."></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblRubro" runat="server" Font-Bold="True" ForeColor="Green" Text="Rubro"></asp:Label></td>
                                                    <td>
                                                        <asp:Label ID="lblCuenta" runat="server" Font-Bold="True" ForeColor="Green" Text="Cuenta"></asp:Label></td>
                                                    <td>
                                                        <asp:Label ID="lblSubCuenta" runat="server" Font-Bold="True" ForeColor="Green" Text="SubCuenta"></asp:Label></td>
                                                    <td>
                                                        <asp:Label ID="lblDivisionaria" runat="server" Font-Bold="True" ForeColor="Green"
                                                            Text="Divisionaria"></asp:Label></td>
                                                    <td>
                                                        <asp:Label ID="lblSubDivisionaria" runat="server" Font-Bold="True" ForeColor="Green"
                                                            Text="SubDivisionaria"></asp:Label></td>
                                                    <td>
                                                        <asp:Label ID="lblAnalitica" runat="server" Font-Bold="True" ForeColor="Green" Text="Analitica"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="txtRubro" runat="server" onkeypress="return numEntero(event)" Width="60px" BackColor="#FFFF80" Font-Bold="True" MaxLength="2"></asp:TextBox></td>
                                                    <td>
                                                        <asp:TextBox ID="txtCuenta" runat="server" onkeypress="return numEntero(event)" Font-Bold="True" MaxLength="2" Width="60px"></asp:TextBox></td>
                                                    <td>
                                                        <asp:TextBox ID="txtSubCuenta" runat="server" onkeypress="return numEntero(event)" Font-Bold="True" MaxLength="2" Width="60px"></asp:TextBox></td>
                                                    <td>
                                                        <asp:TextBox ID="txtDivisionaria" runat="server" onkeypress="return numEntero(event)" Font-Bold="True" MaxLength="2" Width="60px"></asp:TextBox></td>
                                                    <td>
                                                        <asp:TextBox ID="txtSubDivisionaria" runat="server" onkeypress="return numEntero(event)" Font-Bold="True" MaxLength="2"
                                                            Width="60px"></asp:TextBox></td>
                                                    <td>
                                                        <asp:TextBox ID="txtAnalitica" runat="server" onkeypress="return numEntero(event)" Font-Bold="True" MaxLength="2" Width="60px"></asp:TextBox></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblInsertar" runat="server" Text="Insertar"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>
                            <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="Green" Text="Nombre de Cuenta"></asp:Label>
                            <asp:Label ID="Label22" runat="server" BackColor="White" ForeColor="White" Text="..."></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>
                <asp:TextBox ID="txtNomCuenta" runat="server" onblur="conMayuscula('txtNomCuenta')" TextMode="MultiLine" Width="500px"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td style="height: 21px" align="center">
                            <asp:Button ID="btnGuardar" runat="server" Text="Guardar" Width="70px" /><asp:Button ID="btnCancelar" runat="server" Text="Cancelar" Width="70px" /></td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
                </td>
        </tr>
    </table>
</asp:Content>

