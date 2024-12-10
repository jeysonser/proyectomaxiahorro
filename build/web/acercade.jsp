<%@page import="utp.edu.pe.modelo.Carrito"%>
<%@page import="utp.edu.pe.modelo.Producto"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
        <link href="../css/acercade.css" rel="stylesheet" type="text/css"/>
        <link rel="icon" href="https://maxiahorro.com.pe/wp-content/uploads/2021/06/favicon.ico">
        <title>Acerca de Nosotros</title>
        <style>

            .hero-image {
                background-image: url('https://eltiempope36ae5.zapwp.com/wp-content/uploads/2024/06/maxi-ahorro-co-1024x512.jpg');
                background-size: cover;
                background-position: center;
                height: 80vh;
                display: flex;
                align-items: center;
                justify-content: center;
            }
            .hero-text {
                text-align: center;
                color: white;
                background-color: rgba(0, 0, 0, 0.5);
                padding: 2rem;
            }
            .section-card {
                background-color: #fff172;
                border-radius: 0.5rem;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                padding: 2rem;
                margin-bottom: 2rem;
            }
            .section-title {
                color: rgb(254, 73, 73);
                font-size: 2rem;
                font-weight: bold;
                text-align: center;
                margin-bottom: 1rem;
            }
            .section-content {
                color: #4a4a4a;
                text-align: center;
            }
            .contact-button {
                background-color: #ff4141;
                border-color: #ff6b6b;
                transition: all 0.3s ease;
            }
            .contact-button:hover {
                background-color: #ff5252;
                border-color: #ff5252;
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark custom-navbar" style="background-color:red" >
            <!-- <nav class="navbar navbar-expand-lg" style="background-color: #000000;">-->
            <button class="navbar-toggler active" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon active"></span>
            </button>         
            <div class="nav-item dropdown">
                <a class="navbar-brand" style="color: white" href="#" data-toggle="dropdown"><img class="logo" src="https://images.weare365.io/filters:format(.webp)/1920x0/Maxi_ahorro_1517_6148d91102.png" width="100" height="60"></a>
                <div class="dropdown-menu nav-item bg-dark">  
                    <c:if test="${clientelogueado.id!=null&&clientelogueado.id!=0}">
                        <a class="nav-link dropdown-item" style="color: #005AFF" href="./Controlador?accion=Usuarios"><i class="fa fa-angle-right"></i> Usuarios</a>
                        <div class="dropdown-divider"></div> 
                        <c:if test="${clientelogueado.idrol==1}">
                            <a class="nav-link dropdown-item" style="color: #005AFF" href="./Controlador?accion=Productos"><i class="fa fa-angle-right"></i> Productos</a>                                                                         
                        </c:if>
                    </c:if>
                </div>
            </div>

            <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
                <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                    <li class="nav-item active">
                        <a class="nav-link" href="index.jsp"><i class="fas fa-home mr-1" style="color: white"></i>Principal<span class="sr-only">(current)</span></a>
                    </li>
                </ul>
                <ul class="navbar-nav btn-group my-2 my-lg-0" role="group">
                    <c:if test="${clientelogueado.id==null||clientelogueado.id==0}">
                        <a style="color: white; cursor: pointer" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="fas fa-user-tie"></i> Iniciar Sesion</a> 
                        </c:if>                                              
                        <c:if test="${clientelogueado.id!=null&&clientelogueado.id!=0}">
                        <a style="color: white; cursor: pointer" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="fas fa-user-tie"></i> ${clientelogueado.nombres}</a>  
                        </c:if>    
                    <div class="dropdown-menu text-center dropdown-menu-right">
                        <c:if test="${clientelogueado.id==null||clientelogueado.id==0}">
                            <a class="dropdown-item" href="#"><img src="../img/inises.png" width="60" height="60"/></a>                        
                            <a class="dropdown-item" onclick="CargarModalLogueo()">Iniciar Sesion</a> 
                        </c:if>                                              
                        <c:if test="${clientelogueado.id!=null&&clientelogueado.id!=0}">
                            <a class="dropdown-item" href="#"><img src="${clientelogueado.foto}" width="60" height="60"/></a>                       
                            <a class="dropdown-item" onclick="CargarModalLogueo()">${clientelogueado.email}</a>  
                        </c:if>                      
                        <div class="dropdown-divider"></div>
                        <c:if test="${clientelogueado.id!=null&&clientelogueado.id!=0}">
                            <a class="dropdown-item" href="./Controlador?accion=MisCompras">Mis Compras</a> 
                        </c:if>  
                        <c:if test="${clientelogueado.id==null||clientelogueado.id==0}">                            
                            <a class="dropdown-item" onclick="CargarModalLogueo()">Mis Compras</a> 
                        </c:if>   
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="./Controlador?accion=Salir"> <i class="fas fa-arrow-right"> Salir</i></a>                        
                    </div>
                </ul>     
            </div>
        </nav>

        <header class="hero-image">
            <div class="hero-text">
                <h1 class="display-4">Maxiahorro</h1>
                <p class="lead">Descubre nuestra historia, misión y valores</p>
            </div>
        </header>

        <main class="container my-5">
            <section id="historia" class="section-card ">
                <h2 class="section-title">Nuestra Historia</h2>
                <p class="section-content">
                  MaxiAhorro inició hace más de dos décadas en la ciudad de Ica, Perú, como una 
                  tienda familiar enfocada en ofrecer productos de alta calidad a precios accesibles. 
                  Desde sus inicios, MaxiAhorro se ganó el reconocimiento de la comunidad por su 
                  compromiso con el ahorro y la calidad, convirtiéndose en una opción confiable para 
                  las familias de la región.Con el tiempo, la empresa ha crecido significativamente, 
                  ampliando su oferta de productos y mejorando sus instalaciones para brindar una 
                  experiencia de compra cómoda y eficiente.  Su horario de atención, de 8:00 AM a 9:00 PM 
                  todos los días, asegura la conveniencia para todos sus clientes.
                </p>
            </section>

            <div class="row">
                <div class="col-md-4">
                    <div class="section-card">
                        <h2 class="section-title">Misión</h2>
                        <p class="section-content">
                            Ofrecer productos de calidad a precios accesibles, 
                            garantizando una experiencia de compra satisfactoria, con un servicio excepcional 
                            y un compromiso constante con el ahorro y la satisfacción de nuestros clientes.
                        </p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="section-card">
                        <h2 class="section-title">Visión</h2>
                        <p class="section-content">
                            Ser la tienda líder en ahorro y calidad en el Perú, reconocida por su innovación, 
                            excelencia en el servicio y compromiso con el desarrollo sostenible, consolidándonos 
                            como la primera opción para las familias peruanas.
                        </p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="section-card">
                        <h2 class="section-title">Valores</h2>
                        <p class="section-content">
                            MaxiAhorro se enfoca en el compromiso con el cliente, la calidad de sus productos, 
                            la innovación constante, la responsabilidad social y ambiental, el trabajo en equipo, 
                            el ahorro, la honestidad y la excelencia en el servicio.
                        </p>
                    </div>
                </div>
            </div>

            <section id="contactanos" class="section-card">
                <h2 class="section-title">Contáctanos</h2>
                <div class="row text-center">
                    <div class="col-md-4">
                        <h3>Teléfono</h3>
                        <p><a href="tel:+123456789" class="text-decoration-none">963736371</a></p>
                    </div>
                    <div class="col-md-4">
                        <h3>Correo</h3>
                        <p><a href="mailto:info@kabannos.com" class="text-decoration-none">info@MaxiAhorro.com</a></p>
                    </div>
                    <div class="col-md-4">
                        <h3>Ubicación</h3>
                        <p>C. Callao 244, Ica 11002</p>
                    </div>
                </div>
            </section>

            <section id="ubicanos" class="">
                <h2 class="section-title">Ubícanos</h2>
                <div class="embed-responsive embed-responsive-16by9">
                    <iframe class="embed-responsive-item" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3870.2567765122335!2d-75.73167232513805!3d-14.06200878636299!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x9110e2bc68a9cab1%3A0x1c88f9c2e774e393!2sMaxi%20Ahorro!5e0!3m2!1ses-419!2spe!4v1731686214042!5m2!1ses-419!2spe" allowfullscreen></iframe>
                </div>
            </section>
        </main>

        <!-- Modal1 Iniciar Session o Registrarse -->
        <div class="modal fade" id="myModalLogueo1" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="container col-lg-9">                   
                    <div class="modal-content" id="contenido1">                   
                        <!--Aqui el Contenido de Login y Registro-->
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal Iniciar Session o Registrarse -->
        <div class="modal fade" id="myModalLogueo" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="container col-lg-9">                   
                    <div class="modal-content" id="contenido">                   
                        <!--Aqui el Contenido de Login y Registro-->
                    </div>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="../js/funcionregistro.js" type="text/javascript">
        </script>
        <script  type="text/javascript">
            function CargarModalLogueo() {
                //document.getElementById("contenido").innerHTML = "";
                $("#myModalLogueo").modal('show');
                $("#contenido").load("Controlador?accion=IniciarSession");
            }
        </script>
        <script  type="text/javascript">
            function CargarModalLogueo1() {
                //document.getElementById("contenido").innerHTML = "";
                $("#myModalLogueo1").modal('show');
                $("#contenido1").load("Controlador?accion=IniciarSession");
            }
        </script>
        <script  type="text/javascript"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
