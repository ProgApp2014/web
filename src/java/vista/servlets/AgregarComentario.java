/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vista.servlets;

import controlador.clases.ProxyProducto;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author dario
 */
public class AgregarComentario  extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idPadre = request.getParameter("padre");
        String nroRef = request.getParameter("nroRef");
        String cliente = request.getParameter("cliente");
        String comentario = request.getParameter("comentario");
        
        ProxyProducto.getInstance().agregarComentario(cliente, nroRef, idPadre == null?null:Integer.parseInt(idPadre), comentario);
    }
}
