<!doctype html>
<html lang="fr">
    <head>
    <metacharset ="utf-8">
    <title>Deconnexion</title>
    <link rel="stylesheet" type="text/css" href="Monstyle2.css">
</head>
<body>
    <?php
        session_start();
        session_destroy();
        echo 'Vous avez bien été deconnecter ! <BR> <a href="acceuil.html">retour acceuil</a>';
    ?>
</body>
</html>