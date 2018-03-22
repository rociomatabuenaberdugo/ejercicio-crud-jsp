<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cartas</title>
        <link rel="shortcut icon" type="image/x-icon" href="imagenes/2115mancuerna.ico">
        <link rel="stylesheet" type="text/css" href="estilos.css">
    </head>
    <body>
        <div id="titulo">Tu colección de cartas</div>
        <%
          Class.forName("com.mysql.jdbc.Driver");
          Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3309/mundo_cartas","root", "");
          Statement s = conexion.createStatement();
          ResultSet listadoCartas = s.executeQuery ("SELECT * FROM cartas");
          
        %>
        
        <table>
            <tr><th>Código carta</th><th>Nombre de la carta</th><th>Colección a la que pertenece</th></tr>
        <%
          while (listadoCartas.next()) {
            out.println("<tr><td>");
            out.println(listadoCartas.getString("codCar") + "</td>");
            out.println("<td>" + listadoCartas.getString("nomCar") + "</td>");
            out.println("<td>" + listadoCartas.getString("perteneceA") + "</td>");
          }
        %>
        </tr>
        </table>
        
            <a href="index.jsp" class="btn btn-primary"><span class="glyphicon glyphicon-home"></span> Página principal</a>
    <a href="menuUsuario.jsp" class="btn btn-primary"><span class="glyphicon glyphicon-home"></span> Menú usuario</a>
    </body>
</html>