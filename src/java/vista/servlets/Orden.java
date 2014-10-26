package vista.servlets;

import controlador.clases.ProxyOrden;
import controlador.middleware.DataEspecificacionProducto;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map.Entry;

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
        
        HashMap<String, DatosProducto> mp = new HashMap();
        for (DataEspecificacionProducto p : productos) {
            if (!mp.containsKey(p.getNroReferencia())) {
                mp.put(p.getNroReferencia(), new DatosProducto(p));
            } else {
                mp.get(p.getNroReferencia()).incrementar();
            }
        }
        
        String json = "[";
        Integer i = 0;
        for (Entry<String, DatosProducto> dp : mp.entrySet()){
            DatosProducto valor = dp.getValue();
            i++;
            json += "{\"nroRef\": \"" + valor.getProducto().getNroReferencia() + "\",\"nombre\": \"" + valor.getProducto().getNombre() + "\",\"precio\": \"" + valor.getProducto().getPrecio() + "\",\"cantidad\": \"" + valor.getCantidad() + "\"}";
            if(i < mp.size()){
                json += ",";
            }
        }
        json += "]";
        
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.print(json);
        out.close();
    }
    
    class DatosProducto {

        private int cantidad;
        private DataEspecificacionProducto p;

        private DatosProducto() {

        }

        public DatosProducto(DataEspecificacionProducto producto) {

            this.p = producto;
            this.cantidad = 1;

        }

        private void incrementar() {
            this.cantidad++;
        }

        private DataEspecificacionProducto getProducto() {
            return p;
        }

        private int getCantidad() {
            return cantidad;
        }

    }
}
