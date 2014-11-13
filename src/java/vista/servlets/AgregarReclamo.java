
package vista.servlets;

import controlador.clases.ProxyProducto;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author mauro
 */
public class AgregarReclamo  extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nroRef = request.getParameter("nroRef");
        String cliente = request.getParameter("cliente");
        String reclamo = request.getParameter("reclamo");
        
        ProxyProducto.getInstance().agregarReclamo(cliente, nroRef, reclamo);
    }
}    

