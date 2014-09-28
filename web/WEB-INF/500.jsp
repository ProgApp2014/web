<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
  <head>
      
    <jsp:include page="/WEB-INF/includes/head.jsp"/>
    
  </head>
  <body class='contrast-red error contrast-background'>
    <div class='middle-container'>
      <div class='middle-row'>
        <div class='middle-wrapper'>
          <div class='error-container-header'>
            <div class='container'>
              <div class='row'>
                <div class='col-sm-12'>
                  <div class='text-center'>
                    <i class='icon-exclamation-sign'></i>
                    500
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class='error-container'>
            <div class='container'>
              <div class='row'>
                <div class='col-sm-4 col-sm-offset-4'>
                  <h4 class='text-center title'>
                    Ooops! Something went wrong.
                    <br>
                    But don't worry - we'll fix that soon.
                  </h4>
                  <p class='text-center'>
                    <b><%= exception.getClass().getName() %>:</b> <%= exception.getMessage() %><br/>
                    <%= exception.getCause() %><br/>
                    <% for(StackTraceElement ste: exception.getStackTrace()){ %>
                    <small><%= ste.toString() %></small><br/>
                    <% } %>
                  </p>
                  <div class='text-center'>
                    <a class='btn btn-md btn-ablock' href='home'>
                      <i class='icon-chevron-left'></i>
                      Go back
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
