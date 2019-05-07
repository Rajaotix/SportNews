package com.mr.rojo.sportsnews.controller;

import com.mr.rojo.sportsnews.modele.Actualites;
import com.mr.rojo.sportsnews.modele.Client;
import com.mr.rojo.sportsnews.modele.Genre;
import com.mr.rojo.sportsnews.service.ActualitesService;
import com.mr.rojo.sportsnews.service.GenreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@Controller
public class IndexController {
    @Autowired
    ActualitesService actualitesService;
    @Autowired
    GenreService genreService;
    @GetMapping("/")
    public String  home(HttpSession session, Model model)
    {
        List<Actualites> liste=actualitesService.getListActu();
        List<Genre> genre=genreService.getList();
        List<Actualites[]> valiny=new ArrayList<Actualites[]>();
        Random random=new Random();
        if(session.getAttribute("Client")==null)
        {
            for(int i=0;i<3;i++)
            {
                Actualites[] listeActu=null;
                int min=1;
                int max=genre.size();

                int nbaleatoire=random.nextInt(max-min+1)+min;
                listeActu =actualitesService.getActuByGenreLimit(5,nbaleatoire,liste);
                valiny.add(listeActu);
            }
            model.addAttribute("Liste",valiny);
            System.out.println("valiny "+valiny.size());
        }
        model.addAttribute("Genre",genre);
        return  "index";

    }
    @GetMapping("/test")
    public String test(@RequestParam("id") String id)
    {
        System.out.println(id);
        return "single";
    }
    @GetMapping("/categorie")
    public String categorie(@RequestParam("idgenre") int idgenre,Model model)
    {
        List<Genre> genre=genreService.getList();
        model.addAttribute("Genre",genre);
        return "category";
    }
    @GetMapping("/ws")
    @ResponseBody
    public List testa()
    {
        return actualitesService.getListActu();
    }

    @GetMapping("/ws2")
    @ResponseBody
    public void test3()
    {
        Actualites ar=new Actualites();
        Client c=new Client();
        c.setId(1);
        Genre g=new Genre();
        g.setId(1);
        ar.setClient(c);
        ar.setGenre(g);
        Date daty=Date.valueOf("2019-01-01");
        ar.setDate(daty);
        ar.setDescription("DEsc");
        ar.setImage("img");
        actualitesService.save(ar);
    }
}
