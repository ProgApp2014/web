/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador.clases;

import controlador.middleware.ControladorOrdenesWS;
import controlador.middleware.ControladorOrdenesWSService;
import controlador.middleware.ControladorProductosWS;
import controlador.middleware.DataCategoria;
import controlador.middleware.DataCliente;
import controlador.middleware.DataEspecificacionProducto;
import controlador.middleware.DataOrdenCompra;
import java.util.List;

/**
 *
 * @author rodro
 */
public class ProxyOrden {

    private Integer idOrdenesControlador;
    private final ControladorOrdenesWS controlador;

    public ProxyOrden() {

        idOrdenesControlador = null;
        ControladorOrdenesWSService servicio = new ControladorOrdenesWSService();
        controlador = servicio.getControladorOrdenesWSPort();
        idOrdenesControlador = controlador.getId();
    }

    private static ProxyOrden instance = null;

    public static ProxyOrden getInstance() {

        if (ProxyOrden.instance == null) {

            ProxyOrden.instance = new ProxyOrden();

        }
        return ProxyOrden.instance;
    }

    public List<DataCliente> listarClientes() {

        return (List<DataCliente>) controlador.listarClientes(idOrdenesControlador);

    }

    public void elegirCliente(String nickname) {
        controlador.elegirCliente(nickname, idOrdenesControlador);
    }

    public List<DataCategoria> listarCategorias() {

        return (List<DataCategoria>) controlador.listarCategorias(idOrdenesControlador);

    }

    public void elegirCategoria(String categoria) {

        controlador.elegirCategoria(categoria, idOrdenesControlador);
    }

    public List<DataEspecificacionProducto> listarEspecificacionProductos() {
        return (List<DataEspecificacionProducto>) controlador.listarEspecificacionProductos(idOrdenesControlador);

    }

    public void elegirEspecificacionProducto(String nroRef) {
        controlador.elegirEspecificacionProducto(nroRef, idOrdenesControlador);
    }

    public List<DataEspecificacionProducto> listarProductosEnOrden() {
        return (List<DataEspecificacionProducto>) controlador.listarProductosEnOrden(idOrdenesControlador);

    }

    public void elegirProducto(Integer id) {

        controlador.elegirProducto(id, idOrdenesControlador);
    }

    public void elegirCantidadProducto(Integer cantidad) {
        controlador.elegirCantidadProducto(cantidad, idOrdenesControlador);
    }

    public void generarItemOrden() {

        controlador.generarItemOrden(idOrdenesControlador);
    }

    public void guardarOrden(DataOrdenCompra dataOrden) {

        controlador.guardarOrden(dataOrden, idOrdenesControlador);
    }

    public List<DataOrdenCompra> listarOrdenes() {
        return (List<DataOrdenCompra>) controlador.listarOrdenes(idOrdenesControlador);

    }

    public void elegirOrden(Integer nroOrden) {
        controlador.elegirOrden(nroOrden, idOrdenesControlador);
    }

    public void borrarOrdenCompra() {

        controlador.borrarOrdenCompra(idOrdenesControlador);
    }

    public DataOrdenCompra mostrarDatosOrden() {

        return controlador.mostrarDatosOrden(idOrdenesControlador);
    }

    public void removerEspecificacionProducto(String ref) {

        controlador.removerEspecificacionProducto(ref, idOrdenesControlador);
    }

}
