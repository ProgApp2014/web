/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador.datatypes;

import java.util.Date;

/**
 *
 * @author dario
 */
public class DataEstadosOrdenesWS {
    private Integer id;
    
    private DataOrdenCompraWS orden;
    
    private Integer estado;
    
    private Date fecha;
    
    public DataEstadosOrdenesWS(){}
    
    public DataEstadosOrdenesWS(Integer id, DataOrdenCompraWS orden, Integer estado, Date fecha) {
        this.id = id;
        this.orden = orden;
        this.estado = estado;
        this.fecha = fecha;
    }
    
    public Integer getId() {
        return id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    
    public DataOrdenCompraWS getOrden() {
        return orden;
    }
    
    public void setCliente(DataOrdenCompraWS orden) {
        this.orden = orden;
    }
    
    public Integer getEstado() {
        return estado;
    }
    
    public void setEstado(Integer estado) {
        this.estado = estado;
    }
    
    public Date getFecha() {
        return fecha;
    }
    
    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }
}
