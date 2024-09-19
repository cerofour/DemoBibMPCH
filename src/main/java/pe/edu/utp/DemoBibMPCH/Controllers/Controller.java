package pe.edu.utp.DemoBibMPCH.Controllers;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import pe.edu.utp.DemoBibMPCH.WebScraperBNP.TitleAuthorCode;
import pe.edu.utp.DemoBibMPCH.WebScraperBNP.WebScrapingBNP;

import java.io.IOException;
import java.util.ArrayList;

@RestController
public class Controller {

    @GetMapping(value = "scrapeBNP/{title}")
    public ArrayList<TitleAuthorCode<String, String, String>> scraper(@PathVariable String title) throws IOException {
        return new WebScrapingBNP().scrape(title);
    }

}
