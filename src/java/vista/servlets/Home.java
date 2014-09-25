package vista.servlets;
 
import Controlador.DataTypes.DataCategoria;
import Controlador.DataTypes.DataEspecificacionProducto;  
import controlador.clases.ProxyProducto; 
import controlador.clases.TreeParser; 
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Home extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
         String cat = request.getParameter("cat"); 
        List<DataEspecificacionProducto> productos = new ArrayList(); 
    
        if(cat != null) {
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
            request.setAttribute("categorias",  tp.buildTree(categorias));
        } catch(Exception ex){
            response.sendError(404);
            request.getRequestDispatcher("/WEB-INF/404.jsp").include(request, response);
            return;
        }
        
        request.getRequestDispatcher("/WEB-INF/home.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
