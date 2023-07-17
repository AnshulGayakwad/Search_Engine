<%@ page import="myServlet.HistoryResult" %>
<%@ page import="java.util.ArrayList" %>

<html>
  <head>
    <!-- Font Awesome -->
    <script
      src="https://kit.fontawesome.com/373af5142a.js"
      crossorigin="anonymous"
    ></script>

    <!-- Fevicon -->
    <link rel="icon" type="image/x-icon" href="Images/favicon.ico" />

    <!-- CSS Stylesheets -->
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
      integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
      crossorigin="anonymous"
    />

    <!-- Local CSS-->
    <link rel="stylesheet" href="serHis.css">

    <title>Search History</title>
  </head>
  <body>
    <section class="colored-section" id="title">
      <div>
        <!--Navigation Bar Start-->
        <nav class="navbar navbar-expand-lg navbar-light">
          <a class="navbar-brand" href="index.jsp"
            >Search Engine <i class="fas fa-search"></i
          ></a>

          <button
            class="navbar-toggler"
            type="button"
            data-toggle="collapse"
            data-target="#navbarTogglerDemo02"
          >
            <span class="navbar-toggler-icon"></span>
          </button>

          <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
            <ul class="navbar-nav ml-auto">
              <li class="nav-item">
                <a class="nav-link" href="#">About Us</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#footer">Contact</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="">More</a>
              </li>
            </ul>
          </div>
        </nav>
        <!--Navigation Bar End-->
      </div>
      <!-- Form  -->
      <div class="col-lg-6 maintext">
        <table>
          <tr>
            <td>
              <form action="Search">
                <table>
                  <tr>
                    <input
                      type="text"
                      name="keyword"
                      class="form-control"
                      placeholder="Search Here"
                      required
                    />
                  </tr>
                  <tr>
                    <button
                      type="submit"
                      class="btn btn-dark btn-lg download-button" style="margin-right: 20px;"
                    >
                      Search <i class="fas fa-search"></i>
                    </button>
                  </tr>
                  <tr></tr>
                  <tr>
                    <a href="History"
                      ><button
                        type="button"
                        class="btn btn-outline-info btn-lg download-button"
                      >
                        Get History
                      </button></a
                    >
                  </tr>
                </table>
              </form>
            </td>
          </tr>
        </table>
      </div>
      <!-- Form end -->
    </section>

    <div class="container-fluid" style="padding: 0 8%;">
      <hr>
      <h4 style="color: rgb(23, 23, 23);">Showing History</h4>
      <hr>
      <table border=2x class="table table-bordered table-hover table-light table-striped ">
        <thead class="table-light">
          <tr>
            <th scope="col" style="text-align: center;">Keyword</th>
            <th scope="col" style="text-align: center;">Link</th>
          </tr>
        </thead>
        <%
         ArrayList<HistoryResult> results = (ArrayList<HistoryResult>)request.getAttribute("results");
        for(HistoryResult result : results){
        %>
        <tbody>
          <tr>
            <td style="text-align: center;"><% out.println(result.getKeyword()); %></td>
            <td style="text-align: center;"><a href= "<% out.println(result.getLink()); %>"><% out.println(result.getLink()); %></a></td>
          </tr>
        </tbody>
        
      <%
        }
      %>
      </table>
    </div>

    <div style="padding-top: 30px;"></div>

    <!-- Footer -->

    <footer class="white-section footer" id="footer">
      <div class="container-fluid">
        <i class="social-icon fab fa-facebook-f fa-2x"></i>
        <i class="social-icon fab fa-twitter fa-2x"></i>
        <i class="social-icon fab fa-linkedin fa-2x"></i>
        <i class="social-icon fab fa-instagram fa-2x"></i>
        <i class="social-icon fas fa-envelope fa-2x"></i>
        <p class="bottom">Made with <i class="fas fa-heart fa-1x"></i></p>
        <p class="copyright">©Anshul Gayakwad 2023 Search Engine</p>
      </div>
    </footer>
  </body>
</html>