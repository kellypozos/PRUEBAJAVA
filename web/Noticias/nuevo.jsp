<%-- 
    Document   : nuevo
    Created on : May 5, 2023, 7:58:58 PM
    Author     : kelly
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Noticias</title>
    </head>
    <body>
        <h2>Nueva nota</h2>
        
       
        
        <form action="NoticiasController?accion=insertar" method="POST" autocomplete="off">
            <p>
                Id:
                <input id="idnota" name="idnota" type="number" />
            </p>
            <p>
                Nota:
                <input id="nota" name="nota" type="text" />
            </p>
           
            <p>
                Id usuario interno:
                <input id="idusuariointerno" name="idusuariointerno" type="number" />
            </p>
            
            <button id="guardar" name="guardar" type="submit">Publicar</button>
        </form>
    </body>
</html>
