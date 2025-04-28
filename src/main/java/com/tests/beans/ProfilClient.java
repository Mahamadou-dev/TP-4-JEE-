package com.tests.beans;

public class ProfilClient {
    private int idProp;
    private String nom;
    private String prenom;
    private String societe;
    private String ville;
    private String adresse;
    
    // Constructeurs
    public ProfilClient() {}
    
    public ProfilClient(int idProp, String nom, String prenom, String societe, String ville, String adresse) {
        this.idProp = idProp;
        this.nom = nom;
        this.prenom = prenom;
        this.societe = societe;
        this.ville = ville;
        this.adresse = adresse;
    }
    
    // Getters & Setters
    public int getIdProp() { return idProp; }
    public void setIdProp(int idProp) { this.idProp = idProp; }
    
    public String getNom() { return nom; }
    public void setNom(String nom) { this.nom = nom; }
    
    public String getPrenom() { return prenom; }
    public void setPrenom(String prenom) { this.prenom = prenom; }
    
    public String getSociete() { return societe; }
    public void setSociete(String societe) { this.societe = societe; }
    
    public String getVille() { return ville; }
    public void setVille(String ville) { this.ville = ville; }
    
    public String getAdresse() { return adresse; }
    public void setAdresse(String adresse) { this.adresse = adresse; }
}