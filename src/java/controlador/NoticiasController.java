/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Noticias;
import modelo.NoticiasDAO;

/**
 *
 * @author kelly
 */
@WebServlet(name = "NoticiasController", urlPatterns = {"/NoticiasController"})
public class NoticiasController extends HttpServlet {
  

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        NoticiasDAO noticiasDAO = new NoticiasDAO();
        String accion;
        RequestDispatcher dispatcher = null;
        accion = request.getParameter("accion");
        
        if(accion == null || accion.isEmpty()){
            dispatcher = request.getRequestDispatcher("Noticias/index.jsp");
            List<Noticias> listaNoticias = noticiasDAO.listarNoticias();
            request.setAttribute("lista", listaNoticias);
        } else if("nuevo".equals(accion)) {
            dispatcher = request.getRequestDispatcher("Noticias/nuevo.jsp");
        }
        else if("insertar".equals(accion)) {
            
            String nota = request.getParameter("nota");
            int idnota = Integer.parseInt(request.getParameter("idnota"));
            int idusuariointerno = Integer.parseInt(request.getParameter("idusuariointerno"));
           
            
            Noticias noticia = new Noticias(idnota,nota,idusuariointerno);
            
            noticiasDAO.insertar(noticia);
            dispatcher = request.getRequestDispatcher("Noticias/index.jsp");
            List<Noticias> listaNoticias = noticiasDAO.listarNoticias();
            request.setAttribute("lista", listaNoticias);
        }
        
        
        dispatcher.forward(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
