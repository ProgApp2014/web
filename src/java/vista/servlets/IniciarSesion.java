package vista.servlets;

import controlador.clases.ProxyUsuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class IniciarSesion extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String usuario = request.getParameter("email");
        String clave = request.getParameter("password");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            if(!ProxyUsuario.getInstance().login(usuario,md5(clave))){
                out.println("Error");
            }else{
                if(ProxyUsuario.getInstance().esCliente(usuario)){
                    ProxyUsuario.getInstance().elegirCliente(usuario);
                    HttpSession session = request.getSession();
                    session.setAttribute("esCliente","yes");
                    session.setAttribute("usuario_logueado", ProxyUsuario.getInstance().mostrarDatosCliente().getNombre() + " " + ProxyUsuario.getInstance().mostrarDatosCliente().getApellido());
                    session.setAttribute("nickname", usuario);
                    out.println("Ok");
                }else if(ProxyUsuario.getInstance().esProveedor(usuario)){
                    HttpSession session = request.getSession();
                    ProxyUsuario.getInstance().elegirProveedor(usuario);
                    session.setAttribute("esProveedor","yes");
                    session.setAttribute("usuario_logueado", ProxyUsuario.getInstance().mostrarDatosProveedor().getNombre() + " " + ProxyUsuario.getInstance().mostrarDatosProveedor().getApellido());
                    session.setAttribute("nickname", usuario);
                    out.println("Ok");
                }
            }
        } catch(Exception ex){
            response.sendError(404);
            request.getRequestDispatcher("/WEB-INF/404.jsp").include(request, response);
            response.sendRedirect("homeERROR");
            return;
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
    
    public static String md5(String input) {
         
        String md5 = null;
         
        if(null == input) return null;
         
        try {
             
        //Create MessageDigest object for MD5
        MessageDigest digest = MessageDigest.getInstance("MD5");
         
        //Update input string in message digest
        digest.update(input.getBytes(), 0, input.length());
 
        //Converts message digest value in base 16 (hex)
        md5 = new BigInteger(1, digest.digest()).toString(16);
 
        } catch (NoSuchAlgorithmException e) {
 
            e.printStackTrace();
        }
        return md5;
    }
}
