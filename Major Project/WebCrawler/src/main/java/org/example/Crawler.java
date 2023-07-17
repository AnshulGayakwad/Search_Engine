package org.example;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.IOException;
import java.util.*;

public class Crawler {
    HashSet<String> urlSet;
    int MAX_DEPTH = 2;
    Crawler(){
        urlSet = new HashSet<>();
    }

    public void getPageTextsAndLinks(String url, int depth){
        //base case
        if(urlSet.contains(url) || depth >= MAX_DEPTH){
            return;
        }
        if(urlSet.add(url)){
            System.out.println(url);
        }

        depth++;
        try{
            //Jsoup will parse HTML object to Java Object
            Document document = Jsoup.connect(url).timeout(5000).get();
            //Indexer work start here
            Indexer indexer = new Indexer(document, url);

            System.out.println(document.title());
            Elements availableLinksOnPage = document.select("a[href]");
            for (Element currentLink : availableLinksOnPage) {
                getPageTextsAndLinks(currentLink.attr("abs:href"), depth);
            }
        }
        catch (IOException ioException){
            ioException.printStackTrace();
        }
    }

    public static void main(String[] args) {
        Crawler crawler = new Crawler();
        crawler.getPageTextsAndLinks("https://www.javatpoint.com", 0);
    }
}