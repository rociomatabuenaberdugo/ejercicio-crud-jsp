<%-- 
    Document   : CRUDUsu
    Created on : 22-mar-2018, 1:45:42
    Author     : Roframa Matber
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

    <title></title>
  </head>
  <body>
		<div class="container">
			<br><br>			
      <div class="panel panel-primary">
        <div class="panel-heading text-center"><h2>Usuarios de "Mundo Cartas"</h2></div>
    <%
      Class.forName("com.mysql.jdbc.Driver");
      Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3309/mundo_cartas", "root", "");
      Statement s = conexion.createStatement();
      ResultSet listadoCliente = s.executeQuery("SELECT * FROM usuario");
    %>

    <table class="table table-striped">
      <tr><th>Código usuario</th><th>Nombre</th><th>Correo electrónico</th><th>Contraseña</th><th>Fecha de nacimiento</th></tr>
          <%          while (listadoCliente.next()) {
              out.println("<tr><td>");
              out.println(listadoCliente.getString("CodUsu") + "</td>");
              out.println("<td>" + listadoCliente.getString("NomUsu") + "</td>");
              out.println("<td>" + listadoCliente.getString("CorEleUsu") + "</td>");
              out.println("<td>" + listadoCliente.getString("ConUsu") + "</td>");
              out.println("<td>" + listadoCliente.getString("FecNacUsu") + "</td>");

          %>
      <td>
        <form id="modificar" name="modificar" method="get" action="modificaSocio.jsp">
          <input type="hidden" name="codigoUsu" value="<%=listadoCliente.getString("CodUsu")%>" >
          <input type="hidden" name="nombre" value="<%=listadoCliente.getString("NomUsu")%>" >
          <input type="hidden" name="email" value="<%=listadoCliente.getString("CorEleUsu")%>" >
          <input type="hidden" name="contraseña" value="<%=listadoCliente.getString("ConUsu")%>" >
          <input type="hidden" name="fechanac" value="<%=listadoCliente.getString("FecNacUsu")%>" >
          <button type="submit"  class="btn btn-info"><span class="glyphicon glyphicon-pencil"></span> Modificar</button>
        </form>
      </td>
      <td>
        <form method="get" action="borraUsuario.jsp">
          <input type="hidden" name="codigoUsu" value="<%=listadoCliente.getString("CodUsu")%>" >
          <button type="submit" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span>Eliminar</button>
        </form>
      </td>
    </tr>
    <%
      }

    %>
  </table>