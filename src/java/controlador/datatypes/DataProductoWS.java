package controlador.datatypes;


public class DataProductoWS {
    
    private Integer id;
    private String idEspecifico;
    private DataEspecificacionProductoWS especificacionProducto;
    private Boolean enOrden;


    public DataProductoWS() {
      
    }
    
    public DataProductoWS(Integer id, DataEspecificacionProductoWS especificacionProducto) {
        this.id = id;
        this.idEspecifico = null;
        this.especificacionProducto = especificacionProducto;
    }
    
    public DataProductoWS(Integer id, String idEspecifico, DataEspecificacionProductoWS especificacionProducto) {
        this.id = id;
        this.idEspecifico = idEspecifico;
        this.especificacionProducto = especificacionProducto;
    }

    public Integer getId() {
        return id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
        public Boolean isEnOrden() {
        return enOrden;
    }

    public void setEnOrden(Boolean enOrden) {
        this.enOrden = enOrden;
    }
    public String getIdEspecifico() {
        return idEspecifico;
    }
    
    public void setIdEspecifico(String id) {
        this.idEspecifico = id;
    }
    
    public DataEspecificacionProductoWS getEspecificacionProducto() {
        return especificacionProducto;
    }
       
    public void setEspecificacionProducto(DataEspecificacionProductoWS especificacionProducto) {
        this.especificacionProducto = especificacionProducto;
    }
    
    @Override
    public String toString() {
        return this.getId() + "  --  " + this.getEspecificacionProducto();
    }
    
}
