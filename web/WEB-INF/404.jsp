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
                    <i class='icon-question-sign'></i>
                    404
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class='error-container'>
            <div class='container'>
              <div class='row'>
                <div class='col-sm-4 col-sm-offset-4'>
                  <h4 class='text-center title'>Ooops! We can't find what you're looking for.</h4>
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

