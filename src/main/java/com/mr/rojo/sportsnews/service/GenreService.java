package com.mr.rojo.sportsnews.service;

import com.mr.rojo.sportsnews.modele.Actualites;
import com.mr.rojo.sportsnews.modele.Genre;
import com.mr.rojo.sportsnews.repository.GenreRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import java.util.ArrayList;
import java.util.List;

@Service
public class GenreService implements MatchesServiceInterface {
    @Autowired
    EntityManager entityManager;

    @Autowired
    GenreRepository genreRepository;
    public static List<Genre> liste=new ArrayList<Genre>();
    public List<Genre> getList()
    {
        if(liste.isEmpty()|| liste==null) {
            List<Genre> lista = new ArrayList<>();
            genreRepository.findAll().forEach(e -> lista.add(e));
            liste = lista;
            return lista;
        }
        else
        {
            return liste;
        }
    }
    public void insert(String nom)throws Exception
    {
        List<Genre>lista=getList();
        for(int i=0;i<lista.size();i++)
        {
            if(lista.get(i).getNom().compareToIgnoreCase(nom)==0)
            {
                throw new Exception("Il y a deja un categorie "+nom+"");
            }
        }
        Genre g=new Genre();
        g.setNom(nom);
        genreRepository.save(g);
    }
    public void delete(int id)throws Exception
    {
        Genre g=new Genre();
        g.setId(id);
        g=genreRepository.findById(g.getId()).get();
        g.setDelete(1);
        genreRepository.save(g);
    }
}
