/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador.clases;

import controlador.middleware.ControladorProductosWS;
import controlador.middleware.ControladorProductosWSService;
import controlador.middleware.DataCategoria;
import controlador.middleware.DataComentario;
import controlador.middleware.DataEspecificacionProducto;
import controlador.middleware.DataProducto;
import controlador.middleware.DataProveedor;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 *
 * @author rodro
 */
public class ProxyProducto {

    private Integer idProductosControlador;

    private static ProxyProducto instance = null;

    public static ProxyProducto getInstance() {

        if (ProxyProducto.instance == null) {

            ProxyProducto.instance = new ProxyProducto();

        }
        return ProxyProducto.instance;
    }
    private final ControladorProductosWS controlador;

    private ProxyProducto() {

        idProductosControlador = null;
        ControladorProductosWSService servicio = new ControladorProductosWSService();
        controlador = servicio.getControladorProductosWSPort();
        idProductosControlador = controlador.getId();
    }

    public List<DataProveedor> listarProveedores() {
        return (List<DataProveedor>) controlador.listarProveedores(idProductosControlador);
    }

    public void elegirProveedor(String nickname) {
        controlador.elegirProveedor(nickname, idProductosControlador);
    }

    public void ingresarDatosProductos(DataEspecificacionProducto espProducto) {
        controlador.ingresarDatosProductos(espProducto, idProductosControlador);
    }

    public Boolean elegirTipoProducto() {

        return controlador.elegirTipoProducto(idProductosControlador);
    }

    public void agregarMultiplesProductosAutogenerados(Integer cantidad) {
        controlador.agregarMultiplesProductosAutogenerados(cantidad, idProductosControlador);
    }

    public void ingresarDatosUnidad(DataProducto producto) {

        controlador.ingresarDatosUnidad(producto, idProductosControlador);
    }

    public List<DataCategoria> listarCategorias() {
        return (List<DataCategoria>) controlador.listarCategorias(idProductosControlador);
    }

    public void elegirCategoria(String categoria) {

        controlador.elegirCategoria(categoria, idProductosControlador);
    }

    public List<DataEspecificacionProducto> listarProductosCategoria() {
        return (List<DataEspecificacionProducto>) controlador.listarProductosCategoria(idProductosControlador);
    }

    public DataEspecificacionProducto mostrarDatosProducto(String numRef) {

        return controlador.mostrarDatosProducto(numRef, idProductosControlador);
    }

    public Boolean controlarErrores() {
        return controlador.controlarErrores(idProductosControlador);
    }

    public void guardarProducto() {

        controlador.guardarProducto(idProductosControlador);
    }

    public DataCategoria elegirCategoriaPadre(String categoria) {

        return controlador.elegirCategoriaPadre(categoria, idProductosControlador);
    }

    public void ingresarDatosCategoria(DataCategoria categoria) {

        controlador.ingresarDatosCategoria(categoria, idProductosControlador);
    }

    public void asociarCategoriaPadre(DataCategoria padre) {

        controlador.asociarCategoriaPadre(padre, idProductosControlador);
    }

    public void guardarCategoria() {

        controlador.guardarCategoria(idProductosControlador);
    }

    public void elegirEspProducto(String numRef) {

        controlador.elegirEspProducto(numRef, idProductosControlador);
    }

    public DataProducto mostrarInformacionProducto() {
        return controlador.mostrarInformacionProducto(idProductosControlador);
    }

    public void modificarDatosEspecificacionProducto(DataEspecificacionProducto espProducto) {

        controlador.modificarDatosEspecificacionProducto(espProducto, idProductosControlador);
    }

    public void agregarImagen(String rutaImagen) {

        controlador.agregarImagen(rutaImagen, idProductosControlador);
    }

    public void agregarCategoria(DataCategoria categoria) {

        controlador.agregarCategoria(categoria, idProductosControlador);
    }

    public Boolean validarInfo() {

        return controlador.validarInfo(idProductosControlador);
    }

    public void ingresarEspecificacion(String clave, String desc) {

        controlador.ingresarEspecificacion(clave, desc, idProductosControlador);
    }

    public void agregarCategoriaAEspecificacion(String categoria) {
        controlador.agregarCategoriaAEspecificacion(categoria, idProductosControlador);
    }

    public List<String> listarImagenesAModificar() {
        return (List<String>) controlador.listarImagenesAModificar(idProductosControlador);

    }

    public void borrarImagen(String rutaImagen) {
        controlador.borrarImagen(rutaImagen, idProductosControlador);
    }

    public List<DataCategoria> listarCategoriasAModificar() {
        return (List<DataCategoria>) controlador.listarCategoriasAModificar(idProductosControlador);
    }

    public void borrarCategoriaAEspecificacion(String categoria) {

        controlador.borrarCategoriaAEspecificacion(categoria, idProductosControlador);
    }

    public void guardarEspProductoModificado() {

        controlador.guardarEspProductoModificado(idProductosControlador);
    }

    public Boolean categoryAlreadyExist(String categoria) {
        return controlador.categoryAlreadyExist(categoria, idProductosControlador);

    }

    public List<DataEspecificacionProducto> buscarProductos(String keyword) {

        return (List<DataEspecificacionProducto>) controlador.buscarProductos(keyword, idProductosControlador);
    }

    public Map<String, List<DataEspecificacionProducto>> buscarProductosSeparados(String keyword, String Orden) {
        //controlador.buscarProductosSeparados(keyword,Orden, idProductosControlador);
         return null;
    }

    public Boolean puedeComentar(String nickname, String nroRef) {

        return controlador.puedeComentar(nickname, nroRef, idProductosControlador);
    }

    public List<DataComentario> listarComentarios(String nroRef) {

        return (List<DataComentario>) controlador.listarComentarios(nroRef, idProductosControlador);
    }

    public void agregarComentario(String nickname, String nroRef, Integer padre, String Comentario) {
        controlador.agregarComentario(nickname, nroRef, padre, Comentario, idProductosControlador);
    }

    public Boolean verificarEspecificacionProducto(String nroRef) {

        return controlador.verificarEspecificacionProducto(nroRef, idProductosControlador);
    }
}
