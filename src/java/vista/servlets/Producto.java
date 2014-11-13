package vista.servlets;

 
import controlador.clases.ImagesProxy;
import controlador.clases.ProxyProducto;
import controlador.middleware.DataCategoria;
import controlador.middleware.DataEspecificacionProducto;
import controlador.middleware.DataProveedor;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig(maxFileSize = 16177215)
public class Producto extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            List<DataCategoria> categorias = ProxyProducto.getInstance().listarCategorias();
            request.setAttribute("categorias", categorias);
        } catch (Exception ex) {
            response.sendError(404);
            request.getRequestDispatcher("/WEB-INF/404.jsp").include(request, response);
            return;
        }
        request.getRequestDispatcher("/WEB-INF/registro-producto.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String titulo = request.getParameter("titulo");
            String nro_referencia = request.getParameter("nro_referencia");
            String descripcion = request.getParameter("descripcion");
            String precio = request.getParameter("precio");
            String stock = request.getParameter("stock");
            String[] categorias = request.getParameterValues("categorias");
            String[] especificaciones = request.getParameterValues("especificaciones");
            ArrayList<String> imagenes = new ArrayList<>();
             
            Iterator it = request.getParts().iterator();
            ImagesProxy ih = new ImagesProxy();
            while (it.hasNext()) {
                Part p = (Part) it.next();
                if (p.getName().equals("imagenes")) {
                    String fileName = getFileName(p);
                    if (fileName != null && !fileName.isEmpty()) {
                        String imagen = ih.saveImage(p.getInputStream(), fileName);
                        imagenes.add(imagen);
                    }
                }
            }

            Float precioReal = null;
            Integer stockReal = null;

            stockReal = Integer.parseInt(stock);
            precioReal = Float.parseFloat(precio);

            DataProveedor proveedor = ProxyProducto.getInstance().listarProveedores().get(0);
            DataEspecificacionProducto espProducto = new DataEspecificacionProducto();
            espProducto.setDescripcion(descripcion);
            espProducto.setNroReferencia(nro_referencia);
            espProducto.setNombre(titulo);
            espProducto.setPrecio(precioReal);
            espProducto.setProveedor(proveedor);
            
            ProxyProducto.getInstance().elegirProveedor((String) request.getSession().getAttribute("nickname"));
            ProxyProducto.getInstance().ingresarDatosProductos(espProducto);
            if (especificaciones != null) {
                for (String esp : especificaciones) {
                    String[] espe = esp.split(":");
                    ProxyProducto.getInstance().ingresarEspecificacion(espe[0], espe[1].trim());
                }
            }

            ProxyProducto.getInstance().agregarMultiplesProductosAutogenerados(stockReal);

            if (categorias != null) {
                for (String cat : categorias) {
                    ProxyProducto.getInstance().agregarCategoriaAEspecificacion(cat);
                }
            } 
            
            if (imagenes != null && imagenes.size() > 0) {
                for (String img : imagenes) {
                    ProxyProducto.getInstance().agregarImagen(img);
                }
            }

            ProxyProducto.getInstance().guardarProducto();
            response.sendRedirect("home");
        } catch (Exception ex) {
            response.sendError(404);
            System.out.println("  sss " + ex.getMessage());
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

}
