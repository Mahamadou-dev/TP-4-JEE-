<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>📊 Le Grand Inventaire des Comptes Cosmiques 📊</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Titre de la page</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #222;
            color: #eee;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: flex-start;
            min-height: 100vh;
            margin: 0;
            padding-top: 50px;
            background-image: radial-gradient(circle, rgba(40, 40, 40, 0.8), rgba(0, 0, 0, 0.9));
        }

        h1 {
            color: #ffeb3b;
            text-align: center;
            margin-bottom: 30px;
            text-shadow: 4px 4px 8px rgba(0, 0, 0, 0.5);
            font-size: 3.5em;
            letter-spacing: 3px;
            animation: neonGlow 1.5s infinite alternate;
        }

        @keyframes neonGlow {
            0% {
                text-shadow: 4px 4px 8px #ffeb3b;
            }
            100% {
                text-shadow: 4px 4px 12px #fdd835;
            }
        }

        table {
            border-collapse: collapse;
            width: 80%;
            max-width: 900px;
            margin-bottom: 30px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
            border-radius: 12px;
            overflow: hidden;
        }

        th, td {
            border: none;
            padding: 15px;
            text-align: left;
        }

        th {
            background-color: #333;
            color: #fff;
            font-weight: bold;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        tr:nth-child(even) {
            background-color: #444;
        }

        td {
            color: #ddd;
        }

        td a {
            color: #64ffda;
            text-decoration: none;
            font-weight: bold;
            transition: color 0.3s ease;
        }

        td a:hover {
            color: #a7ffeb;
            text-shadow: 1px 1px 2px #000;
        }

        a.add-button {
            display: inline-block;
            padding: 15px 30px;
            background-color: #4caf50;
            color: white;
            text-decoration: none;
            border-radius: 10px;
            font-size: 1.2em;
            font-weight: bold;
            transition: background-color 0.3s ease, transform 0.2s ease;
            box-shadow: 0 6px 10px rgba(0, 0, 0, 0.2);
        }

        a.add-button:hover {
            background-color: #43a047;
            transform: translateY(-3px);
        }

        .back-button {
            margin-top: 30px;
        }

        .back-button .btn {
            display: inline-block;
            padding: 12px 25px;
            background-color: #f44336;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: bold;
            transition: background-color 0.3s ease, transform 0.2s ease;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
        }

        .back-button .btn:hover {
            background-color: #d32f2f;
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <h1>✨ Le Panthéon des Comptes Stellaires ✨</h1>
    <table>
        <thead>
            <tr>
                <th>Numéro de Vortex</th>
                <th>ID d'Entité Galactique</th>
                <th>Date de Genèse</th>
                <th>Flux Monétaire Cosmique</th>
                <th>Actions Interdimensionnelles</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${comptes}" var="compte">
                <tr>
                    <td>${compte.numero}</td>
                    <td>${compte.idClient}</td>
                    <td>${compte.dateCreation}</td>
                    <td>${compte.chiffreAffaire} <span style="font-size: 0.8em; color: #ccc;">unités</span></td>
                    <td>
                        <a href="compte?action=consulter&numero=${compte.numero}" style="color: #00bcd4;">Observer</a> |
                        <a href="compte?action=modifier&numero=${compte.numero}" style="color: #ffc107;">Réconfigurer</a> |
                        <a href="compte?action=supprimer&numero=${compte.numero}"
                           onclick="return confirm('Attention ! Supprimer ce compte pourrait déchirer le continuum espace-temps!')"
                           style="color: #e91e63;">Éradiquer</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <a href="compte?action=ajouter" class="add-button">🌌 Créer un Nouveau Système 🌌</a>
    <div class="back-button">
        <a href="javascript:history.back()" class="btn">⏪ Retour au Néant Précédent ⏪</a>
    </div>
</body>
</html>