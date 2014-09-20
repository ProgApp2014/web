package controlador.datatypes;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DataEspecificacionProductoWS {
    
    private String nroReferencia;
    private String nombre;
    private String descripcion;
    private Map<String,String> especificacion;
    private Float precio;
    private DataProveedorWS proveedor;
    private List<String> imagenes;
    private List<DataCategoriaWS> categorias;
    private List<DataProductoWS> productos;
    
    public DataEspecificacionProductoWS() {

    }
    
    public DataEspecificacionProductoWS(String nroReferencia, String nombre, String descripcion, Map<String,String> especificacion, Float precio, DataProveedorWS proveedor, ArrayList<String> imagenes, ArrayList<DataCategoriaWS> categorias,List<DataProductoWS> productos) {
        this.nroReferencia = nroReferencia;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.especificacion = especificacion;
        this.precio = precio;
        this.proveedor = proveedor;
        this.imagenes = imagenes;
        this.categorias = categorias;
        this.productos = productos;
    }

    public String getNroReferencia() {
        return nroReferencia;
    }

    public void setNroReferencia(String nroReferencia) {
        this.nroReferencia = nroReferencia;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Map<String,String> getEspecificacion() {
        return especificacion;
    }

    public void setEspecificacion(Map<String,String> especificacion) {
        this.especificacion = especificacion;
    }

    public Float getPrecio() {
        return precio;
    }

    public void setPrecio(Float precio) {
        this.precio = precio;
    }
    
    public DataProveedorWS getProveedor() {
        return proveedor;
    }

    public void setProveedor(DataProveedorWS proveedor) {
        this.proveedor = proveedor;
    }

    public List<String> getImagenes() {
        return imagenes;
    }

    public void setImagenes(List<String> imagenes) {
        this.imagenes = imagenes;
    }
    
    public List<DataCategoriaWS> getCategorias() {
        return categorias;
    }

    public void setCategorias(List<DataCategoriaWS> categorias) {
        this.categorias = categorias;
    }
    
    public List<DataProductoWS> getProductos() {
        return productos;
    }

    public void setProductos(List<DataProductoWS> productos) {
        this.productos = productos;
    }
    public int getStock(){
        
        return productos.size();
            
    }
    @Override
    public String toString() {
        return this.getNroReferencia() + "  --  " + this.getNombre();
    }
    
}
