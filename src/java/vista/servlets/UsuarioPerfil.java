package vista.servlets;

import Controlador.DataTypes.DataUsuario;
import controlador.clases.ProxyUsuario;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UsuarioPerfil extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            HttpSession session = request.getSession();
            String userId = session.getAttribute("nickname").toString();
            DataUsuario dataUsuario;
            if(session.getAttribute("esProveedor") != null && session.getAttribute("esProveedor").toString().equals("yes")){
                ProxyUsuario.getInstance().elegirProveedor(userId);
                dataUsuario = ProxyUsuario.getInstance().mostrarDatosProveedor();
            }else{
                ProxyUsuario.getInstance().elegirCliente(userId);
                dataUsuario = ProxyUsuario.getInstance().mostrarDatosCliente();
            }
            request.setAttribute("usuario", dataUsuario);
            request.getRequestDispatcher("/WEB-INF/perfil.jsp").forward(request, response);
    }

}
