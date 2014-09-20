/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador.clases;

import Controlador.Clases.Fabrica;
import Controlador.DataTypes.DataCategoria;
import Controlador.DataTypes.DataEspecificacionProducto;
import Controlador.DataTypes.DataProducto;
import controlador.datatypes.DataCategoriaWS;
import controlador.datatypes.DataEspecificacionProductoWS;
import controlador.datatypes.DataProductoWS;
import controlador.datatypes.DataProveedorWS;
import java.util.List;

/**
 *
 * @author rodro
 */
public class ProxyProducto {

    private final Integer idProductosControlador;

    private static ProxyProducto instance = null;

    public static ProxyProducto getInstance() {

        if (ProxyProducto.instance == null) {

            ProxyProducto.instance = new ProxyProducto();

        }
        return ProxyProducto.instance;
    }

    private ProxyProducto() {

        idProductosControlador = Fabrica.getInstance().getControladorProductos(null).getId();

    }

    public void getControladorProductos() {

    }

    public List<DataProveedorWS> listarProveedores() {
        return null;

    }

    public void elegirProveedor(String nickname) {
        Fabrica.getInstance().getControladorProductos(idProductosControlador).elegirProveedor(nickname);
    }

    public void ingresarDatosProductos(DataEspecificacionProductoWS espProducto) {
    }

    public Boolean elegirTipoProducto() {

        return null;
    }

    public void agregarMultiplesProductosAutogenerados(Integer cantidad) {

        Fabrica.getInstance().getControladorProductos(idProductosControlador).agregarMultiplesProductosAutogenerados(cantidad);
    }

    public void ingresarDatosUnidad(DataProductoWS producto) {

        Fabrica.getInstance().getControladorProductos(idProductosControlador).ingresarDatosUnidad(null);
    }

    public List<DataCategoriaWS> listarCategorias() {
        List<DataCategoria> l = Fabrica.getInstance().getControladorProductos(idProductosControlador).listarCategorias();

        return null;
    }

    public void elegirCategoria(String categoria) {
        Fabrica.getInstance().getControladorProductos(idProductosControlador).elegirCategoria(categoria);
    }

    public List<DataEspecificacionProductoWS> listarProductosCategoria() {
        List<DataEspecificacionProducto> l = Fabrica.getInstance().getControladorProductos(idProductosControlador).listarProductosCategoria();

        return null;
    }

    public DataEspecificacionProductoWS mostrarDatosProducto(String numRef) {
        DataEspecificacionProducto l = Fabrica.getInstance().getControladorProductos(idProductosControlador).mostrarDatosProducto(numRef);
        return null;
    }

    public Boolean controlarErrores() {

        return Fabrica.getInstance().getControladorProductos(idProductosControlador).controlarErrores();
    }

    public void guardarProducto() {
        Fabrica.getInstance().getControladorProductos(idProductosControlador).guardarProducto();
    }

    public DataCategoriaWS elegirCategoriaPadre(String categoria) {
        DataCategoria l = Fabrica.getInstance().getControladorProductos(idProductosControlador).elegirCategoriaPadre(categoria);
        return null;
    }

    public void ingresarDatosCategoria(DataCategoriaWS categoria) {
        
        Fabrica.getInstance().getControladorProductos(idProductosControlador).ingresarDatosCategoria(null);
    }
//    public Boolean tienePadre(){}

    public void asociarCategoriaPadre(DataCategoriaWS padre) {
        
        
        Fabrica.getInstance().getControladorProductos(idProductosControlador).asociarCategoriaPadre(null);
    }

    public void guardarCategoria() {
        Fabrica.getInstance().getControladorProductos(idProductosControlador).guardarCategoria();
    }

    public void elegirEspProducto(String numRef) {
        Fabrica.getInstance().getControladorProductos(idProductosControlador).elegirEspProducto(numRef);
    }

    public DataProductoWS mostrarInformacionProducto() {
        DataProducto l = Fabrica.getInstance().getControladorProductos(idProductosControlador).mostrarInformacionProducto();
        return null;
    }
 
    public void modificarDatosEspecificacionProducto(DataEspecificacionProductoWS espProducto) {
        Fabrica.getInstance().getControladorProductos(idProductosControlador).modificarDatosEspecificacionProducto(null);
    }

    public void agregarImagen(String rutaImagen) {
        Fabrica.getInstance().getControladorProductos(idProductosControlador).agregarImagen(rutaImagen);
    }

    public void agregarCategoria(DataCategoriaWS categoria) {
        Fabrica.getInstance().getControladorProductos(idProductosControlador).agregarCategoria(null);
    }

    public Boolean validarInfo() {

        return Fabrica.getInstance().getControladorProductos(idProductosControlador).validarInfo();
    }

    public void ingresarEspecificacion(String clave, String desc) {
         Fabrica.getInstance().getControladorProductos(idProductosControlador).ingresarEspecificacion(clave, desc);
    }

    public void agregarCategoriaAEspecificacion(String categoria) {
        Fabrica.getInstance().getControladorProductos(idProductosControlador).agregarCategoriaAEspecificacion(categoria);
    }

    public List<String> listarImagenesAModificar() {

        return Fabrica.getInstance().getControladorProductos(idProductosControlador).listarImagenesAModificar();
    }

    public void borrarImagen(String rutaImagen) {
        Fabrica.getInstance().getControladorProductos(idProductosControlador).borrarImagen(rutaImagen);
    }

    public List<DataCategoriaWS> listarCategoriasAModificar() {
        List<DataCategoria> l = Fabrica.getInstance().getControladorProductos(idProductosControlador).listarCategoriasAModificar();
        return null;
    }

    public void borrarCategoriaAEspecificacion(String categoria) {
    }

    public void guardarEspProductoModificado() {
        Fabrica.getInstance().getControladorProductos(idProductosControlador).guardarEspProductoModificado();
    }

    public Boolean categoryAlreadyExist(String categoria) {

        return  Fabrica.getInstance().getControladorProductos(idProductosControlador).categoryAlreadyExist(categoria);
    }
}
