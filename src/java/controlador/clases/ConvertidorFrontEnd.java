/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador.clases;

import Controlador.DataTypes.DataCategoria;
import Controlador.DataTypes.DataCliente;
import Controlador.DataTypes.DataClienteCompraProducto;
import Controlador.DataTypes.DataComentario;
import Controlador.DataTypes.DataEspecificacionProducto;
import Controlador.DataTypes.DataOrdenCompra;
import Controlador.DataTypes.DataProducto;
import Controlador.DataTypes.DataProveedor;
import controlador.datatypes.DataCategoriaWS;
import controlador.datatypes.DataClienteCompraProductoWS;
import controlador.datatypes.DataClienteWS;
import controlador.datatypes.DataComentarioWS;
import controlador.datatypes.DataEspecificacionProductoWS;
import controlador.datatypes.DataOrdenCompraWS;
import controlador.datatypes.DataProductoWS;
import controlador.datatypes.DataProveedorWS;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 *
 * @author rodro
 */
public class ConvertidorFrontEnd {

    public static DataCategoriaWS toCategoria(DataCategoria o) {
        DataCategoriaWS ret = new DataCategoriaWS();
        ret.setNombre(o.getNombre());
        if (o.getPadre() != null) {
            ret.setPadre(toCategoria(o.getPadre()));
        }
        HashMap<String, DataEspecificacionProductoWS> lp = getMapDataEspecificacionProductoWS(o.getListaProductos());
        ret.setListaProductos(lp);
        return ret;
    }

    public static DataEspecificacionProductoWS toEspecificacionProducto(DataEspecificacionProducto o) {
        DataEspecificacionProductoWS ret = new DataEspecificacionProductoWS();
        ret.setDescripcion(o.getDescripcion());
        ret.setNombre(o.getNombre());
        ret.setImagenes(o.getImagenes());
        ret.setEspecificacion(o.getEspecificacion());
        ret.setNroReferencia(o.getNroReferencia());
        ret.setPrecio(o.getPrecio());
        ret.setCategorias(getListDataCategoriaWS(o.getCategorias()));
        ret.setProveedor(toProveedor(o.getProveedor()));
        ret.setProductos(getListDataProductoWS(o.getProductos()));
        return ret;
    }

    public static DataProductoWS toProducto(DataProducto o) {
        return new DataProductoWS(o.getId(), o.getIdEspecifico(), toEspecificacionProducto(o.getEspecificacionProducto()));
    }

    public static DataProveedorWS toProveedor(DataProveedor o) {
        return new DataProveedorWS(o.getNickname(), o.getNombre(), o.getApellido(), o.getEmail(), o.getFechaNacimiento(), o.getNombreCompania(), o.getLinkSitio());

    }

    public static DataClienteWS toCliente(DataCliente o) {
        DataClienteWS ret = new DataClienteWS();
        ret.setApellido(o.getApellido());
        ret.setEmail(o.getEmail());
        ret.setFechaNacimiento(o.getFechaNacimiento());
        ret.setImagen(o.getImagen());
        ret.setNickname(o.getNickname());
        ret.setNombre(o.getNombre());
        return ret;
    }

    public static DataOrdenCompraWS toOrden(DataOrdenCompra o) {
        DataOrdenCompraWS ret = new DataOrdenCompraWS();
        ret.setFecha(o.getFecha());
        ret.setNroOrden(o.getNroOrden());
        ret.setPrecioTotal(o.getPrecioTotal());
        ret.setClienteCompraProducto(getListClienteCompraProductoWS(o.getClienteCompraProducto()));
        return ret;
    }

    public static DataClienteCompraProductoWS toClientCompraProd(DataClienteCompraProducto o) {
    
        DataClienteCompraProductoWS ret = new DataClienteCompraProductoWS();
        ret.setCliente(toCliente(o.getCliente()));
        ret.setPrecio(o.getPrecio());
        ret.setProducto(toProducto(o.getProducto()));
        return ret;
    }
    
    public static DataComentarioWS toComentario(DataComentario o){
        DataComentarioWS ret = new DataComentarioWS();
        ret.setCliente(toCliente(o.getCliente()));
        ret.setComentario(o.getComentario());
        ret.setEspecificacionProducto(toEspecificacionProducto(o.getEspecificacionProducto()));
        return ret;
    }

    public static List<DataCategoriaWS> getListDataCategoriaWS(List<DataCategoria> o) {
        List<DataCategoriaWS> ret = new ArrayList();
        Iterator it = o.iterator();
        while (it.hasNext()) {

            ret.add(toCategoria((DataCategoria) it.next()));
        }

        return ret;
    }

    private static List<DataProductoWS> getListDataProductoWS(List<DataProducto> o) {
        List<DataProductoWS> ret = new ArrayList();
        Iterator it = o.iterator();
        while (it.hasNext()) {

            ret.add(toProducto((DataProducto) it.next()));
        }

        return ret;

    }

    public static List<DataClienteCompraProductoWS> getListClienteCompraProductoWS(List<DataClienteCompraProducto> o) {
        List<DataClienteCompraProductoWS> ret = new ArrayList();
        Iterator it = o.iterator();
        while (it.hasNext()) {

            ret.add(toClientCompraProd((DataClienteCompraProducto) it.next()));
        }

        return ret;
    }

    public static HashMap<String, DataEspecificacionProductoWS> getMapDataEspecificacionProductoWS(Map<String, DataEspecificacionProducto> map) {
        Iterator it = map.values().iterator();
        HashMap<String, DataEspecificacionProductoWS> lp = new HashMap();
        while (it.hasNext()) {
            DataEspecificacionProductoWS de = toEspecificacionProducto((DataEspecificacionProducto) it.next());
            lp.put(de.getNroReferencia(), de);
        }
        return lp;
    }

}
