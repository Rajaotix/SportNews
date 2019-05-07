package com.mr.rojo.sportsnews.modele;

import javax.persistence.*;

@Entity
@Table(name="GENRE")
public class Genre {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="IDGENRE")
    private int id;

    @Column(name="NOM")
    private String nom;

    @Column(name="Deleted")
    private int delete=0;

    public int getDelete() {
        return delete;
    }

    public void setDelete(int delete) {
        this.delete = delete;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }
}
