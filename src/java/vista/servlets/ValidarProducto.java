package vista.servlets;

import controlador.clases.ProxyProducto;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ValidarProducto extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nroRef = request.getParameter("nroRef");

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        if (nroRef != null) {
            Boolean existe = ProxyProducto.getInstance().verificarEspecificacionProducto(nroRef);
            if (existe) {
                response.sendError(404);
                return;
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
