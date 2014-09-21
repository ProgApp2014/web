/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador.clases;

import Controlador.Clases.Fabrica;
import Controlador.DataTypes.DataCategoria;
import Controlador.DataTypes.DataCliente;
import Controlador.DataTypes.DataOrdenCompra;
import Controlador.DataTypes.DataProveedor;
import controlador.datatypes.DataCategoriaWS;
import controlador.datatypes.DataClienteWS;
import controlador.datatypes.DataOrdenCompraWS;
import controlador.datatypes.DataProveedorWS;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 *
 * @author rodro
 */
public class ProxyUsuario {

    private final Integer idUsuariosControlador;

    private static ProxyUsuario instance = null;

    public ProxyUsuario() {

        idUsuariosControlador = Fabrica.getInstance().getControladorUsuarios(null).getId();

    }

    public static ProxyUsuario getInstance() {

        if (ProxyUsuario.instance == null) {

            ProxyUsuario.instance = new ProxyUsuario();

        }
        return ProxyUsuario.instance;
    }

    public void ingresarDatosCliente(DataClienteWS cliente) {
        Fabrica.getInstance().getControladorUsuarios(idUsuariosControlador).ingresarDatosCliente(ConvertidorBackend.toCliente(cliente));
    }

    public void ingresarDatosProveedor(DataProveedorWS proveedor) {
        Fabrica.getInstance().getControladorUsuarios(idUsuariosControlador).ingresarDatosProveedor(ConvertidorBackend.toProveedor(proveedor));
    }

    public Boolean validarDatosUsuario() {
        return Fabrica.getInstance().getControladorUsuarios(idUsuariosControlador).validarDatosUsuario();

    }

    public void guardarUsuario() {
        Fabrica.getInstance().getControladorUsuarios(idUsuariosControlador).guardarUsuario();
    }

    public List<DataClienteWS> listarClientes() {
        List<DataCliente> l = Fabrica.getInstance().getControladorUsuarios(idUsuariosControlador).listarClientes();

        List<DataClienteWS> ret = new ArrayList();
        Iterator it = l.iterator();
        while (it.hasNext()) {
            ret.add(ConvertidorFrontEnd.toCliente((DataCliente) it.next()));
        }
        return ret;
    }

    public void elegirCliente(String nickname) {
        Fabrica.getInstance().getControladorUsuarios(idUsuariosControlador).elegirCliente(nickname);

    }

    public DataClienteWS mostrarDatosCliente() {
        DataCliente l = Fabrica.getInstance().getControladorUsuarios(idUsuariosControlador).mostrarDatosCliente();
        return ConvertidorFrontEnd.toCliente(l);

    }

    public List<DataOrdenCompraWS> listarOrdenesCliente() {
        List<DataOrdenCompra> l = Fabrica.getInstance().getControladorUsuarios(idUsuariosControlador).listarOrdenesCliente();
        List<DataOrdenCompraWS> ret = new ArrayList();
        Iterator it = l.iterator();
        while (it.hasNext()) {
            ret.add(ConvertidorFrontEnd.toOrden((DataOrdenCompra) it.next()));
        }
        return ret;

    }

    public List<DataProveedorWS> listarProveedores() {
        List<DataProveedor> l = Fabrica.getInstance().getControladorUsuarios(idUsuariosControlador).listarProveedores();

        List<DataProveedorWS> ret = new ArrayList();
        Iterator it = l.iterator();
        while (it.hasNext()) {
            ret.add(ConvertidorFrontEnd.toProveedor((DataProveedor) it.next()));
        }
        return ret;

    }

    public void elegirProveedor(String nickname) {
        Fabrica.getInstance().getControladorUsuarios(idUsuariosControlador).elegirProveedor(nickname);
    }

    public DataProveedorWS mostrarDatosProveedor() {
        DataProveedor l = Fabrica.getInstance().getControladorUsuarios(idUsuariosControlador).mostrarDatosProveedor();

        return ConvertidorFrontEnd.toProveedor(l);

    }

    public String getErrors() {
        return Fabrica.getInstance().getControladorUsuarios(idUsuariosControlador).getErrors();

    }
}
