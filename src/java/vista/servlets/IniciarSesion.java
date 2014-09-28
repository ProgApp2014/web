package vista.servlets;

import controlador.clases.ProxyUsuario;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class IniciarSesion extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String usuario = request.getParameter("usuario");
        String clave = request.getParameter("clave");

        try {
//            DataUsuarioWS usr = Proxyusuario.getInstance().buscarUsuario(usuario);
//            if(!usr.getPassword().equals(clave))
//                nuevoEstado = "Login incorrecto";
//            else {
//                nuevoEstado = "Login correcto";
//                request.getSession().setAttribute("usuario_logueado", usr.getEmail());
//            }
            request.getSession().setAttribute("usuario_logueado", "andresbotta@gmail.com");
        } catch(Exception ex){
            response.sendError(404);
            request.getRequestDispatcher("/WEB-INF/404.jsp").include(request, response);
            return;
        }
        
        response.sendRedirect("home");
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
