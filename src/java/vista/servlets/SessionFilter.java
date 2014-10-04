package vista.servlets;
 
import java.io.IOException;
import java.util.ArrayList;
import java.util.StringTokenizer;
 
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
 
public class SessionFilter implements Filter {
 
    private ArrayList<String> urlsLstCliente;
    private ArrayList<String> urlsLstVisitante;
    private ArrayList<String> urlsLstProveedor;
     
    public void destroy() {
    }
 
    public void doFilter(ServletRequest req, ServletResponse res,
            FilterChain chain) throws IOException, ServletException {
 
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        HttpSession session = request.getSession();
        
        String url = request.getServletPath();
        
        ArrayList<String> allUrls = new ArrayList<String>();
        allUrls.add("/home");
        allUrls.add("/registro-usuario");
        allUrls.add("/registro-producto");
        if(allUrls.contains(url)){

            if(session.getAttribute("usuario_logueado") == null && !urlsLstVisitante.contains(url)){
                RequestDispatcher dispatcher = request.getRequestDispatcher("home");
                dispatcher.forward(request, response);
            }
            if(session.getAttribute("usuario_logueado") != null && session.getAttribute("esProveedor") != null && "yes".equals(session.getAttribute("esProveedor").toString()) && !urlsLstProveedor.contains(url)){
                RequestDispatcher dispatcher = request.getRequestDispatcher("home");
                dispatcher.forward(request, response);
                System.out.println("ACAAA2 "+url);
            }

            if(session.getAttribute("usuario_logueado") != null && session.getAttribute("esProveedor") == null && !urlsLstCliente.contains(url)){
                RequestDispatcher dispatcher = request.getRequestDispatcher("home");
                dispatcher.forward(request, response);
            }
        } 
        chain.doFilter(req, res);
    }
 
    public void init(FilterConfig config) throws ServletException {
        String urlsCliente = config.getInitParameter("cliente-urls");
        StringTokenizer tokenCliente = new StringTokenizer(urlsCliente, ",");
        String urlsVisitante = config.getInitParameter("visitante-urls");
        StringTokenizer tokenVisitante = new StringTokenizer(urlsVisitante, ",");
        String urlsProveedor = config.getInitParameter("proveedor-urls");
        StringTokenizer tokenProveedor = new StringTokenizer(urlsProveedor, ",");
 
        urlsLstCliente = new ArrayList<String>();
        urlsLstVisitante = new ArrayList<String>();
        urlsLstProveedor = new ArrayList<String>();
 
        while (tokenCliente.hasMoreTokens()) {
            urlsLstCliente.add(tokenCliente.nextToken());
 
        }
        while (tokenVisitante.hasMoreTokens()) {
            urlsLstVisitante.add(tokenVisitante.nextToken());
 
        }
        while (tokenProveedor.hasMoreTokens()) {
            urlsLstProveedor.add(tokenProveedor.nextToken());
 
        }
    }
}