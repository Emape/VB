<%@ page language="VB" masterpagefile="~/MasterPage.master" autoeventwireup="false" inherits="Importar1, App_Web_js1z4v53" title="Importar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table>
        <tr>
            <td>
            </td>
            <td style="width: 100px">
            </td>
            <td style="width: 100px">
            </td>
        </tr>
        <tr>
            <td style="width: 100px">
                <asp:Button ID="btnDinamica" runat="server" Text="Dinamicas" /></td>
            <td style="width: 100px">
            </td>
            <td style="width: 100px">
                <asp:Button ID="btnTipos" runat="server" Text="Tipos" /></td>
        </tr>
        <tr>
            <td style="width: 100px">
            </td>
            <td style="width: 100px">
                <asp:Button ID="btnTabAuxiliar" runat="server" Text="TablasAuxiliares" /></td>
            <td style="width: 100px">
            </td>
        </tr>
        <tr>
            <td style="width: 100px">
                <asp:Button ID="btnCtaPlazoCalcum" runat="server" Text="CtaPlazoCalcum" /></td>
            <td style="width: 100px">
            </td>
            <td style="width: 100px">
                <asp:Button ID="btnTransaccion" runat="server" Text="Transacciones" /></td>
        </tr>
        <tr>
            <td style="width: 100px">
                <asp:Button ID="btnPlanCuenta" runat="server" Text="Plan Contable" /></td>
            <td style="width: 100px">
                <asp:Button ID="btnCartera" runat="server" Text="CarteraDic2011" /></td>
            <td style="width: 100px">
            </td>
        </tr>
        <tr>
            <td style="width: 100px">
                <asp:Button ID="btnReprogramacion" runat="server" Text="TipoReprogramacion" /></td>
            <td style="width: 100px">
            </td>
            <td style="width: 100px">
                <asp:Button ID="btnTipoMovimiento" runat="server" Text="TipoMovimiento" /></td>
        </tr>
        <tr>
            <td style="width: 100px">
                </td>
            <td style="width: 100px">
                <asp:Button ID="btnTipoAsiento" runat="server" Text="TipoAsiento" /></td>
            <td style="width: 100px">
                <asp:Button ID="Button1" runat="server" Text="Modalidad" /></td>
        </tr>
        <tr>
            <td style="width: 100px">
                <asp:Button ID="btnRefinanciado" runat="server" Text="Refinanciado" /></td>
            <td style="width: 100px">
                <asp:Button ID="btnDinaDese" runat="server" Text="DinaDesembolso" /></td>
            <td style="width: 100px">
                </td>
        </tr>
        <tr>
            <td style="width: 100px">
                </td>
            <td style="width: 100px">
            </td>
            <td style="width: 100px">
                <asp:Button ID="btnEquivalencia" runat="server" Text="EquivalenciaCuenta" /></td>
        </tr>
        <tr>
            <td style="width: 100px">
                <asp:Button ID="btnImportarExcell" runat="server" Text="ImportaExcell" /></td>
            <td style="width: 100px">
            </td>
            <td style="width: 100px">
                </td>
        </tr>
        <tr>
            <td style="width: 100px">
                </td>
            <td style="width: 100px">
            </td>
            <td style="width: 100px">
            </td>
        </tr>
        <tr>
            <td style="width: 100px">
            </td>
            <td style="width: 100px">
            </td>
            <td style="width: 100px">
                </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:GridView ID="grdvResultado" runat="server">
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>

