package com.tests.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ConnexionBD {
    // Configuration de la connexion
    private static final String URL = "Your Database URL";
    private static final String USER = "root";
    private static final String PASSWORD = "Your_Password";
    
    // Instance unique de la connexion
    private static Connection connexion = null;
    
    // Logger pour le suivi des erreurs
    private static final Logger LOGGER = Logger.getLogger(ConnexionBD.class.getName());
    
    // Constructeur privé pour empêcher l'instanciation
    private ConnexionBD() {
        try {
            // Chargement du driver (plus nécessaire depuis JDBC 4.0 mais gardé pour compatibilité)
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Établissement de la connexion
            connexion = DriverManager.getConnection(URL, USER, PASSWORD);
            LOGGER.log(Level.INFO, "Connexion à la base de données établie avec succès");
            
        } catch (ClassNotFoundException e) {
            LOGGER.log(Level.SEVERE, "Driver JDBC MySQL introuvable", e);
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Échec de la connexion à la base de données", e);
        }
    }
    
    /**
     * Méthode pour obtenir l'instance de la connexion (Singleton)
     * @return Connection l'instance de connexion
     */
    public static Connection getInstance() {
        if (connexion == null) {
            synchronized (ConnexionBD.class) {
                if (connexion == null) {
                    new ConnexionBD();
                }
            }
        }
        
        // Vérification que la connexion est toujours valide
        try {
            if (connexion != null && connexion.isClosed()) {
                LOGGER.log(Level.WARNING, "Connexion fermée, tentative de reconnexion");
                new ConnexionBD();
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Erreur lors de la vérification de la connexion", e);
        }
        
        return connexion;
    }
    
    /**
     * Méthode pour fermer la connexion
     */
    public static void close() {
        if (connexion != null) {
            try {
                connexion.close();
                connexion = null;
                LOGGER.log(Level.INFO, "Connexion à la base de données fermée avec succès");
            } catch (SQLException e) {
                LOGGER.log(Level.SEVERE, "Erreur lors de la fermeture de la connexion", e);
            }
        }
    }
    
    /**
     * Méthode pour tester la connexion
     * @return boolean true si la connexion est valide
     */
    public static boolean testConnexion() {
        try (Connection testConn = DriverManager.getConnection(URL, USER, PASSWORD)) {
            return testConn.isValid(2); // Test avec un timeout de 2 secondes
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Échec du test de connexion", e);
            return false;
        }
    }
}