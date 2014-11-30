package vista.servlets;
 
import controlador.clases.ProxyProducto;
import controlador.clases.TreeParserComentarios;
import controlador.middleware.DataComentario;
import controlador.middleware.DataEspecificacionProducto;
import java.io.IOException;
import java.util.List;
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
            TreeParserComentarios tp = new TreeParserComentarios();
            List<DataComentario> comentarios = ProxyProducto.getInstance().listarComentarios(nro_ref);
            request.setAttribute("comentarios", tp.buildTree(comentarios));
            request.getRequestDispatcher("/WEB-INF/detalle-producto.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("/WEB-INF/404.jsp").include(request, response);
        }
        
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {

            String cliente = request.getParameter("cliente");
            String nroRef = request.getParameter("nroRef");
            Integer puntaje = Integer.parseInt(request.getParameter("apellido"));

            ProxyProducto.getInstance().agregarPuntaje(cliente, nroRef, puntaje);
        } catch (Exception ex) {
            response.sendError(404);
            System.out.println(ex.getMessage()+" "+ex.getStackTrace());
            request.getRequestDispatcher("/WEB-INF/404.jsp").include(request, response);
        }

    }

}
