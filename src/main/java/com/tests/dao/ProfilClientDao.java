package com.tests.dao;

import com.tests.beans.ProfilClient;
import java.util.List;

public interface ProfilClientDao {
    void ajouter(ProfilClient profilClient);
    List<ProfilClient> lister();
    ProfilClient trouverParId(int idProp);
    void modifier(ProfilClient profilClient);
    void supprimer(int idProp);

}