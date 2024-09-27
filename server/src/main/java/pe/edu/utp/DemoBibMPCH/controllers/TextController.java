package pe.edu.utp.DemoBibMPCH.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.w3c.dom.Text;
import pe.edu.utp.DemoBibMPCH.DAO.TextResourceDAO;
import pe.edu.utp.DemoBibMPCH.models.TextResource;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

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
}
