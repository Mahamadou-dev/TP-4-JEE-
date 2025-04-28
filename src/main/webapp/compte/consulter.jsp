<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>🔍 Plongée au Cœur du Compte 🔍</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Titre de la page</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #ecf0f1;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            margin: 0;
            background-image: linear-gradient(135deg, #bdc3c7 0%, #2c3e50 100%);
            color: #fff;
        }

        h1 {
            color: #f1c40f;
            text-align: center;
            margin-bottom: 30px;
            text-shadow: 3px 3px 6px rgba(0, 0, 0, 0.3);
            font-size: 3em;
            letter-spacing: 2px;
            animation: pulsate 2s infinite alternate;
        }

        @keyframes pulsate {
            0% {
                transform: scale(1);
            }
            100% {
                transform: scale(1.05);
            }
        }

        p {
            background-color: rgba(255, 255, 255, 0.1);
            padding: 15px 30px;
            border-radius: 10px;
            margin-bottom: 15px;
            font-size: 1.2em;
            box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
            border-left: 5px solid #e67e22;
        }

        a {
            display: inline-block;
            padding: 12px 25px;
            background-color: #3498db;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: bold;
            transition: background-color 0.3s ease, transform 0.2s ease;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        a:hover {
            background-color: #2980b9;
            transform: translateY(-2px);
        }

        .back-button {
            margin-top: 20px;
        }

        .back-button .btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #9b59b6;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: bold;
            transition: background-color 0.3s ease, transform 0.2s ease;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .back-button .btn:hover {
            background-color: #8e44ad;
            transform: translateX(-2px);
        }
    </style>
</head>
<body>
    <h1>🔍 Détails Éblouissants du Compte 🔍</h1>
    <p><strong>Numéro Magique :</strong> <span style="color: #2ecc71; font-weight: bold;">${compte.numero}</span></p>
    <p><strong>Identifiant du Client Mystérieux :</strong> <span style="color: #e74c3c; font-weight: bold;">${compte.idClient}</span></p>
    <p><strong>Date d'Apparition Cosmique :</strong> <span style="color: #f39c12; font-weight: bold;">${compte.dateCreation}</span></p>
    <p><strong>Montant Vertigineux :</strong> <span style="color: #1abc9c; font-weight: bold;">${compte.chiffreAffaire}</span></p>
    <div style="margin-top: 30px;">
        <a href="compte" style="background-color: #e67e22; color: white; padding: 15px 30px; border-radius: 10px; text-decoration: none; font-weight: bold; transition: background-color 0.3s ease, transform 0.2s ease;" onmouseover="this.style.backgroundColor='#d35400'; this.style.transform='scale(1.05)'" onmouseout="this.style.backgroundColor='#e67e22'; this.style.transform='scale(1)'">Retour au Panthéon des Comptes</a>
    </div>
    <div class="back-button">
        <a href="javascript:history.back()" class="btn">⏪ Retourner dans l'Olympe ⏪</a>
    </div>
</body>
</html>