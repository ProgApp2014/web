package controlador.datatypes;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class DataOrdenCompraWS {
    
    private Integer nroOrden;
    private Date fecha;
    private Float precioTotal;
    private List<DataClienteCompraProductoWS> clienteCompraProducto;
    
    public DataOrdenCompraWS() {

    }
    
    public DataOrdenCompraWS(Integer nroOrden) {
        this.nroOrden = nroOrden;
        this.fecha = new Date();
        this.precioTotal = 0.0f;
    }
    
    public DataOrdenCompraWS(Integer nroOrden, Date fecha, Float precioTotal, List<DataClienteCompraProductoWS> clienteCompraProducto) {
        this.nroOrden = nroOrden;
        this.fecha = fecha;
        this.precioTotal = precioTotal;
        this.clienteCompraProducto = clienteCompraProducto;
    }
    
    public DataOrdenCompraWS(Integer nroOrden, List<DataClienteCompraProductoWS> clienteCompraProducto) {
        this.nroOrden = nroOrden;
        this.fecha = new Date();
        this.precioTotal = 0.0f;
        this.clienteCompraProducto = clienteCompraProducto;
    }

    public Integer getNroOrden() {
        return nroOrden;
    }
    
    public void setNroOrden(Integer nroOrden) {
        this.nroOrden = nroOrden;
    }
    
    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }
    
    public List<DataClienteCompraProductoWS> getClienteCompraProducto() {
        return clienteCompraProducto;
    }

    public void setClienteCompraProducto(List<DataClienteCompraProductoWS> clienteCompraProducto) {
        this.clienteCompraProducto = clienteCompraProducto;
    }
    
    public Float getPrecioTotal() {
        return precioTotal;
    }
    
    public void setPrecioTotal(Float pt) {
        this.precioTotal = pt;
    }
    
    @Override
    public String toString() {
        return this.getNroOrden() + "  --  " + this.getFecha() + "  --  " + this.getClienteCompraProducto() ;
    }
    
}
