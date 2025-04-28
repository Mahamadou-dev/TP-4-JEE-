package com.tests.dao;

import com.tests.beans.CompteClient;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CompteClientImp implements CompteClientsDao {
    private DaoFactory daoFactory;

    public CompteClientImp(DaoFactory daoFactory) {
        this.daoFactory = daoFactory;
    }


   @Override
public void ajouter(CompteClient compteClient) {
    Connection connexion = null;
    PreparedStatement preparedStatement = null;
    
    try {
        connexion = daoFactory.getConnection();
        connexion.setAutoCommit(false); // Désactive l'auto-commit
        
        // Vérifiez d'abord si le client existe
        PreparedStatement checkStmt = connexion.prepareStatement(
            "SELECT idProp FROM profilclient WHERE idProp = ?");
        checkStmt.setInt(1, compteClient.getIdClient());
        ResultSet rs = checkStmt.executeQuery();
        
        if (!rs.next()) {
            System.err.println("ERREUR: Le client avec ID " + compteClient.getIdClient() + " n'existe pas");
            return;
        }
        
        preparedStatement = connexion.prepareStatement(
            "INSERT INTO compteclient(numero, idClient, dateCreation, chiffreAffaire) VALUES (?, ?, ?, ?)");
        preparedStatement.setInt(1, compteClient.getNumero());
        preparedStatement.setInt(2, compteClient.getIdClient());
        preparedStatement.setDate(3, new java.sql.Date(compteClient.getDateCreation().getTime()));
        preparedStatement.setDouble(4, compteClient.getChiffreAffaire());
        
        int rows = preparedStatement.executeUpdate();
        connexion.commit(); // Commit explicite
        
        System.out.println(rows + " ligne(s) affectée(s)"); // Log
        
    } catch (SQLException e) {
        try {
            if (connexion != null) {
                connexion.rollback(); // Rollback en cas d'erreur
            }
        } catch (SQLException ex) {
            System.err.println("Erreur lors du rollback: " + ex.getMessage());
        }
        System.err.println("Erreur SQL: " + e.getMessage());
        e.printStackTrace();
    } finally {
        try { 
            if (preparedStatement != null) preparedStatement.close(); 
            if (connexion != null) {
                connexion.setAutoCommit(true); // Rétablit l'auto-commit
                connexion.close();
            }
        } catch (SQLException e) {
            System.err.println("Erreur lors de la fermeture: " + e.getMessage());
        }
    }
}

    @Override
    public List<CompteClient> lister() {
        List<CompteClient> comptes = new ArrayList<>();
        Connection connexion = null;
        Statement statement = null;
        ResultSet resultat = null;
        
        try {
            connexion = daoFactory.getConnection();
            statement = connexion.createStatement();
            resultat = statement.executeQuery("SELECT * FROM compteclient");
            
            while (resultat.next()) {
                CompteClient compte = new CompteClient();
                compte.setNumero(resultat.getInt("numero"));
                compte.setIdClient(resultat.getInt("idClient"));
                compte.setDateCreation(resultat.getDate("dateCreation"));
                compte.setChiffreAffaire(resultat.getDouble("chiffreAffaire"));
                comptes.add(compte);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try { if (resultat != null) resultat.close(); } catch (SQLException e) {}
            try { if (statement != null) statement.close(); } catch (SQLException e) {}
            ConnexionBD.close();
        }
        return comptes;
    }

    @Override
    public CompteClient trouverParNumero(int numero) {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultat = null;
        CompteClient compte = null;
        
        try {
            connexion = daoFactory.getConnection();
            preparedStatement = connexion.prepareStatement("SELECT * FROM compteclient WHERE numero = ?");
            preparedStatement.setInt(1, numero);
            resultat = preparedStatement.executeQuery();
            
            if (resultat.next()) {
                compte = new CompteClient();
                compte.setNumero(resultat.getInt("numero"));
                compte.setIdClient(resultat.getInt("idClient"));
                compte.setDateCreation(resultat.getDate("dateCreation"));
                compte.setChiffreAffaire(resultat.getDouble("chiffreAffaire"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try { if (resultat != null) resultat.close(); } catch (SQLException e) {}
            try { if (preparedStatement != null) preparedStatement.close(); } catch (SQLException e) {}
            ConnexionBD.close();
        }
        return compte;
    }

 @Override
public void modifier(CompteClient compteClient) {
    Connection connexion = null;
    PreparedStatement preparedStatement = null;
    
    try {
        connexion = daoFactory.getConnection();
        preparedStatement = connexion.prepareStatement(
            "UPDATE CompteClient SET idClient=?, dateCreation=?, chiffreAffaire=? WHERE numero=?");
        
        preparedStatement.setInt(1, compteClient.getIdClient());
        preparedStatement.setDate(2, new java.sql.Date(compteClient.getDateCreation().getTime()));
        preparedStatement.setDouble(3, compteClient.getChiffreAffaire());
        preparedStatement.setInt(4, compteClient.getNumero());
        
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
public void supprimer(int numero) {
    Connection connexion = null;
    PreparedStatement preparedStatement = null;
    
    try {
        connexion = daoFactory.getConnection();
        preparedStatement = connexion.prepareStatement(
            "DELETE FROM CompteClient WHERE numero=?");
        preparedStatement.setInt(1, numero);
        
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