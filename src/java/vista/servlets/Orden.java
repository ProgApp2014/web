package vista.servlets;

import Controlador.DataTypes.DataEspecificacionProducto;
import controlador.clases.ProxyOrden;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Orden extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/carrito.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Integer nroOrden = Integer.parseInt(request.getParameter("nroOrden"));
        ProxyOrden.getInstance().elegirOrden(nroOrden);
        List<DataEspecificacionProducto> productos = ProxyOrden.getInstance().listarProductosEnOrden();
        
        String json = "[";
        Integer i = 0;
        for (DataEspecificacionProducto p : productos) {
            i++;
            json += "{\"nroRef\": \"" + p.getNroReferencia() + "\",\"nombre\": \"" + p.getNombre() + "\",\"precio\": \"" + p.getPrecio() + "\"}";
            if(i < productos.size()){
                json += ",";
            }
        }
        json += "]";
        
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.print(json);
        out.close();
    }
}
