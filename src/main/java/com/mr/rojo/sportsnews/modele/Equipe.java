package com.mr.rojo.sportsnews.modele;

import javax.persistence.*;

@Entity
@Table(name="EQUIPE")
public class Equipe {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="IDEQUIPE")
    private int id;

    @OneToOne
    @JoinColumn(name="IDGENRE")
    private Genre genre;

    @Column(name="NOMEQUIPE")
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

    public Genre getGenre() {
        return genre;
    }

    public void setGenre(Genre genre) {
        this.genre = genre;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }
}
