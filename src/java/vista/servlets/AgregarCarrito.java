/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vista.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author dario
 */
public class AgregarCarrito extends HttpServlet {
     @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idProducto = request.getParameter("nroRef");
        String cantidad = request.getParameter("cantidad");
        HttpSession session = request.getSession();
        String carrito = session.getAttribute("carrito") == null?"":session.getAttribute("carrito").toString();
        String nuevoCarrito = "";
        Boolean agregado = false;
        if(carrito.equals("")){
            carrito = cantidad + "-"+idProducto;
        }else{
            for(String iter : carrito.split(";")){
                String[] current = iter.split("-");
                if(current[1].equals(idProducto)){
                    agregado = true;
                    current[0] = String.valueOf(Integer.parseInt(current[0]) + Integer.parseInt(cantidad));
                }
                nuevoCarrito += nuevoCarrito.equals("")?current[0]+"-"+current[1]:";"+current[0]+"-"+current[1];
            }
            if(!agregado)
                nuevoCarrito += ";"+cantidad + "-"+idProducto;
            carrito = nuevoCarrito;
        }
        session.setAttribute("carrito", carrito);
    }
}
