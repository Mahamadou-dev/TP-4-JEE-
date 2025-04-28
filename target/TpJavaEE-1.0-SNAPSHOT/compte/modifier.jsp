<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>🛠️ Réinitialisation des Paramètres du Compte 🛠️</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Titre de la page</title>

    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #303030;
            color: #f0f0f0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            background-image: linear-gradient(to bottom right, #424242, #212121);
        }

        h1 {
            color: #00e676;
            text-align: center;
            margin-bottom: 40px;
            text-shadow: 2px 2px 4px #00b25e;
            font-size: 3em;
            letter-spacing: 2px;
        }

        form {
            background-color: #424242;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.5);
            width: 80%;
            max-width: 600px;
        }

        label {
            display: block;
            margin-bottom: 10px;
            color: #bbdefb;
            font-weight: bold;
            font-size: 1.1em;
        }

        input[type="number"],
        input[type="date"] {
            width: calc(100% - 22px);
            padding: 12px;
            margin-bottom: 25px;
            border: 2px solid #00bcd4;
            border-radius: 8px;
            box-sizing: border-box;
            font-size: 16px;
            background-color: #616161;
            color: #e0f7fa;
        }

        input[type="number"]:focus,
        input[type="date"]:focus {
            outline: none;
            border-color: #ff9800;
            box-shadow: 0 0 10px rgba(255, 152, 0, 0.7);
        }

        input[type="submit"] {
            background-color: #00c853;
            color: white;
            padding: 15px 30px;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            font-size: 1.2em;
            font-weight: bold;
            transition: background-color 0.3s ease, transform 0.2s ease;
            box-shadow: 0 6px 10px rgba(0, 0, 0, 0.3);
        }

        input[type="submit"]:hover {
            background-color: #00a547;
            transform: scale(1.05);
        }

        a {
            display: inline-block;
            margin-top: 20px;
            color: #f44336;
            text-decoration: none;
            font-weight: bold;
            font-size: 1.1em;
            transition: color 0.3s ease;
        }

        a:hover {
            color: #d32f2f;
            text-shadow: 1px 1px 2px #000;
        }

        p[style="color:red"] {
            color: #ff5252;
            margin-top: 20px;
            font-weight: bold;
            text-align: center;
            animation: blinkError 1s infinite alternate;
        }

        @keyframes blinkError {
            0% {
                opacity: 1;
            }
            100% {
                opacity: 0.7;
            }
        }

        .back-button {
            margin-top: 30px;
        }

        .back-button .btn {
            display: inline-block;
            padding: 12px 25px;
            background-color: #64b5f6;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: bold;
            transition: background-color 0.3s ease, transform 0.2s ease;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
        }

        .back-button .btn:hover {
            background-color: #42a5f5;
            transform: translateX(-2px);
        }
    </style>
</head>
<body>
    <h1>⚙️ Ajustement des Données du Client ⚙️</h1>
    <form method="post" action="compte">
        <input type="hidden" name="action" value="modifier">
        <input type="hidden" name="numero" value="${compte.numero}">

        <label for="idClient">Identifiant Unique du Client :</label>
        <input type="number" id="idClient" name="idClient" value="${compte.idClient}" required><br>

        <label for="dateCreation">Date de Création Initiale :</label>
        <input type="date" id="dateCreation" name="dateCreation"
               value="<fmt:formatDate value='${compte.dateCreation}' pattern='yyyy-MM-dd'/>" required><br>

        <label for="chiffreAffaire">Flux Financier Actuel :</label>
        <input type="number" step="0.001" id="chiffreAffaire" name="chiffreAffaire"
               value="${compte.chiffreAffaire}" required><br>

        <input type="submit" value="💾 Enregistrer les Modifications 💾">
    </form>
    <a href="compte" style="background-color: #f44336; color: white; padding: 12px 25px; border-radius: 8px; text-decoration: none; font-weight: bold; transition: background-color 0.3s ease, transform 0.2s ease;" onmouseover="this.style.backgroundColor='#d32f2f'; this.style.transform='scale(1.05)'" onmouseout="this.style.backgroundColor='#f44336'; this.style.transform='scale(1)'">Abandonner les Changements</a>

    <c:if test="${not empty erreur}">
        <p style="color:red">🚨 ALERTE : ${erreur} 🚨</p>
    </c:if>
<div class="back-button">
    <a href="javascript:history.back()" class="btn">⏪ Retour à la Console ⏪</a>
</div>
</body>
</html>