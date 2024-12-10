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
        <link href="css/estilos2.css" rel="stylesheet" type="text/css"/>       
        <link rel="icon" href="https://maxiahorro.com.pe/wp-content/uploads/2021/06/favicon.ico">
        
       
        <title>MaxiAhorro</title>
        
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark custom-navbar">
            <!-- <nav class="navbar navbar-expand-lg" style="background-color: #000000;">-->
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>         
            <div class="nav-item dropdown">
                <a class="navbar-brand" style="color: white" href="#" data-toggle="dropdown"><img class="logo" src="https://images.weare365.io/filters:format(.webp)/1920x0/Maxi_ahorro_1517_6148d91102.png" width="100" height="60"></a>
                <div class="dropdown-menu nav-item bg-dark">  
                    <c:if test="${clientelogueado.id!=null&&clientelogueado.id!=0}">
                        <a class="nav-link dropdown-item" style="color: red" href="./Controlador?accion=Usuarios"><i class="fa fa-angle-right"></i> Usuarios</a>
                        <div class="dropdown-divider"></div> 
                        <c:if test="${clientelogueado.idrol==1}">
                            <a class="nav-link dropdown-item" style="color: red" href="./Controlador?accion=home"><i class="fa fa-angle-right"></i> Productos</a>                                                                         
                        </c:if>
                    </c:if>
                </div>
            </div>

            <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
                <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                    <li class="nav-item active">
                        <a class="nav-link" href="index.jsp"><i class="fas fa-home mr-1" style="color: white"></i>Principal<span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="./Controlador?txtBuscar=&accion=BuscarProducto"><i class="fas fa-cube mr-1" style="color: white"></i>Productos<span class="sr-only">(current)</span></a>
                    </li>
                    <!--<li class="nav-item dropdown">
                        <a class="nav-link" id="dropdownMenuButton" data-toggle="dropdown" href="./Controlador?accion=Nuevo"><i class="fas fa-sliders-h" style="color: white"></i> Categorias</a>
                        <div class="dropdown-menu nav-item bg-dark">
                    <c:forEach var="cat" items="${categorias}">
                        <a class="nav-link dropdown-toggle" href="Controlador?accion=ListarCategoria&idCat=${cat.id}"><i class="fa fa-angle-right"></i>${cat.categoria}</a>
                        <div class="dropdown-divider"></div>
                    </c:forEach>                          
                </div>
            </li>-->
                    <li class="nav-item active">
                        <a class="nav-link" href="./Controlador?accion=Oferta"><i class="fas fa-plus-circle mr-1" style="color: white"></i> Ofertas</a>
                    </li>                   
                    <li class="nav-item active">
                        <a class="nav-link" href="./Controlador?accion=carrito"><i class="fas fa-cart-plus mr-1" style="color: white">(<label style="color:darkorange">${cont}</label>)</i> Carrito</a>
                    </li>                               
                </ul>   
                <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                    <form action="Controlador" class="form-inline my-2 my-lg-0">
                        <input placeholder="Buscar" class="form-control mr-sm" name="txtBuscar" style="border: 1px solid #ccc;" onfocus="this.style.borderColor = '#FFD700'" onblur="this.style.borderColor = '#ccc'">

                        <button class="btn my-2 my-sm-0 ml-2" style="background-color: #FFD700; color: black;" type="submit" name="accion" value="BuscarProducto">
                            <i class="fas fa-search"></i> Buscar </button>
                    </form>  
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
                            <a class="dropdown-item" href="#"><img src="img/inises.png" width="60" height="60"/></a>                        
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

        <main>
            <div class="slideshow-container full-width">
                <div class="mySlides fade">
                    <img src="https://maxiahorro.com.pe/wp-content/uploads/2021/07/catalogobanner.jpg" style="width:100%">
                </div>
                <div class="mySlides fade">
                    <img src="https://maxiahorro.com.pe/wp-content/uploads/2024/09/ContraEspecial_BannerWeb_Maxi.jpg" style="width:100%">
                </div>
                <div class="mySlides fade">
                    <img src="https://maxiahorro.com.pe/wp-content/uploads/2024/09/BannerWeb_MaxiSORTEOLIMA.jpg" style="width:100%">
                </div>
                <div class="mySlides fade">
                    <img src="https://maxiahorro.com.pe/wp-content/uploads/2024/09/BannerWeb_MaxiLIMASORTEO.jpg" style="width:100%">
                </div>
                <div class="mySlides fade">
                    <img src="https://maxiahorro.com.pe/wp-content/uploads/2021/06/contactonew.jpg" style="width:100%">
                </div>
                <div class="mySlides fade">
                    <img src="https://maxiahorro.com.pe/wp-content/uploads/2021/06/merkatnew.jpg" style="width:100%">
                </div>

                <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
                <a class="next" onclick="plusSlides(1)">&#10095;</a>
            </div>
            <br>

            <div style="text-align:center">
                <span class="dot" onclick="currentSlide(1)"></span>
                <span class="dot" onclick="currentSlide(2)"></span>
                <span class="dot" onclick="currentSlide(3)"></span>
                <span class="dot" onclick="currentSlide(4)"></span>
                <span class="dot" onclick="currentSlide(5)"></span>
                <span class="dot" onclick="currentSlide(6)"></span>
            </div>

            <div class="features">
                <div class="feature">
                    <img src="https://w7.pngwing.com/pngs/38/434/png-transparent-computer-icons-delivery-miscellaneous-angle-service-thumbnail.png" alt="Entrega gratis">
                    <p>Entrega gratis<br>A tu puerta</p>
                </div>
                <div class="feature">
                    <img src="https://cdn-icons-png.flaticon.com/512/4230/4230763.png" alt="Atención al cliente">
                    <p>A tu disposición<br>Asistencia online 24/7</p>
                </div>
            </div>
        </main><br>
        <section class="hero">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-md-6 mb-4 mb-md-0">
                        <h1 class="display-4 fw-bold mb-4">Nuestra Empresa</h1>
                        <p class="lead mb-4">Somos una empresa líder en soluciones innovadoras, comprometida con la excelencia y la satisfacción del cliente. Con años de experiencia en el mercado, nos enorgullece ofrecer productos y servicios de la más alta calidad.</p>
                        <a href="acercade.jsp" class="btn btn-lg m-0" style="background-color: red; color: white" sy>Conoce más sobre nosotros</a>
                    </div>
                    <div class="col-md-6">
                        <img src="https://peruretail.sfo3.cdn.digitaloceanspaces.com/wp-content/uploads/maxiahorro-sechura.jpeg" alt="Imagen representativa de la empresa" class="img-fluid hero-image w-100">
                    </div>
                </div>
            </div>
        </section>
        
         <footer>
        <div class="footer-container">
            <div class="footer-column">
                <h2>MAXIAHORRO</h2>
                <p>¿Necesitas ayuda?</p>
                <p>Visita <a href="#">Atención al Cliente</a> para ayuda o llámanos al</p>
                <p><strong>+51 956695969-108</strong></p>
            </div>
            <div class="footer-column">
                <h3>Menú</h3>
                <p>Ofertas</p>
                <p>Inicio de sesión</p>
                <p>Atención del cliente</p>
                <p>Acerca de nosotros</p>
                <p>Registro</p>
            </div>
            <div class="footer-column">
                <h3>Categorías</h3>
                <p>Abarrotes</p>
                <p>Bebidas</p>
                <p>Congelados</p>
                <p>Lacteos</p>
                <p>Desayunos, etc</p>
            </div>
            <div class="footer-column">
                <h3>Info</h3>
                <p>Acerca de</p>
                <p>Atención al cliente</p>
                <p>Ubicaciones</p>
            </div>
            <div class="footer-column">
                <h3>Mi elección</h3>
                <p>Favoritos</p>
                <p>Mis pedidos</p>
            </div>
        </div>
        <div class="footer-bottom">
            <div class="social-media">
                <a href="https://www.facebook.com/MaxiahorroPE" target="_blank"><img src="img/facebook.png" alt="Facebook"></a>
                <a href="https://maps.app.goo.gl/sb6BbfKuRJXRPagY6" target="_blank"><img src="img/mapsg.png" alt="google maps"></a>
                <a href="#" target="_blank"><img src="img/WhatsApp.svg.png" alt="whatsapp"></a>
            </div>
            <div class="footer-links">
                <a href="#">Envío y devoluciones</a>
                <a href="#">Términos y condiciones</a>
                <a href="#">Métodos de pago → → →</a>
            </div>
            <div class="payment-methods">
                <img src="img/master.png" alt="Mastercard">
                <img src="img/america.png" alt="American Express">
                <img src="img/pay.png" alt="PayPal">
                <img src="img/vis.jpg" alt="Visa">
            </div>
        </div>
    </footer>

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
        <script src="js/funcionregistro.js" type="text/javascript">
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
        <script src="js/principal.js" type ="text/javascript"></script>
    </body>
</html>
