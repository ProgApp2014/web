/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vista.servlets;

import controlador.clases.ProxyUsuario;
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
public class ActDesNotificaciones extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Boolean estado = request.getParameter("estado").equals("true")?true:false;
        String cliente = request.getParameter("cliente");
        if(estado){
            ProxyUsuario.getInstance().habilitarNotificaciones(cliente);
        }else{
            ProxyUsuario.getInstance().deshabilitarNotificaciones(cliente);
        }
        
    }
}