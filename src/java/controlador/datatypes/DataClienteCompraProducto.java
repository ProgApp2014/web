package controlador.datatypes;

 

public class DataClienteCompraProducto {
    
    private DataCliente cliente;
    private DataProducto producto;
    private Float precio;
       
    public DataClienteCompraProducto() {
        
    }

    public DataCliente getCliente() {
        return cliente;
    }
    
    public void setCliente(DataCliente cliente) {
        this.cliente = cliente;
    }
    
    public DataProducto getProducto() {
        return producto;
    }

    public void setProducto(DataProducto producto) {
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
