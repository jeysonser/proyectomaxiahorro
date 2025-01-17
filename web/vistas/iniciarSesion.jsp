<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
        <link href="http://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>        
        <title>Carrito de Compras</title>
        <style>

            .nav-pills .nav-link {
                font-size: 1.2rem; /* Aumentar tamaño de texto de las pestañas */
                padding: 10px 20px; /* Incrementar tamaño del botón */
            }
            .nav-pills .nav-link {
                font-size: 18px;
                padding: 10px 15px;
                background-color: #eaeaea; /* Fondo predeterminado */
                color: #333; /* Color de texto predeterminado */
                border-radius: 5px; /* Bordes redondeados */
                transition: all 0.3s ease; /* Transición suave */
            }
            .nav-pills .nav-link.active {
                background-color: red; /* Cambiar a verde (puedes elegir otro color) */
                color: white; /* Texto blanco */
                font-weight: bold; /* Resaltar la pestaña activa */
            }
            .nav-pills .nav-link:hover {
                background-color: #ddd; /* Fondo al pasar el cursor */
                color: #000; /* Color de texto */
            }
            .btn-container {
                text-align: center; /* Alineación centrada */
                margin-top: 10px; /* Espaciado superior */
            }
            .btn-custom {
                padding: 12px 30px; /* Ajustamos el tamaño del botón */
                font-size: 1.2rem; /* Aumentamos el tamaño del texto */
                border-radius: 8px; /* Bordes redondeados */
                transition: all 0.3s ease;
                color: white;/* Transición suave en hover */
            }
            .btn-custom:hover {
                background-color: #ff3b25; /* Color de fondo más oscuro */
                color: #fff; /* Color del texto blanco */
                transform: scale(1.05); /* Pequeño aumento en tamaño */
            }
            /* Estilo para mover el texto debajo */
            input[type="file"]::-webkit-file-upload-button {
                margin-bottom: 10px; /* Espacio entre el botón y el texto */
            }

            input[type="file"] {
                display: block; /* Asegura que el texto quede en una nueva línea */
                margin-bottom: 5px; /* Margen inferior para separación */
            }
        </style>
    </head>
    <body>
        <div class="pr-2 pt-1">                         
            <button type="button" class="close" data-dismiss="modal">
                <span aria-hidden="true">&times;</span>
            </button>                    
        </div>
        <div class="custom-container">
            <div class="modal-header text-center">                      
                <ul class="nav nav-pills">                           
                    <li class="nav-item">
                        <a class="nav-link active mr-3 ml-3" data-toggle="pill" href="#pills-iniciar">Iniciar Sesion</a>
                    </li>
                    <c:if test="${clientelogueado.id==null||clientelogueado.id==0}">
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="pill" href="#pills-registrar">Registrarse</a>
                        </li>    
                    </c:if>
                </ul>  
            </div>
        </div>
        <div class="modal-body"> 
            <div class="tab-content" id="pills-tabContent">
                <!-- Iniciar Session -->
                <div class="tab-pane fade show active" id="pills-iniciar" role="tabpanel">
                    <form action="Controlador">
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="inputGroup-sizing-default"><i class="fas fa-at"></i></span>
                            </div>
                            <input type="text" name="txtemail" required="" class="form-control" placeholder="example@gmail.com" >
                        </div>                                                   
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="inputGroup-sizing-default"><i class="fa fa-unlock-alt"></i></span>
                            </div>
                            <input type="password" name="txtpass" required=""  class="form-control" placeholder="12345678">
                        </div>                     
                        <div class="ml-auto po">
                            <button type="submit" name="accion" value="Validar" class="btn btn-custom ml-5" style="background-color: red;"><i class="fa fa-save"></i> Iniciar Session</button>
                        </div>
                    </form>
                </div>
                <!-- Registrarse -->
                <div class="tab-pane fade" id="pills-registrar" role="tabpanel">
                    <form action="Controlador?accion=Registrarse" method="POST" enctype="multipart/form-data">                             
                        <div class="modal-body">
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="inputGroup-sizing-default"><i class="far fa-address-card"></i></span>
                                </div>
                                <input type="number" id="dni" name="txtDni" class="form-control" placeholder="46184659">
                            </div>                                                   
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="inputGroup-sizing-default"><i class="fa fa-user-plus"></i></span>
                                </div>
                                <input type="text" name="txtNom" class="form-control" placeholder="Nombres Apellidos">
                            </div>                                                   
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="inputGroup-sizing-default"><i <i class="fas fa-street-view"></i></span>
                                </div>
                                <input type="text" name="txtDir" class="form-control" placeholder="Av. Los Almaos N°356">
                            </div>                                                   
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="inputGroup-sizing-default"> <i class="fas fa-envelope-open-text"></i></span>
                                </div>
                                <input type="email" name="txtCorreo" class="form-control" placeholder="example@gmail.com" >
                            </div>                                                   
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="inputGroup-sizing-default"><i class="fa fa-unlock-alt"></i></span>
                                </div>
                                <input type="password" name="txtPass" class="form-control" value="12345678">
                            </div> 
                            <div class="input-group mb-3">

                                <!-- <div class="input-group-prepend">
                                     <span class="input-group-text" id="inputGroup-sizing-default"><i class="fas fa-cloud-upload-alt"></i></span>
                                 </div>-->
                                <input type="file" name="file" class="form-control-file">
                               
                            </div>     
                            <div class="ml-auto po">
                                <button type="submit" name="accion" value="Registrarse" class="btn  btn-custom ml-5" style="background-color: red;"><i class="fa fa-save"></i> Guardar</button>
                            </div>
                        </div>   
                    </form>
                </div>                       
            </div>  
        </div>

        <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="http://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js">
        </script>
        <script>
            $(document).ready(function () {
                var input = document.getElementById('dni');
                input.addEventListener('input', function () {
                    if (this.value.length > 8)
                        this.value = this.value.slice(0, 8);
                })
            });
        </script>
    </body>
</html>
