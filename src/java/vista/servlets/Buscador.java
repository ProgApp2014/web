package vista.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Buscador extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String buscar = request.getParameter("buscar");
        String ordenBusqueda = request.getParameter("ordenBusqueda");
        ordenBusqueda = ordenBusqueda == null?"nombre":ordenBusqueda;
        request.setAttribute("buscar", buscar);
        request.setAttribute("ordenBusqueda", ordenBusqueda);
        request.getRequestDispatcher("/WEB-INF/buscador.jsp").forward(request, response);
    }
    
}
