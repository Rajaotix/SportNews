package com.mr.rojo.sportsnews.modele;


import javax.persistence.*;


@Entity
@Table(name="Client")
public class Client {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="IDCLIENT")
    private int id;

    @Column(name="NOM")
    private String nom;

    @Column(name="USERNAME")
    private String username;

    @Column(name="PASSWORD")
    private String password;

    @Column(name="TOKEN")
    private String token;

    @Column(name="AUTORISATION")
    private int autorisation;

    @OneToOne
    @JoinColumn(name="genre1",insertable=false,updatable=false)
    private Genre genre1;

    @OneToOne
    @JoinColumn(name="genre2",insertable=false,updatable=false)
    private Genre genre2;

    @OneToOne
    @JoinColumn(name="genre3",insertable=false,updatable=false)
    private Genre genre3;

    @Column(name="couleur")
    private String color;

    @Column(name="Deleted")
    private int delete=0;

    public Genre getGenre1() {
        return genre1;
    }

    public void setGenre1(Genre genre1) {
        this.genre1 = genre1;
    }

    public Genre getGenre2() {
        return genre2;
    }

    public void setGenre2(Genre genre2) {
        this.genre2 = genre2;
    }

    public Genre getGenre3() {
        return genre3;
    }

    public void setGenre3(Genre genre3) {
        this.genre3 = genre3;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

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

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public int getAutorisation() {
        return autorisation;
    }

    public void setAutorisation(int autorisation) {
        this.autorisation = autorisation;
    }
}
