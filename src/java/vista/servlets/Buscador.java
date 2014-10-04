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
        request.setAttribute("buscar", buscar);
        request.getRequestDispatcher("/WEB-INF/buscador.jsp").forward(request, response);
    }
    
}
