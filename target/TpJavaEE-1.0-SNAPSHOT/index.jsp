<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>🏠 Portail de Gestion Client 🏠</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Titre de la page</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f5f5f5; /* Un gris très clair et neutre */
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            margin: 0;
            background-image: linear-gradient(to bottom, #f5f5f5, #e0e0e0);
        }

        h1 {
            color: #3f51b5; /* Un bleu indigo profond et accueillant */
            text-align: center;
            margin-bottom: 40px;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
            font-size: 3.2em;
            letter-spacing: 1.5px;
            animation: fadeIn 1s ease-out;
        }

        @keyframes fadeIn {
            0% { opacity: 0; transform: translateY(-20px); }
            100% { opacity: 1; transform: translateY(0); }
        }

        ul {
            list-style: none;
            padding: 0;
            text-align: center;
            margin-bottom: 30px;
        }

        li {
            margin: 20px 0;
        }

        li a {
            display: inline-block;
            padding: 15px 30px;
            background-color: #00bcd4; /* Un turquoise vif et engageant */
            color: white;
            text-decoration: none;
            border-radius: 10px;
            font-size: 1.2em;
            font-weight: bold;
            transition: background-color 0.3s ease, transform 0.2s ease, box-shadow 0.3s ease;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        li a:hover {
            background-color: #0097a7;
            transform: scale(1.05);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }
    </style>
</head>
<body>
    <h1>✨ Bienvenue au Centre de Gestion Client ✨</h1>
    <ul>
        <li><a href="compte">🏦 Accéder à la Gestion des Comptes 🏦</a></li>
        <li><a href="profil">👤 Explorer la Gestion des Profils 👤</a></li>
    </ul>
</body>
</html>