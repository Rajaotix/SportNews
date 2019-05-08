package com.mr.rojo.sportsnews.service;
import com.mr.rojo.sportsnews.modele.Actualites;
import com.mr.rojo.sportsnews.modele.Client;
import com.mr.rojo.sportsnews.repository.ClientRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Formatter;
import java.util.List;

@Service
public class ClientService implements MatchesServiceInterface {
    @Autowired
    EntityManager entityManager;

    @Autowired
    ClientRepository clientRepository;

    public List<Client> getAllClient()
    {
        List<Client> liste=new ArrayList<Client>();
        clientRepository.findAll().forEach(e->liste.add(e));
        return liste;
    }
    public Client connection(String username,String mdp)throws Exception
    {
        List<Client> list=getAllClient();
        MessageDigest crypt=MessageDigest.getInstance("SHA-1");
        crypt.reset();
        crypt.update(mdp.getBytes("UTF-8"));
        String token= byteToHex(crypt.digest());

        for(int i=0;i<list.size();i++)
        {
            if(list.get(i).getToken().compareTo(token)==0 && list.get(i).getUsername().compareTo(username)==0)
            {
                return list.get(i);
            }
        }
        return  null;
    }
    public Client connectionAdmin(String username,String mdp)throws Exception
    {
        List<Client> list=getAllClient();
        MessageDigest crypt=MessageDigest.getInstance("SHA-1");
        crypt.reset();
        crypt.update(mdp.getBytes("UTF-8"));
        String token= byteToHex(crypt.digest());

        for(int i=0;i<list.size();i++)
        {
            if(list.get(i).getAutorisation()==1) {
                if (list.get(i).getToken().compareTo(token) == 0 && list.get(i).getUsername().compareTo(username) == 0) {
                    return list.get(i);
                }
            }
        }
        return  null;
    }
    private static  String byteToHex(final byte[] hash)
    {
        Formatter formatter=new Formatter();
        for(byte b :hash)
        {
            formatter.format("%02x",b);
        }
        String result=formatter.toString();
        return result;
    }
}
