<%@ Page Language="VB" AutoEventWireup="false" CodeFile="~/Home/CierreAlmacen.aspx.vb" Inherits="CierreAlmacen" %>
<style>
tr.highlighted td {
    background-color: rgb(102, 153, 204);
    color:#FFFFFF;
    
}
    th, td{
    border:1px solid #cfcfcf !important;
    font: normal 11px tahoma, arial,verdana;
    }

.cabecera{
cursor:default;zoom:1;padding:0;
background-image:none;
background-color:#c5c5c5;
background-image:-webkit-gradient(linear,50% 0%,50% 100%,color-stop(0%,#f9f9f9),color-stop(100%,#e3e4e6));
background-image:-webkit-linear-gradient(top,#f9f9f9,#e3e4e6);
background-image:-moz-linear-gradient(top,#f9f9f9,#e3e4e6);
background-image:-o-linear-gradient(top,#f9f9f9,#e3e4e6);
background-image:-ms-linear-gradient(top,#f9f9f9,#e3e4e6);
background-image:linear-gradient(top,#f9f9f9,#e3e4e6);
}

	</style>

   <section class="content-header">
    
          <h1 style="font-size:18px;font-weight:bold">
            
              Cierre de Almacén
          </h1>
         
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Logística</a></li>
            <li><a href="#">Almacén</a></li>
            <li class="active">Cierre</li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">
          
            <div class="row">
            <div class="col-md-12">

              <div class="box box-primary">
                <div class="box-header" style="height:780px">
                 
				  


             <form id="form1" runat="server">
                       
                 <asp:TextBox style="display:none" name="cod_empresa" id="cod_empresa" runat="server" aria-controls="tabla_inventario" class="form-control input-sm" />
                     <div class="row">
										
					<div class="col-xs-1">
					<div class="dataTables_length">
					 &nbsp; <b> </b> 
                                 
					</div>
					</div>


					<div class="col-xs-2">
					<div class="dataTables_length">
					
					</div>
					</div>

                        <div class="col-xs-3">
                        </div>
                        <div class="cols-xs-3" align="right" style="margin-right:32px;">
                        <div class="dataTables_length">
                         

                        </div>
                        </div>


				 </div>

                 <div class="row">				

					
					<div class="col-xs-12" align="center">
					<div class="dataTables_length">
                        <% If (Day(Now()) * 1 < 20 And Day(Now()) * 1 > 0) Then%>

                       Cerrar <b><%= ucase(left(MonthName(Month(DateAdd("d", -30, Now()))),1))& lcase(right(MonthName(Month(DateAdd("d", -30, Now()))),len(MonthName(Month(DateAdd("d", -30, Now()))))-1)) & " " & Year(DateAdd("d", -30, Now()))%></b>
                         y  Aperturar <b><%= ucase(left(MonthName(Month(Now())),1))& lcase(right(MonthName(Month(Now())),len(MonthName(Month(Now())))-1))& " " & Year(Now()) %></b>
     <span title="imprimir" onclick="cerrar()"  class="btn btn-success" style="font-size:12px;" >
                            <i  class="fa fa-lock" ></i> &nbsp; Ejecutar
                        </span>
                        <% Else%>
                            No existe cierre activo.
					    <% End If%>

                    </div>

                        <div id="div-cierre"></div>
					</div>
				 </div>
                 <br>

		  </form>
                </div>        
              </div> 
            </div><!-- /.col -->
          </div><!-- ./row -->



        </section><!-- /.content -->
            
    <script type="text/javascript">

            function cerrar() {
                url = document.url;
                $("#div-cierre").html("<div align=center ><img src='../images/loader.gif'></div>");
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/Cierre',
                    data: '{"empresa": "' + $("#id_empresa").val() + '", }',
                    dataType: "json",
                    success: function (response) {
                        $("#div-cierre").html("<div style='color:#33c34c' align=center >La petición se realizó correctamente.</div>");
                    },
                    error: function (a, b, c) {
                        alert(a.responseText);
                        $("#results").html(a.responseText);
                    }
                });

            }


    </script>

