/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author kelly
 */
public class NoticiasDAO {
    Connection conexion;
    
    public NoticiasDAO(){
      Conexion con = new Conexion();
      conexion = con.getConexion();
    }
    
    public List<Noticias> listarNoticias(){
       PreparedStatement ps;
       ResultSet rs;
       
       List<Noticias> lista = new ArrayList<>();
       
       try{
           ps = conexion.prepareStatement("SELECT * FROM noticias");
           rs = ps.executeQuery();
           
           while(rs.next()){
               int idnota = rs.getInt("idnota");
               String nota = rs.getString("nota");
               Timestamp fecha = rs.getTimestamp("fecha");
               int idusuariointerno = rs.getInt("idusuariointerno");
               
               Noticias noticia = new Noticias(idnota, nota, fecha, idusuariointerno);
               
               lista.add(noticia);
                
           }
           
           return lista;
       } catch(SQLException e){
           System.out.println(e.toString());
           return null;
       }
    }
    
    public Noticias mostrarNoticia(int _idnota){
       PreparedStatement ps;
       ResultSet rs;
       
       Noticias noticia = null;
       
       try{
           ps = conexion.prepareStatement("SELECT * FROM noticias WHERE idnota=? ");
           ps.setInt(1,_idnota);
           rs = ps.executeQuery();
           
           while(rs.next()){
               int idnota = rs.getInt("idnota");
               String nota = rs.getString("nota");
               Timestamp fecha = rs.getTimestamp("fecha");
               int idusuariointerno = rs.getInt("idusuariointerno");
               
               noticia = new Noticias(idnota, nota,fecha, idusuariointerno);
               
              
                
           }
           
           return noticia;
       } catch(SQLException e){
           System.out.println(e.toString());
           return null;
       }
    }
    
    public boolean  insertar(Noticias noticia){
       PreparedStatement ps;
     
      
       try{
           ps = conexion.prepareStatement("INSERT INTO noticias (idnota,nota,idusuariointerno) VALUES(?,?,?)");
           ps.setString(1,noticia.getNota());
            ps.setInt(2,noticia.getIdnota());
             ps.setInt(3,noticia.getIdusuariointerno());
             
            ps.execute();
           

           return true;
       } catch(SQLException e){
           System.out.println(e.toString());
           return false;
       }
    }

}
