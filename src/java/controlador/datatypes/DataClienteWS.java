package controlador.datatypes;

 
import java.util.Calendar;

public class DataClienteWS extends DataUsuarioWS{

    public DataClienteWS() {
        super();
    }


    
    @Override
    public String toString() {
        return this.getNickname() + "  --  " + this.getNombre() + "  --  " + this.getApellido();
    }
    
}
