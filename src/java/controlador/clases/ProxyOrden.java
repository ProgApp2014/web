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
import java.util.ArrayList;
import java.util.Iterator;
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

    public String retNombre() {
        return "sapeeee rodro";
    }

    public List<DataClienteWS> listarClientes() {
        List<DataCliente> l = Fabrica.getInstance().getControladorOrdenes(idOrdenesControlador).listarClientes();
        List<DataClienteWS> ret = new ArrayList();
        Iterator it = l.iterator();
        while (it.hasNext()) {
            ret.add(ConvertidorFrontEnd.toCliente((DataCliente) it.next()));
        }
        return ret;

    }

    public void elegirCliente(String nickname) {
        Fabrica.getInstance().getControladorOrdenes(idOrdenesControlador).elegirCategoria(nickname);
    }

    public List<DataCategoriaWS> listarCategorias() {
        List<DataCategoria> l = Fabrica.getInstance().getControladorOrdenes(idOrdenesControlador).listarCategorias();
        List<DataCategoriaWS> ret = new ArrayList();
        Iterator it = l.iterator();
        while (it.hasNext()) {
            ret.add(ConvertidorFrontEnd.toCategoria((DataCategoria) it.next()));
        }
        return ret;

    }

    public void elegirCategoria(String categoria) {
        Fabrica.getInstance().getControladorOrdenes(idOrdenesControlador).elegirCategoria(categoria);

    }

    public List<DataEspecificacionProductoWS> listarEspecificacionProductos() {
        List<DataEspecificacionProducto> l = Fabrica.getInstance().getControladorOrdenes(idOrdenesControlador).listarEspecificacionProductos();

        List<DataEspecificacionProductoWS> ret = new ArrayList();
        Iterator it = l.iterator();
        while (it.hasNext()) {
            ret.add(ConvertidorFrontEnd.toEspecificacionProducto((DataEspecificacionProducto) it.next()));
        }
        return ret;

    }

    public void elegirEspecificacionProducto(String nroRef) {
        Fabrica.getInstance().getControladorOrdenes(idOrdenesControlador).elegirEspecificacionProducto(nroRef);
    }

    public List<DataEspecificacionProductoWS> listarProductosEnOrden() {

        List<DataEspecificacionProducto> l = Fabrica.getInstance().getControladorOrdenes(idOrdenesControlador).listarProductosEnOrden();
       
        List<DataEspecificacionProductoWS> ret = new ArrayList();
        Iterator it = l.iterator();
        while (it.hasNext()) {
            ret.add(ConvertidorFrontEnd.toEspecificacionProducto((DataEspecificacionProducto) it.next()));
        }
        return ret;

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

        Fabrica.getInstance().getControladorOrdenes(idOrdenesControlador).guardarOrden(ConvertidorBackend.toOrden(dataOrden));
    }

    public List<DataOrdenCompraWS> listarOrdenes() {

        List<DataOrdenCompra> l = Fabrica.getInstance().getControladorOrdenes(idOrdenesControlador).listarOrdenes();
        
        List<DataOrdenCompraWS> ret = new ArrayList();
        Iterator it = l.iterator();
        while (it.hasNext()) {
            ret.add(ConvertidorFrontEnd.toOrden((DataOrdenCompra) it.next()));
        }
        return ret;

    }

    public void elegirOrden(Integer nroOrden) {
        Fabrica.getInstance().getControladorOrdenes(idOrdenesControlador).elegirOrden(nroOrden);

    }

    public void borrarOrdenCompra() {
        Fabrica.getInstance().getControladorOrdenes(idOrdenesControlador).borrarOrdenCompra();
    }

    public DataOrdenCompraWS mostrarDatosOrden() {
        DataOrdenCompra l = Fabrica.getInstance().getControladorOrdenes(idOrdenesControlador).mostrarDatosOrden();
        return ConvertidorFrontEnd.toOrden(l);

    }

    public void removerEspecificacionProducto(String ref) {
        Fabrica.getInstance().getControladorOrdenes(idOrdenesControlador).removerEspecificacionProducto(ref);
    }

}
