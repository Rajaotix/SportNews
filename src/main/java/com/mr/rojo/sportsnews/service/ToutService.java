package com.mr.rojo.sportsnews.service;

import com.mr.rojo.sportsnews.modele.Actualites;
import com.mr.rojo.sportsnews.modele.Genre;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ToutService {
    @Autowired
    GenreService genreService;
    @Autowired
    MatchesService matchesService;
    @Autowired
    EquipeService equipeService;
    @Autowired
    ClientService clientService;
    @Autowired
    ActualitesService actualitesService;

    public List<Actualites> getActuNew()
    {
        List<Actualites> valiny=new ArrayList<Actualites>();
         List<Genre> genre=genreService.getList();
         List<Actualites> liste=actualitesService.getListActu();
         for(int i=0;i<genre.size();i++ )
         {
             int test=1;
             if(i==0)
             {
                 test=2;
             }
             Actualites[] temp=actualitesService.getActuByGenreLimit(test,genre.get(i).getId(),liste);
             for(int j=0;j<temp.length;j++)
             {
                 valiny.add(temp[j]);
             }
         }
         return valiny;
    }

}
