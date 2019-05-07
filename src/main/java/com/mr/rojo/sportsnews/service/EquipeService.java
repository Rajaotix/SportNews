package com.mr.rojo.sportsnews.service;

import com.mr.rojo.sportsnews.modele.Equipe;
import com.mr.rojo.sportsnews.modele.Genre;
import com.mr.rojo.sportsnews.repository.EquipeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.util.ArrayList;
import java.util.List;

@Service
public class EquipeService implements MatchesServiceInterface {
    @Autowired
    EntityManager entityManager;

    @Autowired
    EquipeRepository equipeRepository;
    public static List<Equipe> listeEquipe;
    public List<Equipe> getList()
    {
        if(listeEquipe.isEmpty() || listeEquipe==null) {
            List<Equipe> liste = new ArrayList<Equipe>();
            String hql = "Select e from Equipe as e where e.deleted=0";
            Query query = entityManager.createQuery(hql, Equipe.class);
            liste = query.getResultList();
            listeEquipe = liste;
            return liste;
        }
        else{
            return listeEquipe;
        }

    }
    public List<Equipe> getByGenre(int idgenre)
    {
        List<Equipe> valiny=new ArrayList<Equipe>();
        List<Equipe> temp=getList();
        for(int i=0;i<temp.size();i++)
        {
            if(temp.get(i).getGenre().getId()==idgenre)
            {
                valiny.add(temp.get(i));
            }
        }
        return temp;
    }
    public void insert(String nom,int genre)throws Exception
    {
        List<Equipe>liste=getList();
        for(int i=0;i<liste.size();i++)
        {
            if(liste.get(i).getNom().compareToIgnoreCase(nom)==0 && liste.get(i).getGenre().getId()==genre)
            {
                throw new Exception("Cette equipe existe déja");
            }
        }
        Genre genre1=new Genre();
        genre1.setId(genre);
        Equipe e=new Equipe();
        e.setNom(nom);
        e.setGenre(genre1);
        equipeRepository.save(e);
    }
    public void deleted(int id)
    {
        Equipe e=new Equipe();
        e=equipeRepository.findById(id).get();
        e.setDelete(1);
        equipeRepository.save(e);
    }
}
