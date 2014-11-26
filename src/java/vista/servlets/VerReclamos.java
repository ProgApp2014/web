/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vista.servlets;

import controlador.clases.ProxyProducto;
import controlador.clases.ProxyUsuario;
import controlador.middleware.DataReclamo;
import controlador.middleware.DataUsuario;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 *
 * @author mauro
 */
public class VerReclamos extends HttpServlet{
//QUE VA ACA??? no tengo claro si la lista de reclamos la itero aca o en el jsp con los <% %>, mirar el web.xml por las dudas   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String userId = session.getAttribute("nickname").toString();
        request.getRequestDispatcher("/WEB-INF/ver-reclamos.jsp").forward(request, response);
    }

}
