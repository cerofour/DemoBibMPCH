package pe.edu.utp.DemoBibMPCH.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import pe.edu.utp.DemoBibMPCH.DAO.AuthorDAO;
import pe.edu.utp.DemoBibMPCH.DAO.TextResourceDAO;
import pe.edu.utp.DemoBibMPCH.models.Author;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

@CrossOrigin
@RestController
public class AuthorController {

    @Autowired
    private AuthorDAO authorDAO;

    @RequestMapping(value = "api/authors")
    public List<Author> getText(@RequestParam Optional<Long> id) {
        if (id.isEmpty())
            return authorDAO.findAll();

        Optional<Author> author = authorDAO.findById(id.get());

        return author.map(Arrays::asList).orElseGet(ArrayList::new);

    }
}
