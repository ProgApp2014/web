package controlador.datatypes;

 

public class DataClienteCompraProductoWS {
    
    private DataClienteWS cliente;
    private DataProductoWS producto;
    private Float precio;
       
    public DataClienteCompraProductoWS() {
        
    }

    public DataClienteWS getCliente() {
        return cliente;
    }
    
    public void setCliente(DataClienteWS cliente) {
        this.cliente = cliente;
    }
    
    public DataProductoWS getProducto() {
        return producto;
    }

    public void setProducto(DataProductoWS producto) {
        this.producto = producto;
    }
    
    public Float getPrecio() {
        return precio;
    }

    public void setPrecio(Float precio) {
        this.precio = precio;
    }
    
    @Override
    public String toString() {
        return this.getCliente() + "  --  " + this.getProducto() + "  --  " + this.getPrecio() ;
    }
    
}
