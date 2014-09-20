package controlador.datatypes;


import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

public class DataCategoria {
    
    private String nombre;
    private DataCategoria padre;
    private Map<String,DataEspecificacionProducto> listaProductos;
    
    public DataCategoria() {
        
    }
       
    public DataCategoria(String nombre, DataCategoria padre) {
        this.nombre = nombre;
        this.padre = padre;
    }

    public String getNombre() {
        return nombre;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public DataCategoria getPadre() {
        return padre;
    }
    
    public void setPadre(DataCategoria padre) {
        this.padre = padre;
    }
    
    public Map<String,DataEspecificacionProducto> getListaProductos() {
        return this.listaProductos;
    }
    
    public void setListaProductos(Map<String,DataEspecificacionProducto> productos) {
        this.listaProductos = productos;
    }
    
    @Override
    public String toString() {
        return this.getNombre() + "  --  " + this.getPadre();
    }

    public boolean tienePadre() {
        return this.padre != null;
     }
    
}
