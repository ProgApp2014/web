package vista.servlets;

import controlador.clases.ProxyUsuario;
import controlador.middleware.DataCliente;
import controlador.middleware.DataProveedor;
import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.xml.datatype.XMLGregorianCalendar;

@MultipartConfig(maxFileSize = 16177215)
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
            String imagen = null;

           /*
            ImageHandler ih = new ImageHandler();
            Part imgPart = request.getPart("imagen");
            String imageName = getFileName(imgPart);
            if(imageName!=null && !imageName.isEmpty()){
                imagen = ih.saveInputStream(imgPart.getInputStream(),imageName);
            }
            */
            String fechaNacimiento = request.getParameter("fecha_nacimiento");
            Date date = new SimpleDateFormat("yyyy-MM-dd").parse(fechaNacimiento);
            Calendar fnac = Calendar.getInstance();
            fnac.setTime(date);

            String esProveedor = request.getParameter("proveedor");
            if ("proveedor".equals(esProveedor)) {
                DataProveedor proveedor = new DataProveedor();
                 proveedor.setNickname(nickname);
                proveedor.setPassword(password);
                proveedor.setNombre(nombre);
                proveedor.setApellido(apellido);
                proveedor.setEmail(email); 
               //proveedor.setFechaNacimiento(fnac);
                proveedor.setNombreCompania(nombreCompania);
                proveedor.setLinkSitio(linkSitio);
                
                proveedor.setImagen(imagen);
                ProxyUsuario.getInstance().ingresarDatosProveedor(proveedor);
            } else {
                DataCliente cliente = new DataCliente();
                cliente.setNickname(nickname);
                cliente.setPassword(password);
                cliente.setNombre(nombre);
                cliente.setApellido(apellido);
                cliente.setEmail(email);
               // cliente.setFechaNacimiento(fnac);
                cliente.setImagen(imagen);
                ProxyUsuario.getInstance().ingresarDatosCliente(cliente);
            }

            ProxyUsuario.getInstance().guardarUsuario();

            response.sendRedirect("home");
        } catch (Exception ex) {
            response.sendError(404);
            System.out.println(ex.getMessage());
            request.getRequestDispatcher("/WEB-INF/404.jsp").include(request, response);
        }

    }

    private static String getFileName(Part p) {
        String dispositionHeader = p.getHeader("content-disposition");
        int s = dispositionHeader.indexOf("filename=");
        String fileName = null;
        if (s != -1) {
            fileName = dispositionHeader.substring(s + "filename=".length(), dispositionHeader.length());
            fileName = fileName.replaceAll("\"", "");
        }
        return fileName;

    }

    public static String md5(String input) {

        String md5 = null;

        if (null == input) {
            return null;
        }

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
