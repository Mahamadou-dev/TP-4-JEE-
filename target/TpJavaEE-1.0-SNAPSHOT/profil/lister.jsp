<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>🎭 La Galerie des Personnalités Client 🎭</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Titre de la page</title>

    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #263238; /* Un bleu grisâtre profond */
            color: #eceff1;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: flex-start;
            min-height: 100vh;
            margin: 0;
            padding-top: 50px;
            background-image: linear-gradient(to bottom, #37474f, #263238);
        }

        h1 {
            color: #ffca28; /* Un jaune ambré éclatant */
            text-align: center;
            margin-bottom: 30px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
            font-size: 3em;
            letter-spacing: 2px;
            animation: pulseTitle 2s infinite alternate;
        }

        @keyframes pulseTitle {
            0% {
                transform: scale(1);
            }
            100% {
                transform: scale(1.03);
            }
        }

        table {
            border-collapse: collapse;
            width: 90%;
            max-width: 1000px;
            margin-bottom: 30px;
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.4);
            border-radius: 10px;
            overflow: hidden;
            background-color: #37474f;
        }

        th, td {
            border: none;
            padding: 18px 15px;
            text-align: left;
        }

        th {
            background-color: #455a64;
            color: #fff;
            font-weight: bold;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        tr:nth-child(even) {
            background-color: #4f5b62;
        }

        td {
            color: #cfd8dc;
        }

        td a {
            color: #80cbc4; /* Un turquoise doux */
            text-decoration: none;
            font-weight: bold;
            transition: color 0.3s ease, text-shadow 0.3s ease;
        }

        td a:hover {
            color: #a7ffeb;
            text-shadow: 1px 1px 2px #000;
        }

        a.add-button {
            display: inline-block;
            padding: 15px 30px;
            background-color: #009688; /* Un vert turquoise vibrant */
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-size: 1.2em;
            font-weight: bold;
            transition: background-color 0.3s ease, transform 0.2s ease;
            box-shadow: 0 6px 10px rgba(0, 0, 0, 0.2);
        }

        a.add-button:hover {
            background-color: #00796b;
            transform: translateY(-2px);
        }

        .back-button {
            margin-top: 30px;
        }

        .back-button .btn {
            display: inline-block;
            padding: 12px 25px;
            background-color: #d32f2f; /* Un rouge profond */
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: bold;
            transition: background-color 0.3s ease, transform 0.2s ease;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
        }

        .back-button .btn:hover {
            background-color: #c62828;
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <h1>🎭 Le Théâtre des Identités Client 🎭</h1>
    <table>
        <thead>
            <tr>
                <th>Identifiant Scénique</th>
                <th>Nom de Famille</th>
                <th>Prénom Artistique</th>
                <th>Troupe de la Société</th>
                <th>Ville de Représentation</th>
                <th>Adresse du Coulisses</th>
                <th>Actions sur Scène</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${profils}" var="profil">
                <tr>
                    <td>${profil.idProp}</td>
                    <td>${profil.nom}</td>
                    <td>${profil.prenom}</td>
                    <td>${profil.societe}</td>
                    <td>${profil.ville}</td>
                    <td>${profil.adresse}</td>
                    <td>
                        <a href="profil?action=consulter&idProp=${profil.idProp}" style="color: #a7ffeb;">Voir la Fiche</a> |
                        <a href="profil?action=modifier&idProp=${profil.idProp}" style="color: #ffeb3b;">Changer le Costume</a> |
                        <a href="profil?action=supprimer&idProp=${profil.idProp}"
                           onclick="return confirm('Attention ! Supprimer ce profil effacera sa présence de la scène!')"
                           style="color: #f44336;">Quitter la Scène</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <a href="profil?action=ajouter" class="add-button">✨ Ajouter une Nouvelle Étoile ✨</a>
    <div class="back-button">
        <a href="javascript:history.back()" class="btn">⏪ Retour au Rideau ⏪</a>
    </div>
</body>
</html>