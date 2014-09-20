package controlador.datatypes;


import java.util.Calendar;

public class DataProveedorWS extends DataUsuarioWS{
    
    private String nombreCompania;
    private String linkSitio;
    
    public DataProveedorWS(String nickname, String nombre, String apellido, String email, Calendar fechaNacimiento, String nombreCompania, String linkSitio) {
        super(nickname, nombre, apellido, email, fechaNacimiento);
        this.nombreCompania = nombreCompania;
        this.linkSitio = linkSitio;
    }
    
    public DataProveedorWS() {
        super();

    }

    public String getNombreCompania() {
        return nombreCompania;
    }

    public void setNombreCompania(String nombreCompania) {
        this.nombreCompania = nombreCompania;
    }

    public String getLinkSitio() {
        return linkSitio;
    }

    public void setLinkSitio(String linkSitio) {
        this.linkSitio = linkSitio;
    }
    
    @Override
    public String toString() {
        return this.getNickname() + "  --  " + this.getNombre() + "  --  " + this.getApellido();
    }
    
}
