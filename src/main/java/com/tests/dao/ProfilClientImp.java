package com.tests.dao;

import com.tests.beans.ProfilClient;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProfilClientImp implements ProfilClientDao {
    private DaoFactory daoFactory;

    public ProfilClientImp(DaoFactory daoFactory) {
        this.daoFactory = daoFactory;
    }

    @Override
    public void ajouter(ProfilClient profilClient) {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        try {
            connexion = daoFactory.getConnection();
            preparedStatement = connexion.prepareStatement(
                "INSERT INTO profilclient(idProp, nom, prenom, societe, ville, adresse) VALUES (?, ?, ?, ?, ?, ?)");
            preparedStatement.setInt(1, profilClient.getIdProp());
            preparedStatement.setString(2, profilClient.getNom());
            preparedStatement.setString(3, profilClient.getPrenom());
            preparedStatement.setString(4, profilClient.getSociete());
            preparedStatement.setString(5, profilClient.getVille());
            preparedStatement.setString(6, profilClient.getAdresse());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try { if (preparedStatement != null) preparedStatement.close(); } catch (SQLException e) {}
            ConnexionBD.close();
        }
    }

    @Override
    public List<ProfilClient> lister() {
        List<ProfilClient> profils = new ArrayList<>();
        Connection connexion = null;
        Statement statement = null;
        ResultSet resultat = null;
        
        try {
            connexion = daoFactory.getConnection();
            statement = connexion.createStatement();
            resultat = statement.executeQuery("SELECT * FROM profilclient");
            
            while (resultat.next()) {
                ProfilClient profil = new ProfilClient();
                profil.setIdProp(resultat.getInt("idProp"));
                profil.setNom(resultat.getString("nom"));
                profil.setPrenom(resultat.getString("prenom"));
                profil.setSociete(resultat.getString("societe"));
                profil.setVille(resultat.getString("ville"));
                profil.setAdresse(resultat.getString("adresse"));
                profils.add(profil);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try { if (resultat != null) resultat.close(); } catch (SQLException e) {}
            try { if (statement != null) statement.close(); } catch (SQLException e) {}
            ConnexionBD.close();
        }
        return profils;
    }

    @Override
    public ProfilClient trouverParId(int idProp) {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultat = null;
        ProfilClient profil = null;
        
        try {
            connexion = daoFactory.getConnection();
            preparedStatement = connexion.prepareStatement("SELECT * FROM profilclient WHERE idProp = ?");
            preparedStatement.setInt(1, idProp);
            resultat = preparedStatement.executeQuery();
            
            if (resultat.next()) {
                profil = new ProfilClient();
                profil.setIdProp(resultat.getInt("idProp"));
                profil.setNom(resultat.getString("nom"));
                profil.setPrenom(resultat.getString("prenom"));
                profil.setSociete(resultat.getString("societe"));
                profil.setVille(resultat.getString("ville"));
                profil.setAdresse(resultat.getString("adresse"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try { if (resultat != null) resultat.close(); } catch (SQLException e) {}
            try { if (preparedStatement != null) preparedStatement.close(); } catch (SQLException e) {}
            ConnexionBD.close();
        }
        return profil;
    }

    @Override
    public void modifier(ProfilClient profilClient) {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;

        try {
            connexion = daoFactory.getConnection();
            preparedStatement = connexion.prepareStatement(
                "UPDATE ProfilClient SET nom=?, prenom=?, societe=?, ville=?, adresse=? WHERE idProp=?");

            preparedStatement.setString(1, profilClient.getNom());
            preparedStatement.setString(2, profilClient.getPrenom());
            preparedStatement.setString(3, profilClient.getSociete());
            preparedStatement.setString(4, profilClient.getVille());
            preparedStatement.setString(5, profilClient.getAdresse());
            preparedStatement.setInt(6, profilClient.getIdProp());

            int rowsUpdated = preparedStatement.executeUpdate();
            System.out.println(rowsUpdated + " ligne(s) mise(s) à jour");

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try { if (preparedStatement != null) preparedStatement.close(); } 
            catch (SQLException e) {}
            ConnexionBD.close();
        }
    }


    @Override
    public void supprimer(int idProp) {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;

        try {
            connexion = daoFactory.getConnection();
            // D'abord supprimer les comptes associés
            PreparedStatement deleteComptes = connexion.prepareStatement(
                "DELETE FROM CompteClient WHERE idClient=?");
            deleteComptes.setInt(1, idProp);
            deleteComptes.executeUpdate();

            // Puis supprimer le profil
            preparedStatement = connexion.prepareStatement(
                "DELETE FROM ProfilClient WHERE idProp=?");
            preparedStatement.setInt(1, idProp);

            int rowsDeleted = preparedStatement.executeUpdate();
            System.out.println(rowsDeleted + " ligne(s) supprimée(s)");

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try { if (preparedStatement != null) preparedStatement.close(); } 
            catch (SQLException e) {}
            ConnexionBD.close();
        }
    }
}