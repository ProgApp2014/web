package vista.servlets;

import Controlador.DataTypes.DataEspecificacionProducto;
import controlador.clases.ProxyProducto;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ProductoDetalle extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nro_ref = request.getParameter("id");
        if (nro_ref != null) {
            DataEspecificacionProducto dataProducto = ProxyProducto.getInstance().mostrarDatosProducto(nro_ref);
            request.setAttribute("producto", dataProducto);
            request.getRequestDispatcher("/WEB-INF/detalle-producto.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("/WEB-INF/404.jsp").include(request, response);
        }
        
    }

}
