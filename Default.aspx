<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <script src="Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script type = "text/javascript">
        $("#search").live("click", function () {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: 'http://ra:88/VB/Services/Logistica/Almacen.svc/GetCustomers',
                data: '{"prefix": "' + $("#prefix").val() + '"}',
                processData: true,
                crossDomain:true,
                dataType: "json",
                success: function (response) {
                    var customers = eval(response.d);
                    var html = "";
                    $.each(customers, function () {
                        html += "<span>Name: " + this.Name + " Id: " + this.Id + "</span><br />";
                    });
                    $("#results").html(html == "" ? "No results" : html);
                },
                error: function (a, b, c) {
                    alert(a.responseText);
                    $("#results").html(a.responseText);
                }
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <input type = "text" id = "prefix" />
    <input id = "search" type = "button" value = "Search" />
    <div id = "results"></div>
        <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" ToolPanelView="None" />
    </form>
</body>
</html>