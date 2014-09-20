package controlador.datatypes;


public class DataProducto {
    
    private Integer id;
    private String idEspecifico;
    private DataEspecificacionProducto especificacionProducto;
    
    public DataProducto() {
      
    }
    
    public DataProducto(Integer id, DataEspecificacionProducto especificacionProducto) {
        this.id = id;
        this.idEspecifico = null;
        this.especificacionProducto = especificacionProducto;
    }
    
    public DataProducto(Integer id, String idEspecifico, DataEspecificacionProducto especificacionProducto) {
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
    
    public String getIdEspecifico() {
        return idEspecifico;
    }
    
    public void setIdEspecifico(String id) {
        this.idEspecifico = id;
    }
    
    public DataEspecificacionProducto getEspecificacionProducto() {
        return especificacionProducto;
    }
       
    public void setEspecificacionProducto(DataEspecificacionProducto especificacionProducto) {
        this.especificacionProducto = especificacionProducto;
    }
    
    @Override
    public String toString() {
        return this.getId() + "  --  " + this.getEspecificacionProducto();
    }
    
}
