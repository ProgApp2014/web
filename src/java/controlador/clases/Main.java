/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controlador.clases;

import java.util.Iterator;
import java.util.List;

/**
 *
 * @author rodro
 */
public class Main {
    
      public static void main(String args[]) {
           
          System.out.println(ProxyUsuario.getInstance().listarClientes());
 
 
          System.out.println(ProxyProducto.getInstance().listarCategorias());
          TreeParser c = new TreeParser();
          recorrer(c.buildTree(ProxyProducto.getInstance().listarCategorias()));
      }
      
      public static void recorrer(List<TreeParser.NodoCategoria> l){
          Iterator it = l.iterator();
          while(it.hasNext()){
              TreeParser.NodoCategoria current = (TreeParser.NodoCategoria)it.next();
              System.out.println(current.nombre);
              if(current.hijos!=null && !current.hijos.isEmpty()){
                  recorrer(current.hijos);
              }
          }
    
      }
}
