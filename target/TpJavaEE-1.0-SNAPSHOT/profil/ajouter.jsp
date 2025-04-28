<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>🎉 Création d'un Nouveau Profil Éclatant 🎉</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Titre de la page</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #ffe0b2; /* Un jaune pâle chaleureux */
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 20 20"><rect fill="#ffcc80" width="10" height="10"/><rect fill="#f48fb1" x="10" width="10" height="10"/><rect fill="#81d4fa" y="10" width="10" height="10"/><rect fill="#a5d6a7" x="10" y="10" width="10" height="10"/></svg>');
            background-size: 40px 40px;
        }

        h1 {
            color: #e91e63; /* Un rose vif */
            text-align: center;
            margin-bottom: 30px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1);
            font-size: 2.8em;
            letter-spacing: 1.5px;
        }

        form {
            background-color: #fff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.15);
            width: 80%;
            max-width: 500px;
        }

        label {
            display: block;
            margin-bottom: 10px;
            color: #5e35b1; /* Un violet profond */
            font-weight: bold;
            font-size: 1.1em;
        }

        input[type="number"],
        input[type="text"] {
            width: calc(100% - 22px);
            padding: 12px;
            margin-bottom: 20px;
            border: 2px solid #ff9800; /* Un orange éclatant */
            border-radius: 8px;
            box-sizing: border-box;
            font-size: 16px;
        }

        input[type="number"]:focus,
        input[type="text"]:focus {
            outline: none;
            border-color: #4caf50; /* Un vert joyeux */
            box-shadow: 0 0 8px rgba(76, 175, 80, 0.5);
        }

        input[type="submit"] {
            background-color: #fdd835; /* Un jaune doré */
            color: #333;
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
            background-color: #fbc02d;
            transform: translateY(-2px);
        }

        a {
            display: inline-block;
            margin-top: 20px;
            color: #03a9f4; /* Un bleu clair */
            text-decoration: none;
            font-weight: bold;
            font-size: 1.1em;
            transition: color 0.3s ease;
        }

        a:hover {
            color: #0288d1;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.2);
        }

        .back-button {
            margin-top: 20px;
        }

        .back-button .btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #9c27b0; /* Un violet intense */
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: bold;
            transition: background-color 0.3s ease, transform 0.2s ease;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .back-button .btn:hover {
            background-color: #7b1fa2;
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <h1>✨ Façonnez un Nouveau Client Éblouissant ✨</h1>
    <form method="post" action="profil">
        <input type="hidden" name="action" value="ajouter">
        <label for="idProp">Identifiant Unique :</label>
        <input type="number" id="idProp" name="idProp" required><br>

        <label for="nom">Nom de Famille :</label>
        <input type="text" id="nom" name="nom" required><br>

        <label for="prenom">Prénom Ensoleillé :</label>
        <input type="text" id="prenom" name="prenom" required><br>

        <label for="societe">Entreprise Créative :</label>
        <input type="text" id="societe" name="societe"><br>

        <label for="ville">Cité Lumineuse :</label>
        <input type="text" id="ville" name="ville"><br>

        <label for="adresse">Chemin Enchanté :</label>
        <input type="text" id="adresse" name="adresse"><br>

        <input type="submit" value="🌟 Ajouter au Répertoire des Stars 🌟">
    </form>
    <a href="profil" style="background-color: #00bcd4; color: white; padding: 12px 25px; border-radius: 8px; text-decoration: none; font-weight: bold; transition: background-color 0.3s ease, transform 0.2s ease;" onmouseover="this.style.backgroundColor='#0097a7'; this.style.transform='scale(1.03)'" onmouseout="this.style.backgroundColor='#00bcd4'; this.style.transform='scale(1)'">Retour à la Galerie des Profils</a>
    <div class="back-button">
        <a href="javascript:history.back()" class="btn">🌈 Retour au Portail 🌈</a>
    </div>
</body>
</html>