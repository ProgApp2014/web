package controlador.datatypes;


public class DataComentarioWS {
    
    private DataClienteWS cliente;
    private DataEspecificacionProductoWS especificacionProducto;
    private String comentario;
    private Integer id;
    private DataComentarioWS padre;
    
    public DataComentarioWS() {
        
    }
    
    public DataComentarioWS(DataClienteWS cliente, DataEspecificacionProductoWS especificacionProducto, String comentario, Integer id, DataComentarioWS padre) {
        this.cliente = cliente;
        this.especificacionProducto = especificacionProducto;
        this.comentario = comentario;
        this.id = id;
        this.padre = padre;
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
    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
    
    public DataComentarioWS getPadre() {
        return padre;
    }

    public void setPadre(DataComentarioWS padre) {
        this.padre = padre;
    }
    
}
