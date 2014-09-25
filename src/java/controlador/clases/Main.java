/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controlador.clases;

/**
 *
 * @author rodro
 */
public class Main {
    
      public static void main(String args[]) {
           
          System.out.println(ProxyUsuario.getInstance().listarClientes());
 
 
          System.out.println(ProxyProducto.getInstance().listarCategorias());
          TreeParser c = new TreeParser();
          System.out.println(c.buildTree(ProxyProducto.getInstance().listarCategorias()));
      }
}
