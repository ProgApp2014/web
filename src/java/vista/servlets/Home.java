package vista.servlets;


import controlador.clases.ProxyProducto;
import controlador.clases.TreeParser;
import controlador.middleware.DataCategoria;
import controlador.middleware.DataEspecificacionProducto;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Home extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cat = request.getParameter("cat");
        List<DataEspecificacionProducto> productos = new ArrayList();

        if (cat != null) {
            ProxyProducto.getInstance().elegirCategoria(cat);
            productos = ProxyProducto.getInstance().listarProductosCategoria();
            request.setAttribute("productos", productos);
            request.setAttribute("cat", cat);
        } else {
            request.setAttribute("productos", productos);
            request.setAttribute("cat", null);
        }

        try {
            TreeParser tp = new TreeParser();
            List<DataCategoria> categorias = ProxyProducto.getInstance().listarCategorias();
            request.setAttribute("categorias", tp.buildTree(categorias));
        } catch (Exception ex) {
            response.sendError(404);
            request.getRequestDispatcher("/WEB-INF/404.jsp").include(request, response);
            return;
        }

        request.getRequestDispatcher("/WEB-INF/home.jsp").forward(request, response);
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
