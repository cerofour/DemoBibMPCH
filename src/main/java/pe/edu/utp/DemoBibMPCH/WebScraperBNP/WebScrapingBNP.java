package pe.edu.utp.DemoBibMPCH.WebScraperBNP;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

/*
TODO: We need to go through all the pages and
 solve the NOT DETECTED issue in the author
 */
@Service
public class WebScrapingBNP {

    public WebScrapingBNP(){
    }

    public ArrayList<TitleAuthorCode<String, String, String>> scrape(String title) throws IOException {
        /*
        When the result is "NOT DETECTED" it must be verified by directly entering
        the book that is searched in the bnp. Possibly a solution is included.
         */

        String url = "http://info.bnp.gob.pe/cgi-bin/abnopac";

        Connection.Response response = sendRequest(url, Connection.Method.GET, null);

        Document doc = response.parse();

        Element metaRefresh = doc.selectFirst("meta[http-equiv=Refresh]");

        assert metaRefresh != null;

        String metaRefreshValue = metaRefresh.attr("content");

        String token = metaRefreshValue.substring(
                metaRefreshValue.lastIndexOf("/")+1,
                metaRefreshValue.lastIndexOf("?"));

        String newURL = url +"/"+token;

        Map<String, String> data = new HashMap<>();
        data.put("ACC", "131");
        data.put("xsqf01", title);
        data.put("subcat", "/");

        response = sendRequest(newURL, Connection.Method.POST, data);

        doc = response.parse();

        ArrayList<TitleAuthorCode<String, String, String>> result = new ArrayList<>();

        Element divDetailReg = doc.selectFirst("div.dvreg.detailreg");

        if(divDetailReg == null) return result;

        Elements divDvdoc = divDetailReg.select("div.dvdoc");

        for (Element div : divDvdoc) {
            String title1 = Objects.requireNonNull(div.selectFirst("span.coverList"))
                    .select("a").getLast().text();

            String author = div.select("strong.dvauth").getLast().text();

            String number = div.select("strong.dvauth").getFirst().text();

            if(author.equals(number)) author = "NOT_DETECTED";

            Elements tr = div.select("tr");

            if(tr.isEmpty()) continue;

            String code = tr.getLast().select("td").get(1).text();

            result.add(new TitleAuthorCode<>(title1, author, code));
        }

        return result;

    }

    public Connection.Response sendRequest(String url, Connection.Method rm, Map<String, String> data) throws IOException {
        Connection connection = Jsoup.connect(url).userAgent("Mozilla/5.0").timeout(10000);

        return (rm == Connection.Method.POST) ?
                connection.data(data).method(Connection.Method.POST).execute():
                connection.method(Connection.Method.GET).execute();
    }

}
