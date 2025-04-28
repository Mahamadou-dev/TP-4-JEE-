package com.tests.servlets;

import com.tests.beans.ProfilClient;
import com.tests.dao.DaoFactory;
import com.tests.dao.ProfilClientDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/profil")
public class ProfilClientServlet extends HttpServlet {
    private ProfilClientDao profilDao;
    
    @Override
    public void init() throws ServletException {
        DaoFactory daoFactory = DaoFactory.getInstance();
        this.profilDao = daoFactory.getProfilClientDao();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if (action == null) {
            request.setAttribute("profils", profilDao.lister());
            this.getServletContext().getRequestDispatcher("/profil/lister.jsp").forward(request, response);
        } else {
            switch (action) {
                case "ajouter":
                    this.getServletContext().getRequestDispatcher("/profil/ajouter.jsp").forward(request, response);
                    break;
                case "modifier":
                    int idPropModif = Integer.parseInt(request.getParameter("idProp"));
                    request.setAttribute("profil", profilDao.trouverParId(idPropModif));
                    this.getServletContext().getRequestDispatcher("/profil/modifier.jsp").forward(request, response);
                    break;
                case "consulter":
                    int idProp = Integer.parseInt(request.getParameter("idProp"));
                    request.setAttribute("profil", profilDao.trouverParId(idProp));
                    this.getServletContext().getRequestDispatcher("/profil/consulter.jsp").forward(request, response);
                    break;
                default:
                    request.setAttribute("profils", profilDao.lister());
                    this.getServletContext().getRequestDispatcher("/profil/lister.jsp").forward(request, response);
            }
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if (action != null) {
            switch (action) {
                case "ajouter":
                    ajouterProfil(request, response);
                    break;
                case "modifier":
                    modifierProfil(request, response);
                    break;
                case "supprimer":
                    supprimerProfil(request, response);
                    break;
            }
        }
    }
    
    private void ajouterProfil(HttpServletRequest request, HttpServletResponse response) 
            throws IOException, ServletException {
        try {
            int idProp = Integer.parseInt(request.getParameter("idProp"));
            String nom = request.getParameter("nom");
            String prenom = request.getParameter("prenom");
            String societe = request.getParameter("societe");
            String ville = request.getParameter("ville");
            String adresse = request.getParameter("adresse");
            
            ProfilClient profil = new ProfilClient(idProp, nom, prenom, societe, ville, adresse);
            profilDao.ajouter(profil);
            
            response.sendRedirect(request.getContextPath() + "/profil");
        } catch (NumberFormatException e) {
            request.setAttribute("erreur", "ID invalide");
            this.getServletContext().getRequestDispatcher("/profil/ajouter.jsp").forward(request, response);
        }
    }

    private void modifierProfil(HttpServletRequest request, HttpServletResponse response) 
            throws IOException, ServletException {
        try {
            int idProp = Integer.parseInt(request.getParameter("idProp"));
            String nom = request.getParameter("nom");
            String prenom = request.getParameter("prenom");
            String societe = request.getParameter("societe");
            String ville = request.getParameter("ville");
            String adresse = request.getParameter("adresse");
            
            ProfilClient profil = new ProfilClient(idProp, nom, prenom, societe, ville, adresse);
            profilDao.modifier(profil);
            
            response.sendRedirect(request.getContextPath() + "/profil");
        } catch (NumberFormatException e) {
            request.setAttribute("erreur", "ID invalide");
            this.getServletContext().getRequestDispatcher("/profil/modifier.jsp").forward(request, response);
        }
    }

    private void supprimerProfil(HttpServletRequest request, HttpServletResponse response) 
            throws IOException {
        int idProp = Integer.parseInt(request.getParameter("idProp"));
        profilDao.supprimer(idProp);
        response.sendRedirect(request.getContextPath() + "/profil");
    }
}