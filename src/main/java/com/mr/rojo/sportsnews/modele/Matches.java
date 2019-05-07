package com.mr.rojo.sportsnews.modele;

import javax.persistence.*;
import java.sql.Date;

@Entity
@Table(name="MATCHES")
public class Matches {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @OneToOne
    @JoinColumn(name="IDEQUIPE1")
    private Equipe equipe;

    @OneToOne
    @JoinColumn(name="IDEQUIPE2")
    private Equipe equipe2;

    @Column(name="SCOREEQUIPE1")
    private int score1;

    @Column(name="SCOREEQUIPE2")
    private int score2;
    @Column(name="DATE")
    private Date date;
    @Column(name="TERMINEE")
    private int terminee;
    @Column(name="GAGNANTS")
    private int gagnants;


    public Equipe getEquipe() {
        return equipe;
    }

    public void setEquipe(Equipe equipe) {
        this.equipe = equipe;
    }

    public Equipe getEquipe2() {
        return equipe2;
    }

    public void setEquipe2(Equipe equipe2) {
        this.equipe2 = equipe2;
    }

    public int getScore1() {
        return score1;
    }

    public void setScore1(int score1) {
        this.score1 = score1;
    }

    public int getScore2() {
        return score2;
    }

    public void setScore2(int score2) {
        this.score2 = score2;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getTerminee() {
        return terminee;
    }

    public void setTerminee(int terminee) {
        this.terminee = terminee;
    }

    public int getGagnants() {
        return gagnants;
    }

    public void setGagnants(int gagnants) {
        this.gagnants = gagnants;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
