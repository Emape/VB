<%@ Page Language="VB" AutoEventWireup="false" CodeFile="RepExpedienteCompromiso.aspx.vb" Inherits="Home_RepExpedienteCompromiso" %>
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

 <style>
	body{
	font-size:12px !important;
	}
        /*css process modal -  processing-modal*/
        .modal-static { 
            position: fixed;
            top: 50% !important; 
            left: 50% !important; 
            margin-top: -100px;  
            margin-left: -150px; 
            overflow: visible !important;
        }
        .modal-static,
        .modal-static .modal-dialog,
        .modal-static .modal-content {
            width: 300px; 
            height: 90px; 
        }
        .modal-static .modal-dialog,
        .modal-static .modal-content {
            padding: 0 !important; 
            margin: 0 !important;
        }
        .modal-static .modal-content .icon {
        }
        .modal-text{
            text-align:center;
            font-family:Cambria;
            font-weight:bold;
            font-size:medium;
        }
    </style>


   <section class="content-header">
    
          <h1 style="font-size:18px;font-weight:bold">
            
              Reporte Expediente Compromiso
          </h1>
         
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Logística</a></li>
            <li><a href="#">Reporte</a></li>
            <li class="active">Expediente Compromiso</li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">
          
            <div class="row">
            <div class="col-md-12">

              <div class="box box-primary">
                <div class="box-header">

             <form id="form1" action="#" method="post">
                     <div class="row">
                    <div class="col-xs-2 col-md-2 col-lg-1">
					<div class="dataTables_length">
					 &nbsp;  N. Orden:                                  
					</div>
					</div>
					<div class="col-xs-8 col-md-5 col-lg-3">
					<div class="dataTables_length">
					<input type="text" name="orden" id="orden"  aria-controls="tabla_inventario" class="form-control input-sm" />
					</div>
					</div>

                    <div class="col-xs-2 col-md-2 col-lg-1">
					<div class="dataTables_length">
                        <span class="btn btn-primary" onclick="listar()"><i class="fa fa-search"></i></span>
					</div>
					</div>
				 </div>
                 

		  </form>
                </div>
                <div class="box-body pad table-responsive"   style="overflow:scroll;height:700px">
	         <table id="tabla"  class="table table-bordered table-hover dataTable no-footer" role="grid" aria-describedby="tabla_inventario_info">
				  <thead>
                    <tr  class="cabecera">
                      
                      <th style="text-align:center" >N. </th>
                      <th style="text-align:center" >N. Orden </th>
                      <th style="text-align:center" >N. Expediente</th>
                      <th style="text-align:center" >N. Encargo</th>
                      <th style="text-align:center" >Certificación</th>
                      <th style="text-align:center" >Tipo </th>
                      <th style="text-align:center" >Fecha  </th>
                      <th style="text-align:center" >Monto  </th>
                    </tr>
					</thead>
                    
                   <tbody id="body_guia">
			   <tr ><td  colspan="11" align="center">No se encontraron resultados</td></tr>		
                  </table>

				  
                </div><!-- /.box -->
              </div>
            </div><!-- /.col -->
          </div><!-- ./row -->
        </section><!-- /.content -->
	<script src="../js/jquery.uitablefilter.js" ></script>
            
    <script type="text/javascript">
        $(document).ready(function () {
            listar();

            $("#orden").keypress(function (e) {
                if (e.which == 13) {
                    // Acciones a realizar, por ej: enviar formulario.
                    listar();
                    return false;
                }
            });
        });

        function listar() {

            $("#body_guia").html("<tr><td colspan=9><div align=center ><img src='../images/loader.gif'></div></td></tr>");
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/listarExpedienteCompromiso',
                data: '{"empresa": "' + $("#id_empresa").val() + '","orden": "' + $("#orden").val() + '"}',
                dataType: "json",
                success: function (response) {
                    var customers = eval(response.d);
                    var html = "";
                    var xnro = 1;
                    $.each(customers, function () {

                        if (this.Expediente==null)
                            exp="";
                        else
                            exp=this.Expediente;

                        //<td> " + this.Estado + "</td>
                        html += "<tr id='fila" + xnro +
                        "' class=getsum  style='cursor:pointer'><td style='text-align:center;'>"
                        + xnro + " </td><td style='text-align:center;'>" + this.Orden + "</td><td style='text-align:center'> " + exp + "</td><td style='text-align:center;'> " +
						this.Encargo + "</td><td style='text-align:center;'>" + this.Solicitud + "</td><td style='text-align:center;'>" + this.CompraServicio + "</td><td style='text-align:center;'>" + this.Fecha + "</td><td style='text-align:center;'>" + this.Monto.toFixed(2) + "</td>";
                        html += "</tr>";
                        xnro++;
                    });

                    $("#body_guia").html(html == "" ? "<tr><td colspan='8'> <div align=center>No se encontraron resultados</div></td></tr>" : html);
                },
                error: function (a, b, c) {
                    alert(a.responseText);
                    $("#results").html(a.responseText);
                }
            });

        }

    </script>
