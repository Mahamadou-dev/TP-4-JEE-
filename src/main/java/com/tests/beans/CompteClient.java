package com.tests.beans;

import java.util.Date;

public class CompteClient {
    private int numero;
    private int idClient;
    private Date dateCreation;
    private double chiffreAffaire;
    
    // Constructeurs
    public CompteClient() {}
    
    public CompteClient(int numero, int idClient, Date dateCreation, double chiffreAffaire) {
        this.numero = numero;
        this.idClient = idClient;
        this.dateCreation = dateCreation;
        this.chiffreAffaire = chiffreAffaire;
    }
    
    // Getters & Setters
    public int getNumero() { return numero; }
    public void setNumero(int numero) { this.numero = numero; }
    
    public int getIdClient() { return idClient; }
    public void setIdClient(int idClient) { this.idClient = idClient; }
    
    public Date getDateCreation() { return dateCreation; }
    public void setDateCreation(Date dateCreation) { this.dateCreation = dateCreation; }
    
    public double getChiffreAffaire() { return chiffreAffaire; }
    public void setChiffreAffaire(double chiffreAffaire) { this.chiffreAffaire = chiffreAffaire; }
}