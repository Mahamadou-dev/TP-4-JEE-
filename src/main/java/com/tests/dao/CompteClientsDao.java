package com.tests.dao;

import com.tests.beans.CompteClient;
import java.util.List;

public interface CompteClientsDao {
    void ajouter(CompteClient compteClient);
    List<CompteClient> lister();
    CompteClient trouverParNumero(int numero);
    void modifier(CompteClient compteClient);
    void supprimer(int numero);

}