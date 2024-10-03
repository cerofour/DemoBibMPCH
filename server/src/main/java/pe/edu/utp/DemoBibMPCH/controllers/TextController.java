package pe.edu.utp.DemoBibMPCH.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.w3c.dom.Text;
import pe.edu.utp.DemoBibMPCH.DAO.TextResourceDAO;
import pe.edu.utp.DemoBibMPCH.models.Author;
import pe.edu.utp.DemoBibMPCH.models.TextResource;

import java.util.*;

@CrossOrigin
@RestController
public class TextController {

    @Autowired
    private TextResourceDAO textDAO;

    @RequestMapping(value = "api/texts")
    @ResponseBody
    public List<TextResource> getText(@RequestParam Optional<Long> id) {
        if (id.isEmpty())
            return textDAO.findAll();

        Optional<TextResource> t = textDAO.findById(id.get());
        return t.map(Arrays::asList).orElseGet(ArrayList::new);
    }

    @RequestMapping(value = "api/texts/authors")
    @ResponseBody
    public Set<Author> getAuthors(@RequestParam Optional<Long> id) {
        if (id.isEmpty()) {
            System.out.println("null case 1");
           return null;
           }

        Optional<TextResource> text = textDAO.findById(id.get());
        if (text.isEmpty()) {
            System.out.println("null case 2");
            return null;
        }

        return text.get().getWrittenBy();
    }
}
