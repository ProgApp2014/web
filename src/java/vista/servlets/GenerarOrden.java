/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vista.servlets;

import Controlador.DataTypes.DataOrdenCompra;
import controlador.clases.ProxyOrden;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author dario
 */
public class GenerarOrden extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String carrito = session.getAttribute("carrito") == null?"":session.getAttribute("carrito").toString();
        ProxyOrden.getInstance().elegirCliente(session.getAttribute("nickname").toString());
        if(!carrito.equals("")){
            for(String iter : carrito.split(";")){
                String[] current = iter.split("-");
                ProxyOrden.getInstance().elegirEspecificacionProducto(current[1]);
                ProxyOrden.getInstance().elegirCantidadProducto(Integer.parseInt(current[0]));
                ProxyOrden.getInstance().generarItemOrden();
            }
             DataOrdenCompra dataOrden = new DataOrdenCompra(0);
            ProxyOrden.getInstance().guardarOrden(dataOrden);
            session.setAttribute("carrito", null);
        }
    }
    
}
