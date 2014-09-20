/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador.clases;

import Controlador.Clases.Fabrica;
import Controlador.DataTypes.DataCategoria;
import Controlador.DataTypes.DataCliente;
import Controlador.DataTypes.DataEspecificacionProducto;
import Controlador.DataTypes.DataOrdenCompra;
import controlador.datatypes.DataCategoriaWS;
import controlador.datatypes.DataClienteWS;
import controlador.datatypes.DataEspecificacionProductoWS;
import controlador.datatypes.DataOrdenCompraWS;
import java.util.List;

/**
 *
 * @author rodro
 */
public class ProxyOrden {
    
    private final Integer idOrdenesControlador;
    
    public ProxyOrden() {
        idOrdenesControlador = Fabrica.getInstance().getControladorOrdenes(null).getId();
    }
    
    private static ProxyOrden instance = null;
    
    public static ProxyOrden getInstance() {
        
        if (ProxyOrden.instance == null) {
            
            ProxyOrden.instance = new ProxyOrden();
            
        }
        return ProxyOrden.instance;
    }
    public String retNombre(){
        return "sapeeee rodro";
    }
    public List<DataClienteWS> listarClientes() {
        List<DataCliente>  l = Fabrica.getInstance().getControladorOrdenes(idOrdenesControlador).listarClientes();
        return null;
        
    }
    
    public void elegirCliente(String nickname) {
        Fabrica.getInstance().getControladorOrdenes(idOrdenesControlador).elegirCategoria(nickname);
    }
    
    public List<DataCategoriaWS> listarCategorias() {
        List<DataCategoria> l = Fabrica.getInstance().getControladorOrdenes(idOrdenesControlador).listarCategorias();
        return null;
        
    }
    
    public void elegirCategoria(String categoria) {
         Fabrica.getInstance().getControladorOrdenes(idOrdenesControlador).elegirCategoria(categoria);
        
    }
    
    public List<DataEspecificacionProductoWS> listarEspecificacionProductos() {
        List<DataEspecificacionProducto> l = Fabrica.getInstance().getControladorOrdenes(idOrdenesControlador).listarEspecificacionProductos();
        
        return null;
        
    }
    
    public void elegirEspecificacionProducto(String nroRef) {
         Fabrica.getInstance().getControladorOrdenes(idOrdenesControlador).elegirEspecificacionProducto(nroRef);
    }
 
    public List<DataEspecificacionProductoWS> listarProductosEnOrden() {
        return null;
        
    }
    
    public void elegirProducto(Integer id) {
        Fabrica.getInstance().getControladorOrdenes(idOrdenesControlador).elegirProducto(id);
    }
    
    public void elegirCantidadProducto(Integer cantidad) {
        Fabrica.getInstance().getControladorOrdenes(idOrdenesControlador).elegirCantidadProducto(cantidad);
    }
    
    public void generarItemOrden() {
        Fabrica.getInstance().getControladorOrdenes(idOrdenesControlador).generarItemOrden();
    }
    
    public void guardarOrden(DataOrdenCompraWS dataOrden) {
        
        Fabrica.getInstance().getControladorOrdenes(idOrdenesControlador).guardarOrden(null);
    }
    
    public List<DataOrdenCompraWS> listarOrdenes() {
        
        List<DataOrdenCompra> l = Fabrica.getInstance().getControladorOrdenes(idOrdenesControlador).listarOrdenes();
        return null;
        
    }
    
    public void elegirOrden(Integer nroOrden) {
        Fabrica.getInstance().getControladorOrdenes(idOrdenesControlador).elegirOrden(nroOrden);
        
    }
    
    public void borrarOrdenCompra() {
        Fabrica.getInstance().getControladorOrdenes(idOrdenesControlador).borrarOrdenCompra();
    }
    
    public DataOrdenCompraWS mostrarDatosOrden() {
        DataOrdenCompra l = Fabrica.getInstance().getControladorOrdenes(idOrdenesControlador).mostrarDatosOrden();
        return null;
        
    }
    
    public void removerEspecificacionProducto(String ref) {
        Fabrica.getInstance().getControladorOrdenes(idOrdenesControlador).removerEspecificacionProducto(ref);
    }
    
}
