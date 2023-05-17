/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import java.sql.Date;
import java.sql.Timestamp;

/**
 *
 * @author kelly
 */
public class Noticias {
    
    private int idnota, idusuariointerno ;
    private String nota;
    private Timestamp fecha;
    
    public Noticias(int idnota, String nota,Timestamp fecha, int idusuariointerno){
        this.idnota = idnota;
        this.nota = nota;
        this.fecha = fecha;
        this.idusuariointerno = idusuariointerno;
    }

    public Noticias(int idnota, String nota, int idusuariointerno) {
        this.idnota = idnota;
        this.nota = nota;
        
        this.idusuariointerno = idusuariointerno;
    }

    public int getIdnota() {
        return idnota;
    }

    public void setIdnota(int idnota) {
        this.idnota = idnota;
    }

    public int getIdusuariointerno() {
        return idusuariointerno;
    }

    public void setIdusuariointerno(int idusuariointerno) {
        this.idusuariointerno = idusuariointerno;
    }

    public String getNota() {
        return nota;
    }

    public void setNota(String nota) {
        this.nota = nota;
    }

    public Timestamp getFecha() {
        return fecha;
    }
    
    public void setFecha(Timestamp fecha) {
        this.fecha = fecha;
    }
    

   
    
    
    
}
