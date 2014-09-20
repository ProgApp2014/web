package controlador.clases;

import controlador.datatypes.DataCliente;
import controlador.datatypes.DataOrdenCompra;
import controlador.datatypes.DataProveedor;
import java.util.ArrayList;
import java.util.List;

public interface IControladorUsuarios {
    
    public Integer getId();
    public void setId(Integer id);
    public void ingresarDatosCliente(DataCliente cliente);
    public void ingresarDatosProveedor(DataProveedor proveedor);
    public Boolean validarDatosUsuario();
    public void guardarUsuario();
//    public void cancelar();
    public List<DataCliente> listarClientes();
    public void elegirCliente(String nickname);
    public DataCliente mostrarDatosCliente();
    public List<DataOrdenCompra> listarOrdenesCliente();
    public List<DataProveedor> listarProveedores();
    public void elegirProveedor(String nickname);
    public DataProveedor mostrarDatosProveedor();
    public String getErrors();
    
}
