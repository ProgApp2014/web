package vista.servlets;

import controlador.clases.ProxyOrden;
import controlador.middleware.DataOrdenCompra;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ConfirmarOrden extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Integer nroOrden = Integer.parseInt(request.getParameter("orden"));
        ProxyOrden.getInstance().elegirOrden(nroOrden);
        DataOrdenCompra orden = ProxyOrden.getInstance().mostrarDatosOrden();
        if(orden.getEstadoActualTexto().equals("Preparada")){
            ProxyOrden.getInstance().agregarEstadoOrdenConfirmada(nroOrden);
        }
    }
}