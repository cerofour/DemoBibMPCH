package pe.edu.utp.DemoBibMPCH.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import pe.edu.utp.DemoBibMPCH.DAO.TextDAO;
import pe.edu.utp.DemoBibMPCH.models.TextResource;

import java.util.List;

@CrossOrigin
@RestController
public class TextController {

    @Autowired
    private TextDAO textDAO;

    @RequestMapping(value = "api/texts")
    public List<TextResource> getText() {
        return textDAO.findAll();
    }
}
