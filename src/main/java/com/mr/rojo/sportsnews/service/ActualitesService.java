package com.mr.rojo.sportsnews.service;

import com.mr.rojo.sportsnews.modele.Actualites;
import com.mr.rojo.sportsnews.modele.Genre;
import com.mr.rojo.sportsnews.repository.ActualitesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.util.ArrayList;
import java.util.List;

@Service
public class ActualitesService implements  ActualitesServiceInterface{
    @Autowired
    EntityManager entityManager;

    @Autowired
    ActualitesRepository actualitesRepository;

    @Override
    public List<Actualites> getListActu() {
        List<Actualites> liste=new ArrayList<Actualites>();
        actualitesRepository.findAll().forEach(e->liste.add(e));
        return liste;
    }

    @Override
    public void save(Actualites a) {
        actualitesRepository.save(a);
    }

    public List<Actualites> getActuByGenre(int genre,List<Actualites>liste)
    {
        List<Actualites> lista=null;
        List<Actualites> valiny=new ArrayList<Actualites>();
        if(liste==null)
        {
            lista=getListActu();
        }
        else
        {
            lista=liste;
        }
        for(int i=0;i<lista.size();i++)
        {
            if(lista.get(i).getGenre().getId()==genre)
            {
                valiny.add(lista.get(i));
            }
        }
        return valiny;
    }

    public Actualites[] getActuByGenreLimit(int limite,int genre,List<Actualites> liste)
    {
        List<Actualites> lsa=getActuByGenre(genre,liste);


        Actualites[]ls=new Actualites[lsa.size()];
        lsa.toArray(ls);
        orderByDate(ls);
        Actualites[] valiny=limit(limite,ls);
        return valiny;

    }
    public Actualites[] limit(int limite,Actualites[]lsa)
    {
        int taille=lsa.length;
        if(taille>limite)
        {
            taille=limite;
        }
        Actualites[] valiny=new Actualites[taille];
        for(int i=0;i<valiny.length;i++)
        {
            valiny[i]=new Actualites();
            valiny[i]=lsa[i];

        }
        return valiny;
    }
    public void orderByDate(Actualites[]ls)
    {
        for(int i=0;i<ls.length;i++)
        {
            for(int j=0;j<ls.length;j++)
            {
                if(ls[i].getDate().compareTo(ls[j].getDate())<0)
                {
                    Actualites temp=ls[i];
                    ls[i]=ls[j];
                    ls[j]=temp;

                }
            }
        }
    }
    public void delete(int id)
    {
        Actualites a=actualitesRepository.findById(id).get();
        actualitesRepository.delete(a);
    }
}
