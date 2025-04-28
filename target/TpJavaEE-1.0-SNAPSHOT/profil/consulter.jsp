<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>👤 Informations Essentielles du Profil 👤</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Titre de la page</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f0f4c3; /* Un vert clair doux */
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            margin: 0;
            background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 20 20"><circle cx="5" cy="5" r="3" fill="#8bc34a"/><circle cx="15" cy="15" r="3" fill="#ffb300"/><circle cx="15" cy="5" r="2" fill="#e64a19"/><circle cx="5" cy="15" r="2" fill="#1e88e5"/></svg>');
            background-size: 30px 30px;
        }

        h1 {
            color: #7b1fa2; /* Un violet profond et élégant */
            text-align: center;
            margin-bottom: 30px;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1);
            font-size: 2.5em;
            letter-spacing: 1px;
        }

        p {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 15px 30px;
            border-radius: 10px;
            margin-bottom: 15px;
            font-size: 1.1em;
            box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.05);
            border-left: 5px solid #ffb300; /* Un jaune chaleureux en accent */
        }

        p strong {
            color: #5e35b1; /* Le violet profond pour l'emphase */
        }

        a {
            display: inline-block;
            padding: 12px 25px;
            background-color: #4caf50; /* Un vert positif */
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: bold;
            transition: background-color 0.3s ease, transform 0.2s ease;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        a:hover {
            background-color: #388e3c;
            transform: translateY(-1px);
        }

        .back-button {
            margin-top: 20px;
        }

        .back-button .btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #f44336; /* Un rouge pour l'action de retour */
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: bold;
            transition: background-color 0.3s ease, transform 0.2s ease;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .back-button .btn:hover {
            background-color: #d32f2f;
            transform: scale(1.03);
        }
    </style>
</head>
<body>
    <h1>✨ Aperçu du Profil Client ✨</h1>
    <p><strong>Identifiant Unique :</strong> <span style="color: #e64a19; font-weight: bold;">${profil.idProp}</span></p>
    <p><strong>Nom Patronymique :</strong> <span style="color: #1e88e5; font-weight: bold;">${profil.nom}</span></p>
    <p><strong>Prénom Usuel :</strong> <span style="color: #8bc34a; font-weight: bold;">${profil.prenom}</span></p>
    <p><strong>Entité Organisationnelle :</strong> <span style="color: #ffb300; font-weight: bold;">${profil.societe}</span></p>
    <p><strong>Localisation Urbaine :</strong> <span style="color: #00acc1; font-weight: bold;">${profil.ville}</span></p>
    <p><strong>Adresse de Résidence :</strong> <span style="color: #d84315; font-weight: bold;">${profil.adresse}</span></p>
    <div style="margin-top: 30px;">
        <a href="profil" style="background-color: #00bcd4; color: white; padding: 12px 25px; border-radius: 8px; text-decoration: none; font-weight: bold; transition: background-color 0.3s ease, transform 0.2s ease;" onmouseover="this.style.backgroundColor='#0097a7'; this.style.transform='scale(1.03)'" onmouseout="this.style.backgroundColor='#00bcd4'; this.style.transform='scale(1)'">Retour à la Collection des Profils</a>
    </div>
    <div class="back-button">
        <a href="javascript:history.back()" class="btn">⏪ Revenir en Arrière ⏪</a>
    </div>
</body>
</html>