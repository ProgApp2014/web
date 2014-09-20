package controlador.datatypes;


import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

public class DataCategoriaWS {
    
    private String nombre;
    private DataCategoriaWS padre;
    private Map<String,DataEspecificacionProductoWS> listaProductos;
    
    public DataCategoriaWS() {
        
    }
       
    public DataCategoriaWS(String nombre, DataCategoriaWS padre) {
        this.nombre = nombre;
        this.padre = padre;
    }

    public String getNombre() {
        return nombre;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public DataCategoriaWS getPadre() {
        return padre;
    }
    
    public void setPadre(DataCategoriaWS padre) {
        this.padre = padre;
    }
    
    public Map<String,DataEspecificacionProductoWS> getListaProductos() {
        return this.listaProductos;
    }
    
    public void setListaProductos(Map<String,DataEspecificacionProductoWS> productos) {
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
