package vista.servlets;

import controlador.clases.ProxyUsuario;
import controlador.middleware.DataCliente;
import controlador.middleware.DataProveedor;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ValidarUsuario extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nickname = request.getParameter("nickname");
        String email = request.getParameter("email");
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        List<DataCliente> clientes = ProxyUsuario.getInstance().listarClientes();
        List<DataProveedor> proveedores = ProxyUsuario.getInstance().listarProveedores();
        if(nickname != null){
            for(DataCliente c : clientes){
                if(c.getNickname().equals(nickname)){
                    response.sendError(404);
                    return;
                }
            }
            
            for(DataProveedor p : proveedores){
                if(p.getNickname().equals(nickname)){
                    response.sendError(404);
                    return;
                }
            }
        }
        
        if(email != null){
            for(DataCliente c : clientes){
                if(c.getEmail().equals(email)){
                    response.sendError(404);
                    return;
                }
            }
            
            for(DataProveedor p : proveedores){
                if(p.getEmail().equals(email)){
                    response.sendError(404);
                    return;
                }
            }
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
}
