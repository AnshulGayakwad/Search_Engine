package myServlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

@WebServlet("/Search")
public class Search extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //get parameter from index page(frontend page)
        String keyword = request.getParameter("keyword");
        //Setting connection with database
        Connection connection = DatabaseConnection.getConnection();

        /*
        In try block we are doing Ranking part.
        So, there are various Ranking algorithms to rank the website at top of the search
        For Ex-> Google use sentiment ranking algo. -> This algo. will understand what the page is saying, and after judging
        Index is given according to ranking and then appear on webpage.

        Here we are using simple ranking system
        We are going to count no. of occurrence of keyword in pageText, whose count is greater will be at early position.
        */
        try{
            //Store the query of user as History
            PreparedStatement preparedStatement = connection.prepareStatement("insert into history values(?, ?);");
            preparedStatement.setString(1, keyword);
            preparedStatement.setString(2, "http://localhost:8080/Search_Engine/Search?keyword="+keyword);
            preparedStatement.executeUpdate();

            //getting results after running the ranking query
            ResultSet resultSet = connection.createStatement().executeQuery("select pageTitle, pageLink, (length(lower(pageText))-length(replace(lower(pageText), '" + keyword.toLowerCase() + "', '')))/length('" + keyword.toLowerCase() + "') as countoccurance from pages order by countoccurance desc limit 30;");
            //we have to store the result in arrayList
            ArrayList<SearchResult> results = new ArrayList<>();
            //transferring the values  from resultSet to arrayList
            //traverse elements Resultset
            while (resultSet.next()) {
                SearchResult searchResult = new SearchResult();
                searchResult.setTitle(resultSet.getString("pageTitle"));
                searchResult.setLink(resultSet.getString("pageLink"));
                results.add(searchResult);
            }
            //print arraylist in console
            for (SearchResult result : results){
                System.out.println(result.getTitle()+"\n"+result.getLink()+"\n");
            }
            //sending data to frontend
            request.setAttribute("results", results);
            request.getRequestDispatcher("search.jsp").forward(request, response);
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
        }
        catch (SQLException | ServletException sqlException){
            sqlException.printStackTrace();
        }
    }
}
