<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>✍️ Révision du Portrait Client ✍️</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Titre de la page</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #e0f7fa; /* Un bleu très clair et apaisant */
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            background-image: linear-gradient(135deg, #e0f7fa 0%, #b2ebf2 100%);
        }

        h1 {
            color: #00bcd4; /* Un turquoise vif */
            text-align: center;
            margin-bottom: 40px;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1);
            font-size: 2.8em;
            letter-spacing: 1.2px;
        }

        form {
            background-color: #fff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 500px;
        }

        label {
            display: block;
            margin-bottom: 10px;
            color: #3f51b5; /* Un bleu indigo profond */
            font-weight: bold;
            font-size: 1.1em;
        }

        input[type="text"] {
            width: calc(100% - 22px);
            padding: 12px;
            margin-bottom: 20px;
            border: 2px solid #00bcd4; /* Le turquoise vif en bordure */
            border-radius: 8px;
            box-sizing: border-box;
            font-size: 16px;
        }

        input[type="text"]:focus {
            outline: none;
            border-color: #ffc107; /* Un jaune ambré pour la focus */
            box-shadow: 0 0 8px rgba(255, 193, 7, 0.5);
        }

        input[type="submit"] {
            background-color: #4caf50; /* Un vert positif */
            color: white;
            padding: 15px 30px;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            font-size: 1.2em;
            font-weight: bold;
            transition: background-color 0.3s ease, transform 0.2s ease;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        input[type="submit"]:hover {
            background-color: #388e3c;
            transform: translateY(-2px);
        }

        a {
            display: inline-block;
            margin-top: 20px;
            color: #f44336; /* Un rouge pour l'annulation */
            text-decoration: none;
            font-weight: bold;
            font-size: 1.1em;
            transition: color 0.3s ease;
        }

        a:hover {
            color: #d32f2f;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.2);
        }

        p[style="color:red"] {
            color: #ff5252;
            margin-top: 20px;
            font-weight: bold;
            text-align: center;
            animation: shakeError 0.5s infinite alternate;
        }

        @keyframes shakeError {
            0% { transform: translateX(0); }
            25% { transform: translateX(-5px); }
            75% { transform: translateX(5px); }
            100% { transform: translateX(0); }
        }

        .back-button {
            margin-top: 30px;
        }

        .back-button .btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #9e9e9e; /* Un gris neutre pour le retour */
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: bold;
            transition: background-color 0.3s ease, transform 0.2s ease;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .back-button .btn:hover {
            background-color: #757575;
            transform: scale(1.03);
        }
    </style>
</head>
<body>
    <h1>✍️ Affinez les Détails du Client ✍️</h1>
    <form method="post" action="profil">
        <input type="hidden" name="action" value="modifier">
        <input type="hidden" name="idProp" value="${profil.idProp}">

        <label for="nom">Nom de Famille :</label>
        <input type="text" id="nom" name="nom" value="${profil.nom}" required><br>

        <label for="prenom">Prénom Usuel :</label>
        <input type="text" id="prenom" name="prenom" value="${profil.prenom}" required><br>

        <label for="societe">Nom de la Société :</label>
        <input type="text" id="societe" name="societe" value="${profil.societe}"><br>

        <label for="ville">Ville de Résidence :</label>
        <input type="text" id="ville" name="ville" value="${profil.ville}"><br>

        <label for="adresse">Adresse Postale :</label>
        <input type="text" id="adresse" name="adresse" value="${profil.adresse}"><br>

        <input type="submit" value="✔️ Enregistrer les Modifications ✔️">
    </form>
    <a href="profil" style="background-color: #f44336; color: white; padding: 12px 25px; border-radius: 8px; text-decoration: none; font-weight: bold; transition: background-color 0.3s ease, transform 0.2s ease;" onmouseover="this.style.backgroundColor='#d32f2f'; this.style.transform='scale(1.03)'" onmouseout="this.style.backgroundColor='#f44336'; this.style.transform='scale(1)'">❌ Annuler les Changements ❌</a>

    <c:if test="${not empty erreur}">
        <p style="color:red">⚠️ ERREUR : ${erreur} ⚠️</p>
    </c:if>
    <div class="back-button">
        <a href="javascript:history.back()" class="btn">⬅️ Retour à l'Interface ⬅️</a>
    </div>
</body>
</html>