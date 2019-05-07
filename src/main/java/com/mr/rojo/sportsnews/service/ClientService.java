package com.mr.rojo.sportsnews.service;
import com.mr.rojo.sportsnews.repository.ClientRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;

@Service
public class ClientService implements MatchesServiceInterface {
    @Autowired
    EntityManager entityManager;

    @Autowired
    ClientRepository clientRepository;
}
