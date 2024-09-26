package pe.edu.utp.BibChiclayo.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import pe.edu.utp.BibChiclayo.DAO.TextDAO;
import pe.edu.utp.BibChiclayo.models.TextResource;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class TextController {

    @Autowired
    private TextDAO textDAO;

    @RequestMapping(value = "api/texts")
    public List<TextResource> getText() {
        return textDAO.findAll();
    }
}
