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
    <link rel="stylesheet" href="style.css" />

    <title>Search Engine</title>
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

        <!--Main Body Start-->
        <div class="row">
          <div class="col-lg-6">
            <img
              class="title-image"
              src="Images/search.jpg"
              alt="Search Engine"
            />
          </div>

          <div class="col-lg-6 maintext">
            <table>
              <tr>
                <td>
                  <h1 class="big-heading">
                    Do Simple Search with
                    <span class="bigText-style">Search Engine</span>
                  </h1>
                </td>
              </tr>
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
                          class="btn btn-dark btn-lg download-button"
                        >
                          Search <i class="fas fa-search"></i>
                        </button>
                      </tr>
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
        </div>
        <!--Main Body End-->
      </div>
    </section>

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
