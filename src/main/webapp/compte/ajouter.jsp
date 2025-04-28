<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>✨ Ajouter un Compte Client Cosmique ✨</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" viewBox="0 0 100 100"><polygon points="50 0, 61.8 38.2, 100 38.2, 69.1 61.8, 80.9 100, 50 77.7, 19.1 100, 30.9 61.8, 0 38.2, 38.2 38.2" fill="#e74c3c"/><polygon points="50 15, 57.9 43.3, 85 43.3, 63.3 59.6, 70.7 85, 50 67.1, 29.3 85, 36.7 59.6, 15 43.3, 42.1 43.3" fill="#f39c12"/></svg>');
            background-size: 20px 20px;
        }

        h1 {
            color: #3498db;
            text-align: center;
            margin-bottom: 30px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
            font-size: 2.5em;
            letter-spacing: 1px;
        }

        form {
            background-color: #fff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            width: 80%;
            max-width: 600px;
        }

        label {
            display: block;
            margin-bottom: 10px;
            color: #2c3e50;
            font-weight: bold;
        }

        input[type="number"],
        input[type="date"] {
            width: calc(100% - 22px);
            padding: 10px;
            margin-bottom: 20px;
            border: 2px solid #3498db;
            border-radius: 8px;
            box-sizing: border-box;
            font-size: 16px;
        }

        input[type="number"]:focus,
        input[type="date"]:focus {
            outline: none;
            border-color: #e67e22;
            box-shadow: 0 0 8px rgba(230, 126, 34, 0.5);
        }

        input[type="submit"] {
            background-color: #2ecc71;
            color: white;
            padding: 15px 30px;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            font-size: 18px;
            transition: background-color 0.3s ease;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        input[type="submit"]:hover {
            background-color: #27ae60;
        }

        a {
            display: inline-block;
            margin-top: 20px;
            color: #3498db;
            text-decoration: none;
            font-weight: bold;
            transition: color 0.3s ease;
        }

        a:hover {
            color: #e74c3c;
        }

        .back-button {
            margin-top: 20px;
            text-align: center;
        }

        .back-button .btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #f39c12;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            transition: background-color 0.3s ease;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .back-button .btn:hover {
            background-color: #e67e22;
        }
    </style>
</head>
<body>
    <h1>✨ Ajouter un Compte Client Cosmique ✨</h1>
    <form method="post" action="compte">
        <input type="hidden" name="action" value="ajouter">

        <label for="numero">Numéro de Galaxie :</label>
        <input type="number" id="numero" name="numero" required
               min="1" oninvalid="this.setCustomValidity('Le numéro de galaxie doit être positif')"><br>

        <label for="idClient">ID d'Entité Stellaire :</label>
        <input type="number" id="idClient" name="idClient" required
               min="1" oninvalid="this.setCustomValidity('L\'ID d\'entité stellaire doit exister')"><br>

        <label for="dateCreation">Date de Création Interstellaire :</label>
        <input type="date" id="dateCreation" name="dateCreation" required><br>

        <label for="chiffreAffaire">Unités de Valeur Cosmique :</label>
        <input type="number" step="0.001" id="chiffreAffaire" name="chiffreAffaire" required
               min="0" oninvalid="this.setCustomValidity('Les unités de valeur cosmique ne peuvent être négatives')"><br>

        <input type="submit" value="🚀 Ajouter au Cosmos 🚀">
    </form>
    <div style="text-align: center; margin-top: 30px;">
        <a href="compte" style="background-color: #9b59b6; color: white; padding: 12px 25px; border-radius: 8px; text-decoration: none; font-weight: bold; transition: background-color 0.3s ease;" onmouseover="this.style.backgroundColor='#8e44ad'" onmouseout="this.style.backgroundColor='#9b59b6'">Retour à la Nébuleuse des Comptes</a>
    </div>
    <div class="back-button">
        <a href="javascript:history.back()" class="btn">⏪ Retour en Orbite ⏪</a>
    </div>
</body>
</html>