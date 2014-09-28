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
import static controlador.clases.ConvertidorFrontEnd.getListClienteCompraProductoWS;
import static controlador.clases.ConvertidorFrontEnd.getListDataCategoriaWS;
import static controlador.clases.ConvertidorFrontEnd.getMapDataEspecificacionProductoWS;
import static controlador.clases.ConvertidorFrontEnd.toCategoria;
import static controlador.clases.ConvertidorFrontEnd.toClientCompraProd;
import static controlador.clases.ConvertidorFrontEnd.toCliente;
import static controlador.clases.ConvertidorFrontEnd.toEspecificacionProducto;
import static controlador.clases.ConvertidorFrontEnd.toProducto;
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
public class ConvertidorBackend {
    
    public static DataCategoria toCategoria(DataCategoriaWS o) {
        
        DataCategoria ret = null;
        
        
 
        if (o.getPadre() != null) { 
            
            ret = new DataCategoria(o.getNombre(), toCategoria(o.getPadre()));
        
        }else{
            ret = new DataCategoria(o.getNombre(), null);
        }
        Map<String, DataEspecificacionProducto> lp = getMapDataEspecificacionProducto(o.getListaProductos());
        ret.setListaProductos(lp);
        return ret;
    }

    public static DataEspecificacionProducto toEspecificacionProducto(DataEspecificacionProductoWS o) {
        ArrayList<String> imagenes =  new ArrayList();
        imagenes.addAll(o.getImagenes());
        DataEspecificacionProducto ret = new DataEspecificacionProducto(o.getNroReferencia(), o.getNombre(), o.getDescripcion(), o.getEspecificacion(), o.getPrecio(), toProveedor(o.getProveedor()), imagenes, getListDataCategoria(o.getCategorias()), getListDataProducto(o.getProductos()));       
        return ret;
    }

    public static DataProducto toProducto(DataProductoWS o) {
        DataProducto ret =  new DataProducto(o.getId(), o.getIdEspecifico(), o.isEnOrden(), toEspecificacionProducto(o.getEspecificacionProducto()));
        return ret;
    }

    public static DataProveedor toProveedor(DataProveedorWS o) {
        return new DataProveedor(o.getNickname(), "", o.getNombre(), o.getApellido(), o.getEmail(), o.getFechaNacimiento(), o.getNombreCompania(), o.getLinkSitio());

    }

    public static DataCliente toCliente(DataClienteWS o) {
        DataCliente ret = new DataCliente(o.getNickname(), "", o.getNombre(),o.getApellido(),o.getEmail(),o.getFechaNacimiento());
        ret.setImagen(o.getImagen());
 
        return ret;
    }

    public static DataOrdenCompra toOrden(DataOrdenCompraWS o) {
        DataOrdenCompra ret = new DataOrdenCompra(o.getNroOrden(),getListClienteCompraProducto(o.getClienteCompraProducto()));
        ret.setFecha(o.getFecha()); 
        ret.setPrecioTotal(o.getPrecioTotal()); 
        return ret;
    }

    public static DataClienteCompraProducto toClientCompraProd(DataClienteCompraProductoWS o) {
    
        DataClienteCompraProducto ret = new DataClienteCompraProducto(toCliente(o.getCliente()), toProducto(o.getProducto()),o.getPrecio());
        return ret;
    }
    
    public static DataComentario toComentario(DataComentarioWS o) {
        DataComentario ret = new DataComentario(toCliente(o.getCliente()), toEspecificacionProducto(o.getEspecificacionProducto()), o.getComentario());
        return ret;
    }

    public static ArrayList<DataCategoria> getListDataCategoria(List<DataCategoriaWS> o) {
        ArrayList<DataCategoria> ret = new ArrayList();
        Iterator it = o.iterator();
        while (it.hasNext()) {

            ret.add(toCategoria((DataCategoriaWS) it.next()));
        }

        return ret;
    }

    public static List<DataProducto> getListDataProducto(List<DataProductoWS> o) {
        List<DataProducto> ret = new ArrayList();
        Iterator it = o.iterator();
        while (it.hasNext()) {

            ret.add(toProducto((DataProductoWS) it.next()));
        }

        return ret;

    }

    public static List<DataClienteCompraProducto> getListClienteCompraProducto(List<DataClienteCompraProductoWS> o) {
        List<DataClienteCompraProducto> ret = new ArrayList();
        Iterator it = o.iterator();
        while (it.hasNext()) {

            ret.add(toClientCompraProd((DataClienteCompraProductoWS) it.next()));
        }

        return ret;
    }

    public static HashMap<String, DataEspecificacionProducto> getMapDataEspecificacionProducto(Map<String, DataEspecificacionProductoWS> map) {
        Iterator it = map.values().iterator();
        HashMap<String, DataEspecificacionProducto> lp = new HashMap();
        while (it.hasNext()) {
            DataEspecificacionProducto de = toEspecificacionProducto((DataEspecificacionProductoWS) it.next());
            lp.put(de.getNroReferencia(), de);
        }
        return lp;
    }
}
