package com.mr.rojo.sportsnews.service;

import com.mr.rojo.sportsnews.modele.Actualites;

import java.util.List;

public interface ActualitesServiceInterface {
    public List<Actualites> getListActu();
    public void save(Actualites a);
}
