/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador.clases;

import Controlador.DataTypes.DataCategoria;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author rodro
 */
public class indexControladora {

    private List<DataCategoria> l;
    private String error;
    
    public indexControladora() {

        
        try {

          l =  ProxyProducto.getInstance().listarCategorias();
        } catch (Exception e) {
            error = e.getMessage();
        }
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

    public List<DataCategoria> getL() {
        return l;
    }

    public void setL(List<DataCategoria> l) {
        this.l = l;
    }
}
