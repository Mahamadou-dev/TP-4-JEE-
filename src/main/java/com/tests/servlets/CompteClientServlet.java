package com.tests.servlets;

import com.tests.beans.CompteClient;
import com.tests.dao.DaoFactory;
import com.tests.dao.CompteClientsDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

@WebServlet("/compte")
public class CompteClientServlet extends HttpServlet {
    private CompteClientsDao compteDao;
    
    @Override
    public void init() throws ServletException {
        DaoFactory daoFactory = DaoFactory.getInstance();
        this.compteDao = daoFactory.getCompteClientsDao();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if (action == null) {
            request.setAttribute("comptes", compteDao.lister());
            this.getServletContext().getRequestDispatcher("/compte/lister.jsp").forward(request, response);
        } else {
            switch (action) {
                case "ajouter":
                    this.getServletContext().getRequestDispatcher("/compte/ajouter.jsp").forward(request, response);
                    break;
                case "modifier":
                    int numeroModif = Integer.parseInt(request.getParameter("numero"));
                    request.setAttribute("compte", compteDao.trouverParNumero(numeroModif));
                    this.getServletContext().getRequestDispatcher("/compte/modifier.jsp").forward(request, response);
                    break;
                case "consulter":
                    int numero = Integer.parseInt(request.getParameter("numero"));
                    request.setAttribute("compte", compteDao.trouverParNumero(numero));
                    this.getServletContext().getRequestDispatcher("/compte/consulter.jsp").forward(request, response);
                    break;
                default:
                    request.setAttribute("comptes", compteDao.lister());
                    this.getServletContext().getRequestDispatcher("/compte/lister.jsp").forward(request, response);
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
                    ajouterCompte(request, response);
                    break;
                case "modifier":
                    modifierCompte(request, response);
                    break;
                case "supprimer":
                    supprimerCompte(request, response);
                    break;
            }
        }
    }
    
    private void ajouterCompte(HttpServletRequest request, HttpServletResponse response) 
            throws IOException, ServletException {
        try {
            int numero = Integer.parseInt(request.getParameter("numero"));
            int idClient = Integer.parseInt(request.getParameter("idClient"));
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date dateCreation = sdf.parse(request.getParameter("dateCreation"));
            double chiffreAffaire = Double.parseDouble(request.getParameter("chiffreAffaire"));
            
            CompteClient compte = new CompteClient(numero, idClient, dateCreation, chiffreAffaire);
            compteDao.ajouter(compte);
            
            response.sendRedirect(request.getContextPath() + "/compte");
        } catch (ParseException | NumberFormatException e) {
            request.setAttribute("erreur", "Données invalides");
            this.getServletContext().getRequestDispatcher("/compte/ajouter.jsp").forward(request, response);
        }
    }

    private void modifierCompte(HttpServletRequest request, HttpServletResponse response) 
            throws IOException, ServletException {
        try {
            int numero = Integer.parseInt(request.getParameter("numero"));
            int idClient = Integer.parseInt(request.getParameter("idClient"));
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date dateCreation = sdf.parse(request.getParameter("dateCreation"));
            double chiffreAffaire = Double.parseDouble(request.getParameter("chiffreAffaire"));
            
            CompteClient compte = new CompteClient(numero, idClient, dateCreation, chiffreAffaire);
            compteDao.modifier(compte);
            
            response.sendRedirect(request.getContextPath() + "/compte");
        } catch (ParseException | NumberFormatException e) {
            request.setAttribute("erreur", "Données invalides");
            this.getServletContext().getRequestDispatcher("/compte/modifier.jsp").forward(request, response);
        }
    }

    private void supprimerCompte(HttpServletRequest request, HttpServletResponse response) 
            throws IOException {
        int numero = Integer.parseInt(request.getParameter("numero"));
        compteDao.supprimer(numero);
        response.sendRedirect(request.getContextPath() + "/compte");
    }
}