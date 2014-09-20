package controlador.datatypes;


public class DataComentarioWS {
    
    private DataClienteWS cliente;
    private DataEspecificacionProductoWS especificacionProducto;
    private String comentario;
    
    public DataComentarioWS() {
        
    }
    
    public DataComentarioWS(DataClienteWS cliente, DataEspecificacionProductoWS especificacionProducto, String comentario) {
        this.cliente = cliente;
        this.especificacionProducto = especificacionProducto;
        this.comentario = comentario;
    }

    public DataClienteWS getCliente() {
        return cliente;
    }
    
    public void setCliente(DataClienteWS cliente) {
        this.cliente = cliente;
    }
    
    public DataEspecificacionProductoWS getEspecificacionProducto() {
        return especificacionProducto;
    }

    public void setEspecificacionProducto(DataEspecificacionProductoWS especificacionProducto) {
        this.especificacionProducto = especificacionProducto;
    }
    
    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }
    
}
