<%@ Page Language="VB" AutoEventWireup="false" CodeFile="~/Home/OrdenCompra.aspx.vb" Inherits="OrderCompra" %>

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
        height: 116px;
        width: 354px;
    }
        
    
    #conceptomodif {
        height: 116px;
        width: 354px;
    }
    
</style>

<section class="content-header">
    
    <h1 style="font-size:18px;font-weight:bold">
        Orden de Compra
    </h1>
        
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Logistica</a></li>
        <li><a href="#">Ordenes</a></li>
        <li class="active">Orden de Compra</li>
   </ol>
</section>

<!-- Main content -->
<section class="content">
          
    <div class="row">
        <div class="col-md-12">
            <div class="box box-primary">
                <div class="box-header">
                 
				    <div class="row" id="Cabec_OrdenCompra">
										
					    <div class="col-xs-1">
					        <div class="dataTables_length">
					            &nbsp;  Buscar : 
                                <input type="hidden" name="del_idtipomovimientostock" value="I">                
					        </div>
					    </div>
                        
					    <div class="col-xs-2">
					        <div class="dataTables_length">
					            <input type=text name="buscar_orden" id="buscar_orden" aria-controls="tabla_inventario" class="form-control input-sm">
					        </div>
					    </div>

                        <div class="col-xs-2">
                            <span class="btn btn-primary" id="buscar" style="font-size:12px" data-toggle="modal" onclick="listar_TProveedoresxOrdenes();" data-target="#BuscarProveedorxOrdenes" >
                                <i  class="fa fa-search" ></i> &nbsp; BUSCAR PROVEEDOR
                            </span>
                        </div>

                        <div class="col-xs-1">
                            <div class="dataTables_length">
                                    <select style="width:80px" class="form-control input-sm" name="Anno" id="Anno" >
                                        <option value="2015">2015</option>
                                        <option value="2016">2016</option>
                                        <%--<option value="2017">2017</option>
                                        <option value="2018">2018</option>
                                        <option value="2019">2019</option>
                                        <option value="2020">2020</option>
                                        <option value="2021">2021</option>
                                        <option value="2022">2022</option>
                                        <option value="2023">2023</option>--%>
                                    </select>
                            </div>
                        </div>

                        <div class="col-xs-1">
                                <div class="dataTables_length">
                                    <select style="width:100px" class="form-control input-sm" name="Mes" id="Mes" >
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

                        <%--<div class="col-xs-1">
                            <input type=text name="id_orden" id="id_orden" aria-controls="tabla_inventario" class="form-control input-sm">
                        </div>
                        <div class="col-xs-1">
                            <input type=text name="id_requerimiento" id="id_requerimiento" aria-controls="tabla_inventario" class="form-control input-sm">
                        </div>
                        <div class="col-xs-1">
                            <input type=text name="modificarcompraoservicio" id="modificarcompraoservicio" aria-controls="tabla_inventario" class="form-control input-sm">
                        </div>--%>

                        <%--<div class="col-xs-1"></div>--%>

                        <div class="cols-xs-3" align="right" style="margin-right:32px;">
                            <div class="dataTables_length">

                                <form id="form1" runat="server">
                                    <asp:TextBox style="display:none" name="cod_empresa" id="cod_empresa" runat="server" aria-controls="tabla_inventario" class="form-control input-sm" />
                                    <asp:TextBox style="display:none" runat="server" id="txt_oc" />
                                    <asp:TextBox style="display:none" runat="server" id="txt_idorden1" />
                                    <asp:TextBox style="display:none" runat="server" id="txt_idorden2" />
                                    <asp:TextBox style="display:none" runat="server" id="txt_tipooc" />
                                    <asp:TextBox style="display:none" runat="server" id="txt_nrocolumnas" />
                                    <%--<asp:TextBox style="display:none" runat="server" id="txt_formaPrint" />
                                    <asp:TextBox style="display:none" runat="server" id="txt_numOrden" />--%>
                                    <asp:Button style="display:none" ID="btn_gs" Text="Exportar" runat="server" OnClientClick="target = '_blank'" OnClick="Exportargs" />
                                    <asp:Button style="display:none" ID="btn_gsMasiva" Text="Exportar" runat="server" OnClientClick="target = '_blank'" OnClick="Exportargs_Masiva" />
                                                                                                        
                                    <span class="btn btn-success" id="agregar" style="font-size:12px" data-toggle="modal" onclick="listar_requerimiento();" data-target="" >
                                        <i  class="fa fa-plus" ></i> &nbsp; AGREGAR
                                    </span>

                                    &nbsp;
                                    <span class="btn btn-info" id="cambiar" style="font-size:12px" data-toggle="modal" onclick="OrdenesAnuladas();OrdenesActuales();" data-target="#confirm-reemplazo" >
                                        <i  class="fa fa-edit" ></i> &nbsp; CAMBIAR ORDEN
                                    </span>

                                    &nbsp;
                                    <span class="btn btn-danger" id="eliminar" style="font-size:12px" data-toggle="modal" data-target="#confirm-delete" onclick="" >
                                        <i class="fa fa-minus-circle" ></i> &nbsp; ANULAR
                                    </span>

                                    &nbsp;
                                    <span class="btn btn-warning" id="modificar" style="font-size:12px" data-toggle="modal" onclick="cabecera_modif_ordencompra()" data-target="" >
                                        <i class="fa fa-pencil" ></i> &nbsp; MODIFICAR
                                    </span>

                                    &nbsp;
                                    <span class="btn btn-primary" id="imprimir" style="font-size:12px" data-toggle="modal" onclick="" data-target="#imprimirOrden" >
                                        <i class="fa fa-print" ></i> &nbsp; IMPRIMIR
                                    </span>
                                    
                                    <%--<ul class="" style="">
                                        <li id="Li1" class="vineta"><a href="../home/ordenservicio.aspx" class="ajaxmenu"><i class="fa fa-cubes"></i> Orden de Servicio</a></li>
                                    </ul>--%>
                                
                               </form>
                            </div>
                        </div>

                        <div class="form-group">

                            <div class="col-lg-1"><input type=text name="buscar_ordendetalle" id="buscar_ordendetalle" aria-controls="tabla_inventario" class="form-control input-sm"></div>
                            <div class="col-lg-2"><input type="text" name="CodCentroCostDet" id="CodCentroCostDet" class="form-control"></div>
                            <div class="col-lg-1"><input type="text" name="NumItemOrdenCompDet" id="NumItemOrdenCompDet" class="form-control"></div>
                            <div class="col-lg-2"><input type="text" name="PartidapresuDet" id="PartidapresuDet" class="form-control"></div>
                            <div class="col-lg-2"><input type="text" name="CodTransacDet" id="CodTransacDet" class="form-control"></div>
                            <div class="col-lg-1"><input type="text" name="Estado" id="Estado" class="form-control"></div>
                            <div class="col-lg-1"><input type="text" name="Guia" id="Guia" class="form-control"></div>

                            <div class="col-lg-2"><input type="text" name="MensajeCabecera" id="MensajeCabecera" class="form-control"></div>
                            <div class="col-lg-2"><input type="text" name="MensajeDetalle" id="MensajeDetalle" class="form-control"></div>

                            <div class="col-lg-1"><input type="text" name="ValGuiaxOrden" id="ValGuiaxOrden" class="form-control"></div>

                            <div class="col-lg-4"><input type="text" name="BuscarProv" id="BuscarProv" class="form-control"></div>

                            <div class="col-lg-4"><input type="text" name="VerifEnter" id="VerifEnter" class="form-control"></div>

                            <div class="col-lg-4"><input type="text" name="NroFilas" id="NroFilas" class="form-control"></div>

                            <div class="col-lg-4"><input type="text" name="FlagEvaluado" id="FlagEvaluado" class="form-control"></div>

                            <div class="col-lg-4"><input type="text" name="NroOrden" id="NroOrden" class="form-control"></div>
                            
                        </div>
                   </div>
                    
                    <%--ADICIONAR ORDEN DE COMPRA--%>
                    <form id="AdicionarOrdendeCompra" class="form-horizontal" >     
                        <input type="hidden" name="nroreg" id="nroreg" >
                        <div class="row" id="AdicNewOrdenCompra">
                        <div class="col-md-12">
                            <div class="box box-primary">
                                <div class="box-header">

                        <%--<div class="modal fade" id="agregarOrdenCompra" role="dialog" aria-labelledby="Login" aria-hidden="true" >
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">--%>
                                        <h1 class="modal-title" style="font-size:18px;font-weight:bold"><label>Adicionar Orden de Compra</label></h1>
                        
                                        <span style="float:right;margin-top:-28px">
                                            <span id="guardarordencompra" class="btn btn-primary" style="font-size:12px" onclick="carga_submit_guardarordencompra() ">
                                                <i class="fa fa-save" ></i> &nbsp; GUARDAR
                                            </span>

                                            <span id="cancelarrordencompra" data-dismiss="modal" aria-label="Close" class="btn btn-danger" style="font-size:12px" onclick="cerrar_InsertOrdenes()" >
                                                <i class="fa fa-close"></i> &nbsp; CANCELAR
                                            </span>
                                        </span>
                                    </div>

                                    <input type="hidden" name="empresa" id="empresa" >
                                    <input type="hidden" name="IdUsuario" id="IdUsuario" class="form-control">
                                                                        
                                    <div class="modal-body">

                                        <input type="hidden" name="cond" id="cond" value=1>
                                        <input type="hidden" name="contadoradicordcomp" id="contadoradicordcomp" value=1>
                                        <input type="hidden" name="cond_tabla" id="cond_tabla" value=1>       
                      
                                        <input id="guardar1" type="submit" class="btn btn-primary" value="Guardar" style="display:none"  >
				                        <button style="display:none" id="cancelar" type="button" class="btn btn-default" data-dismiss="modal" >Cancelar</button>
                                        
                                        <%--<div class="form-group">--%>

                                        <div class="row">
                                            <div class="col-xs-4">
                                                
                                                <div class="form-group">                                              
                                                     <label class="col-lg-6 control-label" style="text-align:left" >Fecha</label>
                                                     
                                                     <label id="lblTipoCambio" class="col-lg-6 control-label" style="text-align:left" >Tipo Cambio</label>
                                                </div>

                                                <div class="form-group">
                                                    <div class="col-lg-4">
                                                        <input readonly style="border-color:#00a65a;background-color:#ffffff" type="text" class="form-control" name="FechaTipoCamb" id="FechaTipoCamb"/>
                                                    </div>

                                                    <div class="col-lg-3" id="FechaActual">
                                                        <input type="text" class="form-control" name="FActual" id="FActual"/>
                                                    </div>

                                                    <div class="col-lg-3" id="Tipo_Cambio">
                                                        <input disabled type="text" class="form-control" name="TipoCambio" id="TipoCambio"/>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="col-lg-3 control-label">Forma <font color=white>_</font>Pago</label>
                                                    <div class="col-lg-9">
                                                        <%--<select onchange="carga_tran();ver_alm()" class="form-control" name="tran" id="tran">--%>
                                                        <select class="form-control" name="IdFormaPago" id="IdFormaPago" >
                                                            <option value="S"></option>                        
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="col-lg-3 control-label">Tipo <font color=white>_</font>Documento</label>
                                                    <div class="col-lg-9">
                                                        <select class="form-control" name="IdTipoDocumento" id="IdTipoDocumento">
                                                            <option value=""></option>                  
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="col-lg-3 control-label">Plazo Entrega</label>
                                                    <div class="col-lg-3">
                                                        <input style="width:100%;" type="text" class="form-control" name="PlazoEntrega" id="PlazoEntrega" />
                                                    </div>  

                                                    <div class="col-lg-5">
                                                        <input type="checkbox"  name="diashabiles" id="diashabiles"> Dias Habiles<br>
                                                    </div>
                                                </div>

                                                <%--<div class="form-group">
                                                    <label class="col-lg-3 control-label">Proveedor</label>
                                                    <div class="col-lg-9">
                                                        <select class="form-control" name="Proveedor" id="Proveedor"  style="width:100%">
                                                            <option selected disabled></option>                
                                                        </select>                                        
                                                    </div>
                                                    <div class="col-lg-1">
                                                        <span title="Agregar Proveedor" id="Span4" class="btn btn-success" style="font-size:12px" data-toggle="modal" onclick="" data-target="#agregarProveedor" >
                                                            <i  class="fa fa-plus" ></i>
                                                        </span>
                                                    </div>
                                                </div>--%>

                                                <div class="form-group">
                                                    <label class="col-lg-3 control-label">Moneda</label>
                                                    <div class="col-lg-9">
                                                        <select disabled class="form-control" name="Moneda" id="Moneda">
                                                            <option value=""></option>
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="col-lg-3 control-label">Concepto</label>
                                                    <div class="col-xs-2">
                                                        <%--<input  type="text" class="form-control" name="concepto" id="concepto"/>--%>
                                                        <textarea class="form-control" name="concepto" id="concepto"></textarea>
                                                    </div>

                                                </div>

                                                <div class="form-group">
                                                    <div class="col-lg-1"><input  type="text" class="form-control" name="fechaTipoCambSelect" id="fechaTipoCambSelect"/></div>
                                                    <div class="col-lg-1"><input  type="text" class="form-control" name="fechaactualTC" id="fechaactualTC"/></div>
                                                    <div class="col-lg-1"><input  type="text" class="form-control" name="ProvSelect" id="ProvSelect"/></div>
                                                    <div class="col-lg-3"><input  type="text" class="form-control" name="CertificacioOrden" id="CertificacionOrden"/></div>

                                                    <div class="col-lg-1"><input  type="text" class="form-control" name="Locador" id="Locador"/></div>
                                                                                                        
                                                    <div class="col-lg-1"><input  type="text" class="form-control" name="TipoServicio" id="TipoServicio"/></div>

                                                    <div class="col-lg-1"><input  type="text" class="form-control" name="TipoDoc" id="TipoDoc"/></div>

                                                    <div class="col-lg-4"><input  type="text" class="form-control" name="IdRequerimiento" id="IdRequerimiento"/></div>
                                                </div>

                                            </div>
                                          
                                            <div class="col-xs-8">
                                                
                                                <%--<label class="col-lg-2 control-label">Proveedor</label>
                                                <div class="col-lg-5">
                                                    <select class="form-control" name="Proveedor" id="Proveedor"  style="width:100%">
                                                        <option selected disabled></option>                
                                                    </select>                                        
                                                </div>

                                                <div class="col-lg-1">
                                                    <span title="Agregar Proveedor" id="agregarprov" class="btn btn-success" style="font-size:12px" data-toggle="modal" onclick="" data-target="#agregarProveedor" >
                                                        <i  class="fa fa-plus" ></i>
                                                    </span>
                                                </div>--%>

                                                <%--<div class="col-lg-1"></div>--%>

                                                <%--<label class="col-lg-2 control-label">Centro_Costos</label>
                                                <div class="col-lg-6">
	                                                <select class="form-control" name="CentroCost" id="CentroCost">
        	                                            <option value=""></option>                  
                                                    </select>
                                                </div>--%>

                                                <label class="col-lg-6 control-label"></label>
                                                
                                                <label class="col-lg-1 control-label">Buscar:</label>
                                                <div class="col-lg-5"><input type="text" name="search_ocreq" id="search_ocreq" class="form-control"></div>             
				                            	
                                                <div class="box-body pad table-responsive" style="height:160px">
					                                <table id="tabla_req" class="table table-bordered table-hover dataTable no-footer">
				                                        <thead>
                                                            <tr class="cabecera">
                                                                <th class="auto-style1">Nro </th>
                                                                <th class="auto-style1">Requerimiento </th>
                                                                <th class="auto-style1">Descripci&oacute;n </th>
                                                                <th class="auto-style1" width="50">Fecha </th>
                                                                <th class="auto-style1">Centro Costos </th>
                                                                <th class="auto-style1">Saldo Total </th>
					                                        </tr>
                                                        </thead>
				                                        <tbody id="tbody_req">
					                                        <tr><td  colspan="6" align="center">No se encontraron resultados</td></tr>
				                                        </tbody>
                                                    </table>

                                                    <table id="tabla_reqSinRnp" class="table table-bordered table-hover dataTable no-footer">
				                                        <thead>
                                                            <tr class="cabecera">
                                                                <th class="auto-style1">Nro </th>
                                                                <th class="auto-style1">Requerimiento </th>
                                                                <th class="auto-style1">Descripci&oacute;n </th>
                                                                <th class="auto-style1" width="50">Fecha </th>
                                                                <th class="auto-style1">Centro Costos </th>
                                                                <th class="auto-style1">Saldo Total </th>
					                                        </tr>
                                                        </thead>
				                                        <tbody id="tbody1">
					                                        <tr><td  colspan="6" align="center" class="auto-style1">No se encontraron resultados</td></tr>
				                                        </tbody>
                                                    </table>
					                            </div><!-- /.box -->    
                                             
                                                <%--<div class="row" style="margin-left:10px;margin-right:10px">
                                                    <div class="col-md-12" style="">--%>
                                                        <%--<div class="box box-primary">--%>
                                                            <div class="box-header"></div>
                                                            <%--<div class="col-lg-2"></div>--%>
                                                                                                                        
                                                            <%--<label class="col-lg-2 control-label">Centro_Costos</label>
                                                            <div class="col-lg-6">
	                                                            <select class="form-control" name="CentroCost" id="CentroCost">
        	                                                            <option value=""></option>                  
                                                                    </select>
                                                            </div>--%>
                                                            <%--<div class="col-lg-2">
                                                                <input type="radio" id="consultor" name="consultor" ><br>
                                                            </div>

                                                            <div class="col-lg-2">
                                                                <input type="radio" id="asesor" name="asesor" ><br>
                                                            </div>

                                                            <div class="col-lg-2">
                                                                <input type="radio" id="locador" name="locador" ><br>
                                                            </div>--%>

                                                            <%--<label class="col-lg-2 control-label">Proveedor</label>--%>

                                                            <label class="col-lg-2 control-label">Proveedor </label>
                                                            <div class="col-lg-6"><input type="text" name="search_prov" id="search_prov" placeholder="Digite 5 caract. de proveedor a buscar" class="form-control"></div>
                                                            
                                                            <div class="col-lg-1">
                                                                <span title="Buscar Proveedor" id="Buscar_Prov" class="btn btn-success" style="font-size:12px" data-toggle="modal" onclick="validarLlenadoBP();" data-target="" >
                                                                    <i  class="fa fa-search" ></i>
                                                                </span>
                                                            </div>   
                                                                                                                       
                                                            <%--<div class="col-lg-4">
                                                                <select class="form-control" name="Proveedor" id="Proveedor"  style="width:100%">
                                                                    <option selected disabled></option>                
                                                                </select>                                        
                                                            </div>--%>

                                                            <div class="col-lg-1">
                                                                <span title="Agregar Proveedor" id="agregarprov" class="btn btn-success" style="font-size:12px" data-toggle="modal" onclick="" data-target="#agregarProveedor" >
                                                                    <i  class="fa fa-plus" ></i>
                                                                </span>
                                                            </div>
                                                            

                                                           <%-- <label class="col-lg-1 control-label">Buscar:</label>--%>
                                                            <div class="col-lg-2"><input type="text" name="search_detreq" id="search_detreq" class="form-control"></div>             
                  
                                                            <div class="box-body pad table-responsive" style="height:160px">
					                                            <table id="tabla_detreq" class="table table-bordered table-hover dataTable no-footer">
				                                                    <thead>
                                                                        <tr class="cabecera">
                                                                            <th class="auto-style1" id="Th1">Item </th>
                                                                            <th class="auto-style1" id="Th2">Art&iacute;culo </th>
                                                                            <th class="auto-style1" id="Th3">U.M. </th>
                                                                            <th class="auto-style1" id="Th4">Descripci&oacute;n </th>
                                                                        
                                                                            <th class="auto-style1" id="Th5">Centro Costo </th>
                                                                            <th class="auto-style1" id="Th6">Pendiente </th>
                                                                            <th class="auto-style1" id="Th7">Costo </th>
                                                                            <th class="auto-style1" id="Th8">Sub Total </th>
                                                                        </tr>
                                                                    </thead>
				                                                    <tbody id="tbody_detreq">
					                                                    <tr><td colspan="8" align="center">No se encontraron resultados</td></tr>
				                                                    </tbody>
                                                                </table>

                                                                <table id="tabla_detreqSinRnp" class="table table-bordered table-hover dataTable no-footer">
				                                                    <thead>
                                                                        <tr class="cabecera">
                                                                            <th class="auto-style1" id="Th17">Item </th>
                                                                            <th class="auto-style1" id="Th18">Art&iacute;culo </th>
                                                                            <th class="auto-style1" id="Th19">U.M. </th>
                                                                            <th class="auto-style1" id="Th20">Descripci&oacute;n </th>
                                                                        
                                                                            <th class="auto-style1" id="Th21">Centro Costo </th>
                                                                            <th class="auto-style1" id="Th22">Pendiente </th>
                                                                            <th class="auto-style1" id="Th23">Costo </th>
                                                                            <th class="auto-style1" id="Th24">Sub Total </th>
                                                                        </tr>
                                                                    </thead>
				                                                    <tbody id="tbody2">
					                                                    <tr><td  colspan="8" align="center">No se encontraron resultados</td></tr>
				                                                    </tbody>
                                                                </table>
					                                        </div><!-- /.box -->
                                                        <%--</div>--%>
                                                    <%--</div><!-- /.col -->
                                                </div>--%>
                                                <input type="hidden" name="n" id="n">
                                                <input type="hidden" name="nroFilas" id="nroFilas">
                                                <input type="hidden" name="cantidadx" id="cantidadx">
                                                <input type="hidden" name="cod_idreqx" id="cod_idreqx">
                                                <input type="hidden" name="cod_centcostx" id="cod_centcostx">
                                                <input type="hidden" name="cod_bienserx" id="cod_bienserx">
                                                <input type="hidden" name="cod_nroitemx" id="cod_nroitemx">
                                                <input type="hidden" name="cod_idumx" id="cod_idumx">
                                                <input type="hidden" name="costo_reqx" id="costo_reqx">
                                                <input type="hidden" name="sabdoreserva_reqx" id="sabdoreserva_reqx">
                                                <input type="hidden" name="impuesto_reqx" id="impuesto_reqx">
                                                <input type="hidden" name="subtotal_reqx" id="subtotal_reqx">
                                                <input type="hidden" name="partidapresux" id="partidapresux">
                                                <input type="hidden" name="cod_transx" id="cod_transx">
                                                <input type="hidden" name="cod_ctacontabx" id="cod_ctacontabx">
                                                <input type="hidden" name="cod_almacx" id="cod_almacx">
                                                <%--<input type="hidden" name="nc" id="nc">--%>

                                            </div>

                                            <%--<div class="modal-body">--%>
                                            <div class="form-group">

                                               <%--<div class="row" style="margin-left:10px;margin-right:10px">--%>
                                                    <div class="col-md-12" style="">
                                                        <%--<div class="box box-primary">--%>
                                                            <div class="box-header"></div>
				                                            <%--<div class="col-lg-8"></div>--%>

                                                            <div class="col-lg-1"><input type="text" name="idimpuesto" id="idimpuesto" class="form-control"></div>
                                                            <div class="col-lg-1"><input type="text" name="valor_venta" id="valor_venta" class="form-control"></div>
                                                            <div class="col-lg-1"><input type="text" name="dias_habiles" id="dias_habiles" class="form-control"></div>
                                                            <div class="col-lg-1"><input type="text" name="Tipo_cambio" id="Tipo_cambio" class="form-control"></div>

                                                            <div class="col-lg-1"><input type="text" name="agregarcompraoservicio" id="agregarcompraoservicio" class="form-control"></div>
                                                            <div class="col-lg-1"><input type="text" name="agregarbienservicio" id="agregarbienservicio" class="form-control"></div>
                                                            <div class="col-lg-2"><input type="text" name="valor_ventaXCien" id="valor_ventaXCien" class="form-control"></div>

                                                            <%--<label class="col-lg-1 control-label">Buscar:</label>
                                                            <div class="col-lg-3"><input type="text" name="search_ocartreq" id="search_ocartreq" class="form-control"></div>--%>
				                                            <%--<br><br>--%>

                                                            <%--<div class="col-lg-1">
                                                                <input type="checkbox"  name="Items" id="Items"> Items<br>
                                                            </div>--%>

                                                            <div class="col-lg-2"></div>

                                                            <div class="col-lg-1">
                                                                <button id="QuitarTodos" name="QuitarTodos" type="button" class="btn btn-danger" data-dismiss="" onclick="QuitarMasivamente()">QUITAR TODOS</button>
                                                            </div>
                                                            <div class="col-lg-1">
                                                               <button id="EnviarTodos" name="EnviarTodos" type="button" class="btn btn-info" data-dismiss="" onclick="Masivamente()">ENVIAR TODOS</button>
                                                            </div>
				                                     
                                                            <br>
                                                            <div class="box-body pad table-responsive" style="overflow:scroll;height:240px">
                                                                <table id="tabla_ocreq" class="table table-bordered table-hover dataTable no-footer">
				                                                    <thead>
                                                                        <tr class="cabecera">
                                                                            <th class="auto-style1">Nº </th>
                                                                            <th class="auto-style1">Requerimiento </th>
                                                                            <th class="auto-style1">Item </th>
                                                                            <th class="auto-style1">Art&iacute;culo </th>
                                                                            <th class="auto-style1">U.M </th>
                                                                            <th class="auto-style1">Descripci&oacute;n </th>

                                                                            <th class="auto-style1">C.Cost </th>
                                                                            <th class="auto-style1">Clasificador </th>
                                                                            <th class="auto-style1">Actividad </th>
                                                                            <th class="auto-style1">Finalidad </th>
                                                                            <th class="auto-style1">Meta </th>

                                                                            <th class="auto-style1">Disponible </th>
                                                                            <th class="auto-style1">Cantidad </th>
                                                                            <th class="auto-style1">Costo </th>
                                                                            <th class="auto-style1">Sub Total </th>
                                                                            <%--<th class="auto-style1">Reservar </th>
                                                                            <th class="auto-style1">Saldo Reserva </th>--%>
					                                                    </tr>
                                                                    </thead>
				                                                    <tbody id="tbody_ocpreq">
					                                                    <tr id="tbody_ocreq_comp"><td  colspan="20" align="center">No se encontraron resultados</td></tr>
				                                                    </tbody>
                                                                </table>

                                                                <table id="tabla_ocreqSinRnp" class="table table-bordered table-hover dataTable no-footer">
				                                                    <thead>
                                                                        <tr class="cabecera">
                                                                            <th class="auto-style1">Nº </th>
                                                                            <th class="auto-style1">Requerimiento </th>
                                                                            <th class="auto-style1">Item </th>
                                                                            <th class="auto-style1">Art&iacute;culo </th>
                                                                            <th class="auto-style1">U.M </th>
                                                                            <th class="auto-style1">Descripci&oacute;n </th>

                                                                            <th class="auto-style1">C.Cost </th>
                                                                            <th class="auto-style1">Clasificador </th>
                                                                            <th class="auto-style1">Actividad </th>
                                                                            <th class="auto-style1">Finalidad </th>
                                                                            <th class="auto-style1">Meta </th>

                                                                            <th class="auto-style1">Disponible </th>
                                                                            <th class="auto-style1">Cantidad </th>
                                                                            <th class="auto-style1">Costo </th>
                                                                            <th class="auto-style1">Sub Total </th>
                                                                            <%--<th class="auto-style1">Reserva </th>
                                                                            <th class="auto-style1">Saldo Reserva </th>--%>
					                                                    </tr>
                                                                    </thead>
				                                                    <tbody id="tbody3">
					                                                    <tr id="Tr1"><td  colspan="18" align="center">No se encontraron resultados</td></tr>
				                                                    </tbody>
                                                                </table>
                                                            </div>


                                                            <div class="col-lg-1"><input type="text" name="ValSinRNP" id="ValSinRNP" class="form-control"></div>
                                                            <div class="col-lg-1"><input type="text" name="ValGuardado" id="ValGuardado" class="form-control"></div>
                                                            <div class="col-lg-1"><input type="text" name="ConfirGuardado" id="ConfirGuardado" class="form-control"></div>

                                                            <div class="col-lg-1"><input type="text" name="valcantidad" id="valcantidad" class="form-control"></div>

                                                            <div class="col-lg-2"><input type="text" name="FechaFinRNP" id="FechaFinRNP" class="form-control"></div>
                                                            <div class="col-lg-2"><input type="text" name="FechaActualxRNP" id="FechaActualxRNP" class="form-control"></div>
                                                            <div class="col-lg-2"><input type="text" name="FechaRNP" id="FechaRNP" class="form-control"></div>

                                                            <div class="col-lg-2"><input type="text" name="LocadorxRNP" id="LocadorxRNP" class="form-control"></div>

                                                            <div class="col-lg-4"><input type="text" name="BuscarReq" id="BuscarReq" class="form-control"></div>

                                                            <div class="col-lg-2"><input type="text" name="Requerimiento" id="Requerimiento" class="form-control"></div>

                                                        <%--</div>--%>
                                                    </div>
                                                <%--</div>--%>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <%--MODIFICAR ORDEN DE COMPRA--%>
                        <div class="row" id="ModifNewOrdenCompra">
                        <div class="col-md-12">
                            <div class="box box-primary">
                                <div class="box-header">

                        <%--<div class="modal fade" id="modificarOrden" role="dialog" aria-labelledby="Login" aria-hidden="true">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">--%>
                                        <h1 class="modal-title" style="font-size:18px;font-weight:bold"><label>Modificar Orden de Compra</label></h1>
                        
                                        <span style="float:right;margin-top:-28px">
                                            <span id="guardarmodifordencompra" class="btn btn-primary" style="font-size:12px" onclick="modificar_ordencompra()" >
                                                <i class="fa fa-save" ></i> &nbsp; GUARDAR
                                            </span>

                                            <span id="cancelarmodifordencompra" data-dismiss="modal" aria-label="Close" class="btn btn-danger" style="font-size:12px" onclick="cerrar_modiforden()" >
                                                <i class="fa fa-close"></i> &nbsp; CANCELAR
                                            </span>
                                        </span>
                                    </div>

                                    <input type="hidden" name="empresa" id="empresa" >
                                                                        
                                    <div class="modal-body">

                                        <input type="hidden" name="cond" id="cond" value=1>
                                        <input type="hidden" name="contadoradicordcomp" id="contadoradicordcomp" value=1>
                                        <input type="hidden" name="cond_tabla" id="cond_tabla" value=1>       
                      
                                        <input id="guardarmodif1" type="submit" class="btn btn-primary" value="Guardar" style="display:none"  >
				                        <button style="display:none" id="cancelarmodif" type="button" class="btn btn-default" data-dismiss="modal" >Cancelar</button>
                                        
                                        <%--<div class="form-group">--%>

                                        <div class="row">
                                            <div class="col-xs-4">
                                                
                                                <div class="form-group">                                              
                                                     <label class="col-lg-6 control-label" style="text-align:left" >Fecha</label>
                                                     
                                                     <label id="lblTipoCambioM" class="col-lg-6 control-label" style="text-align:left" >Tipo Cambio</label>
                                                </div>

                                                <div class="form-group">
                                                    <div class="col-lg-6">
                                                        <input readonly style="border-color:#00a65a;background-color:#ffffff" type="text" class="form-control" name="FechaTipoCambModif" id="FechaTipoCambModif"/>
                                                    </div>

                                                    <div class="col-lg-6" id="FechaGuardada">
                                                        <input type="text" class="form-control" name="FGuardada" id="FGuardada"/>
                                                    </div>

                                                    <div class="col-lg-6" id="FechaActualM">
                                                        <input type="text" class="form-control" name="FActualM" id="FActualM"/>
                                                    </div>
                                                    
                                                    <div class="col-lg-6" id="Tipo_CambioM">
                                                        <input disabled type="text" class="form-control" name="TipoCambiomodif" id="TipoCambiomodif"/>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="col-lg-3 control-label">Forma <font color=white>_</font>Pago</label>
                                                    <div class="col-lg-9">
                                                        <%--<select onchange="carga_tran();ver_alm()" class="form-control" name="tran" id="tran">--%>
                                                        <select class="form-control" name="IdFormaPagomodif" id="IdFormaPagomodif" >
                                                            <option value="S"></option>                        
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="col-lg-3 control-label">Tipo <font color=white>_</font>Documento</label>
                                                    <div class="col-lg-9">
                                                        <select class="form-control" name="IdTipoDocumentomodif" id="IdTipoDocumentomodif">
                                                            <option value=""></option>                  
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="col-lg-3 control-label">Plazo Entrega</label>
                                                    <div class="col-lg-3">
                                                        <input style="width:100%;" type="text" class="form-control" name="PlazoEntregamodif" id="PlazoEntregamodif" />
                                                    </div>  

                                                    <div class="col-lg-5">
                                                        <input type="checkbox"  name="diashabilesmodif" id="diashabilesmodif"> Dias Habiles<br>
                                                    </div>
                                                </div>

                                                <%--<div class="form-group">
                                                    <label class="col-lg-3 control-label">Proveedor</label>
                                                    <div class="col-lg-9">
                                                        <select class="form-control" name="Proveedor" id="Proveedor"  style="width:100%">
                                                            <option selected disabled></option>                
                                                        </select>                                        
                                                    </div>
                                                    <div class="col-lg-1">
                                                        <span title="Agregar Proveedor" id="Span4" class="btn btn-success" style="font-size:12px" data-toggle="modal" onclick="" data-target="#agregarProveedor" >
                                                            <i  class="fa fa-plus" ></i>
                                                        </span>
                                                    </div>
                                                </div>--%>

                                                <div class="form-group">
                                                    <label class="col-lg-3 control-label">Moneda</label>
                                                    <div class="col-lg-9">
                                                        <select disabled class="form-control" name="Monedamodif" id="Monedamodif">
                                                            <option value=""></option>
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="col-lg-3 control-label">Concepto</label>
                                                    <div class="col-xs-2">
                                                        <%--<input  type="text" class="form-control" name="concepto" id="concepto"/>--%>
                                                        <textarea class="form-control" name="conceptomodif" id="conceptomodif"></textarea>
                                                    </div>

                                                </div>
                                            </div>
                                          
                                            <div class="col-xs-8">

                                                <%--<div class="col-lg-5"><input type="text" name="search_provm" id="search_provm" placeholder="Digite 4 caracteres a buscar" class="form-control"></div>           

                                                <div class="col-lg-5">
                                                    <select class="form-control" name="Proveedorm" id="Proveedorm"  style="width:100%">
                                                        <option selected disabled></option>                
                                                    </select>                                        
                                                </div>--%>

                                                <label class="col-lg-2 control-label">Proveedor </label>
                                                <div class="col-lg-7"><input type="text" placeholder="Digite 5 caract. de proveedor a buscar" name="Proveedorm" id="Proveedorm" class="form-control"></div>
                                                            
                                                <div class="col-lg-1">
                                                    <span title="Buscar Proveedor" id="Buscar_Provm" class="btn btn-success" style="font-size:12px" data-toggle="modal" onclick="validarLlenadoBPM();" data-target="" >
                                                        <i  class="fa fa-search" ></i>
                                                    </span>
                                                </div>
                                                
                                               <%-- <label class="col-lg-2 control-label">Proveedor</label>
                                                <div class="col-lg-5">
                                                    <select class="form-control" name="Proveedormodif" id="Proveedormodif"  style="width:100%">
                                                        <option selected disabled></option>                
                                                    </select>                                        
                                                </div>--%>

                                                <div class="col-lg-1">
                                                    <span title="Agregar Proveedor" id="agregarprovmodif" class="btn btn-success" style="font-size:12px" data-toggle="modal" onclick="" data-target="#agregarProveedor" >
                                                        <i  class="fa fa-plus" ></i>
                                                    </span>
                                                </div>

                                                <%--<div class="col-lg-4"></div>--%>
                                                
                                                <%--<label class="col-lg-1 control-label">Buscar:</label>--%>
                                                <div class="col-lg-1"><input disabled type="text" name="text1" id="text1" class="form-control"></div>
				                            	
                                                <div class="box-body pad table-responsive" style="height:150px">
					                                <table id="tabla_req_modif" class="table table-bordered table-hover dataTable no-footer">
				                                        <thead>
                                                            <tr class="cabecera">
                                                                <th class="auto-style1">Nro </th>
                                                                <th class="auto-style1">Requerimiento </th>
                                                                <th class="auto-style1">Descripci&oacute;n </th>
                                                                <th class="auto-style1" width="50">Fecha </th>
                                                                <th class="auto-style1">Centro Costos </th>
                                                                <th class="auto-style1">Saldo Total </th>
					                                        </tr>
                                                        </thead>
				                                        <tbody id="tbody_req_modif">
					                                        <tr><td  colspan="6" align="center">No se encontraron resultados</td></tr>
				                                        </tbody>
                                                    </table>
					                            </div><!-- /.box -->    
                                             
                                                <%--<div class="row" style="margin-left:10px;margin-right:10px">
                                                    <div class="col-md-12" style="">--%>
                                                        <div class="box box-primary">
                                                            <div class="box-header"></div>

                                                            <div class="col-lg-10"><input disabled type="text" placeholder="" name="proveedorModif" id="proveedorModif" class="form-control"></div>

                                                            <label class="col-lg-1 control-label"> </label>

                                                            <div class="col-lg-1"><input disabled type="text" name="buscar_detreq" id="buscar_detreq" class="form-control"></div>
                                                            <%--<div class="col-lg-4"></div>--%>
                                                            
                                                            <%--<label class="col-lg-1 control-label">Buscar:</label>
                                                            <div class="col-lg-3"><input type="text" name="search_detreq_modif" id="search_detreq_modif" class="form-control"></div>--%>            
                  
                                                            <div class="box-body pad table-responsive" style="height:150px">
					                                            <table id="tabla_detreq_modif" class="table table-bordered table-hover dataTable no-footer">
				                                                    <thead>
                                                                        <tr class="cabecera">
                                                                            <th class="auto-style1" id="Th9">Item </th>
                                                                            <th class="auto-style1" id="Th10">Art&iacute;culo </th>
                                                                            <th class="auto-style1" id="Th11">U.M. </th>
                                                                            <th class="auto-style1" id="Th12">Descripci&oacute;n </th>
                                                                        
                                                                            <th class="auto-style1" id="Th13">Centro Costo </th>
                                                                            <th class="auto-style1" id="Th14">Cantidad </th>
                                                                            <th class="auto-style1" id="Th15">Costo </th>
                                                                            <th class="auto-style1" id="Th16">Sub Total </th>
                                                                        </tr>
                                                                    </thead>
				                                                    <tbody id="tbody_detreq_modif">
					                                                    <tr><td  colspan="8" align="center">No se encontraron resultados</td></tr>
				                                                    </tbody>
                                                                </table>
					                                        </div><!-- /.box -->
                                                        </div>
                                                    <%--</div><!-- /.col -->
                                                </div>--%>
                                                <%--<input type="hidden" name="n" id="Hidden5">
                                                <input type="hidden" name="cantidadx" id="Hidden6">
                                                <input type="hidden" name="cod_idreqx" id="Hidden7">
                                                <input type="hidden" name="cod_centcostx" id="Hidden8">
                                                <input type="hidden" name="cod_bienserx" id="Hidden9">
                                                <input type="hidden" name="cod_nroitemx" id="Hidden10">
                                                <input type="hidden" name="cod_idumx" id="Hidden11">
                                                <input type="hidden" name="costo_reqx" id="Hidden12">
                                                <input type="hidden" name="sabdoreserva_reqx" id="Hidden13">
                                                <input type="hidden" name="impuesto_reqx" id="Hidden14">
                                                <input type="hidden" name="subtotal_reqx" id="Hidden15">
                                                <input type="hidden" name="partidapresux" id="Hidden16">
                                                <input type="hidden" name="cod_transx" id="Hidden17">
                                                <input type="hidden" name="cod_ctacontabx" id="Hidden18">
                                                <input type="hidden" name="cod_almacx" id="Hidden19">--%>
                                                <%--<input type="hidden" name="nc" id="nc">--%>

                                            </div>

                                            <%--<div class="modal-body">--%>
                                            <div class="form-group">

                                               <%--<div class="row" style="margin-left:10px;margin-right:10px">--%>
                                                    <div class="col-md-12" style="">
                                                        <div class="box box-primary">
                                                            <div class="box-header"></div>
				                                            
                                                            <div class="col-lg-2"><input type="text" name="dias_habilesmodif" id="dias_habilesmodif" class="form-control"></div>
                                                            <div class="col-lg-2"><input type="text" name="forma_pago" id="forma_pago" class="form-control"></div>
                                                            <div class="col-lg-2"><input type="text" name="tipo_doc" id="tipo_doc" class="form-control"></div>
                                                            <div class="col-lg-2"><input type="text" name="proveedor" id="proveedor" class="form-control"></div>                                         

                                                            <div class="col-lg-2"><input type="text" name="Tipo_Cambiomodif" id="Tipo_Cambiomodif" class="form-control"></div>
                                                            <div class="col-lg-2"><input type="text" name="Nro_filas" id="Nro_filas" class="form-control"></div>
                                                                                                                      

                                                            <%--<label class="col-lg-1 control-label">Buscar:</label>
                                                            <div class="col-lg-3"><input type="text" name="search_ocartreq_modif" id="search_ocartreq_modif" class="form-control"></div>
				                                            <br><br>--%>
				                                     
                                                            <div class="box-body pad table-responsive" style="overflow:scroll;height:240px">
                                                                <table id="tabla_ocreq_modif" class="table table-bordered table-hover dataTable no-footer">
				                                                    <thead>
                                                                        <tr class="cabecera">
                                                                            <%--<th class="auto-style1">Nº </th>--%>
                                                                            <th class="auto-style1">Requerimiento </th>
                                                                            <th class="auto-style1">Item </th>
                                                                            <th class="auto-style1">Art&iacute;culo </th>
                                                                            <th class="auto-style1">U.M </th>
                                                                            <th class="auto-style1">Descripci&oacute;n </th>

                                                                            <th class="auto-style1">C.Cost </th>
                                                                            <th class="auto-style1">Clasificado </th>
                                                                            <th class="auto-style1">Actividad </th>
                                                                            <th class="auto-style1">Finalidad </th>
                                                                            <th class="auto-style1">Meta </th>

                                                                            <th class="auto-style1">Cantidad </th>
                                                                            <th class="auto-style1">Costo </th>
                                                                            <th class="auto-style1">Sub Total </th>
                                                                            <th class="auto-style1">Reservar </th>
                                                                            <th class="auto-style1">Saldo Reserva </th>
					                                                    </tr>
                                                                    </thead>
				                                                    <tbody id="tbody_ocreq_modif">
					                                                    <tr><td  colspan="15" align="center">No se encontraron resultados</td></tr>
				                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                <%--</div>--%>

                                            </div>

                                            <div class="form-group">
                                                <div class="col-lg-2"><input type="text" class="form-control" name="FechaOrdCompModif" id="FechaOrdCompModif"/></div>
                                                <div class="col-lg-2"><input type="text" class="form-control" name="ValVtaModif" id="ValVtaModif"/></div>
                                                <div class="col-lg-2"><input type="text" class="form-control" name="ImpustModif" id="ImpustModif"/></div>

                                                <div class="col-lg-2"><input type="text" class="form-control" name="CstItemModif" id="CstItemModif"/></div>
                                                <div class="col-lg-2"><input type="text" class="form-control" name="CantModif" id="CantModif"/></div>
                                                <div class="col-lg-2"><input type="text" class="form-control" name="NumItemOrden" id="NumItemOrden"/></div>
                                            </div>

                                            <div class="form-group">
                                                <div class="col-lg-2"><input type="text" class="form-control" name="TasaModif" id="TasaModif"/></div>
                                                <div class="col-lg-2"><input type="text" class="form-control" name="CantTotalModif" id="CantTotalModif"/></div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>                    

                        <%--ELIMINAR ORDEN DE COMPRA--%>
                        <div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        <h4 class="modal-title" id="myModalLabel">Anular Orden de Compra</h4>
                                    </div>
            
                                    <div class="modal-body">
                                        <p>¿Desea Anular la Orden de Compra N°  <span id="nro_orden"></span> ?</p>
                                        <p class="debug-url"></p>
                                    </div>
                
                                    <div class="modal-footer">
                                        <button id="cerrar" type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                                        <a class="btn btn-danger btn-anular" >Anular</a>
                                    </div>


                                   <%-- <span id="guardarordencompra" class="btn btn-primary" style="font-size:12px" onclick="carga_submit_ordencompra() ">
                                                <i class="fa fa-save" ></i> &nbsp; GUARDAR
                                            </span>--%>
                                </div>
                            </div>
                        </div>

                        <%--REEMPLAZAR ORDEN DE COMPRA ANULADA--%>
                        <div class="modal fade" id="confirm-reemplazo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        <h4 class="modal-title" id="H4">Reemplazar Orden de Compra Anulada</h4>

                                        <%--<span id="Span1" data-dismiss="modal" aria-label="Close" class="btn btn-danger" style="font-size:12px" >
                                            <i class="fa fa-close"></i> &nbsp; CERRAR
                                        </span>--%>
                                    </div>
                                       
                                    <div class="modal-body">
                                        <div class="form-group">
                                            <label class="col-lg-3 control-label" style="text-align:left" >Nro Orden Eliminada</label>
                                            <div class="col-lg-4">
                                                <select class="form-control" name="OrdenEliminada" id="OrdenEliminada" style="width:100%">
                                                    <option value=""></option>                  
                                                </select>
                                            </div>

                                            <div class="col-lg-4" id="NroOrdenAnulada">
                                                <input type="text" class="form-control" name="IdOrdenCompraAnulada" id="IdOrdenCompraAnulada"/>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-lg-3 control-label" style="text-align:left" >Nro Orden Actual</label>
                                            <div class="col-lg-4">
                                                <select class="form-control" name="OrdenActual" id="OrdenActual" style="width:100%">
                                                    <option value=""></option>                  
                                                </select>
                                            </div>

                                            <div class="col-lg-4" id="NroOrdenActual">
                                                <input type="text" class="form-control" name="IdOrdenCompraActual" id="IdOrdenCompraActual"/>
                                            </div>
                                        </div>

                                        <div class="modal-footer">
                                            <button id="CerrarReemplazo" type="button" class="btn btn-default" data-dismiss="modal" onclick="Limpiar()">Cerrar</button>
                                            <a class="btn btn-primary btn-ok" >OK</a>
                                        </div>
                                    </div>         
                                    
                                </div>
                            </div>
                        </div>

                        <%--BUSCAR PROVEEDORES POR ORDENES--%>
                        <div class="modal fade" id="BuscarLocxOrd" role="dialog" aria-labelledby="Login" aria-hidden="true" >
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title" style="font-size:18px;font-weight:bold"><label>Busqueda de Ordenes de Compra</label></h1>
                        
                                        <span style="float:right;margin-top:-28px">
                                            <span id="Span2" data-dismiss="modal" aria-label="Close" class="btn btn-danger" style="font-size:12px" onclick="Cerrar()" >
                                                <i class="fa fa-close"></i> &nbsp; CANCELAR
                                            </span>
                                        </span>
                                    </div>                                  
                                                                        
                                    <div class="modal-body">

                                        <div class="row">
                                            <label id="NombreProveedor" class="col-lg-4 control-label"></label>
                                        </div>

                                        <div class="row">

                                            <div class="box-body pad table-responsive"   style="overflow:scroll;height:250px">
				                                <table id="T_CabBProveedores"  class="table table-bordered table-hover dataTable no-footer" role="grid" aria-describedby="tabla_inventario_info">
				                                    <thead>
                                                        <tr  class="cabecera">
                                                            <th style="text-align:center" ><b>Nro </b></th>       
                                                            <th style="text-align:center" ><b>Ordenes </b></th>
                                                            <th style="text-align:center" ><b>Requerimiento </b></th>
                                                            <th style="text-align:center" ><b>Centro Costos </b></th>
                                                            <th style="text-align:center" width="52"><b>Fecha </b></th>
                                                            <th style="text-align:center" width="100"><b>Proveedor </b></th>
                                                            <th style="text-align:center" ><b>Moneda </b></th>
                                                            <th style="text-align:center" ><b>Costo </b></th>
                                                            <th style="text-align:center" ><b>Ingreso Almacen </b></th>
                                                            <th style="text-align:center" ><b>Procede Pago </b></th>
                                                            <th style="text-align:center" ><b>Nro Guia </b></th>
                                                            <th style="text-align:center" ><b>Estado </b></th>
                                                            <th style="text-align:center" ><b>Usuario </b></th>
                      
                                                            <!-- <th width="10px">Estado </th>-->
                                                        </tr>
					                                </thead>
                                                    <tbody id="body_CabBProveedores">
			                                            <tr ><td  colspan="13" align="center" class="auto-style1">No se encontraron resultados</td></tr>		
                                                    </tbody>
                                                </table>
                                            </div><!-- /.box -->
                                            
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="box box-primary">
                                                    <div class="box-header">
                                                        <h6 class="box-title"><small>Detalle de Orden de Compra</small></h6>
                                                    </div>
                                                    <div class="box-body pad table-responsive" style="overflow:scroll;height:180px">
				                                        <table id="T_DetBProveedores" class="table table-bordered table-hover dataTable no-footer">
				                                            <thead>
                                                                <tr class=cabecera>
                                                                    <th ><b>Nro</b> </th>
                                                                    <th ><b>Item</b> </th>
                                                                    <th ><b>Nro Requemiento</b> </th>
                                                                    <th ><b>Centro Costo</b> </th>
                                                                    <th ><b>Descripcion</b> </th>
                                                                    <th ><b>Descripcion Bien</b> </th>
                                                                    <th ><b>Clasificador</b> </th>
                                                                    <th ><b>Actividad</b> </th>
                                                                    <th ><b>Finalidad</b> </th>
                                                                    <th ><b>Meta</b> </th>
                                                                    <th ><b>U.M</b> </th>
                                                                    <th ><b>Cantidad</b> </th>
                                                                    <th ><b>Costo</b> </th>
                                                                    <th ><b>Total Costo</b> </th>
                                                                    <th ><b>Estado</b> </th>
                                                                </tr>
                                                            </thead>
				                                           <tbody id="body_DetBProveedores">
					                                            <tr><td colspan=15 align=center class="auto-style1">No se encontraron resultados</td></tr>
				                                           </tbody>
                                                        </table>
                                                    </div><!-- /.box -->
                                                </div>
                                            </div><!-- /.col -->
                                        </div><!-- ./row -->

                                    </div>
                                </div>
                            </div>
                        </div>

                        <%--CONSULTA DOCUMENTOS POR ORDENES--%>
                        <div class="modal fade" id="consultaDoc" role="dialog" aria-labelledby="Login" aria-hidden="true" >
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title" style="font-size:18px;font-weight:bold"><label>Consulta de Documentos</label></h1>
                        
                                        <span style="float:right;margin-top:-28px">
                                            <span id="Span1" data-dismiss="modal" aria-label="Close" class="btn btn-danger" style="font-size:12px" onclick="Cerrar()" >
                                                <i class="fa fa-close"></i> &nbsp; CERRAR
                                            </span>
                                        </span>
                                    </div>                                  
                                                                        
                                    <div class="modal-body">

                                        <div class="row">
                                            <label id="Label1" class="col-lg-4 control-label"></label>
                                        </div>

                                        <div class="row">
                                            <div class="col-xs-2">
					                            <div class="dataTables_length">
					                                Tipo de Orden : 
                                                    <input type="hidden" name="del_idtipomovimientostock" value="I">                
					                            </div>
					                        </div>

                                            <div class="col-xs-1">
					                            <div class="dataTables_length">
					                                <input type=text disabled name="tipo_orden" id="tipo_orden" aria-controls="tabla_inventario" class="form-control input-sm" style="width:100%">
					                            </div>
					                        </div>

                                            <div class="col-xs-1">
					                            <div class="dataTables_length">
					                                Nro Orden : 
                                                    <input type="hidden" name="del_idtipomovimientostock" value="I">                
					                            </div>
					                        </div>

                                            <div class="col-xs-2">
					                            <div class="dataTables_length">
					                                <input type=text name="num_orden" id="num_orden" aria-controls="tabla_inventario" class="form-control input-sm" style="width:100%">
					                            </div>
					                        </div>
                                        </div>

                                        <div class="row"><div class="col-xs-2"></div></div>
                                        <div class="row"><div class="col-xs-2"></div></div>
                                        <div class="row"><div class="col-xs-2"></div></div>

                                        <div class="row">
                                            <div class="col-xs-2">
					                            <div class="dataTables_length">
					                                Proveedor : 
                                                    <input type="hidden" name="del_idtipomovimientostock" value="I">                
					                            </div>
					                        </div>

                                            <div class="col-xs-2">
					                            <div class="dataTables_length">
					                                <input type=text name="ruc_proveedor" id="ruc_proveedor" aria-controls="tabla_inventario" class="form-control input-sm" style="width:100%">
					                            </div>
					                        </div>

                                            <%--<div class="col-xs-2">
					                            <div class="dataTables_length">
					                                Nro Orden : 
                                                    <input type="hidden" name="del_idtipomovimientostock" value="I">                
					                            </div>
					                        </div>--%>

                                            <div class="col-xs-6">
					                            <div class="dataTables_length">
					                                <input type=text name="razonsocial_proveedor" id="razonsocial_proveedor" aria-controls="tabla_inventario" class="form-control input-sm" style="width:100%">
					                            </div>
					                        </div>
                                        </div>

                                        <div class="row"><div class="col-xs-2"></div></div>
                                        <div class="row"><div class="col-xs-2"></div></div>
                                        <div class="row"><div class="col-xs-2"></div></div>

                                        <div class="row">
                                            <div class="col-xs-2">
					                            <div class="dataTables_length">
					                                Glosa : 
                                                    <input type="hidden" name="del_idtipomovimientostock" value="I">                
					                            </div>
					                        </div>                                          

                                            <div class="col-xs-8">
					                            <div class="dataTables_length">
					                                <%--<input type=text name="glosa_orden" id="glosa_orden" aria-controls="tabla_inventario" class="form-control input-sm" style="width:100%">--%>
                                                    <textarea class="form-control" name="glosa_orden" id="glosa_orden" style="resize:none; width: 569px; height: 72px;"></textarea>
					                            </div>
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

                        <%--BUSCAR PROVEEDOR POR ORDENES--%>
                        <div class="modal fade" id="BuscarProveedorxOrdenes" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        <h4 class="modal-title" id="H3">Proveedores que tienen Orden de Compra</h4>

                                        <span style="float:right;margin-top:-28px">
                                            <span id="CerrarBP" data-dismiss="modal" aria-label="Close" class="btn btn-danger" style="font-size:12px" onclick="Cerrar()" >
                                                <i class="fa fa-close"></i> &nbsp; CERRAR
                                            </span>
                                        </span>
                                    </div>                                  
            
                                    <div class="modal-body">
                                                                                                                  
                                        <div class="box-body pad table-responsive" style="height:350px">

                                            <table id="T_ProvxOrdenes" class="table table-bordered table-hover dataTable no-footer">
                                                <thead>
                                                    <tr class="cabecera">
                                                        <th class="auto-style1">Nro </th>
                                                        <th class="auto-style1">RUC </th>
                                                        <th class="auto-style1">Razon Social </th>
                                                    </tr>
                                                </thead>
                                                <tbody id="body_ProvxOrdenes">
                                                    <tr><td  colspan="3" align="center">No se encontraron resultados</td></tr>
                                                </tbody>
                                            </table>
                                        
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <%--IMPRIMIR ORDEN DE COMPRA--%>
                        <div class="modal fade" id="imprimirOrden" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        <h4 class="modal-title" id="H1">Imprimir Orden de Compra</h4>
                                    </div>
            
                                    <div class="modal-body">
                                        <div class="form-group">
                                            <div class="col-lg-3">
                                                <input type="radio" id="usuario" name="usuario" value="bien"> USUARIO<br>
                                            </div>  
                               
                                            <div class="col-lg-3">
                                                <input type="radio" id="logistica" name="logistica" value=""> LOGISTICA<br>
                                            </div>
                                       
                                            <%--<div class="col-lg-3">
                                                <input type="radio" id="contabilidad" name="contabilidad" value=""> CONTABILIDAD<br>
                                            </div>--%> 
                                        
                                            <div class="col-lg-3">
                                                <input type="radio" id="todos" name="todos" value=""> TODOS<br>
                                            </div>                                                                                                               
                                        </div>

                                        <div class="form-group">
                                            <h5 class="modal-title" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Impresi&oacute;n Masiva</h5>
                                            <div class="col-lg-3"><input type="text" name="IdOrden1" id="IdOrden1" class="form-control"></div>
                                            <div class="col-lg-3"><input type="text" name="IdOrden2" id="IdOrden2" class="form-control"></div>
                                        </div>
                                    </div>
                
                                    <div class="modal-footer">
                                        <button id="cancelarprint" type="button" class="btn btn-default" data-dismiss="modal" onclick="LimpiarPrint()">Cerrar</button>
                                        <a class="btn btn-primary btn-print" >Imprimir</a>
                                    </div>


                                   <%-- <span id="guardarordencompra" class="btn btn-primary" style="font-size:12px" onclick="carga_submit_ordencompra() ">
                                                <i class="fa fa-save" ></i> &nbsp; GUARDAR
                                            </span>--%>
                                </div>
                            </div>
                        </div>

                    </form>
                                       
                    <%--INSERTAR PROVEEDOR--%>
                    <form id="proveedorInsert" class="form-horizontal" >
                        <div class="modal fade" id="agregarProveedor" role="dialog" aria-labelledby="Login" aria-hidden="true">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title" style="font-size:18px;font-weight:bold">Registrar Proveedores</h1>
                        
                                        <span style="float:right;margin-top:-28px">
                                            <span title="Guardar Proveedor" id="guardarprov" class="btn btn-primary" style="font-size:12px" onclick="carga_submit()" >
                                               <i class="fa fa-save"></i> 
                                            </span>

                                            <%--<span title="Cancelar" id="cancelarprov" class="btn btn-danger" style="font-size:12px" data-dismiss="modal" aria-label="Close" >--%>
                                            <span title="Salir" id="cancelarprov" class="btn btn-danger" style="font-size:12px" onclick="cerrar_regisprov()" >
                                               <i class="fa fa-close"></i>
                                            </span>
                                            <%--<a class="btnx closeModal">Close</a>--%>
                                        </span>

                                        <input type="hidden" name="empresa" id="empresa" > 

                                        <%--<span id="cancelarrordencompra" class="btn btn-danger" style="font-size:12px" data-dismiss="modal" aria-label="Close"   >
                                            <i class="fa fa-close"></i> &nbsp; CANCELAR
                                        </span>--%>

                                    </div>

                                    <div class="modal-body">
                                        <%--<input type="hidden" name="cond" id="cond" value=1>
                                        <input type="hidden" name="contador" id="contador" value=1>
                                        <input type="hidden" name="cond_tabla" id="cond_tabla" value=1>    --%>   
                      
                                        <input id="guardar" type="submit" class="btn btn-primary" value="Guardar" style="display:none"  >
				                        <button style="display:none" id="cancelar1" type="button" class="btn btn-default" data-dismiss="modal" >Cancelar</button>
                                        
                                        <%--<div class="form-group">
                                            <label class="col-lg-12 control-label"><h1 style="font-size:16px">Auditoria</h1></label>
                                        </div>--%>

                                        <%--<div class="form-group">                       
                                            
                                            <label class="col-lg-2 control-label">Usuario/Fecha Creaci&oacute;n</label>
                                            <div class="col-lg-4">
                                                <input disabled type="text" class="form-control" name="UsuFechCrea" id="UsuFechCrea" />
                                            </div>

                                            <label class="col-lg-2 control-label">Usuario/Fecha Modificaci&oacute;n</label>
                                            <div class="col-lg-4">
                                                <input disabled type="text" class="form-control" name="UsuFechModif" id="UsuFechModif" />
                                            </div>   
                                             
                                        </div>--%>
                                                                                
                                        <%--<div class="form-group">
		                                    
				                            <div class="tab-pane" id="req">
			                                    <div class="col-md-12" style="">
                                                    <div class="box box-primary">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>--%>
    							            
							            <div class="form-group">
                                            <label class="col-lg-2 control-label">Nro RUC </label>
                                            <div class="col-lg-3">
                                                <input type="text" class="form-control" name="IdProveedor" id="IdProveedor" style="width:100%" maxlength="11" />
                                            </div>
                                            
                                            <label class="col-lg-2 control-label">Razon Social</label>
                                            <div class="col-lg-5">
                                                <input disabled type="text" class="form-control" name="RazonSocial" id="RazonSocial" style="width:100%" />
                                            </div>

                                            <%--<label class="col-lg-2 control-label"></label>--%>
                                            <div class="col-lg-2">
                                                <input  type="text" class="form-control" name="RUC" id="RUC" />
                                            </div>
                                            <div class="col-lg-2">
                                                <input  type="text" class="form-control" name="SiglaComercial" id="SiglaComercial" />
                                            </div>
                                            <div class="col-lg-2">
                                                <input  type="text" class="form-control" name="RazSocial" id="RazSocial" />
                                            </div>
                                        </div>

                                        <div class="form-group">

                                            <%--<label class="col-lg-2 control-label">Sigla Comercial </label>--%>
                                            

                                            <%--<label class="col-lg-2 control-label">Razon Social</label>
                                            <div class="col-lg-6">
                                                <input  type="text" class="form-control" name="RazonSocial" id="RazonSocial" style="width:100%" />
                                            </div>
                                            <label class="col-lg-1 control-label"></label>--%>
                                            
                                            <label class="col-lg-2 control-label">Doc. Ident.</label>
                                            <div class="col-lg-2">
                                                <select class="form-control" name="IdTipoDocumentoIdentidad" id="IdTipoDocumentoIdentidad">
                                                    <option value="">Seleccionar </option>                 
                                                </select>
                                            </div>
                                            <div class="col-lg-2">
                                                <input disabled type="text" class="form-control" name="Dni" id="Dni" style="width:100%" />
                                            </div>

                                            <%--<label class="col-lg-2 control-label"></label>--%>
                                            <div class="col-lg-2">
                                                <input type="checkbox"  name="prov_locador" id="prov_locador"> Locador<br>
                                            </div>

                                            <div class="col-lg-2">
                                                <input type="radio" id="sincci" name="sincci" value="" > SIN CCI<br>
                                            </div>
                                            <div class="col-lg-2">
                                                <input type="radio" id="concci" name="concci" value="" > CON CCI<br>
                                            </div>
                                        </div>
							
							            <div class="form-group">
                                            <label class="col-lg-2 control-label">Apellido Paterno</label>
                                            <div class="col-lg-2">
                                                <input  type="text" class="form-control" name="ApPaterno" id="ApPaterno" style="width:100%" maxlength="30" />
                                            </div>

                                            <label class="col-lg-2 control-label">Apellido Materno</label>
                                            <div class="col-lg-2">
                                                <input  type="text" class="form-control" name="ApMaterno" id="ApMaterno" style="width:100%" maxlength="30" />
                                            </div>

                                            <label class="col-lg-1 control-label">CCI</label>
                                            <div class="col-lg-3">
                                                <input  type="text" class="form-control" name="CCI" id="CCI" style="width:100%" maxlength="20" />
                                            </div>
                                        </div>
														
							            <div class="form-group">
                                            <label class="col-lg-2 control-label">Nombres</label>
                                            <div class="col-lg-6">
                                                <input  type="text" class="form-control" name="Nombres" id="Nombres" style="width:100%" maxlength="40" />
                                            </div>

                                            <label class="col-lg-1 control-label">Bco. Telewise</label>
                                            <div class="col-lg-3">
                                                <select class="form-control" name="IdBancoProv" id="IdBancoProv" style="width:100%">
                                                    <option selected disabled></option>                 
                                                </select>
                                            </div>
                                                                                        
                                        </div>

                                        <div class="form-group">
                                            <label class="col-lg-2 control-label">Direcci&oacute;n</label>
                                            <div class="col-lg-6">
                                                <input  type="text" class="form-control" name="Direccion" id="Direccion" style="width:100%" />
                                            </div>

                                            <label class="col-lg-1 control-label">Forma Pago</label>
                                            <div class="col-lg-3">
                                                <select class="form-control" name="FormaPago" id="FormaPago">
                                                    <option value=""></option>                 
                                                </select>
                                            </div>                                        
                                            
                                        </div>

                                        <div class="form-group">
                                            <label class="col-lg-2 control-label">Fecha de Nacimiento</label>
                                            <div class="col-lg-2">
                                                 <input readonly style="border-color:#00a65a;background-color:#ffffff;font-size:100%" type="text" class="form-control" name="FecNac" id="FecNac"/>
                                            </div>

                                            <label class="col-lg-1 control-label">Tipo Act.</label>
                                            <div class="col-lg-3">
                                                <select class="form-control" name="TipoActividad" id="TipoActividad" style="width:100%">
                                                    <option value=""></option>                  
                                                </select>
                                            </div>

                                            <label class="col-lg-1 control-label">Clasific.</label>
                                            <div class="col-lg-3">
                                                <select class="form-control" name="Clasificacion" id="Clasificacion" style="width:100%">
                                                    <option value=""></option>                  
                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-lg-2 control-label">Departamento</label>
                                            <div class="col-lg-3">
                                                <select class="form-control" name="Departamento" id="Departamento" style="width:100%" onchange="listar_provincia(),listar_distrito()">
                                                    <option selected disabled></option>                 
                                                </select>
                                            </div>
                                            <label class="col-lg-1 control-label">RNP Bienes</label>
                                            <div class="col-lg-2">
                                                <input  type="text" class="form-control" name="RnpBienes" id="RnpBienes" style="width:100%" maxlength="11" />
                                            </div>
                                            <div class="col-lg-2">
                                                 <input readonly style="border-color:#00a65a;background-color:#ffffff;font-size:100%" type="text" class="form-control" name="RnpBienFechaIni" id="RnpBienFechaIni"/>
                                            </div>
                                            <div class="col-lg-2">
                                                 <%--<input readonly style="border-color:#00a65a;background-color:#ffffff;font-size:100%" type="text" class="form-control" name="RnpBienFechaFin" id="RnpBienFechaFin"/>--%>
                                                 <input readonly type="text" class="form-control" name="RnpBienFechaFin" id="RnpBienFechaFin" style="width:100%" />
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-lg-2 control-label">Provincia</label>
                                            <div class="col-lg-3">
                                                <select class="form-control" name="Provincia" id="Provincia" style="width:100%" onchange="listar_distrito()">
                                                    <option selected disabled></option>                 
                                                </select>
                                            </div>
                                            <label class="col-lg-1 control-label">RNP Servicios</label>
                                            <div class="col-lg-2">
                                                <input  type="text" class="form-control" name="RnpServicios" id="RnpServicios" style="width:100%" maxlength="11" />
                                            </div>
                                            <div class="col-lg-2">
                                                 <input readonly style="border-color:#00a65a;background-color:#ffffff;font-size:100%" type="text" class="form-control" name="RnpServicioFechaIni" id="RnpServicioFechaIni"/>
                                            </div>
                                            <div class="col-lg-2">
                                                 <%--<input readonly style="border-color:#00a65a;background-color:#ffffff;font-size:100%" type="text" class="form-control" name="RnpServicioFechaFin" id="RnpServicioFechaFin"/>--%>
                                                 <input readonly type="text" class="form-control" name="RnpServicioFechaFin" id="RnpServicioFechaFin" style="width:100%" />
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-lg-2 control-label">Distrito</label>
                                            <div class="col-lg-3">
                                                <select class="form-control" name="Distrito" id="Distrito" style="width:100%">
                                                    <option selected disabled></option>                
                                                </select>
                                            </div>
                                            <label class="col-lg-1 control-label">RNP Consultor.</label>
                                            <div class="col-lg-2">
                                                <input  type="text" class="form-control" name="RnpConsultoria" id="RnpConsultoria" style="width:100%" maxlength="11" />
                                            </div>
                                            <div class="col-lg-2">
                                                 <input readonly style="border-color:#00a65a;background-color:#ffffff;font-size:100%" type="text" class="form-control" name="RnpConsultoriaFechaIni" id="RnpConsultoriaFechaIni"/>
                                            </div>
                                            <div class="col-lg-2">
                                                 <%--<input readonly style="border-color:#00a65a;background-color:#ffffff;font-size:100%" type="text" class="form-control" name="RnpConsultoriaFechaFin" id="RnpConsultoriaFechaFin"/>--%>
                                                 <input readonly type="text" class="form-control" name="RnpConsultoriaFechaFin" id="RnpConsultoriaFechaFin" style="width:100%" />
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-lg-2 control-label">Telefonos</label>
                                            <div class="col-lg-2">
                                                <input  type="text" class="form-control" name="TelefonoEmpresa1" id="TelefonoEmpresa1" style="width:100%" maxlength="16" />
                                            </div>
                                            <div class="col-lg-2 control-text">
                                                <input  type="text" class="form-control" name="TelefonoEmpresa2" id="TelefonoEmpresa2" style="width:100%" maxlength="16" />
                                            </div>

                                            <label class="col-lg-1 control-label">Email</label>
                                            <div class="col-lg-5">
                                                <input  type="text" class="form-control" name="eMail" id="eMail" style="width:100%" />
                                            </div>

                                             <%--<div class="col-lg-1">
                                                <input  type="text" class="form-control" name="idnrocuenta" id="idnrocuenta" />
                                            </div>
                                           <div class="col-lg-4">
                                                <input  type="text" class="form-control" name="Fax" id="Fax" style="width:100%" />
                                            </div>--%>
                                            
                                        </div>
                                                                                                           
                                        <div class="form-group">
                                            <label class="col-lg-2 control-label">Tipo Proveedor</label>
                                            <div class="col-lg-2">
                                                <input type="radio" id="bien" name="bien" value="bien"> Bien<br>
                                            </div>      
                                            <div class="col-lg-2">
                                                <input type="radio" id="Radio1" name="contrato" value=""> Contrato<br>
                                            </div>                                                                                                                 
                                        </div>

                                        <div class="form-group">
                                            <label class="col-lg-2 control-label"></label>
                                            <div class="col-lg-2">
                                                <input type="radio" id="servicio" name="servicio" value=""> Servicio<br>
                                            </div>

                                            <div class="col-lg-2">
                                                <input type="radio" id="Radio2" name="pagoturno" value=""> Pago por Turno<br>
                                            </div>

                                            <label class="col-lg-1 control-label"></label>
                                            <div class="col-lg-2">
                                                <input type="radio" id="scotiabank" name="scotiabank" value=""> Scotiabank<br>
                                            </div>
                                            <div class="col-lg-2">
                                                <input type="radio" id="otrosbancos" name="otrosbancos" value=""> Otros Bancos<br>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-lg-2 control-label"></label>
                                            <div class="col-lg-2">
                                                <input type="radio" id="honorario" name="honorario" value=""> Honorario<br>
                                            </div>

                                            <label class="col-lg-1 control-label"></label>
                                            <label class="col-lg-2 control-label">Cuenta Bancario</label>    
                                            <div class="col-lg-4">
                                                <input  type="text" class="form-control" name="CtaBancaria" id="CtaBancaria" style="width:100%" />
                                            </div>
                                             <div class="col-lg-1">
                                                <input type="text" class="form-control" name="IdNumeroCuenta" id="IdNumeroCuenta" />
                                            </div> 
                                        </div>

                                        <div class="form-group">
                                             <%--FECHA ACTUAL--%>
                                            <div class="col-lg-2">
                                                <input  type="text" class="form-control" name="DiaFecAct" id="DiaFecAct" style="width:100%" />
                                            </div>
                                            <div class="col-lg-2">
                                                <input  type="text" class="form-control" name="MesFecAct" id="MesFecAct" style="width:100%" />
                                            </div>
                                            <div class="col-lg-2">
                                                <input  type="text" class="form-control" name="AnoFecAct" id="AnoFecAct" style="width:100%" />
                                            </div>
                                            <div class="col-lg-2">
                                                <input  type="text" class="form-control" name="Edad" id="Edad" style="width:100%" />
                                            </div>

                                            <div class="col-lg-2">
                                                <input  type="text" class="form-control" name="ValCCI" id="ValCCI" style="width:100%" />
                                            </div>
                                            <div class="col-lg-2">
                                                <input  type="text" class="form-control" name="ValBacTelewiese" id="ValBacTelewiese" style="width:100%" />
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-lg-2">
                                                <input  type="text" class="form-control" name="Depart" id="Depart" style="width:100%" />
                                            </div>
                                            <div class="col-lg-2">
                                                <input  type="text" class="form-control" name="Prov" id="Prov" style="width:100%" />
                                            </div>
                                            <div class="col-lg-2">
                                                <input  type="text" class="form-control" name="Dist" id="Dist" style="width:100%" />
                                            </div>

                                            <div class="col-lg-2">
                                                <input  type="text" class="form-control" name="ValTipoDocu" id="ValTipoDocu" style="width:100%" />
                                            </div>
                                            <div class="col-lg-2">
                                                <input  type="text" class="form-control" name="CantCarTipoDoc" id="CantCarTipoDoc" style="width:100%" />
                                            </div>

                                            <div class="col-lg-2">
                                                <input  type="text" class="form-control" name="ExistProveedor" id="ExistProveedor" style="width:100%" />
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-lg-2">
                                                <input  type="text" class="form-control" name="Val_Locador" id="Val_Locador" style="width:100%" />
                                            </div>
                                        </div>

           
                                        <%--<div class="form-group">   

                                            <label class="col-lg-1 control-label">Anexo</label>
                                            <div class="col-lg-2">
                                                <input  type="text" class="form-control" name="anexo" id="anexo" style="width:100%" />
                                            </div>
                                            <label class="col-lg-1 control-label">RPC</label>
                                            <div class="col-lg-2">
                                                <input  type="text" class="form-control" name="rpc" id="rpc" style="width:100%" />
                                            </div>
                                                                                        

                                            <div class="col-lg-2">
                                                <input type="radio" id="scotiabank" name="scotiabank" value=""> Scotiabank<br>
                                                <input type="radio" id="otrosbancos" name="otrosbancos" value=""> Otros Bancos<br>
                                            </div>
                                            
                                            <label class="col-lg-3 control-label">Cuenta Bancario</label>
                                            
                                            <div class="col-lg-3">
                                                <input type="text" class="form-control" name="IdNumeroCuenta" id="IdNumeroCuenta" style="width:100%" />
                                            </div>

                                        </div>
                                                                               
                                        <div class="form-group">
                                            <div class="col-lg-2">
                                                <input  type="text" name="Bien" id="Bien" style="height:20%" />
                                            </div>
                                            <div class="col-lg-2">
                                                <input  type="text" name="Servicio" id="Servicio" style="height:20%" />
                                            </div>
                                            <div class="col-lg-2">
                                                <input  type="text" name="Honorario" id="Honorario" style="height:20%" />
                                            </div>
                                            <div class="col-lg-2">
                                                <input  type="text" name="Contrato" id="Contrato" style="height:20%" />
                                            </div>
                                            <div class="col-lg-2">
                                                <input  type="text" name="FlagPagoPorTurno" id="FlagPagoPorTurno" style="height:20%" />
                                            </div>
                                        </div>

                                        <div class="form-group">
				                            <div class="tab-pane" id="req">
			                                    <div class="col-md-12" style="">
                                                    <div class="box box-primary">        
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <h1 class="modal-title" style="font-size:100%;font-weight:bold">Datos del Representante</h1><br>
                                        <div class="form-group">
                                            <label class="col-lg-2 control-label">Representate</label>
                                            <div class="col-lg-6">
                                                <input  type="text" class="form-control" name="Representante" id="Representante" style="width:100%" />
                                            </div>
                                            <label class="col-lg-1 control-label">Cargo</label>
                                            <div class="col-lg-3">
                                                <input  type="text" class="form-control" name="CargoRepresentante" id="CargoRepresentante" style="width:100%" />
                                            </div>
                                        </div>
                                         
                                        <div class="form-group">
                                            <label class="col-lg-2 control-label">Telefonos</label>
                                            <div class="col-lg-2">
                                                <input  type="text" class="form-control" name="TelefonoRepresentante1" id="TelefonoRepresentante1" style="width:100%" />
                                            </div>
                                            <div class="col-lg-3 control-text">
                                                <input  type="text" class="form-control" name="TelefonoRepresentante2" id="TelefonoRepresentante2" style="width:100%" />
                                            </div>
                                            <label class="col-lg-1 control-label">Email</label>
                                            <div class="col-lg-4">
                                                <input  type="text" class="form-control" name="eMailRepresentante" id="eMailRepresentante" style="width:100%" />
                                            </div>
                                        </div>--%>                                      
                                        <br>		
                                    </div>
                                </div>
                            </div>
                        </div>
                  </form>				  
				  
                </div>
                
                <div class="box-body pad table-responsive"   style="overflow:scroll;height:350px" id="Tabla_CabeceraOrdenCompra">
				    <table id="tabla_orden"  class="table table-bordered table-hover dataTable no-footer" role="grid" aria-describedby="tabla_inventario_info">
				        <thead>
                            <tr  class="cabecera">
                                <th style="text-align:center" ><b>Nro </b></th>       
                                <th style="text-align:center" ><b>Ordenes </b></th>
                                <th style="text-align:center" ><b>Requerimiento </b></th>
                                <th style="text-align:center" ><b>Centro Costos </b></th>
                                <th style="text-align:center" width="52"><b>Fecha </b></th>
                                <th style="text-align:center" width="100"><b>Proveedor </b></th>
                                <th style="text-align:center" ><b>Moneda </b></th>
                                <th style="text-align:center" ><b>Costo </b></th>
                                <th style="text-align:center" ><b>Ingreso Almacen </b></th>
                                <th style="text-align:center" ><b>Procede Pago </b></th>
                                <th style="text-align:center" ><b>Nro Guia </b></th>
                                <th style="text-align:center" ><b>Estado </b></th>
                                <th style="text-align:center" ><b>Usuario </b></th>
                      
                                <!-- <th width="10px">Estado </th>-->
                            </tr>
					    </thead>
                        <tbody id="body_orden">
			                <tr ><td colspan="13" align="center">No se encontraron resultados</td></tr>		
                        </tbody>
                    </table>
                </div><!-- /.box -->
            </div>
        </div><!-- /.col -->
    </div><!-- ./row -->
     
    <div class="row" id="Tabla_DetalleOrdenCompra">
        <div class="col-md-12">
            <div class="box box-primary">
                <div class="box-header">
                    <h6 class="box-title"><small>Detalle de Orden de Compra</small></h6>
                </div>
                <div class="box-body pad table-responsive" style="overflow:scroll;height:300px">
				    <table id="tabla_orden2" class="table table-bordered table-hover dataTable no-footer">
				        <thead>
                            <tr class=cabecera>
                                <th ><b>Nro</b> </th>
                                <th ><b>Item</b> </th>
                                <th ><b>Nro Requemiento</b> </th>
                                <th ><b>Centro Costo</b> </th>
                                <th ><b>Descripcion</b> </th>
                                <th ><b>Descripcion Bien</b> </th>
                                <th ><b>Clasificador</b> </th>
                                <th ><b>Actividad</b> </th>
                                <th ><b>Finalidad</b> </th>
                                <th ><b>Meta</b> </th>
                                <th ><b>U.M</b> </th>
                                <th ><b>Cantidad</b> </th>
                                <th ><b>Costo</b> </th>
                                <th ><b>Total Costo</b> </th>
                                <th ><b>Estado</b> </th>
                            </tr>
                        </thead>
				       <tbody id="body_orden2">
					        <tr><td colspan=15 align=center class="auto-style1">No se encontraron resultados</td></tr>
				       </tbody>
                    </table>
                </div><!-- /.box -->
            </div>
        </div><!-- /.col -->
    </div><!-- ./row -->

    <div class="row">
        <div class="col-xs-2">
            <input type=text name="id_orden" id="id_orden" aria-controls="tabla_inventario" class="form-control input-sm">
        </div>
        
        <div class="col-xs-2">
            <input type=text name="id_requerimiento" id="id_requerimiento" aria-controls="tabla_inventario" class="form-control input-sm">
        </div>
        
        <div class="col-xs-1">
            <input type=text name="modificarcompraoservicio" id="modificarcompraoservicio" aria-controls="tabla_inventario" class="form-control input-sm">
        </div>

        <div class="col-xs-1">
            <input style="width:80px" type="text" class="form-control input-sm" name="Meses" id="Meses" />
        </div>
                             
        <div class="col-xs-1">
            <input style="width:80px" type="text" class="form-control input-sm" name="Annos" id="Annos" />
        </div>

    </div>
    
    <div class="row">
        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="idanno" id="idanno" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="idmes" id="idmes" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="dia" id="dia" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="columnsOrdenDescrip" id="columnsOrdenDescrip" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

    </div>

    <div class="row">
        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="IdGuia" id="IdGuia" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>
    </div>

    <div class="row">
        <span class="btn btn-success" id="Consulta_Documentos" style="font-size:12px" data-toggle="modal" onclick="" data-target="#consultaDoc" >
            <i  class="fa fa-plus" ></i> &nbsp; CONSULTA DOCUMENTOS
        </span>
    </div>

    <!-- Requerimientos -->

    <%--<div class="row"><!-- Requerimientos 1-6 -->
        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="IdRequerimiento1" id="IdRequerimiento1" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="IdRequerimiento2" id="IdRequerimiento2" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="IdRequerimiento3" id="IdRequerimiento3" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="IdRequerimiento4" id="IdRequerimiento4" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="IdRequerimiento5" id="IdRequerimiento5" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="IdRequerimiento6" id="IdRequerimiento6" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>
    </div>

    <div class="row"><!-- Requerimientos 7-12 -->
        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="IdRequerimiento7" id="IdRequerimiento7" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="IdRequerimiento8" id="IdRequerimiento8" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="IdRequerimiento9" id="IdRequerimiento9" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="IdRequerimiento10" id="IdRequerimiento10" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="IdRequerimiento11" id="IdRequerimiento11" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="IdRequerimiento12" id="IdRequerimiento12" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>
    </div>

    <div class="row"><!-- Requerimientos 13-18 -->
        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="IdRequerimiento13" id="IdRequerimiento13" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="IdRequerimiento14" id="IdRequerimiento14" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="IdRequerimiento15" id="IdRequerimiento15" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="IdRequerimiento16" id="IdRequerimiento16" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="IdRequerimiento17" id="IdRequerimiento17" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="IdRequerimiento18" id="IdRequerimiento18" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>
    </div>

    <div class="row"><!-- Requerimientos 19-24 -->
        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="IdRequerimiento19" id="IdRequerimiento19" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="IdRequerimiento20" id="IdRequerimiento20" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="IdRequerimiento21" id="IdRequerimiento21" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="IdRequerimiento22" id="IdRequerimiento22" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="IdRequerimiento23" id="IdRequerimiento23" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="IdRequerimiento24" id="IdRequerimiento24" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>
    </div>

    <div class="row"><!-- Requerimientos 25-30 -->
        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="IdRequerimiento25" id="IdRequerimiento25" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="IdRequerimiento26" id="IdRequerimiento26" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="IdRequerimiento27" id="IdRequerimiento27" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="IdRequerimiento28" id="IdRequerimiento28" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="IdRequerimiento29" id="IdRequerimiento29" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="IdRequerimiento30" id="IdRequerimiento30" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>
    </div>

    <!-- Bienes/Servicios -->

    <div class="row"><!-- Bienes/Servicios 1-6 -->
        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="IdBienServicio1" id="IdBienServicio1" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="IdBienServicio2" id="IdBienServicio2" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="IdBienServicio3" id="IdBienServicio3" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="IdBienServicio4" id="IdBienServicio4" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="IdBienServicio5" id="IdBienServicio5" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="IdBienServicio6" id="IdBienServicio6" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>
    </div>

    <div class="row"><!-- Bienes/Servicios 7-12 -->
        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="IdBienServicio7" id="IdBienServicio7" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="IdBienServicio8" id="IdBienServicio8" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="IdBienServicio9" id="IdBienServicio9" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="IdBienServicio10" id="IdBienServicio10" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="IdBienServicio11" id="IdBienServicio11" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="IdBienServicio12" id="IdBienServicio12" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>
    </div>

    <div class="row"><!-- Bienes/Servicios 13-18 -->
        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="IdBienServicio13" id="IdBienServicio13" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="IdBienServicio14" id="IdBienServicio14" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="IdBienServicio15" id="IdBienServicio15" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="IdBienServicio16" id="IdBienServicio16" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="IdBienServicio17" id="IdBienServicio17" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="IdBienServicio18" id="IdBienServicio18" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>
    </div>

    <div class="row"><!-- Bienes/Servicios 19-24 -->
        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="IdBienServicio19" id="IdBienServicio19" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="IdBienServicio20" id="IdBienServicio20" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="IdBienServicio21" id="IdBienServicio21" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="IdBienServicio22" id="IdBienServicio22" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="IdBienServicio23" id="IdBienServicio23" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="IdBienServicio24" id="IdBienServicio24" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>
    </div>

    <div class="row"><!-- Bienes/Servicios 25-30 -->
        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="IdBienServicio25" id="IdBienServicio25" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="IdBienServicio26" id="IdBienServicio26" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="IdBienServicio27" id="IdBienServicio27" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="IdBienServicio28" id="IdBienServicio28" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="IdBienServicio29" id="IdBienServicio29" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="IdBienServicio30" id="IdBienServicio30" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>
    </div>
    
    <!-- NumeroItemRequerimientos -->

    <div class="row"><!-- Bienes/Servicios 1-6 -->
        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="NumeroItemRequerimiento1" id="NumeroItemRequerimiento1" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="NumeroItemRequerimiento2" id="NumeroItemRequerimiento2" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="NumeroItemRequerimiento3" id="NumeroItemRequerimiento3" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="NumeroItemRequerimiento4" id="NumeroItemRequerimiento4" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="NumeroItemRequerimiento5" id="NumeroItemRequerimiento5" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="NumeroItemRequerimiento6" id="NumeroItemRequerimiento6" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>
    </div>

    <div class="row"><!-- Bienes/Servicios 7-12 -->
        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="NumeroItemRequerimiento7" id="NumeroItemRequerimiento7" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="NumeroItemRequerimiento8" id="NumeroItemRequerimiento8" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="NumeroItemRequerimiento9" id="NumeroItemRequerimiento9" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="NumeroItemRequerimiento10" id="NumeroItemRequerimiento10" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="NumeroItemRequerimiento11" id="NumeroItemRequerimiento11" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="NumeroItemRequerimiento12" id="NumeroItemRequerimiento12" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>
    </div>

    <div class="row"><!-- Bienes/Servicios 13-18 -->
        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="NumeroItemRequerimiento13" id="NumeroItemRequerimiento13" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="NumeroItemRequerimiento14" id="NumeroItemRequerimiento14" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="NumeroItemRequerimiento15" id="NumeroItemRequerimiento15" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="NumeroItemRequerimiento16" id="NumeroItemRequerimiento16" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="NumeroItemRequerimiento17" id="NumeroItemRequerimiento17" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="NumeroItemRequerimiento18" id="NumeroItemRequerimiento18" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>
    </div>

    <div class="row"><!-- Bienes/Servicios 19-24 -->
        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="NumeroItemRequerimiento19" id="NumeroItemRequerimiento19" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="NumeroItemRequerimiento20" id="NumeroItemRequerimiento20" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="NumeroItemRequerimiento21" id="NumeroItemRequerimiento21" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="NumeroItemRequerimiento22" id="NumeroItemRequerimiento22" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="NumeroItemRequerimiento23" id="NumeroItemRequerimiento23" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="NumeroItemRequerimiento24" id="NumeroItemRequerimiento24" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>
    </div>

    <div class="row"><!-- Bienes/Servicios 25-30 -->
        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="NumeroItemRequerimiento25" id="NumeroItemRequerimiento25" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="NumeroItemRequerimiento26" id="NumeroItemRequerimiento26" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="NumeroItemRequerimiento27" id="NumeroItemRequerimiento27" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="NumeroItemRequerimiento28" id="NumeroItemRequerimiento28" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="NumeroItemRequerimiento29" id="NumeroItemRequerimiento29" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>

        <div class="col-xs-2">
		    <div class="dataTables_length">
			    <input type=text name="NumeroItemRequerimiento30" id="NumeroItemRequerimiento30" aria-controls="tabla_inventario" class="form-control input-sm">
			</div>
		</div>
    </div>--%>

</section><!-- /.content -->


<link href="../css/select2.css" rel="stylesheet"/>
<script src="../js/select2.js"></script>
	 
<script src="../js/jquery.uitablefilter.js" ></script>


<script type="text/javascript">

    function carga_submit() {
        $("#proveedorInsert").submit();
    }

    function carga_submit_guardarordencompra() {
        $("#AdicionarOrdendeCompra").submit();
    }   

    function imprimir_pdf() {
        if (window.location.pathname == '/') {
            //alert("La url es incorrecta, intentalo nuevamente");
            //window.location = "http://" + location.host + "/Home/Index.aspx";
        }
        else {
            $("#cod_empresa").val($("#id_empresa").val())
            $("#btn_gs").click();
        }
    }

    function imprimir_pdfMasiva() {
        if (window.location.pathname == '/') {
            //alert("La url es incorrecta, intentalo nuevamente");
            //window.location = "http://" + location.host + "/Home/Index.aspx";
        }
        else {
            $("#cod_empresa").val($("#id_empresa").val())
            $("#btn_gsMasiva").click();
        }
    }

    $(document).ready(function () {

        datos_usuario();

        //$("#n").val("");

        //Guardar Cabecera Orden de Compra
        $("#AdicionarOrdendeCompra").submit(function (event) {
                
            //validarSelectProveedor();
            //val_cant();

            //if ($("#ProvSelect").val() != "") {

            if ($("#VerifEnter").val() != "BuscarReq") {

                if ($("#PlazoEntrega").val() == "")
                    alert("Ingrese Plazo de Entrega");

                else if ($("#Tipo_cambio").val() == "0.00")
                    alert("Tipo de Cambio no puede ser 0.00");

                else if ($("#proveedor").val() == "")
                    alert("Seleccione un Proveedor");

                else if ($("#concepto").val() == "")
                    alert("Ingrese un Concepto para la Orden de Compra");

                else {

                    $("#guardarordencompra").hide();
                    ExtraerFechaFinRNP();
                    //ConfirmarGuardadoOrden();

                }
            }
            event.preventDefault();
        });

   
        //Nuevo Proveedor
        $("#proveedorInsert").submit(function (event) {

            document.getElementById('RUC').value = document.getElementById('IdProveedor').value;

            $("#Depart").val($("#Departamento").val());
            $("#Prov").val($("#Provincia").val());
            $("#Dist").val($("#Distrito").val());
            $("#ValBacTelewiese ").val($("#IdBancoProv").val());

            if ($("#IdProveedor").val() == "")
                alert("Ingrese el N° de RUC");

            else if ($("#Dni").val() == "")
                alert("Seleccione e ingrese Tipo Documento");

            else if ($("#ApPaterno").val() == "")
                alert("Ingrese el Apellido Paterno");

            else if ($("#ApMaterno").val() == "")
                alert("Ingrese el Apellido Materno");

            else if ($("#Nombres").val() == "")
                alert("Ingrese el Nombre");

            else if ($("#Direccion").val() == "")
                alert("Ingrese la Dirección");

            else if ($("#Depart").val() == "S")
                alert("Seleccione Departamento");

            else if ($("#Prov").val() == "S")
                alert("Seleccione Provincia");

            else if ($("#Dist").val() == "S")
                alert("Seleccione Distrito");

            else if ($("#Edad").val() < 18)
                alert("Proveedor no puede ser menor de edad, elija Fecha de Nacimiento.");

            else if ($("#RnpBienFechaFin").val() == "" & $("#RnpServicioFechaFin").val() == "" & $("#RnpConsultoriaFechaFin").val() == "")
                alert("Elija la fecha del RNP del proveedor");

            else if ($("#CtaBancaria").val() == "")
                alert("Ingrese la Cuente Bancaria");

            else {
                var ary = $("#proveedorInsert").serializeArray();
                var obj = {};
                for (var a = 0; a < ary.length; a++)
                    obj[ary[a].name] = ary[a].value;
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/InsertarNewProveedor',
                        data: JSON.stringify(obj),
                        dataType: "json",
                        success: function (response) {

                        if (response.d == 1) {
                            alert("Proveedor se registro correctamente");
                            $("#cancelarprov").click();
                            ActualizarProv();

                            ActualizarRNP();

                            limpiarInsertProv();
   
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

        $("#PlazoEntrega").keydown(function (event) {
            if (event.shiftKey) {
                event.preventDefault();
            }

            if (event.keyCode == 46 || event.keyCode == 8) {
            }
            else {
                if (event.keyCode < 95) {
                    if (event.keyCode < 48 || event.keyCode > 57) {
                        event.preventDefault();
                    }
                }
                else {
                    if (event.keyCode < 96 || event.keyCode > 105) {
                        event.preventDefault();
                    }
                }
            }
        });

        $("#PlazoEntregamodif").keydown(function (event) {
            if (event.shiftKey) {
                event.preventDefault();
            }

            if (event.keyCode == 46 || event.keyCode == 8) {
            }
            else {
                if (event.keyCode < 95) {
                    if (event.keyCode < 48 || event.keyCode > 57) {
                        event.preventDefault();
                    }
                }
                else {
                    if (event.keyCode < 96 || event.keyCode > 105) {
                        event.preventDefault();
                    }
                }
            }
        });


        $(".closeModal").click(function () {
            $("#agregarProveedor").modal("hide");
            //$(".OrdenCompraInsertar").modal("hide");
        });
        
        orden = $("#tabla_orden");
        //$("#buscar_orden").keyup(function () {
        //    $.uiTableFilter(orden, this.value);
        //});

        requer = $("#tabla_orden");
        //$("#buscar_orden").keyup(function () {
        //    $.uiTableFilter(requer, this.value);
        //});

        adicorden = $("#tabla_req");

        //$("#search_ocreq").keyup(function () {
        //    $.uiTableFilter(adicorden, this.value);
        //});

        provord = $("#T_ProvxOrdenes");

        ordenprov = $("#T_CabBProveedores");

        $("#BuscarReq").val("");

        $("#search_ocreq").keypress(function (e) {
            if (e.which == 13) {
                $("#VerifEnter").val("BuscarReq");
                //alert("Enterrrrr");

                NroFilasxRequerimiento();
                listar_Brequerimiento();
            }

        });

        $("#BuscarProv").val("");

        $("#buscar_orden").keypress(function (e) {
            if (e.which == 13) {
                Blistar_orden();
            }
        });

        //$("#search_prov").keyup(function () {
        //    //$.uiTableFilter(adicorden, this.value);
        //    $("#BuscarProv").val('%' + $("#search_prov").val() + '%');

        //    ValidarBusquedaProv();

        //    Listar_Proveedores();
        //});

        $("#search_provm").keyup(function () {
            //$.uiTableFilter(adicorden, this.value);
            $("#BuscarProv").val('%' + $("#search_provm").val() + '%');

            ValidarBusquedaProvm();

            Listar_Proveedoresm();
        });
        
        $("#proveedorInsert #empresa").val($("#id_empresa").val());
        $("#AdicionarOrdendeCompra #empresa").val($("#id_empresa").val());

        $("#eliminar").hide();
        $("#modificar").hide();
        $("#guardar").hide();
        $("#imprimir").hide();
        
        $("#plazoent").val("0");
        mayuscula("#concepto");
        //mayuscula("#conceptomodif");
        mayuscula("#search_ocreq");
        mayuscula("#search_detreq");
        mayuscula("#search_ocartreq");
        mayuscula("#SiglaComercial");
        mayuscula("#RazonSocial");
        mayuscula("#CCI");
        mayuscula("#ApPaterno");
        mayuscula("#ApMaterno");
        mayuscula("#Nombres");
        mayuscula("#Direccion");
        mayuscula("#Representante");
        mayuscula("#CargoRepresentante");


        $("#Dni").keydown(function (event) {
            if (event.shiftKey) {
                event.preventDefault();
            }

            if (event.keyCode == 46 || event.keyCode == 8) {
            }
            else {
                if (event.keyCode < 95) {
                    if (event.keyCode < 48 || event.keyCode > 57) {
                        event.preventDefault();
                    }
                }
                else {
                    if (event.keyCode < 96 || event.keyCode > 105) {
                        event.preventDefault();
                    }
                }
            }
        });

        $("#TelefonoEmpresa1").keydown(function (event) {
            if (event.shiftKey) {
                event.preventDefault();
            }

            if (event.keyCode == 46 || event.keyCode == 8) {
            }
            else {
                if (event.keyCode < 95) {
                    if (event.keyCode < 48 || event.keyCode > 57) {
                        event.preventDefault();
                    }
                }
                else {
                    if (event.keyCode < 96 || event.keyCode > 105) {
                        event.preventDefault();
                    }
                }
            }
        });

        $("#TelefonoEmpresa2").keydown(function (event) {
            if (event.shiftKey) {
                event.preventDefault();
            }

            if (event.keyCode == 46 || event.keyCode == 8) {
            }
            else {
                if (event.keyCode < 95) {
                    if (event.keyCode < 48 || event.keyCode > 57) {
                        event.preventDefault();
                    }
                }
                else {
                    if (event.keyCode < 96 || event.keyCode > 105) {
                        event.preventDefault();
                    }
                }
            }
        });

        $("#TelefonoRepresentante1").keydown(function (event) {
            if (event.shiftKey) {
                event.preventDefault();
            }

            if (event.keyCode == 46 || event.keyCode == 8) {
            }
            else {
                if (event.keyCode < 95) {
                    if (event.keyCode < 48 || event.keyCode > 57) {
                        event.preventDefault();
                    }
                }
                else {
                    if (event.keyCode < 96 || event.keyCode > 105) {
                        event.preventDefault();
                    }
                }
            }
        });

        $("#TelefonoRepresentante2").keydown(function (event) {
            if (event.shiftKey) {
                event.preventDefault();
            }

            if (event.keyCode == 46 || event.keyCode == 8) {
            }
            else {
                if (event.keyCode < 95) {
                    if (event.keyCode < 48 || event.keyCode > 57) {
                        event.preventDefault();
                    }
                }
                else {
                    if (event.keyCode < 96 || event.keyCode > 105) {
                        event.preventDefault();
                    }
                }
            }
        });

        //$("#eMail").attr("value").match("/^[a-zA-Z0-9\._-]+@[a-zA-Z0-9-]{2,}[.][a-zA-Z]{2,4}$/;");

        document.getElementById("IdTipoDocumento").disabled = true;
        
        $("#agregarprov").hide();
        $("#agregarprovmodif").hide();

        $("#guardarordencompra").hide();
        $("#ProvSelect").hide();

        $("#fechap").css("display", "none");
        $("#RUC").hide();
        $("#SiglaComercial").hide();
        $("#RazSocial").hide();

        $("#DiaFecAct").hide();
        $("#MesFecAct").hide();
        $("#AnoFecAct").hide();
        $("#Edad").val(0);
        $("#Edad").hide();
        $("#Depart").hide();
        $("#Prov").hide();
        $("#Dist").hide();
        $("#ValCCI").hide();
        $("#ValBacTelewiese ").hide();
        $("#ValTipoDocu ").hide();
        $("#CantCarTipoDoc ").hide();
        $("#ExistProveedor ").hide();

        $("#BuscarReq ").hide();
        $("#BuscarProv ").hide();


        //$("#idordencompra").hide();
        //$("#razonsocial").hide();
        $("#Bien").hide();
        $("#Servicio").hide();
        $("#Honorario").hide();
        $("#Contrato").hide();
        $("#FlagPagoPorTurno").hide();
        $("#dias_habiles").hide();
        $("#id_orden").hide();
        $("#id_requerimiento").hide();
        $("#agregarcompraoservicio").hide();
        $("#agregarbienservicio").hide();
        $("#modificarcompraoservicio").hide();
        $("#dias_habilesmodif").hide();
        $("#forma_pago").hide();
        $("#tipo_doc").hide();
        $("#proveedor").hide();
        $("#Tipo_cambio").hide();
        $("#Tipo_Cambiomodif").hide();
        $("#Nro_filas").hide();

        $("#idimpuesto").hide();
        $("#valor_venta").hide();
        $("#valor_ventaXCien").hide();

        $("#buscar_ordendetalle").hide();
        $("#CodCentroCostDet").hide();
        $("#NumItemOrdenCompDet").hide();
        $("#CodTransacDet").hide();
        $("#PartidapresuDet").hide();
        $("#Estado").hide();
        $("#Guia").hide();

        $("#ValGuiaxOrden").hide();

        $("#FechaOrdCompModif").hide();
        $("#ValVtaModif").hide();
        $("#ImpustModif").hide();
        $("#TasaModif").hide();
        $("#CantTotalModif").hide();

        $("#CstItemModif").hide();
        $("#CantModif").hide();
        $("#NumItemOrden").hide();

        $("#fechaTipoCambSelect").hide();
        $("#fechaactualTC").hide();

        $("#IdNumeroCuenta").hide();

        $("#idanno").hide();
        $("#idmes").hide();
        $("#dia").hide();
        $("#columnsOrdenDescrip").hide();
        $("#IdGuia").hide();
        $("#CertificacionOrden").hide();

        $("#Meses").hide();
        $("#Annos").hide();

        $("#Locador").hide();
        $("#Locador").val("N");

        $("#TipoServicio").hide();

        $("#TipoDoc").hide();

        $("#Val_Locador").hide();

        $("#FechaFinRNP").hide();
        $("#FechaActualxRNP").hide();
        $("#FechaRNP").hide();
        $("#LocadorxRNP").hide();

        $("#lblTipoCambio").hide();
        $("#Tipo_Cambio").hide();
        $("#lblTipoCambioM").hide();
        $("#Tipo_CambioM").hide();

        $("#valcantidad").hide();

        $("#MensajeCabecera").hide();
        $("#MensajeDetalle").hide();

        $("#IdRequerimiento").hide();

        $("#FechaActual").hide();
        $("#FechaActualM").hide();
        $("#FechaGuardada").hide();

        $("#buscar").hide();

        $("#AdicNewOrdenCompra").hide();
        $("#ModifNewOrdenCompra").hide();

        $("#VerifEnter").hide();

        $("#tabla_reqSinRnp").hide();
        $("#tabla_detreqSinRnp").hide();
        $("#tabla_ocreqSinRnp").hide();

        $("#EnviarTodos").hide();
        $("#QuitarTodos").hide();

        $("#Requerimiento").hide();

        $("#NroFilas").hide();
        $("#FlagEvaluado").hide();
        $("#NroOrden").hide();

        $("#Consulta_Documentos").hide();

        $("#ValSinRNP").hide();
        $("#ValGuardado").hide();
        $("#ConfirGuardado").hide();


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

        listar_orden();

        $("#FechaTipoCamb").val(fechaactual);
        $("#RnpBienFechaIni").val(fechaactual);
        //$("#RnpBienFechaFin").val(fechaactual);
        $("#RnpServicioFechaIni").val(fechaactual);
        //$("#RnpServicioFechaFin").val(fechaactual);
        $("#RnpConsultoriaFechaIni").val(fechaactual);
        //$("#RnpConsultoriaFechaFin").val(fechaactual);
        $("#FecNac").val(fechaactual);
        

        //Para elegir FechaTipoCamb
        $("#FechaTipoCamb").datepicker({
            format: "dd/mm/yyyy",
            todayHighlight: true,
            autoclose: true,
        });
              
        //RNP_Bienes Inicio
        $("#RnpBienFechaIni").datepicker({
            format: "dd/mm/yyyy",
            todayHighlight: true,
            autoclose: true
        });

        $("#RnpBienFechaIni").change(function () {
            var FechaRnpFechaInicio = $("#RnpBienFechaIni").val();
            var AnnoFechaInicioRnp = FechaRnpFechaInicio.substring(6, 10);

            var DiaMesFechaInicioRnp = FechaRnpFechaInicio.substring(0, 6);
            var SumarAnnoFechaInicioRnp = parseFloat(AnnoFechaInicioRnp) + 1

            var FechaFinRnp = DiaMesFechaInicioRnp + SumarAnnoFechaInicioRnp

            $("#RnpBienFechaFin").val(FechaFinRnp);

            $("#RnpServicioFechaFin").val("");
            $("#RnpConsultoriaFechaFin").val("");
        });

        //RNP_Bienes Fin
        //$("#RnpBienFechaFin").datepicker({
        //    format: "dd/mm/yyyy",
        //    todayHighlight: true,
        //    autoclose: true
        //});

        //RNP_Servicio Inicio
        $("#RnpServicioFechaIni").datepicker({
            format: "dd/mm/yyyy",
            todayHighlight: true,
            autoclose: true
        });

        $("#RnpServicioFechaIni").change(function () {
            var FechaRnpFechaInicio = $("#RnpServicioFechaIni").val();
            var AnnoFechaInicioRnp = FechaRnpFechaInicio.substring(6, 10);

            var DiaMesFechaInicioRnp = FechaRnpFechaInicio.substring(0, 6);
            var SumarAnnoFechaInicioRnp = parseFloat(AnnoFechaInicioRnp) + 1

            var FechaFinRnp = DiaMesFechaInicioRnp + SumarAnnoFechaInicioRnp

            $("#RnpServicioFechaFin").val(FechaFinRnp);

            $("#RnpBienFechaFin").val("");
            $("#RnpConsultoriaFechaFin").val("");
        });

        //RNP_Servicio Fin
        //$("#RnpServicioFechaFin").datepicker({
        //    format: "dd/mm/yyyy",
        //    todayHighlight: true,
        //    autoclose: true
        //});

        //RNP_Consult Inicio
        $("#RnpConsultoriaFechaIni").datepicker({
            format: "dd/mm/yyyy",
            todayHighlight: true,
            autoclose: true
        });

        $("#RnpConsultoriaFechaIni").change(function () {
            var FechaRnpFechaInicio = $("#RnpConsultoriaFechaIni").val();
            var AnnoFechaInicioRnp = FechaRnpFechaInicio.substring(6, 10);

            var DiaMesFechaInicioRnp = FechaRnpFechaInicio.substring(0, 6);
            var SumarAnnoFechaInicioRnp = parseFloat(AnnoFechaInicioRnp) + 1

            var FechaFinRnp = DiaMesFechaInicioRnp + SumarAnnoFechaInicioRnp

            $("#RnpConsultoriaFechaFin").val(FechaFinRnp);

            $("#RnpBienFechaFin").val("");
            $("#RnpServicioFechaFin").val("");
        });

        //RNP_Consult Fin
        //$("#RnpConsultoriaFechaFin").datepicker({
        //    format: "dd/mm/yyyy",
        //    todayHighlight: true,
        //    autoclose: true
        //});

        //Fecha Nacimiento
        $("#FecNac").datepicker({
            format: "dd/mm/yyyy",
            todayHighlight: true,
            autoclose: true
        });
        
        $("#FecNac").change(function () {
            validar_FechaNacimiento()
        });

        $('.btn-anular').click(function (e) {
            //req = $("#buscar_orden").val();

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/anularOrdenCabecera',
                data: '{"CodOrdenComp": "' + $("#id_orden").val() + '","CodRequer": "' + $("#id_requerimiento").val() + '","Usuario": "' + $("#IdUsuario").val() + '","CompraServicio": "C","Idanno": "' + $("#idanno").val() + '","CodCentroCostDet": "' + $("#CodCentroCostDet").val() + '","CodTransacDet": "' + $("#CodTransacDet").val() + '","Insertar": "E","IdAnno": "' + $("#idanno").val() + '","IdMes": "' + $("#idmes").val() + '","Dia": "' + $("#dia").val() + '","UsuarioDeta": "' + $("#IdUsuario").val() + '","empresa": "' + $("#id_empresa").val() + '" }',
                dataType: "json",
                success: function (response) {
                    alert("Orden de Compra anulada");
                    $("#body_orden2").html('');

                    //ActualizarSaldoCantidadyCostoRequerimientoEliminar();

                    $("#buscar_orden").val("");
                    listar_orden();
                    
                    //limpiarAnulacOrden();
                    $("#cerrar").click();
                    $("#modificar").hide();
                    $("#eliminar").hide();
                    $("#imprimir").hide();
                },
                    error: function (a, b, c) {
                    alert(a.responseText);
                }
            });
        });

        $('.btn-print').click(function (e) {

            if ($("#IdOrden1").val() == "" && $("#IdOrden2").val() == "") {

                if ($('input[name="usuario"]').is(':checked')) {
                    var TipoOrden = "USUARIO";
                    $("#txt_tipooc").val(TipoOrden);
                    imprimir_pdf();
                    $("#cancelarprint").click();
                }
                else if ($('input[name="logistica"]').is(':checked')) {
                    var TipoOrden = "LOGISTICA";
                    $("#txt_tipooc").val(TipoOrden);
                    imprimir_pdf();
                    $("#cancelarprint").click();
                }
                else if ($('input[name="contabilidad"]').is(':checked')) {
                    var TipoOrden = "CONTABILIDAD";
                    $("#txt_tipooc").val(TipoOrden);
                    imprimir_pdf();
                    $("#cancelarprint").click();
                }
                else if ($('input[name="todos"]').is(':checked')) {
                    var TipoOrden = "";
                    $("#txt_tipooc").val(TipoOrden);
                    imprimir_pdf();
                    $("#cancelarprint").click();
                }
                else { alert("Listo para imprimir"); }
            }
            else if ($("#IdOrden1").val() != "" && $("#IdOrden2").val() != "") {

                if ($('input[name="usuario"]').is(':checked')) {
                    var TipoOrden = "USUARIO";
                    $("#txt_tipoos").val(TipoOrden);
                    $("#txt_idorden1").val($("#IdOrden1").val());
                    $("#txt_idorden2").val($("#IdOrden2").val());
                    imprimir_pdfMasiva();
                    $("#cancelarprint").click();
                }
                else if ($('input[name="logistica"]').is(':checked')) {
                    var TipoOrden = "LOGISTICA";
                    $("#txt_tipoos").val(TipoOrden);
                    $("#txt_idorden1").val($("#IdOrden1").val());
                    $("#txt_idorden2").val($("#IdOrden2").val());
                    imprimir_pdfMasiva();
                    $("#cancelarprint").click();
                }
                else if ($('input[name="contabilidad"]').is(':checked')) {
                    var TipoOrden = "CONTABILIDAD";
                    $("#txt_tipoos").val(TipoOrden);
                    $("#txt_idorden1").val($("#IdOrden1").val());
                    $("#txt_idorden2").val($("#IdOrden2").val());
                    imprimir_pdfMasiva();
                    $("#cancelarprint").click();
                }
                else if ($('input[name="todos"]').is(':checked')) {
                    var TipoOrden = "";
                    $("#txt_tipoos").val(TipoOrden);
                    $("#txt_idorden1").val($("#IdOrden1").val());
                    $("#txt_idorden2").val($("#IdOrden2").val());
                    imprimir_pdfMasiva();
                    $("#cancelarprint").click();
                }
                else { alert("Listo para imprimir"); }

            }
        });

        $('.btn-ok').click(function (e) {
            //req = $("#buscar_orden").val();

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/reemplazarOrdenAnulxAct',
                data: '{"IdOrdenCompraAnulada": "' + $("#IdOrdenCompraAnulada").val() + '","IdOrdenCompraActual": "' + $("#IdOrdenCompraActual").val() + '","CompraServicio": "C","empresa": "' + $("#id_empresa").val() + '" }',
                dataType: "json",
                success: function (response) {
                    alert("Se reemplazo la Orden Correctamente");

                    $("#CerrarReemplazo").click();
                    $("#modificar").hide();
                    $("#eliminar").hide();
                    $("#imprimir").hide();

                    listar_orden();

                },
                error: function (a, b, c) {
                    alert(a.responseText);
                }
            });
        });

        $("#todos").prop('checked', true);
        //document.getElementById("todos").disabled = true;

        $("#usuario").click(function () {
            $("#logistica").prop('checked', false);
            $("#contabilidad").prop('checked', false);
            $("#todos").prop('checked', false);
        });

        $("#logistica").click(function () {
            $("#usuario").prop('checked', false);
            $("#contabilidad").prop('checked', false);
            $("#todos").prop('checked', false);
        });

        $("#contabilidad").click(function () {
            $("#usuario").prop('checked', false);
            $("#logistica").prop('checked', false);
            $("#todos").prop('checked', false);
        });

        $("#todos").click(function () {
            $("#usuario").prop('checked', false);
            $("#logistica").prop('checked', false);
            $("#contabilidad").prop('checked', false);
        });
               
        //Llenado Combo Forma Pago
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/listarFormaPago',
            data: '{"empresa": "' + $("#id_empresa").val() + '"}',
            dataType: "json",
            success: function (response) {
                var customers = eval(response.d);
                var html = "<option value='S' ></option>";

                $.each(customers, function () {
                    
                    if (this.IdFormaPago == '01')
                        tipopag = "selected";
                    else
                        tipopag = "";
                

                    html += "<option " + tipopag + " value='" + this.IdFormaPago + "'  >" + this.DescripFormaPago + "</option>";

                });
                    $("#IdFormaPago").html(html == "" ? "" : html);
            },
                error: function (a, b, c) {
                    alert(a.responseText);
                }
        });

        //Llenado Combo Tipo Documento
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/listarTipoDoc',
            data: '{"empresa": "' + $("#id_empresa").val() + '"}',
            dataType: "json",
            success: function (response) {
                var customers = eval(response.d);
                var html = "<option value='S' selected></option>";

                $.each(customers, function () {

                    if (this.IdTipoDocumento == '001')
                        tipodoc = "selected";
                    else
                        tipodoc = "";


                    html += "<option " + tipodoc + " value='" + this.IdTipoDocumento + "'  >" + this.Descripcion + "</option>";
                    
                });
                $("#IdTipoDocumento").html(html == "" ? "" : html);

            },
                error: function (a, b, c) {
                    alert(a.responseText);
                }
        });

        $("#IdTipoDocumento").click(function () {
            $("#TipoDoc").val($("#IdTipoDocumento").val());
            $("#TipoProveedor").val($('#Proveedor').val());
        });
        
        $("#PlazoEntrega").val("");

        $("#PlazoEntrega").click(function () {
            $("#PlazoEntrega").select();
        });

        $("#PlazoEntregamodif").click(function () {
            $("#PlazoEntregamodif").select();
        });

        $("#diashabiles").prop('checked', true);
        $("#dias_habiles").val("S")

        $("#diashabiles").click(function () {
            if ($("#diashabiles").is(":checked")) {
                $("#dias_habiles").val("S")
            } else {
                $("#dias_habiles").val("N")
            }
        });

        $("#diashabilesmodif").click(function () {
            if ($("#diashabilesmodif").is(":checked")) {
                $("#dias_habilesmodif").val("S")
            } else {
                $("#dias_habilesmodif").val("N")
            }
        });

        //Llenado Combo Moneda
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/monedas',
            data: '{"empresa": "' + $("#id_empresa").val() + '"}',
            dataType: "json",
            success: function (response) {
                var customers = eval(response.d);
                var html = "<option value='S' selected></option>";

                $.each(customers, function () {

                    if (this.IdTipoMoneda == 'S')
                        tipomon = "selected";
                    else
                        tipomon = "";

                    //<td> " + this.Estado + "</td>
                    html += "<option " + tipomon + " value='" + this.IdTipoMoneda + "'  >" + this.DescripTipoMoneda + "</option>";

                });
                $("#Moneda").html(html == "" ? "" : html);
                $("#Monedamodif").html(html == "" ? "" : html);
            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });

        //Llenado Combo Proveedores
        //$.ajax({
        //    type: "POST",
        //    contentType: "application/json; charset=utf-8",
        //    url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/listarProveedores',
        //    data: '{"empresa": "' + $("#id_empresa").val() + '"}',
        //    dataType: "json",
        //    success: function (response) {
        //        var customers = eval(response.d);
        //        var html = "<option value='P' selected></option>";

        //        $.each(customers, function () {

        //            //<td> " + this.Estado + "</td>
        //            html += "<option value='" + this.idproveedor + "'  >" + this.Razonsocial + "</option>";
                    
        //        });
        //        $("#Proveedor").html(html == "" ? "" : html);

        //    },
        //    error: function (a, b, c) {
        //        alert(a.responseText);
        //    }
        //});

        //Filtrado Proveedores - Select2
        $("#Proveedor").select2();


        $("#Proveedor").change(function () {
            $("#TipoDoc").val($("#IdTipoDocumento").val());

            ExtraerFechaFinRNP();

        });

        $("#ApPaterno").on("keyup", function () {
            $("#CantCarTipoDoc").val($("#Dni").val().length);
            validarCtCrIgTipoDoc();

            var razon_social = $("#ApPaterno").val();
            $("#RazonSocial").val(razon_social);
            $("#RazSocial").val(razon_social);
        });

        $("#ApMaterno").on("keyup", function () {
            var razon_social = $("#ApPaterno").val() +' '+ $("#ApMaterno").val();
            $("#RazonSocial").val(razon_social);
            $("#RazSocial").val(razon_social);
        });

        $("#Nombres").on("keyup", function () {
            var razon_social = $("#ApPaterno").val() + ' ' + $("#ApMaterno").val() + ' ' + $("#Nombres").val();
            $("#RazonSocial").val(razon_social);
            $("#RazSocial").val(razon_social);
        });

        //Llenado Combo Prov Tipo Documento
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/listarProv_TipoDocumento',
            data: '{"empresa": "' + $("#id_empresa").val() + '"}',
            dataType: "json",
            success: function (response) {
                var customers = eval(response.d);
                var html = "<option value='S' selected> Seleccionar </option>";
                        
                $.each(customers, function () {

                    if (this.IdTipoDocumento == '001')
                        provtipodoc = "selected";
                    else
                        provtipodoc = "";
                    
                    //<td> " + this.Estado + "</td>
                    html += "<option " + provtipodoc + " value='" + this.IdTipoDocumento + "'  >" + this.Descripcion + "</option>";

                });
                $("#IdTipoDocumentoIdentidad").html(html == "" ? "" : html);
            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });

        $("#IdTipoDocumentoIdentidad").change(function () {
            ValidacionRUC();
            $("#ValTipoDocu").val($("#IdTipoDocumentoIdentidad").val());
        });

        //Llenado Combo Prov Banco Telewiese
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/listarProv_BancoTelewiese',
            data: '{"empresa": "' + $("#id_empresa").val() + '"}',
            dataType: "json",
            success: function (response) {
                var customers = eval(response.d);
                var html = "<option value='I' selected></option>";

                $.each(customers, function () {

                    //<td> " + this.Estado + "</td>
                    html += "<option value='" + this.IdBanco + "'  >" + this.Descripcion + "</option>";

                });
                $("#IdBancoProv").html(html == "" ? "" : html);
            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });

        //Filtrado Prov Banco Telewiese - Select2
        $("#IdBancoProv").select2();


        //Llenado Combo Prov Forma de Pago
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/listarProv_FormaPago',
            data: '{"empresa": "' + $("#id_empresa").val() + '"}',
            dataType: "json",
            success: function (response) {
                var customers = eval(response.d);
                var html = "<option value='S' selected></option>";

                $.each(customers, function () {

                    if (this.IdFormaPago == '18')
                        provFormaPago = "selected";
                    else
                        provFormaPago = "";

                    //<td> " + this.Estado + "</td>
                    html += "<option " + provFormaPago + " value='" + this.IdFormaPago + "'  >" + this.descripcion + "</option>";

                });
                    $("#FormaPago").html(html == "" ? "" : html);
            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });

        //Llenado Combo Prov Clasificacion
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/listarProv_Clasificacion',
            data: '{"empresa": "' + $("#id_empresa").val() + '"}',
            dataType: "json",
            success: function (response) {
                var customers = eval(response.d);
                var html = "<option value='S' selected></option>";

                $.each(customers, function () {

                    if (this.IdClasificacionNegocio == '00')
                        provClasificacion = "selected";
                    else
                        provClasificacion = "";

                    //<td> " + this.Estado + "</td>
                    html += "<option " + provClasificacion + " value='" + this.IdClasificacionNegocio + "'  >" + this.descripcion + "</option>";

                });
                $("#Clasificacion").html(html == "" ? "" : html);
            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });
        
        //Llenado Combo Prov Tipo Actividad
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/listarProv_TipoActividad',
            data: '{"empresa": "' + $("#id_empresa").val() + '"}',
            dataType: "json",
            success: function (response) {
                var customers = eval(response.d);
                var html = "<option value='S' selected></option>";

                $.each(customers, function () {

                    if (this.IdTipoActividad == '02')
                        provTipoAct = "selected";
                    else
                        provTipoAct = "";

                    //<td> " + this.Estado + "</td>
                    html += "<option " + provTipoAct + " value='" + this.IdTipoActividad + "'  >" + this.descripcion + "</option>";

                });
                $("#TipoActividad").html(html == "" ? "" : html);
            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });

        //Llenado Combo Prov Departamento
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/listarProv_Departamento',
            data: '{"empresa": "' + $("#id_empresa").val() + '"}',
            dataType: "json",
            success: function (response) {
                var customers = eval(response.d);
                var html = "<option value='E' selected></option>";

                $.each(customers, function () {

                    //<td> " + this.Estado + "</td>
                    html += "<option value='" + this.IdDepartamento + "'  >" + this.Descrip + "</option>";

                });
                $("#Departamento").html(html == "" ? "" : html);
            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });
        
        $("#DiaFecAct").val(('0' + f.getDate()).slice(-2).toString());
        $("#MesFecAct").val(('0' + (f.getMonth() + 1)).slice(-2).toString());
        $("#AnoFecAct").val(f.getFullYear().toString());

        //Tipo Cambio
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/tipocambio',
            //data: '{"fechaactual": "19/03/2016" }',
            data: '{"fechaactual": "' + $("#FechaTipoCamb").val() + '","empresa": "' + $("#id_empresa").val() + '" }',
            dataType: "json",
            success: function (response) {
                var customers = eval(response.d);
                
                $.each(customers, function () {

                    $("#TipoCambio").val(this.CompraBCR)
                    $("#Tipo_cambio").val(this.CompraBCR)
                });

            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });

        $("#FechaTipoCamb").change(function () {
            $("#fechaTipoCambSelect").val($("#FechaTipoCamb").val());
            $("#fechaactualTC").val(fechaactual);
            
            tipo_cambio();

            fechaSelect();
        });

        $("#FechaTipoCambModif").change(function () {
            $("#fechaTipoCambSelect").val($("#FechaTipoCambModif").val());
            $("#fechaactualTC").val(fechaactual);

            tipo_cambioModif();
            fechaSelectM();
        });

        $("#Direccion").click(function () {
            siglas();
        });


        //Filtrado Prov Departamento - Select2
        $("#Departamento").select2();

        //Filtrado Prov Departamento - Select2
        $("#Provincia").select2();

        //Filtrado Prov Distrito - Select2
        $("#Distrito").select2();

        //CCI / Banco Telewise
        document.getElementById("CCI").disabled = true;
        document.getElementById("IdBancoProv").disabled = true;
                     
        $("#sincci").prop('checked', true);
        $("#ValCCI").val("");

        $("#sincci").click(function () {
            $("#CCI").val("");
            $("#IdBancoProv").val("");
            document.getElementById("CCI").disabled = true;
            document.getElementById("IdBancoProv").disabled = true;
            $("#concci").prop('checked', false);
            $("#ValCCI").val("SinCCI");
        });

        $("#concci").click(function () {
            document.getElementById("CCI").disabled = false;
            document.getElementById("IdBancoProv").disabled = false;
            $("#CCI").focus();
            $("#sincci").prop('checked', false);
            $("#ValCCI").val("ConCCI");
        });

        //Cuenta Bancario
        $("#idnrocuenta").val("14");
        $("#scotiabank").prop('checked', true);
        $("#IdNumeroCuenta").val("14");
        //$("#IdNumeroCuenta").hide();

        $("#cuentabanc").val("Escriba cuenta bancaria");

        $("#cuentabanc").click(function () {
            $("#cuentabanc").select();
        });
        
        $("#scotiabank").click(function () {
            $("#IdNumeroCuenta").val("14");
            //$("#cuentabanc").val("Escriba cuenta bancaria");
            //$("#cuentabanc").select();
            $("#otrosbancos").prop('checked', false);
            $("#CtaBancaria").focus();
        });

        $("#otrosbancos").click(function () {
            $("#IdNumeroCuenta").val("");
            //$("#cuentabanc").val("Escriba cuenta bancaria");
            //$("#cuentabanc").select();
            $("#scotiabank").prop('checked', false);
            $("#CtaBancaria").focus();
        });
            
        //Tipo proveedor
        $("#Bien").val("N");
        $("#Servicio").val("N");
        $("#Honorario").val("N");
        $("#Contrato").val("N");
        $("#FlagPagoPorTurno").val("N");
        
        $("#bien").click(function () {
            $("#Bien").val("S");
            $("#Servicio").val("N");
            $("#Honorario").val("N");
            $("#Contrato").val("N");
            $("#FlagPagoPorTurno").val("N");
            $("#servicio").prop('checked', false);
            $("#honorario").prop('checked', false);
            $("#contrato").prop('checked', false);
            $("#pagoturno").prop('checked', false);
        });

        $("#servicio").click(function () {
            $("#Bien").val("N");
            $("#Servicio").val("S");
            $("#Honorario").val("N");
            $("#Contrato").val("N");
            $("#FlagPagoPorTurno").val("N");
            $("#bien").prop('checked', false);
            $("#honorario").prop('checked', false);
            $("#contrato").prop('checked', false);
            $("#pagoturno").prop('checked', false);
        });

        $("#honorario").click(function () {
            $("#Bien").val("N");
            $("#Servicio").val("N");
            $("#Honorario").val("S");
            $("#Contrato").val("N");
            $("#FlagPagoPorTurno").val("N");
            $("#bien").prop('checked', false);
            $("#servicio").prop('checked', false);
            $("#contrato").prop('checked', false);
            $("#pagoturno").prop('checked', false);
        });

        $("#contrato").click(function () {
            $("#Bien").val("N");
            $("#Servicio").val("N");
            $("#Honorario").val("N");
            $("#Contrato").val("S");
            $("#FlagPagoPorTurno").val("N");
            $("#bien").prop('checked', false);
            $("#servicio").prop('checked', false);
            $("#honorario").prop('checked', false);
            $("#pagoturno").prop('checked', false);
        });

        $("#pagoturno").click(function () {
            $("#Bien").val("N");
            $("#Servicio").val("N");
            $("#Honorario").val("N");
            $("#Contrato").val("N");
            $("#FlagPagoPorTurno").val("S");
            $("#bien").prop('checked', false);
            $("#servicio").prop('checked', false);
            $("#honorario").prop('checked', false);
            $("#contrato").prop('checked', false);
    });

    //document.getElementById("search_ocreq_modif").disabled = true;
    //document.getElementById("search_detreq_modif").disabled = true;
    //document.getElementById("search_ocartreq_modif").disabled = true;


    $("#Anno").change(function () {
        listar_orden();
    });

    $("#Mes").change(function () {
        $("#buscar_orden").val("");

        listar_orden();
    });


    $("#prov_locador").click(function () {
        if ($("#prov_locador").is(":checked")) {
            $("#Val_Locador").val("S")
        } else {
            $("#Val_Locador").val("N")
        }
    });

    $("#Val_Locador").val("N")

    //listar_requerimiento();
    
    $("#buscar_orden").on("keyup", function () {
        var buscarprov = $("#buscar_orden").val().length;

        if (buscarprov >= 4) {
            $("#buscar").show();
        }
        else {
            $("#buscar").hide();
        }
    });

    $("#OrdenEliminada").change(function () {
        $("#IdOrdenCompraAnulada").val($("#OrdenEliminada").val());
    });

    $("#OrdenActual").change(function () {
        $("#IdOrdenCompraActual").val($("#OrdenActual").val());
    });

    $("#IdOrdenCompraAnulada").hide();
    $("#IdOrdenCompraActual").hide();

    //Para actualizar Web en un intervalo de tiempo
    var timer = setInterval("ActualizarWeb()", 60000);

    });

    function ConfirmarGuardadoOrden() {
        confirmarAceptacion = confirm("Realmente desea guardar la Orden de Compra");
        if (confirmarAceptacion) {
            GuardandoOrden();
        }
        else {
            //alert("Nada guardara");
        }
    }

    function GuardandoOrden() {
        $('#content').html('<div><img src="../images/loader.gif"/></div>');
                                          
        //if ($("#Requerimiento").val() == "") {
        item_atendidos()
        item_requerimientos()
        item_centroCostos()
        item_bienServicio()
        item_nroItem()
        item_unidadMedida()
        item_costoReq()
        item_saldoResev()
        item_impuesto()
        item_subtotalReq()
        item_partPres()
        item_cosTrans()
        item_ctacont()
        item_codAlmac()
        //}
        sol_cant();
        $("#guardarordencompra").hide();

        var ary = $("#AdicionarOrdendeCompra").serializeArray();
        var obj = {};
        for (var a = 0; a < ary.length; a++)
            obj[ary[a].name] = ary[a].value;

        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/InsertarCabeceraOrdenCompraoServicio',
            data: JSON.stringify(obj),
            dataType: "json",
            success: function (response) {

                Mensaje_Cabecera();
                Mensaje_Detalle();

                //if (response.d == 1) {

                //    //alert($("#MensajeCabecera").val());
                //    ////alert($("#MensajeDetalle").val());

                //    //limpiarOrden();
                //    //$("#ProvSelect").val("P");
                //    //$("#cancelarrordencompra").click();
                //    //DatosOrdenes();
                //    //ActualizarCCyRequerimiento();
                //    //listar_orden();
                //    //ActualizarSaldoCantidadyCostoRequerimiento();
                //}
                //else {
                //    alert("Error");
                //}
            },
            error: function (a) {
                alert(a.responseText);
                $("#results").html(a.responseText);
            }
        });
    }

    function BuscarOrdenesxProveedor() {

        $("#NombreProveedor")

        $("#buscar_orden").val("");
    }

    function ValidarBusqueda() {
        if ($("#search_ocreq").val() == "") {
            $("#BuscarReq").val("");

            listar_requerimiento();
        }
        else {
            $("#BuscarReq").val('%' + $("#search_ocreq").val() + '%');

            listar_requerimiento();
        }
    }

    function ValidarBusquedaProv() {
        if ($("#search_prov").val() == "") {
            $("#BuscarProv").val("");
        }
        else {
            $("#BuscarProv").val('%' + $("#search_prov").val() + '%');
        }
    }

    function ValidarBusquedaProvM() {
        if ($("#Proveedorm").val() == "") {
            $("#BuscarProv").val("");
        }
        else {
            $("#BuscarProv").val('%' + $("#Proveedorm").val() + '%');
        }
    }

    //function ValidarBusquedaProvM() {
    //    if ($("#search_prov").val() == "") {
    //        $("#BuscarProv").val("");
    //    }
    //    else {
    //        $("#BuscarProv").val('%' + $("#search_prov").val() + '%');
    //    }
    //}

    function ValidarBusquedaProvm() {
        if ($("#search_provm").val() == "") {
            $("#BuscarProv").val("");
        }
        else {
            $("#BuscarProv").val('%' + $("#search_provm").val() + '%');
        }
    }

    //Llenado Combo Centro Costos
    function CentroCostoxOrden(IdReq) {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/centrocostosOrdenes',
            data: '{"IdRequerimiento": "' + IdReq + '","BienServicio": "B","empresa": "' + $("#id_empresa").val() + '"}',
            dataType: "json",
            success: function (response) {
                var customers = eval(response.d);
                var html = "<option value='S' selected>Seleccione</option>";

                $.each(customers, function () {

                    html += "<option value='" + this.IdCentroCosto + "'  >" + this.DescripcionCorta + "</option>";

                });

                $("#CentroCost").html(html == "" ? "" : html);

            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });
    }                

    function ValidacionRUC() {
        var CantCarRUC = $("#IdProveedor").val().length
                    
        if (CantCarRUC == 0) {
            alert("Ingrese RUC proveedor.")
            $("#IdProveedor").focus();

            $('#IdTipoDocumentoIdentidad').prop('selectedIndex', 0);
        }
        else if (CantCarRUC < 11) {
            alert("El RUC no puede tener menos de 11 caracteres.")
            $("#IdProveedor").focus();

            $('#IdTipoDocumentoIdentidad').prop('selectedIndex', 0);
        }
        else {
            validar_ExistProveedor();
        }
    }
               
    function validarCtCrIgTipoDoc() {
        if ($("#ValTipoDocu").val() == "01") {
            if ($("#CantCarTipoDoc").val() < 8) {
                alert("Digite nuevamente nro de DNI, tiene menos de 8 digitos");
                $("#Dni").focus();
            }
            else if ($("#CantCarTipoDoc").val() > 8) {
                alert("Digite nuevamente nro de DNI, tiene más de 8 digitos");
                $("#Dni").focus();
            }
            else {
                $("#ValTipoDocu").val("00")
            }
        }
        else if ($("#ValTipoDocu").val() == "04") {
            if ($("#CantCarTipoDoc").val() < 12) {
                alert("Digite nuevamente nro de Carnet de Extranjeria, tiene menos de 12 digitos");
                $("#Dni").focus();
            }
            else if ($("#CantCarTipoDoc").val() > 12) {
                alert("Digite nuevamente nro de Carnet de Extranjeria, tiene más de 12 digitos");
                $("#Dni").focus();
            }
            else {
                $("#ValTipoDocu").val("00")
            }
        }
        else if ($("#ValTipoDocu").val() == "06") {
            if ($("#CantCarTipoDoc").val() < 11) {
                alert("Digite nuevamente nro de RUC, tiene menos de 11 digitos");
                $("#Dni").focus();
            }
            else if ($("#CantCarTipoDoc").val() > 11) {
                alert("Digite nuevamente nro de RUC, tiene más de 11 digitos");
                $("#Dni").focus();
            }
            else {
                $("#ValTipoDocu").val("00")
            }
        }
        else if ($("#ValTipoDocu").val() == "07") {
            if ($("#CantCarTipoDoc").val() < 12) {
                alert("Digite nuevamente nro de Pasaporte, tiene menos de 12 digitos");
                $("#Dni").focus();
            }
            else if ($("#CantCarTipoDoc").val() > 12) {
                alert("Digite nuevamente nro de Pasaporte, tiene más de 12 digitos");
                $("#Dni").focus();
            }
            else {
                $("#ValTipoDocu").val("00")
            }
        }

    }

    function validar_FechaNacimiento() {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/FechaNacProveedor',
            data: '{"FecNac": "' + $("#FecNac").val() + '","DiaFecAct": "' + $("#DiaFecAct").val() + '","MesFecAct": "' + $("#MesFecAct").val() + '","AnoFecAct": "' + $("#AnoFecAct").val() + '","empresa": "' + $("#id_empresa").val() + '" }',
            dataType: "json",
            success: function (response) {
                var customers = eval(response.d);

                $.each(customers, function () {

                    $("#Edad").val(this.Edad)

                });

            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });
    }

    function validar_ExistProveedor() {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/ValExistProv',
            data: '{"IdProveedor": "' + $("#IdProveedor").val() + '","empresa": "' + $("#id_empresa").val() + '" }',
            dataType: "json",
            success: function (response) {
                var customers = eval(response.d);

                $.each(customers, function () {

                    $("#ExistProveedor").val(this.RazSocial)
                                
                    SearchProveedor();
                });

            },   
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });
    }

    function SearchProveedor() {
        var Raz_Social = $("#ExistProveedor").val();
                    
        if (Raz_Social != "NO EXISTE                                                                                                                                                                                                                                                     ") {
            alert("El RUC: " + $("#IdProveedor").val() + " pertenece a " + Raz_Social);
            $("#IdProveedor").select();

            $("#IdTipoDocumentoIdentidad").prop("selectedIndex", 0);
        }
        else if (Raz_Social == "NO EXISTE                                                                                                                                                                                                                                                     ") {
            document.getElementById("Dni").disabled = false;
            $("#Dni").focus();
        }
    }

    function regisprov() {
        $('#agregarProveedor').modal('show');

        //Limpiar Todos los controles del Registrar Proveedor

        $("#OrdenCompraInsertar #cancelarrordencompra").click();

        //$("#cancelarrordencompra").click();

        // alert("Probando")
        // $('#agregarOrden').modal('show');
    }

    function cerrar_regisprov() {
        $('#agregarProveedor').modal('hide');

        //Limpiar Todos los controles del Registrar Proveedor
        
        //$("#OrdenCompraInsertar #cancelarrordencompra").click();
                
        //$('#agregarOrden').modal('open');
     
        //alert("Probando")
        //$('#OrdenCompraInsertar #agregarOrden').modal('show');
        //$('#OrdenCompraInsertar').modal('show');
    }

    function tipo_cambio() {
        var fechaInicial = $("#fechaactualTC").val();
        var fechaFinal = $("#fechaTipoCambSelect").val();

        if (validate_fechaMayorQue(fechaInicial, fechaFinal)) {
            //alert("La fecha " + fechaFinal + " es superior a la fecha " + fechaInicial);
            $("#TipoCambio").val("0.00")
            $("#Tipo_cambio").val("0.00")
        } else {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/tipocambio',
                //data: '{"fechaactual": "19/03/2016" }',
                data: '{"fechaactual": "' + $("#FechaTipoCamb").val() + '","empresa": "' + $("#id_empresa").val() + '" }',
                dataType: "json",
                success: function (response) {
                    var customers = eval(response.d);

                    $.each(customers, function () {

                        $("#TipoCambio").val(this.CompraBCR)
                        $("#Tipo_cambio").val(this.CompraBCR)
                    });

                },
                error: function (a, b, c) {
                    alert(a.responseText);
                }
            });
        }
    }

    function tipo_cambioModif() {
        var fechaInicial = $("#fechaactualTC").val();
        var fechaFinal = $("#fechaTipoCambSelect").val();

        if (validate_fechaMayorQue(fechaInicial, fechaFinal)) {
            //alert("La fecha " + fechaFinal + " es superior a la fecha " + fechaInicial);
            $("#TipoCambiomodif").val("0.00")
            $("#Tipo_Cambiomodif").val("0.00")
        } else {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/tipocambio',
                //data: '{"fechaactual": "19/03/2016" }',
                data: '{"fechaactual": "' + $("#FechaTipoCambModif").val() + '","empresa": "' + $("#id_empresa").val() + '" }',
                dataType: "json",
                success: function (response) {
                    var customers = eval(response.d);

                    $.each(customers, function () {

                        $("#TipoCambiomodif").val(this.CompraBCR)
                        $("#Tipo_Cambiomodif").val(this.CompraBCR)
                    });

                },
                error: function (a, b, c) {
                    alert(a.responseText);
                }
            });
        }
    }

    function validate_fechaMayorQue(fechaInicial, fechaFinal) {
        valuesStart = fechaInicial.split("/");
        valuesEnd = fechaFinal.split("/");

        // Verificamos que la fecha no sea posterior a la actual
        var dateStart = new Date(valuesStart[2], (valuesStart[1] - 1), valuesStart[0]);
        var dateEnd = new Date(valuesEnd[2], (valuesEnd[1] - 1), valuesEnd[0]);
        if (dateStart >= dateEnd) {
            return 0;
        }
        return 1;
    }

    function mayuscula(campo) {
        $(campo).keyup(function () {
            $(this).val($(this).val().toUpperCase());
        });
    }

    function siglas(){
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/siglasprov',
            data: '{"ApPaterno": "' + $("#ApPaterno").val() + '","ApMaterno": "' + $("#ApMaterno").val() + '","Nombres": "' + $("#Nombres").val() + '","empresa": "' + $("#id_empresa").val() + '" }',
            //data: '{"fechaactual": "' + $("#fecha").val() + '" }',
            dataType: "json",
            success: function (response) {
                var customers = eval(response.d);

                $.each(customers, function () {

                    $("#SiglaComercial").val(this.SIGLASPROV)
                });

            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });
    }

    function listar_provincia(){
        //Llenado Combo Prov Provincia
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/listarProv_Provincia',
            data: '{"idDepartamento": "' + $("#Departamento").val() + '","empresa": "' + $("#id_empresa").val() + '"}',
            dataType: "json",
            success: function (response) {
                var customers = eval(response.d);
                var html = "<option value='P' selected></option>";

                $.each(customers, function () {

                    //<td> " + this.Estado + "</td>
                    html += "<option value='" + this.IdProvincia + "'  >" + this.Descrip + "</option>";

                });
                $("#Provincia").html(html == "" ? "" : html);
            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });
    }

    function listar_distrito() {
        //Llenado Combo Prov Distrito
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/listarProv_Distrito',
            data: '{"idDepartamento": "' + $("#Departamento").val() + '","idProvincia": "' + $("#Provincia").val() + '","empresa": "' + $("#id_empresa").val() + '"}',
            dataType: "json",
            success: function (response) {
                var customers = eval(response.d);
                var html = "<option value='D' selected></option>";

                $.each(customers, function () {

                    //<td> " + this.Estado + "</td>
                    html += "<option value='" + this.IdDistrito + "'  >" + this.Descrip + "</option>";

                });
                $("#Distrito").html(html == "" ? "" : html);

                //$("#guardarprov").show();
            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });
    }

    function bien_check(checkbox) {
        if (checkbox.checked) {
            servicio_check.checked = false;
        }
    }

    function servicio_check(checkbox) {
        if (checkbox.checked) {
            bien_check.checked = false;
        }
    }

    function listar_orden() {
        url = document.url;
        $("#body_orden").html("<tr><td colspan=10><div align=center ><img src='../images/loader.gif'></div></td></tr>");
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/listarOrden',
            data: '{"Idanno": "' + $("#Anno").val() + '","IdMes": "' + $("#Mes").val() + '","compraservicio": "C","empresa": "' + $("#id_empresa").val() + '"}',
            dataType: "json",
            success: function (response) {
                var customers = eval(response.d);
                var html = "";
                var xnro = 1;
                $.each(customers, function () {

                    html += "<tr id='fila" + xnro +
                            "'  ondblclick=consultaDocumento() onclick=detalle_orden('" + this.IdOrdenCompra + "','" + this.IdRequerimiento + "','" + xnro + "') style='cursor:pointer'><td style='text-align:center'>"
                            + xnro + " </td><td style='text-align:center' class='IdOrdemComp'>"
                            + this.IdOrdenCompra + " </td><td style='text-align:left' class='IdRequer'> " + this.IdRequerimiento + "</td><td> " + this.DescripCentroCosto + "</td><td>" + this.FechaOrdenCompra + "</td><td>" + this.RazonSocial + "</td><td style='text-align:center' >" + this.Moneda + "</td><td style='text-align:center' >" + this.CostoTotal + "</td><td style='text-align:center'>" + this.IngresoAlmacenDescrip + "</td><td style='text-align:center'>" + this.ProcedePagoDescrip + "</td><td style='text-align:center;display:none'>" + this.EstadoOrden + "</td><td style='text-align:center'>" + this.NroGuia + "</td><td style='text-align:center'>" + this.EstadoDescrip + "</td><td style='text-align:center'>" + this.usuariomaquina + "</td> </tr>";
                    xnro++;
                });                
                $("#body_orden").html(html == "" ? "<tr><td colspan='13'> <div align=center><br>No se encontraron resultados</div></td></tr>" : html);
            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });
    }

    function Blistar_orden() {
        url = document.url;
        $("#body_orden").html("<tr><td colspan=10><div align=center ><img src='../images/loader.gif'></div></td></tr>");
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/BlistarOrden',
            data: '{"BOrden": "' + $("#buscar_orden").val() + '","Idanno": "' + $("#Anno").val() + '","IdMes": "' + $("#Mes").val() + '","compraservicio": "C","empresa": "' + $("#id_empresa").val() + '"}',
            dataType: "json",
            success: function (response) {
                var customers = eval(response.d);
                var html = "";
                var xnro = 1;
                $.each(customers, function () {

                    html += "<tr id='fila" + xnro +
                            "'  onclick=detalle_orden('" + this.IdOrdenCompra + "','" + this.IdRequerimiento + "','" + xnro + "') style='cursor:pointer'><td style='text-align:center'>"
                            + xnro + " </td><td style='text-align:center' class='IdOrdemComp'>"
                            + this.IdOrdenCompra + " </td><td style='text-align:left' class='IdRequer'> " + this.IdRequerimiento + "</td><td> " + this.DescripCentroCosto + "</td><td>" + this.FechaOrdenCompra + "</td><td>" + this.RazonSocial + "</td><td style='text-align:center' >" + this.Moneda + "</td><td style='text-align:center' >" + this.CostoTotal + "</td><td style='text-align:center'>" + this.IngresoAlmacenDescrip + "</td><td style='text-align:center'>" + this.ProcedePagoDescrip + "</td><td style='text-align:center;display:none'>" + this.EstadoOrden + "</td><td style='text-align:center'>" + this.NroGuia + "</td><td style='text-align:center'>" + this.EstadoDescrip + "</td><td style='text-align:center'>" + this.usuariomaquina + "</td> </tr>";
                    xnro++;
                });
                $("#body_orden").html(html == "" ? "<tr><td colspan='13'> <div align=center><br>No se encontraron resultados</div></td></tr>" : html);
            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });
    }

    function detalle_orden(orden, requer, u) {
        $("#IdGuia").val("");
        $('#tabla_orden tr').removeClass('highlighted');
        $("#tabla_orden #fila" + u).addClass('highlighted');

        listar_orden_detalle(orden);                  
                        
        $("#id_orden").val(orden);
        $("#txt_oc").val(orden);
        $("#txt_numOrden").val("");
        $("#id_requerimiento").val(requer);
        $("#nro_orden").html(orden);
        $("#modificarcompraoservicio").val("C");
                                             
        detalleordenescolumns();
        cabeceraanno_modif_ordencompra();
        datos_elimordencompra();
        
    }

    function listar_ordenxProveedor(provord) {
        url = document.url;
        $("#body_CabBProveedores").html("<tr><td colspan=10><div align=center ><img src='../images/loader.gif'></div></td></tr>");
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/listarOrdenxProveedor',
            data: '{"Idanno": "' + $("#Anno").val() + '","compraservicio": "C","IdProveedor": "' + provord + '","empresa": "' + $("#id_empresa").val() + '"}',
            dataType: "json",
            success: function (response) {
                var customers = eval(response.d);
                var html = "";
                var xnro = 1;
                $.each(customers, function () {

                    html += "<tr id='fila" + xnro +
                    "'  onclick=detalle_ordenProv('" + this.IdOrdenCompra + "','" + xnro + "') style='cursor:pointer'><td style='text-align:center'>"
                    + xnro + " </td><td style='text-align:center' class='IdOrdemComp'>"
                    + this.IdOrdenCompra + " </td><td style='text-align:left' class='IdRequer'> " + this.IdRequerimiento + "</td><td> " + this.DescripCentroCosto + "</td><td>" + this.FechaOrdenCompra + "</td><td>" + this.RazonSocial + "</td><td style='text-align:center' >" + this.Moneda + "</td><td style='text-align:center' >" + this.CostoTotal + "</td><td style='text-align:center'>" + this.IngresoAlmacenDescrip + "</td><td style='text-align:center'>" + this.ProcedePagoDescrip + "</td><td style='text-align:center;display:none'>" + this.EstadoOrden + "</td><td style='text-align:center'>" + this.NroActa + "</td><td style='text-align:center'>" + this.EstadoDescrip + "</td><td style='text-align:center'>" + this.usuariomaquina + "</td> </tr>";
                    xnro++;

                });

                $("#body_CabBProveedores").html(html == "" ? "<tr><td colspan='13'> <div align=center><br>No se encontraron resultados</div></td></tr>" : html);
            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });
    }

    function detalle_ordenProv(ordenprov, u) {
        $('#T_CabBProveedores tr').removeClass('highlighted');
        $("#T_CabBProveedores #fila" + u).addClass('highlighted');

        listar_ordenxProveedor_Detalle(ordenprov);
    }

    function listar_ordenxProveedor_Detalle(ordenprov) {
        url = document.url;
        $("#body_DetBProveedores").html("<tr><td colspan=10><div align=center ><img src='../images/loader.gif'></div></td></tr>");
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/listarOrdenDetalle',
            data: '{"IdOrdenCompra": "' + ordenprov + '", "compraservicio": "C","empresa":"' + $("#id_empresa").val() + '"}',
            dataType: "json",
            success: function (response) {
                var customers = eval(response.d);
                var html = "";
                var xnro = 1;
                $.each(customers, function () {

                    html += "<tr id='fila" + xnro +
                            "'  onclick=detalle_ordendetProv('" + xnro + "') style='cursor:pointer'><td style='text-align:center'>"
                            + xnro + " </td><td style='text-align:center' class='NumItemOrdenComp'>"
                            + this.NumeroItemOrdenCompra + " </td><td style='text-align:left'> " + this.IdRequerimiento + "</td><td > " + this.IdCentroCosto + "</td><td>" + this.DesCentroCosto + "</td><td>" + this.Descripcion + "</td><td style='text-align:center' >" + this.ClasificadorGasto + "</td><td style='text-align:center' >" + this.IdProyecto + "</td><td style='text-align:center'>" + this.IdFinalidad + "</td><td style='text-align:center'>" + this.Meta + "</td><td style='text-align:center'>" + this.DescripcionUM + "</td><td style='text-align:center'>" + this.Cantidad + "</td><td style='text-align:center'>" + this.Costo + "</td><td style='text-align:center'>" + this.TotalCosto + "</td><td style='text-align:center'>" + this.DescripcionEstado + "</td> </tr>";
                    xnro++;
                });

                $("#body_DetBProveedores").html(html == "" ? "<tr><td colspan='15'> <div align=center><br>No se encontraron resultados</div></td></tr>" : html);

            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });
    }

    function detalle_ordendetProv(u) {
        $('#T_DetBProveedores tr').removeClass('highlighted');
        $("#T_DetBProveedores #fila" + u).addClass('highlighted');
    }

    function datos_elimordencompra() {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/datoselimordencompra',
            data: '{"IdOrdenCompra": "' + $("#id_orden").val() + '","CompraServicio": "C","empresa": "' + $("#id_empresa").val() + '" }',
            dataType: "json",
            success: function (response) {
                var customers = eval(response.d);

                $.each(customers, function () {

                    $("#NumItemOrdenCompDet").val(this.NumeroItemOrdenCompra)
                    $("#PartidapresuDet").val(this.PartidaPresupuestal)
                    $("#CodTransacDet").val(this.IdTransaccion)
                    $("#CodCentroCostDet").val(this.IdCentroCosto)
                    $("#Estado").val(this.Estado)
                    $("#Guia").val(this.ActaConformidadOGuia)

                    //EstadoBotones();
                    
                    if ($("#Estado").val() == "A") {
                        if ($("#Guia").val() == "SinGuia      ") {
                            $("#modificar").show();
                            $("#eliminar").show();
                            $("#imprimir").show();
                        }
                        else if ($("#Guia").val() != "SinGuia      ") {
                            $("#modificar").hide();
                            $("#eliminar").hide();
                            $("#imprimir").show();
                        }
                    }
                    else if ($("#Estado").val() == "D") {
                        if ($("#Guia").val() == "SinGuia      ") {
                            $("#modificar").hide();
                            $("#eliminar").hide();
                            $("#imprimir").show();
                        }
                        else if ($("#Guia").val() != "SinGuia      ") {
                            $("#modificar").hide();
                            $("#eliminar").hide();
                            $("#imprimir").show();
                        }
                    }

                });

            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });
    }

    function EstadoBotones() {
        var EstadoOrden = $("#Estado").val()
        var IdGuia = $("#IdGuia").val()
        //alert(IdGuia);

        if (EstadoOrden == "A" & IdGuia == "") {
            $("#modificar").show();
            $("#eliminar").show();
            $("#imprimir").show();
        }
        else if (EstadoOrden == "A" & IdGuia != "") {
            $("#modificar").hide();
            $("#eliminar").hide();
            $("#imprimir").show();
        }
        else if (EstadoOrden == "D" & IdGuia == "") {
            $("#modificar").hide();
            $("#eliminar").hide();
            $("#imprimir").show();
        }
        else if (EstadoOrden == "D" & IdGuia != "") {
            $("#modificar").hide();
            $("#eliminar").hide();
            $("#imprimir").show();
        }
    }

    function listar_orden_detalle(orden) {
        //url = document.url;
        $("#body_orden2").html("<tr><td colspan=10><div align=center ><img src='../images/loader.gif'></div></td></tr>");
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/listarOrdenDetalle',
            //data: '{"IdOrdenCompra": "' + $("#IdOrdenCompra").val() + '", "compraservicio": "C","empresa":"' + $("#id_empresa").val() + '"}',
            data: '{"IdOrdenCompra": "' + orden + '", "compraservicio": "C","empresa":"' + $("#id_empresa").val() + '"}',
            dataType: "json",
            success: function (response) {
                var customers = eval(response.d);
                var html = "";
                var xnro = 1;
                $.each(customers, function () {
                                                        
                    html += "<tr id='fila" + xnro +
                            "'  onclick=detalle_ordendet('" + this.NumeroItemOrdenCompra + "','" + xnro + "') style='cursor:pointer'><td style='text-align:center'>"
                            + xnro + " </td><td style='text-align:center' class='NumItemOrdenComp'>"
                            + this.NumeroItemOrdenCompra + " </td><td style='text-align:left'> " + this.IdRequerimiento + "</td><td > " + this.IdCentroCosto + "</td><td>" + this.DesCentroCosto + "</td><td>" + this.Descripcion + "</td><td style='text-align:center' >" + this.ClasificadorGasto + "</td><td style='text-align:center' >" + this.IdProyecto + "</td><td style='text-align:center'>" + this.IdFinalidad + "</td><td style='text-align:center'>" + this.Meta + "</td><td style='text-align:center'>" + this.DescripcionUM + "</td><td style='text-align:center'>" + this.Cantidad + "</td><td style='text-align:center'>" + this.Costo + "</td><td style='text-align:center'>" + this.TotalCosto + "</td><td style='text-align:center'>" + this.DescripcionEstado + "</td> </tr>";
                    xnro++;
                });

                $("#body_orden2").html(html == "" ? "<tr><td colspan='15'> <div align=center><br>No se encontraron resultados</div></td></tr>" : html);

                //CodOrdenComp = $("#detalle_ordendet").val();
                $("#CodOrdenComp").val(this.IdOrdenCompra);

            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });
    }

    function detalle_ordendet(u) {
        $('#tabla_orden2 tr').removeClass('highlighted');
        $("#tabla_orden2 #fila" + u).addClass('highlighted');
    }

    function listar_adicionar_requerimiento() {
        url = document.url;
        $("#tbody_req").html("<tr><td colspan=10><div align=center ><img src='../images/loader.gif'></div></td></tr>");
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/listarAdicionarRequerimiento',
            data: '{"BienServicio": "B","empresa":"' + $("#id_empresa").val() + '"}',
            dataType: "json",
            success: function (response) {
                var customers = eval(response.d);
                var html = "";
                var xnro = 1;
                $.each(customers, function () {

                    html += "<tr id='fila" + xnro +
                            "'  onclick=detalle_adicionarrequerimiento('" + this.IdRequerimiento + "','" + xnro + "') style='cursor:pointer'><td style='text-align:center'>"
                            + xnro + " </td><td style='text-align:center'>"
                            + this.IdRequerimiento + " </td><td style='text-align:left'> " + this.Descripcion + "</td><td > " +
                            this.FechaRequerimiento + "</td><td>" + this.DescripcionCorta + "</td><td>" + this.SaldoSubTotal + "</td> </tr>";
                    xnro++;
                });

                $("#tbody_req").html(html == "" ? "<tr><td colspan='10'> <div align=center><br>No se encontraron resultados</div></td></tr>" : html);

                $("#IdTipoDocumento").attr('disabled', 'disabled');
                $("#agregarcompraoservicio").val("C")
                $("#agregarbienservicio").val("B")
                FormaPago()

            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });
    }

    function ActualizarProv() {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/listarProveedores',
            data: '{"empresa": "' + $("#id_empresa").val() + '"}',
            dataType: "json",
            success: function (response) {
                var customers = eval(response.d);
                var html = "<option value='P' selected></option>";

                $.each(customers, function () {

                    //<td> " + this.Estado + "</td>
                    html += "<option value='" + this.idproveedor + "'  >" + this.Razonsocial + "</option>";

                });
                $("#Proveedor").html(html == "" ? "" : html);

            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });
    }

    function FormaPago() {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/listarFormaPago',
            data: '{"empresa": "' + $("#id_empresa").val() + '"}',
            dataType: "json",
            success: function (response) {
                var customers = eval(response.d);
                var html = "<option value='S' ></option>";

                $.each(customers, function () {

                    if (this.IdFormaPago == '04')
                        tipopag = "selected";
                    else
                        tipopag = "";

                    //<td> " + this.Estado + "</td>
                    html += "<option " + tipopag + " value='" + this.IdFormaPago + "'  >" + this.DescripFormaPago + "</option>";

                });
                $("#IdFormaPago").html(html == "" ? "" : html);
            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });
    }

    function cabecera_modif_ordencompra() {

        $("#AdicNewOrdenCompra").hide();

        $("#Cabec_OrdenCompra").hide();
        $("#Tabla_CabeceraOrdenCompra").hide();
        $("#Tabla_DetalleOrdenCompra").hide();

        $("#ModifNewOrdenCompra").show();

        //CABECERA
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/cabeceramodifOrdenCompraoServicio',
            data: '{"IdOrdenCompra": "' + $("#id_orden").val() + '","IdRequerimiento": "' + $("#id_requerimiento").val() + '","CompraServicio": "C","empresa": "' + $("#id_empresa").val() + '" }',
            //data: '{"fechaactual": "' + $("#fecha").val() + '" }',
            dataType: "json",
            success: function (response) {
                var customers = eval(response.d);

                $.each(customers, function () {

                    $("#FechaTipoCambModif").val(this.Fecha)
                                                            
                    $("#FechaTipoCambModif").datepicker({
                        format: "dd/mm/yyyy",
                        todayHighlight: true,
                        autoclose: true
                    });

                    $("#FGuardada").val(this.Fecha)

                    $("#PlazoEntregamodif").val(this.PlazoEntrega)
                    $("#forma_pago").val(this.IdFormaPago)
                    $("#tipo_doc").val(this.IdTipoDocumento)
                    $("#proveedor").val(this.IdProveedor)
                    $("#dias_habilesmodif").val(this.FlagDiaHabil)
                    $("#TipoCambiomodif").val(this.TipoCambio)
                    $("#Tipo_Cambiomodif").val(this.TipoCambio)
                    $("#Tipo_cambiomodif").val(this.TipoCambio)
                    $("#conceptomodif").val(this.Descripcion)
                    $("#FechaOrdCompModif").val(this.FechaOrdenCompra)
                    $("#ValVtaModif").val(this.ValorVenta)
                    $("#ImpustModif").val(this.Impuesto1)
                    $("#TasaModif").val(this.Tasa1)
                    $("#CantTotalModif").val(this.CantidadTotal)

                    $("#IdTipoDocumentomodif").attr('disabled', 'disabled');

                    $("#FActualM").val(fechaactual)
                });

            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });

        if ($("#dias_habilesmodif").val("S")) {
            $("#diashabilesmodif").prop('checked', true);
        }
        else {
            $("#diashabilesmodif").prop('checked', false);
        }

        listar_modificar_requerimiento()
    }

    function cabeceraanno_modif_ordencompra() {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/annoordenes',
            data: '{"IdOrdenCompra": "' + $("#id_orden").val() + '","CompraServicio": "C" ,"empresa": "' + $("#id_empresa").val() + '" }',
            dataType: "json",
            success: function (response) {
                var customers = eval(response.d);

                $.each(customers, function () {

                    $("#idanno").val(this.IdAnno)
                    $("#idmes").val(this.IdMes)
                    $("#dia").val(this.Dia)
                                                                        
                    validacion_anulacionOC();

                });

            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });
    }

    function validacion_anulacionOC() {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/validacionANUL_ordencompra',
            data: '{"IdOrdenCompra": "' + $("#id_orden").val() + '","IdAnno": "' + $("#idanno").val() + '" ,"empresa": "' + $("#id_empresa").val() + '" }',
            dataType: "json",
            success: function (response) {
                var customers = eval(response.d);

                $.each(customers, function () {

                    $("#IdGuia").val(this.IdGuia)
                                    
                });

            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });
    }

    function validacion_certifOrdenes() {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/validacionCentif_Ordenes',
            data: '{"IdRequerimiento": "' + $("#IdRequerimiento").val() + '","IdAnno": "' + $("#Anno").val() + '","empresa": "' + $("#id_empresa").val() + '" }',
            dataType: "json",
            success: function (response) {
                var customers = eval(response.d);

                $.each(customers, function () {

                    $("#CertificacionOrden").val(this.IdNroSolicitud)

                    //var IdNroSolicitud = $("#CertificacionOrden").val()

                    if ($("#CertificacionOrden").val() == "NO EXISTE") {
                        $("#tbody_detreq").html("");
                        alert("Requerimiento no se encuentra certificado");
                    }
                    else if ($("#CertificacionOrden").val() != "NO EXISTE") {
                        listar_adicionar_requerimiento_detalle();
                    }

                });

            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });
    }

    //Llenado Combo Centro Costos
    function CentroCostoxOrden() {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/centrocostosxOrdenes',
            data: '{"BienServicio": "B","empresa": "' + $("#id_empresa").val() + '"}',
            dataType: "json",
            success: function (response) {
                var customers = eval(response.d);
                var html = "<option value='S' selected>Seleccione</option>";

                $.each(customers, function () {

                    html += "<option value='" + this.IdCentroCosto + "'  >" + this.DescripcionCorta + "</option>";

                });
                $("#CentroCost").html(html == "" ? "" : html);

            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });
    }

    $("#CentroCost").change(function () {

        listar_requerimiento();

        $("#search_ocreq").val("");
    });

    function listar_requerimiento() {

        $("#Cabec_OrdenCompra").hide();
        $("#Tabla_CabeceraOrdenCompra").hide();
        $("#Tabla_DetalleOrdenCompra").hide();

        $("#AdicNewOrdenCompra").show();
        $("#ModifNewOrdenCompra").hide();

        url = document.url;
        $("#tbody_req").html("<tr><td colspan=10><div align=center ><img src='../images/loader.gif'></div></td></tr>");
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/listar_RequerimientoXCC',
            data: '{"BienServicio": "B","empresa":"' + $("#id_empresa").val() + '"}',
            dataType: "json",
            success: function (response) {
                var customers = eval(response.d);
                var html = "";
                var xnro = 1;
                $.each(customers, function () {

                    html += "<tr id='fila" + xnro +
                    "' onclick=detalle_adicionarrequerimiento('" + this.IdRequerimiento + "','" + xnro + "') style='cursor:pointer' ><td style='text-align:center'>"
                    + xnro + " </td><td style='text-align:center' class=idreq>"
                    + this.IdRequerimiento + " </td><td style='text-align:left' class=desreq> " + this.Descripcion + "</td><td class=fechareq> " +
                    this.FechaRequerimiento + "</td><td class=desum>" + this.DescripcionCorta + "</td><td class=saldo>" + this.SaldoSubTotal + "</td> </tr>";
                    xnro++;
                });

                $("#tbody_req").html(html == "" ? "<tr><td colspan='10'> <div align=center><br>No se encontraron resultados</div></td></tr>" : html);

                $("#agregarcompraoservicio").val("C")
                $("#agregarbienservicio").val("B")

                $("#FActual").val(fechaactual)
                //FormaPago()

            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });

    }

    function listar_Brequerimiento() {

        $("#Cabec_OrdenServicio").hide();
        $("#Tabla_CabeceraOrdenServicio").hide();
        $("#Tabla_DetalleOrdenServicio").hide();

        $("#AdicNewOrdenServicio").show();
        $("#ModifNewOrdenServicio").hide();

        url = document.url;
        $("#tbody_req").html("<tr><td colspan=10><div align=center ><img src='../images/loader.gif'></div></td></tr>");
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/listar_BRequerimientoXCC',
            data: '{"IdRequerimiento":"' + $("#search_ocreq").val() + '","BienServicio": "B","empresa":"' + $("#id_empresa").val() + '"}',
            dataType: "json",
            success: function (response) {
                var customers = eval(response.d);
                var html = "";
                var xnro = 1;
                $.each(customers, function () {

                    html += "<tr id='fila" + xnro +
                    "' onclick=detalle_adicionarrequerimiento('" + this.IdRequerimiento + "','" + xnro + "') style='cursor:pointer' ><td style='text-align:center'>"
                    + xnro + " </td><td style='text-align:center' class=idreq>"
                    + this.IdRequerimiento + " </td><td style='text-align:left' class=desreq> " + this.Descripcion + "</td><td class=fechareq> " +
                    this.FechaRequerimiento + "</td><td class=desum>" + this.DescripcionCorta + "</td><td class=saldo>" + this.SaldoSubTotal + "</td> </tr>";
                    xnro++;
                });

                $("#tbody_req").html(html == "" ? "<tr><td colspan='10'> <div align=center><br>No se encontraron resultados</div></td></tr>" : html);

                $("#agregarcompraoservicio").val("C")
                $("#agregarbienservicio").val("B")

                $("#FActual").val(fechaactual)
                //FormaPago()

            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });

    }

    function DatosOrdenes() {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/AdicSaldoCantOrdenes',
            data: '{"CompraServicio": "C" ,"empresa": "' + $("#id_empresa").val() + '" }',
            dataType: "json",
            success: function (response) {
                var customers = eval(response.d);

                $.each(customers, function () {

                    $("#id_orden").val(this.IdOrdenCompra)
                    $("#idanno").val(this.IdAnno)
                    $("#idmes").val(this.IdMes)

                });

            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });
    }

    function detalleordenescolumns() {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/columnsModifOrden',
            data: '{"IdOrdenCompra": "' + $("#id_orden").val() + '","CompraServicio": "C","empresa": "' + $("#id_empresa").val() + '" }',
            dataType: "json",
            success: function (response) {
                var customers = eval(response.d);

                $.each(customers, function () {

                    $("#columnsOrdenDescrip").val(this.Columnas)
                    $("#txt_nrocolumnas").val(this.Columnas);

                });

            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });
    }

    function datosReqOrdenes() {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/delReqOrdenes',
            data: '{"IdOrdenCompra": "' + $("#id_orden").val() + '","CompraServicio": "C","IdAnno": "' + $("#idanno").val() + '","IdMes": "' + $("#idmes").val() + '","empresa": "' + $("#id_empresa").val() + '" }',
            dataType: "json",
            success: function (response) {
                var customers = eval(response.d);

                $.each(customers, function () {

                    $("#IdRequerimiento1").val(this.IdRequerimiento1)
                    $("#IdRequerimiento2").val(this.IdRequerimiento2)
                    $("#IdRequerimiento3").val(this.IdRequerimiento3)
                    $("#IdRequerimiento4").val(this.IdRequerimiento4)
                    $("#IdRequerimiento5").val(this.IdRequerimiento5)
                    $("#IdRequerimiento6").val(this.IdRequerimiento6)

                });

            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });
    }

    function datosBienServOrdenes() {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/delBienSerOrdenes',
            data: '{"IdOrdenCompra": "' + $("#id_orden").val() + '","CompraServicio": "C","IdAnno": "' + $("#idanno").val() + '","IdMes": "' + $("#idmes").val() + '","empresa": "' + $("#id_empresa").val() + '" }',
            dataType: "json",
            success: function (response) {
                var customers = eval(response.d);

                $.each(customers, function () {

                    $("#IdBienServicio1").val(this.IdBienServicio1)
                    $("#IdBienServicio2").val(this.IdBienServicio2)
                    $("#IdBienServicio3").val(this.IdBienServicio3)
                    $("#IdBienServicio4").val(this.IdBienServicio4)
                    $("#IdBienServicio5").val(this.IdBienServicio5)
                    $("#IdBienServicio6").val(this.IdBienServicio6)

                });

            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });
    }

    function datosNumItemReqOrdenes() {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/delNumItemReqOrdenes',
            data: '{"IdOrdenCompra": "' + $("#id_orden").val() + '","CompraServicio": "C","IdAnno": "' + $("#idanno").val() + '","IdMes": "' + $("#idmes").val() + '","empresa": "' + $("#id_empresa").val() + '" }',
            dataType: "json",
            success: function (response) {
                var customers = eval(response.d);

                $.each(customers, function () {

                    $("#NumeroItemRequerimiento1").val(this.NumeroItemRequerimiento1)
                    $("#NumeroItemRequerimiento2").val(this.NumeroItemRequerimiento2)
                    $("#NumeroItemRequerimiento3").val(this.NumeroItemRequerimiento3)
                    $("#NumeroItemRequerimiento4").val(this.NumeroItemRequerimiento4)
                    $("#NumeroItemRequerimiento5").val(this.NumeroItemRequerimiento5)
                    $("#NumeroItemRequerimiento6").val(this.NumeroItemRequerimiento6)

                });

            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });
    }

    function actuSalCantSalCostRequerimientos() {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/actSalCantRequerimientos',
            data: '{"CodOrdenComp": "' + $("#id_orden").val() + '","CompraServicio": "C","IdAnno": "' + $("#idanno").val() + '","IdMes": "' + $("#idmes").val() + '","Cantidad": "' + $("#columnsOrdenDescrip").val() + '","empresa": "' + $("#id_empresa").val() + '","IdRequerimiento1": "' + $("#IdRequerimiento1").val() + '","IdRequerimiento2": "' + $("#IdRequerimiento2").val() + '","IdRequerimiento3": "' + $("#IdRequerimiento3").val() + '","IdRequerimiento4": "' + $("#IdRequerimiento4").val() + '","IdRequerimiento5": "' + $("#IdRequerimiento5").val() + '","IdRequerimiento6": "' + $("#IdRequerimiento6").val() + '","IdBienServicio1": "' + $("#IdBienServicio1").val() + '","IdBienServicio2": "' + $("#IdBienServicio2").val() + '","IdBienServicio3": "' + $("#IdBienServicio3").val() + '","IdBienServicio4": "' + $("#IdBienServicio4").val() + '","IdBienServicio5": "' + $("#IdBienServicio5").val() + '","IdBienServicio6": "' + $("#IdBienServicio6").val() + '","NumeroItemRequerimiento1": "' + $("#NumeroItemRequerimiento1").val() + '","NumeroItemRequerimiento2": "' + $("#NumeroItemRequerimiento2").val() + '","NumeroItemRequerimiento3": "' + $("#NumeroItemRequerimiento3").val() + '","NumeroItemRequerimiento4": "' + $("#NumeroItemRequerimiento4").val() + '","NumeroItemRequerimiento5": "' + $("#NumeroItemRequerimiento5").val() + '","NumeroItemRequerimiento6": "' + $("#NumeroItemRequerimiento6").val() + '" }',
            dataType: "json",
            success: function (response) {
                            
            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });
    }

    function listar_modificar_requerimiento() {
        //$("#idordencompra").val($("#id_orden"));
        //$("#idrequerimiento").val($("#id_requerimiento"));

        url = document.url;

        //Primera Tabla
        $("#tbody_req_modif").html("<tr><td colspan=10><div align=center ><img src='../images/loader.gif'></div></td></tr>");
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/listarModificarRequerimiento',
            data: '{"IdOrdenCompra": "' + $("#id_orden").val() + '", "CompraServicio": "C","empresa":"' + $("#id_empresa").val() + '"}',
            dataType: "json",
            success: function (response) {
                var customers = eval(response.d);
                var html = "";
                var xnro = 1;
                $.each(customers, function () {

                    html += "<tr id='fila" + xnro +
                            "'  onclick=detalle_adicionarrequerimiento('" + this.IdRequerimiento + "','" + xnro + "') style='cursor:pointer'><td style='text-align:center'>"
                            + xnro + " </td><td style='text-align:center'>"
                            + this.IdRequerimiento + " </td><td style='text-align:left'> " + this.Descripcion + "</td><td > " +
                            this.FechaRequerimiento + "</td><td>" + this.DescripCentroCosto + "</td><td>" + this.SaldoSubTotal + "</td> </tr>";
                    xnro++;
                });

                $("#tbody_req_modif").html(html == "" ? "<tr><td colspan='10'> <div align=center><br>No se encontraron resultados</div></td></tr>" : html);

            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });

        //Segunda Tabla
        $("#tbody_detreq_modif").html("<tr><td colspan=10><div align=center ><img src='../images/loader.gif'></div></td></tr>");
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/listarModificarDetalleRequerimientoI',
            data: '{"IdOrdenCompra": "' + $("#id_orden").val() + '","CompraServicio": "C","empresa": "' + $("#id_empresa").val() + '" }',
            dataType: "json",
            success: function (response) {
                var customers = eval(response.d);
                var html = "";
                var x = 1;

                $.each(customers, function () {
                    $("#art_detalle").val(this.Detalle);
                    $("#art_um").val(this.UM);
                    html += "<tr style='cursor:pointer' class=''><td style='display:none'> <input type=text class=bool id='bool" + x + "' value='1' ><input type=text class=conta id='conta" + x + "' value='" + x + "' ></td><td class='idnroitem'>" + this.NumeroItemRequerimiento + "</td><td class='idbienser'>" + this.IdBienServicio + "</td><td class='descum'>" + this.UM + "</td><td class='descarti'>" + this.Descripcion + "</td><td class='ccosto'>" + this.Siglas + "</td><td class='cantid'>" + this.Cantidad + "</td><td class='cstitem'>" + this.Costo + "</td><td class='saldosbtot'>" + this.SubTotal + "</td></tr>";
                    x++;
                });
                $("#tbody_detreq_modif").html(html == "" ? "<tr><td colspan=8 align=center>No se encontraron resultados</td></tr>" : html);
            },
            error: function (a) {
                alert(a.responseText);
            }
        });

        //Tercera Tabla
        $("#tbody_ocreq_modif").html("<tr><td colspan=10><div align=center ><img src='../images/loader.gif'></div></td></tr>");
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/listarModificarDetalleRequerimientoII',
            data: '{"IdOrdenCompra": "' + $("#id_orden").val() + '","CompraServicio": "C","BienServicio": "B","Idanno": "' + $("#Anno").val() + '","IdMes": "' + $("#Mes").val() + '","empresa": "' + $("#id_empresa").val() + '" }',
            dataType: "json",
            success: function (response) {
                var customers = eval(response.d);
                var html = "";
                var x = 1;

                $.each(customers, function () {
                    $("#art_detalle").val(this.Detalle);
                    $("#art_um").val(this.UM);
                    html += "<tr style='cursor:pointer' class=''><td class='idreq' id='cod_idreq'>" + this.IdRequerimiento + "</td><td class='idnroitem' id='cod_nroitem'>" + this.IdNumeroItem + "</td><td class='idbienser' id ='cod_bienser'>" + this.IdBienServicio + "</td><td class='descum'>" + this.DescripcionCorta + "</td><td class='descarti'>" + this.Descripcion + "</td><td class='ccosto' id='cod_centcost'>" + this.Siglas + "</td><td class='clasif'>" + this.Clasificador + "</td><td class='act'>" + this.Actividad + "</td><td class='finali'>" + this.IdFinalidad + "</td><td class='met'>" + this.Meta + "</td><td id='cant_req'>" + this.Cantidad + "</td><td id='costo'>" + this.Costo + "</td><td class='saldosbtot' id='subtotal_req'>" + this.SubTotal + "</td><td class='montoreserv'>" + this.MontoAReservarActual + "</td><td class='saldoreserv' id='sabdoreserva_req'>" + this.SaldoReservaActual + "</td></tr>";
                    x++;
                });
                $("#tbody_ocreq_modif").html(html == "" ? "<tr><td colspan=8 align=center>No se encontraron resultados</td></tr>" : html);
                listar_modificar_formapago()
                nrofilastablas()
            },
            error: function (a) {
                alert(a.responseText);
            }
        });

        //DATOS DETALLE ORDEN COMPRA
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/detallemodifOrden',
            data: '{"IdOrdenCompra": "' + $("#id_orden").val() + '","IdRequerimiento": "' + $("#id_requerimiento").val() + '","BienServicio": "B","CompraServicio": "C","empresa": "' + $("#id_empresa").val() + '" }',
            dataType: "json",
            success: function (response) {
                var customers = eval(response.d);

                $.each(customers, function () {

                    $("#CstItemModif").val(this.CostoItem)
                    $("#CantModif").val(this.Cantidad)
                    //$("#NumItemOrden").val(this.NumeroItemOrdenCompra)
                });

            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });

    }

    function listar_modificar_formapago() {
        //Llenado Forma de Pago
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/listarFormaPago',
            data: '{"empresa": "' + $("#id_empresa").val() + '"}',
            dataType: "json",
            success: function (response) {
                var customers = eval(response.d);
                var html = "<option value='S' ></option>";

                $.each(customers, function () {

                    if (this.IdFormaPago == $("#forma_pago").val())
                        tipopag = "selected";
                    else
                        tipopag = "";

                    //<td> " + this.Estado + "</td>
                    html += "<option " + tipopag + " value='" + this.IdFormaPago + "'  >" + this.DescripFormaPago + "</option>";

                });
                $("#IdFormaPagomodif").html(html == "" ? "" : html);

                listar_modificar_tipodocumento()
            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });
    }

    function listar_modificar_tipodocumento() {
        //Llenado Tipo Documento
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/listarTipoDoc',
            data: '{"empresa": "' + $("#id_empresa").val() + '"}',
            dataType: "json",
            success: function (response) {
                var customers = eval(response.d);
                var html = "<option value='S' selected></option>";

                $.each(customers, function () {

                    if (this.IdTipoDocumento == $("#tipo_doc").val())
                        tipodoc = "selected";
                    else
                        tipodoc = "";

                    //<td> " + this.Estado + "</td>
                    html += "<option " + tipodoc + " value='" + this.IdTipoDocumento + "'  >" + this.Descripcion + "</option>";

                });
                $("#IdTipoDocumentomodif").html(html == "" ? "" : html);

                //Listar_Proveedoresmbuscar();
                Mostrar_ProveedorM();
            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });
    }

    function buscar_proveedor() {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/buscarProveedores',
            data: '{"idproveedor": "' + $("#proveedor").val() + '","empresa": "' + $("#id_empresa").val() + '"}',
            dataType: "json",
            success: function (response) {
                var customers = eval(response.d);
                var html = "<option value='P' selected></option>";

                $.each(customers, function () {

                    if (this.idproveedor == $("#proveedor").val())
                        razSoc = "selected";
                    else
                        razSoc = "";

                    //<td> " + this.Estado + "</td>
                    html += "<option " + razSoc + " value='" + this.idproveedor + "'  >" + this.Razonsocial + "</option>";

                });
                $("#Proveedormodif").html(html == "" ? "" : html);

            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });
    }

    function nrofilastablas() {
        var filas = document.getElementById("tabla_ocreq_modif").rows.length - 1;
        //alert(filas);
        $("#Nro_filas").val(filas);
    }

    //$("#Proveedormodif").select2();

    function detalle_adicionarrequerimiento(adicorden, u) {
        $('#tabla_req tr').removeClass('highlighted');
        $("#tabla_req #fila" + u).addClass('highlighted');

        $("#VerifEnter").val("");

        //$("#search_detreq").val("");
        //$("#tbody_ocpreq").html("");

        tasaimpuesto();

        $("#EnviarTodos").show();
                        
        var IdReq = adicorden

        $("#IdRequerimiento").val(IdReq);
                        
        validacion_certifOrdenes();

        extraer_descripReq(IdReq);

        //$("#n").val("0");
    }

    //$("#tbody_req").dblclick(function () {
    //    extraer_descripReq();
    //});

    function validarSelectProveedor() {
        //var valor = $("#Proveedor").val();
        ////alert(valor); 
        //$("#ProvSelect").val(valor);

        var valor = $("#Proveedor").val();

        if (valor == null) {
            var valorRuc = "P"
            $("#ProvSelect").val(valorRuc);
        }
        else {
            $("#ProvSelect").val(valor);
        }
    }
         
    function listar_adicionar_requerimiento_detalle() {
        var i = 1
        $("#tbody_detreq").html("<tr align=center><td colspan=7><img src='../images/loader.gif'></td></tr>");

        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/listarAdicionarDetalleRequerimiento',
            data: '{"IdRequerimiento": "' + $("#IdRequerimiento").val() + '","BienServicio": "B","IdTipoDocumento": "' + $("#IdTipoDocumento").val() + '","empresa": "' + $("#id_empresa").val() + '" }',
            dataType: "json",
            success: function (response) {
                var customers = eval(response.d);
                var html = "";
                var x = 1;

                $.each(customers, function () {
                    $("#art_detalle").val(this.Detalle);
                    $("#art_um").val(this.UM);
                    html += "<tr id='Requerimiento"+i+"' style='cursor:pointer' class='asignar_ordcomprareq'><td style='display:none'> <input type=text class=bool id='bool" + x + "' value='1' ><input type=text class=conta id='conta" + x + "' value='" + x + "' ></td><td style='display:none' class='idreq'>" + this.IdRequerimiento + "</td><td class='idnroitem'>" + this.IdNumeroItem + "</td><td class='idbienser'>" + this.IdBienServicio + "</td><td style='display:none' class='idum'>" + this.IdUnidadMedida + "</td><td class='descum'>" + this.UM + "</td><td class='descarti'>" + this.Descripcion + "</td><td class='ccosto'>" + this.Siglas + "</td><td style='display:none' class='clasif'>" + this.Clasificador + "</td><td style='display:none' class='act'>" + this.Actividad + "</td><td style='display:none' class='finali'>" + this.IdFinalidad + "</td><td style='display:none' class='met'>" + this.Meta + "</td><td class='cantid'>" + this.SaldoCantidad + "</td><td class='cstitem'>" + this.CostoItem + "</td><td style='display:none' class='csitemope'>" + this.CostoItemOpe + "</td><td class='saldosbtot'>" + this.SaldoSubTotal + "</td><td style='display:none' class='montoreserv'>" + this.MontoAReservarActual + "</td><td style='display:none' class='saldoreserv'>" + this.SaldoReservaActual + "</td><td style='display:none' class='idcentcost'>" + this.IdCentroCosto + "</td><td style='display:none' class='partpres'>" + this.PartidaPresupuestal + "</td><td style='display:none' class='idtrans'>" + this.IdTransaccion + "</td><td style='display:none' class='idctacont'>" + this.IdCuentaContable + "</td><td style='display:none' class='idalmc'>" + this.IdAlmacen + "</td><td style='display:none' class='ttlinafecto'>" + this.Inafecto + "</td>    <td style='display:none' class='tasaimpto'>" + this.Tasa + "</td><td style='display:none' class='valope'>" + this.ValorOper + "</td><td style='display:none' class='ttlneto'>" + this.Neto + "</td></tr>";
                    x++;
                    i++;
                });
                
                $("#tbody_detreq").html(html == "" ? "<tr><td colspan=8 align=center>No se encontraron resultados</td></tr>" : html);

                adicordendet = $("#tabla_detreq");

                var nFilas = $("#tabla_detreq tr").length;
                $("#nroFilas").val(nFilas-1);
                //alert(nFilas-1);

                $("#search_detreq").keyup(function () {
                    $.uiTableFilter(adicordendet, this.value);
                });
                        

                //-----------------------------

            },
            error: function (a) {
                alert(a.responseText);
            }
        });
    }

    //Actualizar Saldo Requerimiento
    function ActualizarSaldoRequerimiento() {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/actualizarsaldoxrequerimiento',
            data: '{"IdRequerimiento": "' + adicorden + '","BienServicio": "B","empresa": "' + $("#id_empresa").val() + '" }',
            dataType: "json",
            success: function (response) {
                if (response.d == 1) {
                    //alert("Se actualizo saldo del requerimiento seleccionado.");
                }
                else {
                    alert("Error");
                }
            },
            error: function (a, b, c) {
                //alert(a.responseText);
                /*$("#results").html(a.responseText);*/
                //window.location = "http://" + location.host;
            }
        });
    }

    txtsub = 0;
    $(".subtotal").each(
        function (index, value) {
            txtsub = eval(txtsub) + eval($(this).val());
        }
    );

    $("#TotalCosto").val(txtsub);

    function validarNro(e) {
        var key;
        if (window.event) // IE
        {
            key = e.keyCode;
        }
        else if (e.which) // Netscape/Firefox/Opera
        {
            key = e.which;
        }
        if (key < 48 || key > 57) {
            if (key == 46 || key == 8) // Detectar . (punto) y backspace (retroceso)
                { return true; }
            else
                { return false; }
            }
            return true;
        }

    function sol_cant(u) {
        //if (eval($('#disponible' + u).val()) < eval($('#cantidad' + u).val())) {
        if ((eval($('#disponible' + u).val()) < eval($('#cantidad' + u).val())) || (eval($('#cantidad' + u).val()) == "0")) {
            $('#cantidad' + u).val($('#disponible' + u).val());
        }
    }

    function val_cant(u) {
        if ((eval($('#cantidad' + u).val()) == null)) {
            //$('#cantidad' + u).val($('#disponible' + u).val());
            $("#valcantidad").val("1");
            //$('#cantidad' + u).css({ "background-color": "color" });

        }
        else {
            $("#valcantidad").val("0");
        }
    }

    function sol_subtot(u) {
        if (eval($('#costo' + u).val()) < eval($('#subtotal' + u).val())) {
            $('#subtotal' + u).val($('#costo' + u).val());
        }
    }

    function cmb_subtotal(u) {
        if (eval($('#subtotal' + u).val()) > eval($('#montosubtotal' + u).val())) {
            $('#cantidad' + u).val($('#disponible' + u).val());
            $('#costo' + u).val($('#costoreq' + u).val());
        }
    }

    function subtot(u) {
        var subtotal = $('#cantidad' + u).val() * $('#costo' + u).val();
        $('#subtotal' + u).val(parseFloat(subtotal).toFixed(5));
        $("#TotalCosto").val(parseFloat(subtotal).toFixed(5));
        //$("#TotalCosto").val(parseFloat(subtotal_req).toFixed(2));
    }

    function subtota(u) {
        var subtotal = $('#cantidad' + u).val() * $('#costo_req' + u).val();
        $('#subtotal' + u).val(parseFloat(subtotal).toFixed(5));
        $("#TotalCosto").val(parseFloat(subtotal).toFixed(5));
        //$("#TotalCosto").val(parseFloat(subtotal_req).toFixed(2));
    }
        
    function tasaimpuesto() {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/impuesto_tasa',
            data: '{"IdTipoDocumento": "001","empresa": "' + $("#id_empresa").val() + '" }',
            dataType: "json",
            success: function (response) {
                var customers = eval(response.d);

                $.each(customers, function () {

                    $("#idimpuesto").val(this.IdImpuesto)
                    $("#valor_venta").val(this.ValorImpto)
                    $("#valor_ventaXCien").val((this.ValorImpto)*100)
                });

            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });
    }

    //funcion para matriz detalle orden compra
    function item_atendidos() {
        cad_cantidad = "";
        for (i = 1; i < $("#contadoradicordcomp").val() ; i++) {
            if (typeof ($("#cantidad" + i).val()) != "undefined") {
                cad_cantidad += $("#cantidad" + i).val() + ",";
            }
            //cad_item += ("000" + (eval(i))).slice(-3) + ",";
        }
        //$("#item_atendido").val(cad_atendido);
        $("#cantidadx").val(cad_cantidad);

    }

    function item_requerimientos() {
        cad_req = "";
        for (i = 1; i < $("#contadoradicordcomp").val() ; i++) {
            if (typeof ($("#cod_idreq" + i).val()) != "undefined") {
                cad_req += $("#cod_idreq" + i).val() + ",";
            }
            //cad_item += ("000" + (eval(i))).slice(-3) + ",";
        }
        //$("#item_atendido").val(cad_atendido);
        $("#cod_idreqx").val(cad_req);

    }

    function item_centroCostos() {
        cad_centcostos = "";
        for (i = 1; i < $("#contadoradicordcomp").val() ; i++) {
            if (typeof ($("#cod_centcost" + i).val()) != "undefined") {
                cad_centcostos += $("#cod_centcost" + i).val() + ",";
            }
            //cad_item += ("000" + (eval(i))).slice(-3) + ",";
        }
        //$("#item_atendido").val(cad_atendido);
        $("#cod_centcostx").val(cad_centcostos);
    }

    function item_bienServicio() {
        cad_bienServ = "";
        for (i = 1; i < $("#contadoradicordcomp").val() ; i++) {
            if (typeof ($("#cod_bienser" + i).val()) != "undefined") {
                cad_bienServ += $("#cod_bienser" + i).val() + ",";
            }
            //cad_item += ("000" + (eval(i))).slice(-3) + ",";
        }
        //$("#item_atendido").val(cad_atendido);
        $("#cod_bienserx").val(cad_bienServ);
    }

    function item_nroItem() {
        cad_nroItem = "";
        for (i = 1; i < $("#contadoradicordcomp").val() ; i++) {
            if (typeof ($("#cod_nroitem" + i).val()) != "undefined") {
                cad_nroItem += $("#cod_nroitem" + i).val() + ",";
            }
            //cad_item += ("000" + (eval(i))).slice(-3) + ",";
        }
        //$("#item_atendido").val(cad_atendido);
        $("#cod_nroitemx").val(cad_nroItem);
    }

    function item_unidadMedida() {
        cad_unidMed = "";
        for (i = 1; i < $("#contadoradicordcomp").val() ; i++) {
            if (typeof ($("#cod_idum" + i).val()) != "undefined") {
                cad_unidMed += $("#cod_idum" + i).val() + ",";
            }
            //cad_item += ("000" + (eval(i))).slice(-3) + ",";
        }
        //$("#item_atendido").val(cad_atendido);
        $("#cod_idumx").val(cad_unidMed);
    }

    function item_costoReq() {
        cad_costoReq = "";
        for (i = 1; i < $("#contadoradicordcomp").val() ; i++) {
            if (typeof ($("#costo" + i).val()) != "undefined") {
                cad_costoReq += $("#costo" + i).val() + ",";
            }
            //cad_item += ("000" + (eval(i))).slice(-3) + ",";
        }
        //$("#item_atendido").val(cad_atendido);
        $("#costo_reqx").val(cad_costoReq);
    }

    function item_saldoResev() {
        cad_saldoResev = "";
        for (i = 1; i < $("#contadoradicordcomp").val() ; i++) {
            if (typeof ($("#sabdoreserva_req" + i).val()) != "undefined") {
                cad_saldoResev += $("#sabdoreserva_req" + i).val() + ",";
            }
            //cad_item += ("000" + (eval(i))).slice(-3) + ",";
        }
        //$("#item_atendido").val(cad_atendido);
        $("#sabdoreserva_reqx").val(cad_saldoResev);
    }

    function item_impuesto() {
        cad_impuesto = "";
        for (i = 1; i < $("#contadoradicordcomp").val() ; i++) {
            if (typeof ($("#impuesto_req" + i).val()) != "undefined") {
                cad_impuesto += $("#impuesto_req" + i).val() + ",";
            }
            //cad_item += ("000" + (eval(i))).slice(-3) + ",";
        }
        //$("#item_atendido").val(cad_atendido);
        $("#impuesto_reqx").val(cad_impuesto);
    }

    function item_subtotalReq() {
        cad_subtotalReq = "";
        for (i = 1; i < $("#contadoradicordcomp").val() ; i++) {
            if (typeof ($("#subtotal" + i).val()) != "undefined") {
                cad_subtotalReq += $("#subtotal" + i).val() + ",";
            }
            //cad_item += ("000" + (eval(i))).slice(-3) + ",";
        }
        //$("#item_atendido").val(cad_atendido);
        $("#subtotal_reqx").val(cad_subtotalReq);
    }

    function item_partPres() {
        cad_partPres = "";
        for (i = 1; i < $("#contadoradicordcomp").val() ; i++) {
            if (typeof ($("#partidapresu" + i).val()) != "undefined") {
                cad_partPres += $("#partidapresu" + i).val() + ",";
            }
            //cad_item += ("000" + (eval(i))).slice(-3) + ",";
        }
        //$("#item_atendido").val(cad_atendido);
        $("#partidapresux").val(cad_partPres);
    }

    function item_cosTrans() {
        cad_codTrans = "";
        for (i = 1; i < $("#contadoradicordcomp").val() ; i++) {
            if (typeof ($("#cod_trans" + i).val()) != "undefined") {
                cad_codTrans += $("#cod_trans" + i).val() + ",";
            }
            //cad_item += ("000" + (eval(i))).slice(-3) + ",";
        }
        //$("#item_atendido").val(cad_atendido);
        $("#cod_transx").val(cad_codTrans);
    }

    function item_ctacont() {
        cad_ctacont = "";
        for (i = 1; i < $("#contadoradicordcomp").val() ; i++) {
            if (typeof ($("#cod_ctacontab" + i).val()) != "undefined") {
                cad_ctacont += $("#cod_ctacontab" + i).val() + ",";
            }
            //cad_item += ("000" + (eval(i))).slice(-3) + ",";
        }
        //$("#item_atendido").val(cad_atendido);
        $("#cod_ctacontabx").val(cad_ctacont);
    }

    function item_codAlmac() {
        cad_codAlmac = "";
        for (i = 1; i < $("#contadoradicordcomp").val() ; i++) {
            if (typeof ($("#cod_almac" + i).val()) != "undefined") {
                cad_codAlmac += $("#cod_almac" + i).val() + ",";
            }
            //cad_item += ("000" + (eval(i))).slice(-3) + ",";
        }
        //$("#item_atendido").val(cad_atendido);
        $("#cod_almacx").val(cad_codAlmac);
    }

    function cargarContenido(pagina) {
        // cargamos la pagina en el div capa
        $("#Ordenes").load(pagina);
    }

    function modificar_ordencompra() {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/ModificarCabeceraOrdenCompraoServicio',
            data: '{"CodOrdenComp": "' + $("#id_orden").val() + '","CompraServicio": "C","FechaOrdCompModif": "' + $("#FechaTipoCambModif").val() + '","FechaTipoCambio": "' + $("#FechaTipoCambModif").val() + '","PlazoEntregamodif": "' + $("#PlazoEntregamodif").val() + '","conceptomodif": "' + $("#conceptomodif").val().toUpperCase() + '","Proveedormodif": "' + $("#proveedor").val() + '","IdFormaPagomodif": "' + $("#IdFormaPagomodif").val() + '","IdTipoDocumentomodif": "' + $("#IdTipoDocumentomodif").val() + '","Tipo_Cambiomodif": "' + $("#Tipo_Cambiomodif").val() + '","ValVtaModif": "' + $("#ValVtaModif").val() + '","CantTotalModif": "' + $("#CantTotalModif").val() + '","ImpustModif": "' + $("#ImpustModif").val() + '","TasaModif": "' + $("#TasaModif").val() + '","NumItemOrden": "' + $("#NumItemOrden").val() + '","CantModif": "' + $("#CantModif").val() + '","CstItemModif": "' + $("#CstItemModif").val() + '","IdUsuario": "' + $("#IdUsuario").val() + '","empresa": "' + $("#id_empresa").val() + '" }',
            //data: '{"CodOrdenComp": "' + $("#id_orden").val() + '","CompraServicio": "C","FechaOrdCompModif": "' + $("#FechaOrdCompModif").val() + '","FechaTipoCambio": "27/04/2016","PlazoEntregamodif": "0","conceptomodif": "PROBANDO","Proveedormodif": "' + $("#Proveedormodif").val() + '","IdFormaPagomodif": "' + $("#IdFormaPagomodif").val() + '","IdTipoDocumentomodif": "001","Tipo_Cambiomodif": "3.12","ValVtaModif": "' + $("#ValVtaModif").val() + '","CantTotalModif": "' + $("#CantTotalModif").val() + '","ImpustModif": "' + $("#ImpustModif").val() + '","TasaModif": "' + $("#TasaModif").val() + '","NumItemOrden": "' + $("#NumItemOrden").val() + '","CantModif": "' + $("#CantModif").val() + '","CstItemModif": "' + $("#CstItemModif").val() + '","empresa": "' + $("#id_empresa").val() + '" }',
            dataType: "json",
            success: function (response) {
                $("#body_orden2").html('');
                alert("Orden de Compra modificada");
                listar_orden();
                limpiarOrden();
                $("#cancelarmodifordencompra").click();
                $("#modificar").hide();
                $("#eliminar").hide();
                $("#imprimir").hide();
            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });
    }

    function limpiarOrden() {
        //$("#e_articulo").click();
        //$("#TotalCosto").val("0");

        $("#n").val("0");
        $("#concepto").val("");
        $("#PlazoEntrega").val("");
        $("#diashabiles").prop('checked', true);
        $("#dias_habiles").val("S");
        $("#Proveedor").select2('val', 'All');
        $("#IdRequerimiento").val("");
        $("#Requerimiento").val("");

        $("#proveedor").val("");
        $("#Proveedorm").val("");
        $("#buscar_orden").val("");

        $("#search_prov").val("");
        $("#search_ocreq").val("");
        $("#search_detreq").val("");
        $("#search_ocartreq").val("");
        $("#tbody_req").html("");
        $("#tbody_detreq").html("");
        $("#tbody_ocpreq").html("");

        document.getElementById("EnviarTodos").disabled = false;
        $("#QuitarTodos").hide();
        $("#EnviarTodos").hide();


    }

    function cerrar_InsertOrdenes() {                     

        limpiarOrden();

        HabilitarCampos();
        //HabilitarCamposxRNPVencido();

        $("#AdicNewOrdenCompra").hide();

        $("#Cabec_OrdenCompra").show();

        $("#Tabla_CabeceraOrdenCompra").show();
        $("#Tabla_DetalleOrdenCompra").show();

    }

    function HabilitarCampos() {

        document.getElementById("FechaTipoCamb").disabled = false;
        document.getElementById("IdFormaPago").disabled = false;
        document.getElementById("IdTipoDocumento").disabled = false;
        document.getElementById("PlazoEntrega").disabled = false;
        document.getElementById("diashabiles").disabled = false;
        document.getElementById("concepto").disabled = false;

        //document.getElementById("CentroCost").disabled = false;
        document.getElementById("search_ocreq").disabled = false;
        document.getElementById("tabla_req").disabled = false;
        document.getElementById("agregarprov").disabled = false;
        //document.getElementById("search_detreq").disabled = false;
        document.getElementById("tabla_detreq").disabled = false;

        //document.getElementById("consultor").disabled = false;
        //document.getElementById("asesor").disabled = false;
        //document.getElementById("locador").disabled = false;
        //document.getElementById("search_ocartreq").disabled = false;
        document.getElementById("tabla_ocreq").disabled = false;

        $("#guardarordencompra").show();

        $("#tabla_reqSinRnp").hide();
        $("#tabla_detreqSinRnp").hide();
        $("#tabla_ocreqSinRnp").hide();

        $("#tabla_req").show();
        $("#tabla_detreq").show();
        $("#tabla_ocreq").show();

        //$("#VerifEnter").val("BuscarReq");
        listar_Brequerimiento();

    }
    
    function limpiarInsertProv() {
                        
        $("#IdProveedor").val("");
        $("#RUC").val("");
        $('#IdTipoDocumentoIdentidad').prop('selectedIndex', 0);
        $("#Dni").val("");
        document.getElementById("Dni").disabled = false;
        $("#ApPaterno").val("");
        $("#ApMaterno").val("");
        $("#Nombres").val("");
        $("#SiglaComercial").val("");
        $("#RazonSocial").val("");
        $("#Direccion").val("");
        $("#FecNac").val(fechaactual);

        $("#Departamento").select2('val', 'All');
        $("#Provincia").select2('val', 'All');
        $("#Distrito").select2('val', 'All');

        $("#TelefonoEmpresa1").val("");
        $("#TelefonoEmpresa2").val("");

        $("#bien").prop('checked', false);
        $("#servicio").prop('checked', false);
        $("#honorario").prop('checked', false);
        $("#contrato").prop('checked', false);
        $("#pagoturno").prop('checked', false);

        $("#Bien").val("N");
        $("#Servicio").val("N");
        $("#Honorario").val("N");
        $("#Contrato").val("N");
        $("#FlagPagoPorTurno").val("N");

        $("#sincci").prop('checked', true);
        $("#concci").prop('checked', false);

        $("#CCI").val("");
        $("#IdBancoProv").select2('val', 'All');
        document.getElementById("CCI").disabled = true;
        document.getElementById("IdBancoProv").disabled = true;

        $("#RnpBienes").val("");
        $("#RnpServicios").val("");
        $("#RnpConsultoria").val("");

        $("#RnpBienFechaIni").val(fechaactual);
        $("#RnpBienFechaFin").val("");
        $("#RnpServicioFechaIni").val(fechaactual);
        $("#RnpServicioFechaFin").val("");
        $("#RnpConsultoriaFechaIni").val(fechaactual);
        $("#RnpConsultoriaFechaFin").val("");

        $("#eMail").val("");

        $("#scotiabank").prop('checked', true);
        $("#IdNumeroCuenta").val("14");
        $("#otrosbancos").prop('checked', false);

        $("#CtaBancaria").val("");

    }

    function limpiarDatosAnuModOrden() {
        $("#id_orden").val("");
        $("#id_requerimiento").val("");

        $("#modificarcompraoservicio").val("");
        $("#CodCentroCostDet").val("");
        $("#NumItemOrdenCompDet").val("");
        $("#PartidapresuDet").val("");
        $("#CodTransacDet").val("");
        $("#Estado").val("");

        $("#idanno").val("");
        $("#idmes").val("");
        $("#dia").val("");
        $("#columnsOrdenDescrip").val("");
    }

    function ActualizarRNP() {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/ActualizarFechaRNP',
            data: '{"IdProveedor": "' + $("#IdProveedor").val() + '","empresa": "' + $("#id_empresa").val() + '" }',
            dataType: "json",
            success: function (response) {

            },
            error: function (a) {
                alert(a.responseText);
                $("#results").html(a.responseText);
            }
        });
    }

    function ExtraerFechaFinRNP() {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/ExtraerFechaRNP',
            data: '{"IdProveedor": "' + $("#proveedor").val() + '","CompraServicio": "C","empresa": "' + $("#id_empresa").val() + '" }',
            dataType: "json",
            success: function (response) {
                var customers = eval(response.d);

                $.each(customers, function () {

                    var FechaFinRNP = this.FechaFinRNP

                    var DiaFechaFinRNP = FechaFinRNP.substring(0, 2)
                    var MesFechaFinRNP = FechaFinRNP.substring(3, 5)
                    var AnnoFechaFinRNP = FechaFinRNP.substring(6, 10)

                    $("#FechaFinRNP").val(DiaFechaFinRNP + MesFechaFinRNP + AnnoFechaFinRNP);

                    var FechaActualRNP = fechaactual

                    var DiaFechaActualRNP = FechaActualRNP.substring(0, 2)
                    var MesFechaActualRNP = FechaActualRNP.substring(3, 5)
                    var AnnoFechaActualRNP = FechaActualRNP.substring(6, 10)

                    $("#FechaActualxRNP").val(DiaFechaActualRNP + MesFechaActualRNP + AnnoFechaActualRNP);

                    $("#LocadorxRNP").val(this.RazonSocial);
                    $("#FechaRNP").val(this.FechaFinRNP);

                    var ValorVenta = this.ValorVenta

                    var UIT = this.UIT


                    //if (($("#FechaFinRNP").val() == "") && ($("#Valor_Venta").val() <= "3950.00")) {
                    //    HabilitarCamposxRNPVencido();
                    //}
                    
                    if (($("#FechaFinRNP").val() == "") && (ValorVenta > "0.00")) {
                        //alert($("#LocadorxRNP").val() + ", no cuenta con RNP");
                        //DeshabilitarCamposxRNPVencido();
                        ConfirmarGuardadoSinRnp();
                    }
                    else if (($("#FechaFinRNP").val() == "") && (ValorVenta == "0.00")) {
                        //alert($("#LocadorxRNP").val() + ", no cuenta con RNP");
                        //DeshabilitarCamposxRNPVencido();
                        ConfirmarGuardadoSinRnp();
                    }
                    else if (AnnoFechaFinRNP > AnnoFechaActualRNP) {
                        HabilitarCamposxRNPVencido();
                    }
                    else if (MesFechaFinRNP > MesFechaActualRNP) {
                        HabilitarCamposxRNPVencido();
                    }
                    else if (DiaFechaFinRNP > DiaFechaActualRNP) {
                        HabilitarCamposxRNPVencido();
                    }
                    else if (DiaFechaFinRNP == DiaFechaActualRNP) {
                        HabilitarCamposxRNPVencido();
                    }
                    else {
                        DeshabilitarCamposxRNPVencido();

                        alert("El RNP del proveedor " + $("#LocadorxRNP").val() + " ya vencio. Fecha Vencimiento RNP: " + $("#FechaRNP").val());
                    }

                    //else if ($("#FechaActualxRNP").val() > $("#FechaFinRNP").val()) {

                    //    DeshabilitarCamposxRNPVencido();

                    //    alert("El RNP del proveedor " + $("#LocadorxRNP").val() + " ya vencio. Fecha Vencimiento RNP: " + $("#FechaRNP").val());

                    //}
                    //else {

                    //    HabilitarCamposxRNPVencido();

                    //}

                });

            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });
    }

    function ConfirmarGuardadoSinRnp() {
        confirmarGuardado = confirm($("#LocadorxRNP").val() + ", no cuenta con RNP.");
        if (confirmarGuardado) {
            //HabilitarCamposxRNPVencido();
            DeshabilitarCamposxRNPVencido();
        }
        else {
            DeshabilitarCamposxRNPVencido();
        }
    }

    function DeshabilitarCamposxRNPVencido() {

        $("#ValSinRNP").val("SinRNP");

        document.getElementById("FechaTipoCamb").disabled = true;
        document.getElementById("IdFormaPago").disabled = true;
        document.getElementById("IdTipoDocumento").disabled = true;
        document.getElementById("PlazoEntrega").disabled = true;
        document.getElementById("diashabiles").disabled = true;
        document.getElementById("concepto").disabled = true;

        //document.getElementById("CentroCost").disabled = true;
        document.getElementById("search_ocreq").disabled = true;
        document.getElementById("agregarprov").disabled = true;

        $("#QuitarTodos").hide();
        $("#EnviarTodos").hide();

        //document.getElementById("consultor").disabled = true;
        //document.getElementById("asesor").disabled = true;
        //document.getElementById("locador").disabled = true;
        //document.getElementById("search_ocartreq").disabled = true;

        //$("#concepto").val("");

        //$("#tbody_req").html("");
        //$("#tbody_detreq").html("");
        //$("#tbody_ocreq").html("");

        $("#guardarordencompra").hide();

        $("#tabla_reqSinRnp").show();
        $("#tabla_detreqSinRnp").show();
        $("#tabla_ocreqSinRnp").show();

        $("#tabla_req").hide();
        $("#tabla_detreq").hide();
        $("#tabla_ocreq").hide();

    }

    function HabilitarCamposxRNPVencido() {

        if ($("#ValGuardado").val() == "" && ($("#ValSinRNP").val() == "")) {
            $("#ConfirGuardado").val("Confirmar");
        }

        document.getElementById("FechaTipoCamb").disabled = false;
        document.getElementById("IdFormaPago").disabled = false;
        document.getElementById("IdTipoDocumento").disabled = false;
        document.getElementById("PlazoEntrega").disabled = false;
        document.getElementById("diashabiles").disabled = false;
        document.getElementById("concepto").disabled = false;

        //document.getElementById("CentroCost").disabled = false;
        document.getElementById("search_ocreq").disabled = false;
        document.getElementById("tabla_req").disabled = false;
        document.getElementById("agregarprov").disabled = false;
        //document.getElementById("search_detreq").disabled = false;
        document.getElementById("tabla_detreq").disabled = false;

        //document.getElementById("consultor").disabled = false;
        //document.getElementById("asesor").disabled = false;
        //document.getElementById("locador").disabled = false;
        //document.getElementById("search_ocartreq").disabled = false;
        document.getElementById("tabla_ocreq").disabled = false;

        $("#QuitarTodos").show();
        $("#EnviarTodos").show();

        $("#guardarordencompra").show();

        $("#tabla_reqSinRnp").hide();
        $("#tabla_detreqSinRnp").hide();
        $("#tabla_ocreqSinRnp").hide();

        $("#tabla_req").show();
        $("#tabla_detreq").show();
        $("#tabla_ocreq").show();

        //$("#VerifEnter").val("BuscarReq");
        listar_Brequerimiento();


        $("#ValSinRNP").val("");


        if ($("#ConfirGuardado").val() == "Confirmar") {
            ConfirmarGuardadoOrden();
        }

        $("#ValSinRNP").val("");
    }

    function extraer_descripReq(IdReq) {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/ExtraerDescripRequer',
            data: '{"IdRequerimiento": "' + IdReq + '","BienServicio": "B","empresa": "' + $("#id_empresa").val() + '" }',
            dataType: "json",
            success: function (response) {
                var customers = eval(response.d);

                $.each(customers, function () {

                    $("#concepto").val();

                    $("#concepto").val(this.Descripcion);

                });

            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });
    }

    function ActualizarSaldoCantidadyCostoRequerimiento() {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/ActualizarSaldoCantidadyCostoRequer',
            data: '{"CompraServicio": "C","empresa": "' + $("#id_empresa").val() + '" }',
            dataType: "json",
            success: function (response) {

            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });
    }

    function ActualizarSaldoCantidadyCostoRequerimientoEliminar() {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/ActualizarSaldoCantidadyCostoRequer_Eliminar',
            data: '{"IdOrdenCompra": "' + $("#id_orden").val() + '","CompraServicio": "C","empresa": "' + $("#id_empresa").val() + '" }',
            dataType: "json",
            success: function (response) {

            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });
    }

    function ActualizarCCyRequerimiento() {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/ActualizarCCyReq',
            data: '{"CompraServicio": "C","empresa": "' + $("#id_empresa").val() + '" }',
            dataType: "json",
            success: function (response) {

            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });
    }

    function Actualizar_Impuesto() {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/ActualizarImpuesto',
            data: '{"empresa": "' + $("#id_empresa").val() + '","CompraServicio": "C" }',
            dataType: "json",
            success: function (response) {

            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });
    }

    function Mensaje_Cabecera() {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/MSJCabecera',
            data: '{"empresa": "' + $("#id_empresa").val() + '"}',
            dataType: "json",
            success: function (response) {
                var customers = eval(response.d);

                $.each(customers, function () {

                    $("#MensajeCabecera").val(this.Mensajes)

                    //alert($("#MensajeCabecera").val());
                    

                });

            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });
    }

    function Mensaje_Detalle() {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/MSJDetalle',
            data: '{"empresa": "' + $("#id_empresa").val() + '"}',
            dataType: "json",
            success: function (response) {
                var customers = eval(response.d);

                $.each(customers, function () {

                    $("#MensajeDetalle").val(this.Mensajes)

                    if (($("#MensajeCabecera").val() != "Nueva Orden Grabada Ok..!!!") && ($("#MensajeDetalle").val() != "Item de Orden de Compra Insertado o Actualizado OK !!!")) {
                        //alert($("#MensajeCabecera").val());
                        alert($("#MensajeDetalle").val());
                    }
                    else if (($("#MensajeCabecera").val() != "Nueva Orden Grabada Ok..!!!") && ($("#MensajeDetalle").val() == "Item de Orden de Compra Insertado o Actualizado OK !!!")) {
                        //alert($("#MensajeCabecera").val());
                        alert($("#MensajeCabecera").val());
                    }
                    else if (($("#MensajeCabecera").val() == "Nueva Orden Grabada Ok..!!!") && ($("#MensajeDetalle").val() != "Item de Orden de Compra Insertado o Actualizado OK !!!")) {
                        //alert($("#MensajeCabecera").val());
                        alert($("#MensajeDetalle").val());
                    }
                    else if (($("#MensajeCabecera").val() == "Nueva Orden Grabada Ok..!!!") && ($("#MensajeDetalle").val() == "Item de Orden de Compra Insertado o Actualizado OK !!!")) {
                        alert($("#MensajeCabecera").val());
                        $("#ValGuardado").val("Guardado");
                        $("#ConfirGuardado").val("");
                        limpiarOrden();
                        $("#ProvSelect").val("P");
                        $("#cancelarrordencompra").click();
                        DatosOrdenes();
                        ActualizarCCyRequerimiento();
                        Actualizar_Impuesto();
                        listar_orden();
                    }

                });

            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });
    }

    function Listar_Proveedores() {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/listarProveedores',
            data: '{"Proveedor": "' + $("#BuscarProv").val() + '","empresa": "' + $("#id_empresa").val() + '"}',
            dataType: "json",
            success: function (response) {
                var customers = eval(response.d);
                var html = "<option value='P' selected></option>";

                $.each(customers, function () {

                    //<td> " + this.Estado + "</td>
                    html += "<option value='" + this.IdProveedor + "'  >" + this.RazonSocial + "</option>";

                });
                $("#Proveedor").html(html == "" ? "" : html);

            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });
    }

    function Listar_Proveedoresm() {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/listarProveedores',
            data: '{"Proveedor": "' + $("#BuscarProv").val() + '","empresa": "' + $("#id_empresa").val() + '"}',
            dataType: "json",
            success: function (response) {
                var customers = eval(response.d);
                var html = "<option value='P' selected></option>";

                $.each(customers, function () {

                    //<td> " + this.Estado + "</td>
                    html += "<option value='" + this.IdProveedor + "'  >" + this.RazonSocial + "</option>";

                });
                $("#Proveedorm").html(html == "" ? "" : html);

            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });
    }

    function Listar_Proveedoresmbuscar() {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/listarProveedoresbuscar',
            data: '{"IdProveedor": "' + $("#proveedor").val() + '","empresa": "' + $("#id_empresa").val() + '"}',
            dataType: "json",
            success: function (response) {
                var customers = eval(response.d);
                var html = "<option value='P' selected></option>";

                $.each(customers, function () {

                    if (this.IdProveedor == $("#proveedor").val())
                        razSoc = "selected";
                    else
                        razSoc = "";

                    html += "<option " + razSoc + " value='" + this.IdProveedor + "'  >" + this.RazonSocial + "</option>";


                });
                $("#Proveedorm").html(html == "" ? "" : html);

            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });
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

        Mostrar_Proveedor();

        $("#TipoDoc").val($("#IdTipoDocumento").val());
        $("#TipoProveedor").val($('#Proveedor').val());

        if ($("#ValSinRNP").val() == "SinRNP") {
            ExtraerFechaFinRNP();
        }

        $("#CerrarBuscarProv").click();

    }

    function listar_TProveedoresxOrdenes() {
        url = document.url;
        $("#body_ProvxOrdenes").html("<tr><td colspan=3><div align=center ><img src='../images/loader.gif'></div></td></tr>");
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/listarProveedoresxOrdenes',
            data: '{"CompraServicio": "C","RazonSocial": "' + $("#buscar_orden").val() + '","empresa": "' + $("#id_empresa").val() + '"}',
            dataType: "json",
            success: function (response) {
                var customers = eval(response.d);
                var html = "";
                var xnro = 1;
                $.each(customers, function () {

                    html += "<tr id='fila" + xnro +
                            "'  onclick=detalle_selectproveedor('" + this.IdProveedor + "','" + xnro + "') style='cursor:pointer'><td style='text-align:center'>"
                            + xnro + " </td><td style='text-align:center'>"
                            + this.IdProveedor + " </td><td style='text-align:left'> " + this.RazonSocial + "</td> </tr>";
                    xnro++;
                });
                $("#body_ProvxOrdenes").html(html == "" ? "<tr><td colspan='3'> <div align=center><br>No se encontraron resultados</div></td></tr>" : html);
            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });
        $("#buscar_orden").val("");
        listar_orden();
    }

    function detalle_selectproveedor(provord, u) {
        $('#T_ProvxOrdenes tr').removeClass('highlighted');
        $("#T_ProvxOrdenes #fila" + u).addClass('highlighted');

        $("#BuscarLocxOrd").modal();

        RazonSocial(provord);
        listar_ordenxProveedor(provord);

        $("#CerrarBP").click();
    }

    function RazonSocial(provord) {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/DatosProveedor',
            data: '{"IdProveedor": "' + provord + '","empresa": "' + $("#id_empresa").val() + '"}',
            dataType: "json",
            success: function (response) {
                var customers = eval(response.d);

                $.each(customers, function () {

                    $("#NombreProveedor").text(this.RazonSocial)

                });

            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });
    }

    function listar_TProveedoresM() {
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
                            "'  onclick=detalle_proveedorM('" + this.IdProveedor + "','" + xnro + "') style='cursor:pointer'><td style='text-align:center'>"
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

    function detalle_proveedorM(prov, u) {
        $('#TProveedores tr').removeClass('highlighted');
        $("#TProveedores #fila" + u).addClass('highlighted');

        $("#proveedor").val(prov);

        Mostrar_ProveedorM();

        $("#CerrarBuscarProv").click();

    }

    function validarLlenadoBP() {

        var buscarProveedor = $("#search_prov").val();
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

    function validarLlenadoBPM() {

        var buscarProveedorM = $("#Proveedorm").val();
        var contarM = buscarProveedorM.length;

        if (contarM >= '5') {
            ValidarBusquedaProvM();

            listar_TProveedoresM();

            $("#buscarprov").modal();
        }
        else if (contarM < '5') {
            alert("Ingrese 5 caracteres para buscar al proveedor")
        }
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

                    $("#search_prov").val(this.RazonSocial)
                    $("#proveedorModif").val(this.RazonSocial)

                });

            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });
    }

    function Mostrar_ProveedorM() {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/MostrarProveedor',
            data: '{"IdProveedor": "' + $("#proveedor").val() + '","empresa": "' + $("#id_empresa").val() + '"}',
            dataType: "json",
            success: function (response) {
                var customers = eval(response.d);

                $.each(customers, function () {

                    $("#proveedorModif").val(this.RazonSocial)

                });

            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });
    }

    function fechaSelect() {
        if ($("#FechaTipoCamb").val() > $("#FActual").val()) {
            //alert("Fecha no puede ser mayor");
            $("#FechaTipoCamb").val(fechaactual);
        }
    }

    function fechaSelectM() {
        if ($("#FechaTipoCambModif").val() > $("#FActualM").val()) {
            //alert("Fecha no puede ser mayor");
            $("#FechaTipoCambModif").val($("#FGuardada").val());
        }
    }

    function cerrar_modiforden() {
        $("#ModifNewOrdenCompra").hide();

        $("#AdicNewOrdenCompra").hide();

        $("#Cabec_OrdenCompra").show();
        $("#Tabla_CabeceraOrdenCompra").show();
        $("#Tabla_DetalleOrdenCompra").show();
    }

    function Cerrar() {
        $("#buscar").hide();
    }

    function LimpiarPrint() {
        $("#IdOrden1").val("");
        $("#IdOrden2").val("");

        $("#usuario").prop('checked', false);
        $("#logistica").prop('checked', false);
        $("#todos").prop('checked', true);
    }

    function datos_usuario() {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/datosusuario',
            data: '{}',
            dataType: "json",
            success: function (response) {
                var customers = eval(response.d);

                $.each(customers, function () {

                    $("#IdUsuario").val(this.IdUsuario)

                });

            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });
    }

    function QuitarMasivamente() {
        $("#Requerimiento").val("");
        $("#n").val("0");

        $("#tbody_ocpreq").html("");

        //validacion_certifOrdenes();
        listar_adicionar_requerimiento_detalle();
        $("#QuitarTodos").hide();
        document.getElementById("EnviarTodos").disabled = false;
        $("#guardarordencompra").hide();

    }

    $("#EnviarTodos").click(function () {
        $("#Requerimiento").val("EnvioMasivo");
    });

    function OrdenesAnuladas() {
        //Llenado Combo Ordenes Anuladas
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/listarOrdenesAnuladas',
            data: '{"CompraServicio": "C","empresa": "' + $("#id_empresa").val() + '"}',
            dataType: "json",
            success: function (response) {
                var customers = eval(response.d);
                var html = "<option value='S' selected></option>";

                $.each(customers, function () {

                    html += "<option value='" + this.IdOrdenCompra + "'  >" + this.IdOrdenCompra + "</option>";

                });
                $("#OrdenEliminada").html(html == "" ? "" : html);

            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });
    }

    function OrdenesActuales() {
        //Llenado Combo Ordenes Anuladas
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/listarOrdenesActual',
            data: '{"CompraServicio": "C","empresa": "' + $("#id_empresa").val() + '"}',
            dataType: "json",
            success: function (response) {
                var customers = eval(response.d);
                var html = "<option value='S' selected></option>";

                $.each(customers, function () {

                    html += "<option value='" + this.IdOrdenCompra + "'  >" + this.IdOrdenCompra + "</option>";

                });
                $("#OrdenActual").html(html == "" ? "" : html);

            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });
    }

    function Limpiar() {
        $("#IdOrdenCompraAnulada").val("");
        $("#IdOrdenCompraActual").val("");
    }

    function ActualizarWeb() {

        if ($("#buscar_orden").val() == "") {
            listar_orden();
        }
        else {
            Blistar_orden();
        }

    }

    function NroFilasxRequerimiento() {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/FilasxRequerimiento',
            data: '{"IdRequerimiento": "' + $("#search_ocreq").val() + '","BienServicio": "B","empresa": "' + $("#id_empresa").val() + '" }',
            dataType: "json",
            success: function (response) {
                var customers = eval(response.d);

                $.each(customers, function () {

                    $("#NroFilas").val(this.Filas)
                    $("#FlagEvaluado").val(this.FlagEvaluado)
                    $("#NroOrden").val(this.NroOrden)


                    if (($("#NroFilas").val() == "0") && ($("#FlagEvaluado").val() == "A")) {
                        alert("Requerimiento ya tiene Orden de Compra");

                        $("#search_ocreq").val("");

                        $("#cancelarrordencompra").click();

                        $("#buscar_orden").val($("#NroOrden").val())

                        Blistar_orden();

                    }
                    else if (($("#NroFilas").val() == "0") && ($("#FlagEvaluado").val() == "P")) {
                        alert("Requerimiento no se encuentra Evaluado");
                    }

                });

            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });
    }

    function consultaDocumento() {
        $("#Consulta_Documentos").click();

        $("#tipo_orden").val("O/C");
        $("#num_orden").val($("#id_orden").val());

        datos_ordenes();
    }

    function datos_ordenes() {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/datosConsultaDoc',
            data: '{"IdOrdenCompra": "' + $("#id_orden").val() + '","CompraServicio": "C","empresa": "' + $("#id_empresa").val() + '" }',
            dataType: "json",
            success: function (response) {
                var customers = eval(response.d);

                $.each(customers, function () {

                    $("#ruc_proveedor").val(this.IdProveedor)
                    $("#razonsocial_proveedor").val(this.RazonSocial)
                    $("#glosa_orden").val(this.Descripcion)

                });

            },
            error: function (a, b, c) {
                alert(a.responseText);
            }
        });
    }
    
</script>