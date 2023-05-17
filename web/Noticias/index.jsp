<%-- 
    Document   : index
    Created on : May 5, 2023, 7:58:27 PM
    Author     : kelly
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Noticias</title>
    </head>
    <body>
            <h1>Noticias</h1>
            
            <a href ="NoticiasController?accion=nuevo">Nueva nota</a>
            <br /> <br />
            <table>
                <thead>
                    <tr>
                        <th>Noticia</th>
                        <th>Fecha</th>
                        <th>Usuario</th>
                    </tr>
                </thead>
                
                <tbody>
                    
                    <c:forEach var="noticia" items="${lista}">
                        <tr>
                            <td><c:out value="${noticia.nota}" /></td>
                            <td><c:out value="${noticia.fecha}" /></td>
                            <td><c:out value="${noticia.idusuariointerno}" /></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
    </body>
</html>
