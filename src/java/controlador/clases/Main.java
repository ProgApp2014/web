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
        TreeParser c = new TreeParser();
        recorrer(c.buildTree(ProxyProducto.getInstance().listarCategorias()));
    }
      
    public static String recorrer(List<TreeParser.NodoCategoria> l){
        String arbol = "";
        for (TreeParser.NodoCategoria current : l) {
            if(current.hijos!=null && !current.hijos.isEmpty()){
                arbol += "<li><label class=\"tree-toggler nav-header\">" + current.nombre + "</label>";
                arbol += "<ul class=\"nav-list tree none\">";
                arbol += recorrer(current.hijos);
                arbol += "</ul>";
            }else{
                arbol += "<li><a href=\"#\">" + current.nombre + "</a></li>";
            }
        }
        System.out.println(arbol);
        return arbol;
    }
}
