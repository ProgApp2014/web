package vista.servlets;

import Controlador.DataTypes.DataCliente;
import Controlador.DataTypes.DataProveedor;
import controlador.clases.ProxyUsuario;
import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Usuario extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/registro-usuario.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String nickname = request.getParameter("nickname");
            String password = md5(request.getParameter("password"));
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String email = request.getParameter("email");
            String nombreCompania = request.getParameter("nombre_compania");
            String linkSitio = request.getParameter("link_sitio");
            String imagen = request.getParameter("imagen");

            String fechaNacimiento = request.getParameter("fecha_nacimiento");
            Date date = new SimpleDateFormat("yyyy-MM-dd").parse(fechaNacimiento);
            Calendar fnac = Calendar.getInstance();
            fnac.setTime(date);

            String esProveedor = request.getParameter("proveedor");
            if ("proveedor".equals(esProveedor)) {
                DataProveedor proveedor = new DataProveedor(nickname, password, nombre, apellido, email, fnac, nombreCompania, linkSitio);
                proveedor.setImagen(imagen);
                ProxyUsuario.getInstance().ingresarDatosProveedor(proveedor);
            } else {
                DataCliente cliente = new DataCliente(nickname, password, nombre, apellido, email, fnac);
                cliente.setImagen(imagen);
                ProxyUsuario.getInstance().ingresarDatosCliente(cliente);
            }

            ProxyUsuario.getInstance().guardarUsuario();
        } catch (Exception ex) {
            response.sendError(404);
            request.getRequestDispatcher("/WEB-INF/404.jsp").include(request, response);
        }

        response.sendRedirect("home");
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
