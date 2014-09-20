package controlador.clases;

import controlador.datatypes.DataCategoria;
import controlador.datatypes.DataCliente;
import controlador.datatypes.DataEspecificacionProducto;
import controlador.datatypes.DataOrdenCompra;
import java.util.ArrayList;
import java.util.List;

public interface IControladorOrdenes {
    
    public Integer getId();
    public void setId(Integer id);
    public List<DataCliente> listarClientes();
    public void elegirCliente(String nickname);
    public List<DataCategoria> listarCategorias();
    public void elegirCategoria(String categoria);
    public List<DataEspecificacionProducto> listarEspecificacionProductos();
    public void elegirEspecificacionProducto(String nroRef);
//    public void elegirMetodoDeSeleccion(String metodo);
    public List<DataEspecificacionProducto> listarProductosEnOrden();
    public void elegirProducto(Integer id);
    public void elegirCantidadProducto(Integer cantidad);
    public void generarItemOrden();
    public void guardarOrden(DataOrdenCompra dataOrden);
//    public void imprimirDatosOrden();
    public List<DataOrdenCompra> listarOrdenes();
    public void elegirOrden(Integer nroOrden);
//    public Boolean confirmarEliminacion();
    public void borrarOrdenCompra();
    public DataOrdenCompra mostrarDatosOrden();

    public void removerEspecificacionProducto(String ref);

    public Integer getNextId();
    
}
