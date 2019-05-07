package com.mr.rojo.sportsnews.modele;

import javax.persistence.*;
import java.sql.Date;

@Entity
@Table(name="ACTUALITES")
public class Actualites {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="IDACTU")
    private int id;

    @Column(name="TITRE")
    private String titre;
    @Column(name="DATE")
    private Date date;

    @Column(name="DESCRIPTION")
    private String description;


    @Column(name="IMAGE")
    private String image;

    @OneToOne
    @JoinColumn(name="IDCLIENT")
    private Client client;

    @OneToOne
    @JoinColumn(name="IDGENRE")
    private Genre genre;

    @Column(name="CONTENUE")
    private String contenue;

    @Column(name="IMGDESCRI")
    private String imgdescri;

    public String getImgdescri() {
        return imgdescri;
    }

    public void setImgdescri(String imgdescri) {
        this.imgdescri = imgdescri;
    }

    public String getContenue() {
        return contenue;
    }

    public void setContenue(String contenue) {
        this.contenue = contenue;
    }

    public String getTitre() {
        return titre;
    }

    public void setTitre(String titre) {
        this.titre = titre;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    public Genre getGenre() {
        return genre;
    }

    public void setGenre(Genre genre) {
        this.genre = genre;
    }
}
