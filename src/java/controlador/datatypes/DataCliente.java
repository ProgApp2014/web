package controlador.datatypes;

 
import java.util.Calendar;

public class DataCliente extends DataUsuario{

    public DataCliente() {
        super();
    }


    
    @Override
    public String toString() {
        return this.getNickname() + "  --  " + this.getNombre() + "  --  " + this.getApellido();
    }
    
}
