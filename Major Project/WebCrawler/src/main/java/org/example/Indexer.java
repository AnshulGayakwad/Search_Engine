package org.example;

import org.jsoup.nodes.Document;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/*
* what Indexer do -->
* 1) It select important links &
* 2) Store in the MySQL database
*/
public class Indexer {
    static Connection connection = null;

    Indexer(Document document, String url){
        //Select important elements of document which is coming from Crawler
        String title = document.title();
        String link = url;
        String text = document.text();

        //Now save this elements in Database
        try{
            connection = DatabaseConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("Insert into pages values(?, ?, ?);");
            preparedStatement.setString(1, title);
            preparedStatement.setString(2, link);
            preparedStatement.setString(3, text);
            //push into database
            preparedStatement.executeUpdate();
        }
        catch (SQLException sqlException){
            sqlException.printStackTrace();
        }
    }
}
