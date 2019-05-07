package com.mr.rojo.sportsnews.repository;

import com.mr.rojo.sportsnews.modele.Genre;
import org.springframework.data.repository.CrudRepository;

public interface GenreRepository extends CrudRepository<Genre,Integer> {
}
