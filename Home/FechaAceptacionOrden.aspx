<%@ Page Language="VB" AutoEventWireup="false" CodeFile="~/Home/FechaAceptacionOrden.aspx.vb" Inherits="FechaAceptacionOrden" %>

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

    .auto-style1
    {
        height: 19px;
    }
        
    
    #Text13 {
        height: 55px;
    }
        
    
    #concepto {
        height: 131px;
        width: 474px;
    }
        
    
    #conceptomodif {
        height: 84px;
        width: 196px;
    }

    
</style>

<section class="content-header">
    
    <h1 style="font-size:18px;font-weight:bold">
        Fecha Aceptaci&oacute;n de Ordenes
    </h1>
        
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Logistica</a></li>
        <li><a href="#">Ordenes</a></li>
        <li class="active">Fecha Aceptaci&oacute;n de Ordenes</li>
   </ol>
</section>

<!-- Main content -->
<section class="content">   

    <div class="row">        
        <div class="col-md-12">
            <div class="box box-primary">
                <div class="box-header">
                 
				    <div class="row">
                        <div class="col-lg-1">
					        <div class="dataTables_length">
					            &nbsp;  Tipo Orden 
                                <input type="hidden" name="del_idtipomovimientostock" value="I">                
					        </div>
					    </div>

                        <div class="col-lg-1">
                            <input type="radio" id="bien" name="bien" value="B" > Bien<br>
                        </div>

                        <div class="col-lg-1">
                            <input type="radio" id="servicio" name="servicio" value="S" > Servicio<br>
                        </div>

                        <div class="col-xs-1">
                            <div class="dataTables_length">
                                <select style="width:80px" class="form-control input-sm" name="Anno" id="Anno" >
                                    <%--<option value="2015">2015</option>--%>
                                    <option value="2016">2016</option>
                                </select>
                            </div>
                        </div>

                        <div class="col-xs-1">
                            <div class="dataTables_length">
                                <select style="width:80px" class="form-control input-sm" name="Mes" id="Mes" >
                                    <option value="01">Enero</option>
                                    <option value="02">Febrero</option>
                                    <option value="03">Marzo</option>
                                    <option value="04">Abril</option>
                                    <option value="05">Mayo</option>
                                    <option value="06">Junio</option>
                                    <option value="07">Julio</option>
                                    <option value="08">Agosto</option>
                                    <option value="09">Septiembre</option>
                                    <option value="10">Octubre</option>
                                    <option value="11">Noviembre</option>
                                    <option value="12">Diciembre</option>
                                </select>
                            </div>
                        </div>

                        <div class="col-lg-2">
                            <input type=text name="tipo_orden" id="tipo_orden" aria-controls="tabla_inventario" class="form-control input-sm">
                        </div>

                        <div class="col-lg-2">
                            <input type=text name="id_orden" id="id_orden" aria-controls="tabla_inventario" class="form-control input-sm">
                        </div>

                        <div class="cols-xs-3" align="right" style="margin-right:32px;">
                            <div class="dataTables_length">
                                                                                                                                       
                                    <span class="" id="asignarfechaAct" data-toggle="modal" onclick="" data-target="#agregarFechaAceptacion" >
                                        <%--<i  class="fa fa-plus" ></i> &nbsp; AGREGAR--%>
                                    </span>
              
                            </div>
                        </div>

                    </div>

                    <div class="row"><div class="col-lg-1"></div></div>
                    <div class="row"><div class="col-lg-1"></div></div>
                    <div class="row"><div class="col-lg-1"></div></div>
                    <div class="row"><div class="col-lg-1"></div></div>
                    <div class="row"><div class="col-lg-1"></div></div>

                    <div class="row">
                        <div class="col-xs-2" style="width:300px">
                            <label style="width:120px" class="col-lg-2 control-label">Buscar por</label>

                            <div class="col-xs-6">
                                <div class="dataTables_length">
                                    <select class="form-control input-sm" name="Buscarpor" id="Buscarpor" style="width:100%" >
                                        <option value="">Todos</option>
                                        <option value="ORDEN">Orden</option>
                                        <option value="CONCEPTO">Concepto</option>
                                        <option value="GERENCIA">Gerencia</option>
                                        <option value="PROVEEDOR">Proveedor</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <%--<div class="col-xs-1">
					        <div class="dataTables_length">
					            &nbsp;  Buscar : 
                                <input type="hidden" name="del_idtipomovimientostock" value="I">                
					        </div>
					    </div>--%>
                        
					    <div class="col-xs-3">
					        <div class="dataTables_length">
					            <input type=text name="buscar_fechaacept" id="buscar_fechaacept" aria-controls="tabla_inventario" class="form-control input-sm">

                                <input type=text name="Busqueda" id="Busqueda" aria-controls="tabla_inventario" class="form-control input-sm">

                                <input type=text name="BuscarProv" id="BuscarProv" aria-controls="tabla_inventario" class="form-control input-sm">

                                <input type=text name="proveedor" id="proveedor" aria-controls="tabla_inventario" class="form-control input-sm">
					        </div>
					    </div>
                    </div>

                    <div class="row">
                        <div class="col-xs-3">
					        <div class="dataTables_length">
					            <input type=text name="Fecha_Acept" id="Fecha_Acept" aria-controls="tabla_inventario" class="form-control input-sm">

                                <input type=text name="Fecha_Orden" id="Fecha_Orden" aria-controls="tabla_inventario" class="form-control input-sm">

                                <input type=text name="Fecha_AcepSelec" id="Fecha_AcepSelec" aria-controls="tabla_inventario" class="form-control input-sm">

                                <input type=text name="Fecha_Aceptacion" id="Fecha_Aceptacion" aria-controls="tabla_inventario" class="form-control input-sm">

                                <input type=text name="ActaoGuia" id="ActaoGuia" aria-controls="tabla_inventario" class="form-control input-sm">
					        </div>
					    </div>
                    </div>

                    <div class="box-body pad table-responsive"   style="overflow:scroll;height:580px">
				    <table id="tabla_fecAcept"  class="table table-bordered table-hover dataTable no-footer" role="grid" aria-describedby="tabla_inventario_info">
				        <thead>
                            <tr  class="cabecera">
                                <th style="text-align:center" ><b>Nro </b></th>       
                                <th style="text-align:center" ><b>Orden </b></th>
                                <th style="text-align:center" ><b>Concepto </b></th>
                                <th style="text-align:center" ><b>Gerencia </b></th>
                                <th style="text-align:center" width="62" ><b>Fecha </b></th>
                                <th style="text-align:center" ><b>Proveedor </b></th>
                                <th style="text-align:center" ><b>Importe </b></th>
                                <th style="text-align:center" ><b>Aceptaci&oacute;n </b></th>
                                
                            </tr>
					    </thead>
                        <tbody id="body_fecAcept">
			                <tr ><td colspan="8" align="center">No se encontraron resultados</td></tr>		
                        </tbody>
                    </table>
                </div><!-- /.box -->

                </div>
            </div>
        </div>

        <%--ADICIONAR FECHA ACEPTACION--%>
         <form id="AdicionarFechaAceptacion" class="form-horizontal" >     
            <input type="hidden" name="fecAcep" id="fecAcep" >
                <div class="modal fade" id="agregarFechaAceptacion" role="dialog" aria-labelledby="Login" aria-hidden="true" >
                    <div class="modal-dialog modal-md">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title" style="font-size:18px;font-weight:bold"><label>Ingreso Fecha de Aceptaci&oacute;n</label></h1>
                                                        
                                <span style="float:right;margin-top:-28px">
                                    <span id="guardarfechaaceptacion" class="btn btn-primary" style="font-size:12px" onclick="validadFechaAceptacion()">
                                        <i class="fa fa-save" ></i> &nbsp; GUARDAR
                                    </span>

                                    <span id="cancelarfechaaceptacion" data-dismiss="modal" aria-label="Close" class="btn btn-danger" style="font-size:12px" onclick="" >
                                        <i class="fa fa-close"></i> &nbsp; CANCELAR
                                    </span>
                                </span>
                            </div>

                            <input type="hidden" name="empresa" id="empresa" >
                                                                        
                            <div class="modal-body">

                                <div class="form-group">
                                    <label class="col-lg-3 control-label">Nro de Orden</label>
                                    <div class="col-lg-3">
                                        <input disabled  type="text" class="form-control" name="ordencompra" id="ordencompra" style="width:100%" />
                                    </div>

                                    <label class="col-lg-2 control-label">Gerencia</label>
                                    <div class="col-lg-2">
                                        <input disabled type="text" class="form-control" name="gerencia" id="gerencia" style="width:100%" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-lg-2 control-label">Proveedor</label>
                                    <div class="col-lg-9">
                                        <input disabled type="text" class="form-control" name="proveedorr" id="proveedorr" style="width:100%" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-lg-2 control-label">Concepto</label>
                                    <div class="col-lg-9">
                                        <textarea disabled class="form-control" name="concepto" id="concepto" style="resize:none"></textarea>
                                    </div>
                                </div>
                               
                                <div class="form-group">
                                    <label class="col-lg-7 control-label">Fecha de Aceptaci&oacute;n</label>
                                </div>                               

                                <div class="form-group">
                                    <label class="col-lg-5 control-label" style="width:260px"></label>
                                    <div class="col-lg-2" style="width:125px">
                                        <input readonly style="border-color:#00a65a;background-color:#ffffff" type="text" class="form-control" name="FechaAceptacion" id="FechaAceptacion"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-lg-3">
                                        <input type="text" class="form-control" name="ordencompra_asig" id="ordencompra_asig" style="width:100%" />
                                    </div>    
                                    
                                    <div class="col-lg-3">
                                        <input type="text" class="form-control" name="tipoorden_asig" id="tipoorden_asig" style="width:100%" />
                                    </div>                                                  
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <%--BUSCAR PROVEEDOR--%>
                        <div class="modal fade" id="buscarprov" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        <h4 class="modal-title" id="H2">Buscar Proveedor</h4>

                                        <span id="CerrarBuscarProv" data-dismiss="modal" aria-label="Close" class="btn btn-danger" style="font-size:12px" >
                                            <i class="fa fa-close"></i> &nbsp; CERRAR
                                        </span>
                                    </div>

                                    
            
                                    <div class="modal-body">
                                                                                                                  
                                        <div class="box-body pad table-responsive" style="height:350px">

                                            <table id="TProveedores" class="table table-bordered table-hover dataTable no-footer">
                                                <thead>
                                                    <tr class="cabecera">
                                                        <th class="auto-style1">Nro </th>
                                                        <th class="auto-style1">RUC </th>
                                                        <th class="auto-style1">Razon Social </th>
                                                    </tr>
                                                </thead>
                                                <tbody id="body_proveedores">
                                                    <tr><td  colspan="3" align="center">No se encontraron resultados</td></tr>
                                                </tbody>
                                            </table>
                                        
                                        </div>
                                    </div>
                
                                    
                                   <%-- <span id="guardarordencompra" class="btn btn-primary" style="font-size:12px" onclick="carga_submit_ordencompra() ">
                                                <i class="fa fa-save" ></i> &nbsp; GUARDAR
                                            </span>--%>
                                </div>
                            </div>
                        </div>

         </form>
    </div>

    <div class="row">
        <div class="col-xs-2">
            <input style="width:80px" type="text" class="form-control input-sm" name="Annos" id="Annos" />
        </div>

        <div class="col-xs-2">
            <input style="width:80px" type="text" class="form-control input-sm" name="Meses" id="Meses" />
        </div>
    </div>

    <div class="row">
        <label class="col-lg-1 control-label" />

        <span class="btn btn-success" id="enviocorreo" style="font-size:12px" data-toggle="modal" onclick="envioEmail()" data-target="" >
            <i  class="fa fa-plus" ></i> &nbsp; ENVIO CORREO
        </span>

        <span class="btn btn-success" id="enviocorreoasistentes" style="font-size:12px" data-toggle="modal" onclick="envioEmailAsistente()" data-target="" >
            <i  class="fa fa-plus" ></i> &nbsp; ENVIO CORREO Asistente
        </span>

    </div>

    <div class="row">
        <div class="col-xs-2">
            <input style="width:80px" type="text" class="form-control input-sm" name="Email" id="Email" />
            <input style="width:80px" type="text" class="form-control input-sm" name="EmailAsistente" id="EmailAsistente" />
        </div>

        <div class="col-xs-2">
            <input style="width:80px" type="text" class="form-control input-sm" name="Cuerpo_Correo" id="Cuerpo_Correo" />

            <input style="width:80px" type="text" class="form-control input-sm" name="BuscarCarEspc" id="BuscarCarEspc" />
        </div>
    </div>

</section>

<link href="../css/select2.css" rel="stylesheet"/>
<script src="../js/select2.js"></script>
	 
<script src="../js/jquery.uitablefilter.js" ></script>


<script type="text/javascript">

    function carga_submit() {
        $("#AdicionarFechaAceptacion").submit();
    }

    $(document).ready(function () {

        //Fecha Actual
        var f = new Date();

        fechaactual = ('0' + f.getDate()).slice(-2).toString()
           + '/' + ('0' + (f.getMonth() + 1)).slice(-2).toString()
           + '/' + f.getFullYear().toString();

        Ano = f.getFullYear().toString();
        Mes = ('0' + (f.getMonth() + 1)).slice(-2).toString();

        $("#Annos").val(Ano);
        $("#Meses").val(Mes);

        $('select[name=Anno]').val($("#Annos").val());
        $('select[name=Mes]').val($("#Meses").val());

        $("#Annos").hide();
        $("#Meses").hide();
        $("#Mes").hide();


        //Bien - Servicio
        $("#bien").click(function () {
            $("#servicio").prop('checked', false);

            $("#tipo_orden").val("C")
            listar_fechaaceptacion();
        });

        $("#servicio").click(function () {
            $("#bien").prop('checked', false);

            $("#tipo_orden").val("S")
            listar_fechaaceptacion();
        });

        $("#bien").prop('checked', true);
        $("#tipo_orden").val("C")

        $("#tipo_orden").hide();

        orden = $("#tabla_fecAcept");
        //$("#buscar_fechaacept").keyup(function () {
        //    $.uiTableFilter(orden, this.value);
        //});

        ruc = $("#tabla_fecAcept");

        siglas = $("#tabla_fecAcept");
        //$("#buscar_fechaacept").keyup(function () {
        //    $.uiTableFilter(siglas, this.value);
        //});

        listar_fechaaceptacion();

        $("#Anno").change(function () {
            listar_fechaaceptacion();
        });

        $("#Mes").change(function () {
            listar_fechaaceptacion();
        });

        $("#FechaAceptacion").val(fechaactual);

        //Para elegir FechaTipoCamb
        $("#FechaAceptacion").datepicker({
            format: "dd/mm/yyyy",
            todayHighlight: true,
            autoclose: true,
        });

        $("#ordencompra_asig").hide();
        $("#tipoorden_asig").hide();
        $("#id_orden").hide();

        //Asignar Fecha Aceptacion
        $("#AdicionarFechaAceptacion").submit(function (event) {

            if ($("#ordencompra").val() == "")
                alert("Seleccion Orden de Compra");

            else {
                var ary = $("#AdicionarFechaAceptacion").serializeArray();
                var obj = {};
                for (var a = 0; a < ary.length; a++)
                    obj[ary[a].name] = ary[a].value;
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/InsertarFechaAceptacion',
                    data: JSON.stringify(obj),
                    dataType: "json",
                    success: function (response) {

                        if (response.d == 1) {
                            Correos();
                        }
                        else {
                            alert("Error");
                        }
                    },
                    error: function (a) {
                        alert(a.responseText);
                        $("#results").html(a.responseText);
                    }
                });
            }

            event.preventDefault();
        });

        $("#AdicionarFechaAceptacion #empresa").val($("#id_empresa").val());

        document.getElementById("buscar_fechaacept").disabled = true;

        $("#Buscarpor").change(function () {
           if ($("#Buscarpor").val() != "") {
                document.getElementById("buscar_fechaacept").disabled = false;
                $("#buscar_fechaacept").val("");
                $("#buscar_fechaacept").focus();
            }
            else if ($("#Buscarpor").val() == "") {
                document.getElementById("buscar_fechaacept").disabled = true;
                $("#buscar_fechaacept").val("");
                listar_fechaaceptacion();
            }
        });

        $("#buscar_fechaacept").keypress(function (e) {
            if (e.which == 13) {
                if ($("#Buscarpor").val() == "PROVEEDOR") {
                    validarLlenadoBP();
                }
                else if ($("#Buscarpor").val() != "PROVEEDOR") {
                    $("#Busqueda").val($("#buscar_fechaacept").val());

                    listar_fechaaceptacion();
                }
            }
        });

        mayuscula("#buscar_fechaacept");

        //alert($("#Anno").val());

        $("#Busqueda").hide();
        $("#BuscarProv").hide();
        $("#proveedor").hide();

        $("#Email").hide();
        $("#EmailAsistente").hide();

        $("#Cuerpo_Correo").hide();
        $("#BuscarCarEspc").hide();

        $("#enviocorreo").hide();
        $("#enviocorreoasistentes").hide();

        $("#Fecha_Acept").hide();
        $("#Fecha_Orden").hide();
        $("#Fecha_AcepSelec").hide();
        $("#Fecha_Aceptacion").hide();
        $("#ActaoGuia").hide();
        
    });

    function mayuscula(campo) {
        $(campo).keyup(function () {
            $(this).val($(this).val().toUpperCase());
        });
    }

    function listar_fechaaceptacion() {
        url = document.url;
        $("#body_fecAcept").html("<tr><td colspan=8><div align=center ><img src='../images/loader.gif'></div></td></tr>");
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/listarFechaAceptacion',
            data: '{"IdAnno": "' + $("#Anno").val() + '","CompraServicio": "' + $("#tipo_orden").val() + '","TipoBusqueda": "' + $("#Buscarpor").val() + '","Busqueda": "' + $("#Busqueda").val() + '","empresa": "' + $("#id_empresa").val() + '"}',
            dataType: "json",
            success: function (response) {
                var customers = eval(response.d);
                var html = "";
                var xnro = 1;
                $.each(customers, function () {

                    html += "<tr id='fila" + xnro +
                    "'  ondblclick=asignarfechaaceptacion() onclick=fechaaceptacion('" + this.IdOrdenCompra + "','" + this.IdProveedor + "','" + xnro + "') style='cursor:pointer'><td style='text-align:center'>"
                    + xnro + " </td><td style='text-align:left' class='IdOrdemComp'>"
                    + this.IdOrdenCompra + " </td><td style='text-align:left' class='Descrip'> " + this.Descripcion + "</td><td> " + this.Siglas + "</td><td style='text-align:center' >" + this.FechaOrdenCompra + "</td><td>" + this.RazonSocial + "</td><td style='text-align:right' >" + this.ValorVenta + "</td><td style='text-align:center' >" + this.FechaAceptacion + "</td><td style='text-align:center' hidden >" + this.IdProveedor + "</td> </tr>";
                    xnro++;
                });

                $("#body_fecAcept").html(html == "" ? "<tr><td colspan='8> <div align=center><br>No se encontraron resultados</div></td></tr>" : html);
            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });
    }

    function fechaaceptacion(orden,ruc, u) {
        $('#tabla_fecAcept tr').removeClass('highlighted');
        $("#tabla_fecAcept #fila" + u).addClass('highlighted');

        $("#id_orden").val(orden);

        $("#proveedor").val(ruc);
        //alert($("#proveedor").val());

    }

    function detaAsignarFechaAcept() {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/detAsignarFecAcept',
            data: '{"IdOrdenCompra": "' + $("#id_orden").val() + '","CompraServicio": "' + $("#tipo_orden").val() + '","IdAnno": "' + $("#Anno").val() + '","empresa": "' + $("#id_empresa").val() + '" }',
            dataType: "json",
            success: function (response) {
                var customers = eval(response.d);

                $.each(customers, function () {

                    $("#ordencompra").val(this.IdOrdenCompra)
                    $("#gerencia").val(this.Siglas)
                    $("#proveedorr").val(this.RazonSocial)
                    $("#concepto").val(this.Descripcion)

                    $("#ordencompra_asig").val(this.IdOrdenCompra)
           
                });

            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });
    }

    function asignarfechaaceptacion() {

        ActaoGuia();

    }



    function validarLlenadoBP() {

        var buscarProveedor = $("#buscar_fechaacept").val();
        var contar = buscarProveedor.length;

        if (contar >= '5') {
            ValidarBusquedaProv();

            listar_TProveedores();

            $("#buscarprov").modal();
        }
        else if (contar < '5') {
            alert("Ingrese 5 caracteres para buscar al proveedor")
        }
    }
    
    function ValidarBusquedaProv() {
        if ($("#buscar_fechaacept").val() == "") {
            $("#BuscarProv").val("");
        }
        else {
            $("#BuscarProv").val('%' + $("#buscar_fechaacept").val() + '%');
        }
    }

    function listar_TProveedores() {
        url = document.url;
        $("#body_proveedores").html("<tr><td colspan=3><div align=center ><img src='../images/loader.gif'></div></td></tr>");
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/listarProveedores',
            data: '{"Proveedor": "' + $("#BuscarProv").val() + '","empresa": "' + $("#id_empresa").val() + '"}',
            dataType: "json",
            success: function (response) {
                var customers = eval(response.d);
                var html = "";
                var xnro = 1;
                $.each(customers, function () {

                    html += "<tr id='fila" + xnro +
                            "'  onclick=detalle_proveedor('" + this.IdProveedor + "','" + xnro + "') style='cursor:pointer'><td style='text-align:center'>"
                            + xnro + " </td><td style='text-align:center'>"
                            + this.IdProveedor + " </td><td style='text-align:left'> " + this.RazonSocial + "</td> </tr>";
                    xnro++;
                });
                $("#body_proveedores").html(html == "" ? "<tr><td colspan='3'> <div align=center><br>No se encontraron resultados</div></td></tr>" : html);
            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });
    }

    function detalle_proveedor(prov, u) {
        $('#TProveedores tr').removeClass('highlighted');
        $("#TProveedores #fila" + u).addClass('highlighted');

        $("#proveedor").val(prov);
        $("#Busqueda").val($("#proveedor").val());

        Mostrar_Proveedor();

        //$("#TipoDoc").val($("#IdTipoDocumento").val());
        //$("#TipoProveedor").val($('#Proveedor').val());

        //if ($("#ValSinRNP").val() == "SinRNP") {
        //    ExtraerFechaFinRNP();
        //}

        $("#CerrarBuscarProv").click();

    }

    function Mostrar_Proveedor() {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/MostrarProveedor',
            data: '{"IdProveedor": "' + $("#proveedor").val() + '","empresa": "' + $("#id_empresa").val() + '"}',
            dataType: "json",
            success: function (response) {
                var customers = eval(response.d);

                $.each(customers, function () {

                    $("#buscar_fechaacept").val(this.RazonSocial)

                });

            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });
        listar_fechaaceptacion();
    }

    function envioEmail() {

        $.ajax({
            //url: 'http://' + document.domain + '/VB/Services/Service.svc/EditPic',
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/Envio_Email',
            type: 'POST',
            contentType: "application/json; charset=utf-8",
            //data: '{"Correo": "sistemas01@emape.gob.pe","Cuerpo": "' + $("#Cuerpo_Correo").val() + '"}',
            data: '{"Correo": "' + $("#Email").val() + '","Cuerpo": "' + $("#Cuerpo_Correo").val() + '"}',
            processData: false,
            crossDomain: true,
            dataType: "json",
            success: function (data, textStatus, jqXHR) {

            }
        });
    }

    function envioEmailAsistente() {

        $.ajax({
            //url: 'http://' + document.domain + '/VB/Services/Service.svc/EditPic',
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/Envio_Email_Asistentes',
            type: 'POST',
            contentType: "application/json; charset=utf-8",
            //data: '{"Correo": "sistemas01@emape.gob.pe","Cuerpo": "' + $("#Cuerpo_Correo").val() + '"}',
            data: '{"CorreoAsistente": "' + $("#EmailAsistente").val() + '","Cuerpo_mAsistente": "' + $("#Cuerpo_Correo").val() + '"}',
            processData: false,
            crossDomain: true,
            dataType: "json",
            success: function (data, textStatus, jqXHR) {

            }
        });
    }

    function Correos() {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/Correos',
            data: '{"IdProveedor": "' + $("#proveedor").val() + '","empresa": "' + $("#id_empresa").val() + '"}',
            dataType: "json",
            success: function (response) {
                var customers = eval(response.d);

                $.each(customers, function () {

                    $("#Email").val(this.Correo1)
                    $("#EmailAsistente").val(this.Correo2)
                    $("#BuscarCarEspc").val(this.BuscarCarEspc)

                });
                ActualizarFechaAceptacion();

            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });
    }

    function ActualizarFechaAceptacion() {
        if ($("#tipo_orden").val() == "S") {
            $("#Cuerpo_Correo").val("FECHA DE ACEPTACION: " + $("#FechaAceptacion").val() + " FUE ASIGNADA A SU ORDEN DE SERVICIO NRO: " + $("#ordencompra").val() + ".");
        }
        else if ($("#tipo_orden").val() == "C") {
            $("#Cuerpo_Correo").val("FECHA DE ACEPTACION: " + $("#FechaAceptacion").val() + " FUE ASIGNADA A SU ORDEN DE COMPRA NRO: " + $("#ordencompra").val() + ".");
        }


        if ($("#BuscarCarEspc").val() == 0) {
            alert("Proveedor no cuenta con email, sirvase actualizarlo");
        }
        else if ($("#BuscarCarEspc").val() == 1) {
            $("#enviocorreo").click();
            $("#enviocorreoasistentes").click();
        }

        alert("Fecha de Aceptación fue asignada a la Orden Nro: " + $("#ordencompra").val());
        $("#cancelarfechaaceptacion").click();
        $("#buscar_fechaacept").val("");
        listar_fechaaceptacion();
        Limpiar();
        
    }

    function Limpiar() {
        $("#Email").val("");
        $("#EmailAsistente").val("");
        $("#Cuerpo_Correo").val("");
        $("#BuscarCarEspc").val("");
        $("#proveedor").val("");
        $("#buscar_fechaacept").val("");
        $("#Busqueda").val("");
        $("#BuscarProv").val("");
    }

    function ActaoGuia() {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/actasoguias',
            data: '{"IdOrdenCompra": "' + $("#id_orden").val() + '","CompraServicio": "' + $("#tipo_orden").val() + '","empresa": "' + $("#id_empresa").val() + '" }',
            dataType: "json",
            success: function (response) {
                var customers = eval(response.d);

                $.each(customers, function () {

                    $("#ActaoGuia").val(this.ActaoGuia)


                    if (($("#ActaoGuia").val() != "             ") && ($("#tipo_orden").val() == "S")) {
                        alert("Orden de Servicio Nro: " + $("#id_orden").val() + " con Acta de Conformidad");
                    }
                    else if (($("#ActaoGuia").val() != "             ") && ($("#tipo_orden").val() == "C")) {
                        alert("Orden de Compra Nro: " + $("#id_orden").val() + " con Guías de Ingreso a Almacén");
                    }
                    else {
                        $("#asignarfechaAct").click();

                        detaAsignarFechaAcept();
                        $("#tipoorden_asig").val($("#tipo_orden").val());
                    }

                    $("#ActaoGuia").val("");

                });

            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });
    }

    function datosFechaAcepSelect() {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/selectFecAcept',
            data: '{"IdOrdenCompra": "' + $("#id_orden").val() + '","CompraServicio": "' + $("#tipo_orden").val() + '","FechaAceptacion": "' + $("#Fecha_Aceptacion").val() + '","empresa": "' + $("#id_empresa").val() + '" }',
            dataType: "json",
            success: function (response) {
                var customers = eval(response.d);

                $.each(customers, function () {

                    $("#Fecha_Orden").val(this.FechaOrdenCompra)
                    $("#Fecha_AcepSelec").val(this.FechaAceptacionSelect)


                    if (($("#Fecha_AcepSelec").val() < $("#Fecha_Orden").val()) && ($("#tipo_orden").val() == "S")) {
                        alert("La Fecha Aceptación no puede ser menor a la Fecha de la Orden de Servicio: " + $("#Fecha_Orden").val());
                    }
                    else if (($("#Fecha_AcepSelec").val() < $("#Fecha_Orden").val()) && ($("#tipo_orden").val() == "C")) {
                        alert("La Fecha Aceptación no puede ser menor a la Fecha de la Orden de Compra: " + $("#Fecha_Orden").val());
                    }
                    else {
                        carga_submit();
                    }

                });

            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });
    }

    function validadFechaAceptacion() {

        $("#Fecha_Aceptacion").val($("#FechaAceptacion").val());

        datosFechaAcepSelect();

    }

</script>
