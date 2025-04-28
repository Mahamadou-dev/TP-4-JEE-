package com.tests.dao;

import java.sql.Connection;
import java.sql.SQLException;

public class DaoFactory {
    private static DaoFactory instance;
    
    private DaoFactory() {}
    
    public static DaoFactory getInstance() {
        if (instance == null) {
            instance = new DaoFactory();
        }
        return instance;
    }
    
    public Connection getConnection() throws SQLException {
        return ConnexionBD.getInstance();
    }
    
    public CompteClientsDao getCompteClientsDao() {
        return new CompteClientImp(this);
    }
    
    public ProfilClientDao getProfilClientDao() {
        return new ProfilClientImp(this);
    }
}