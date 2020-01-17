<!doctype html>
<html lang="fr">
	<head>
	  <meta charset="utf-8">
	  <title>Accueil du site</title>
	  <link rel="stylesheet" type="text/css" href="Monstyle2.css"> 
	</head>
	<body>
			<h1>Liste des emprunts </h1>
			<!--Définition d'un tableau HTML -->
			<table> 
				<tr><th>numpersonne</th><th>numlivre</th><th>sortie</th><th>retour</th></tr>
		   
		  <?php
			/*************************************************************************
				nom du script : affiche_emprunt.php
				Description : ce script se connecte au SGBD MySQL,
				              envoie une requête pour recuperrer les données
							  de la table emprunt et affiche le résultat dans un
							  tableau HTML
				Version : 1.0
				Date	: 15/11/2019
				Auteur	: Blondel/Gauthier
			*************************************************************************/
			session_start();
		if (isset($_SESSION['emailUser']))
		{
			// paramètres de connexion
			$host 	= 'localhost';
			$user 	= 'user' ;   
			$passwd = 'snir@snir2019';
			$mabase = 'biblio';
			
			//tentative de connexion au SGBD MySQL  
			if ($conn = mysqli_connect($host,$user,$passwd,$mabase))
			{
				// connexion à la base de données OK
				// preparation de la requête
				$req = "SELECT * FROM emprunt";	
				
				// envoie de la requete
				if($result = mysqli_query($conn, $req, MYSQLI_USE_RESULT))
				{
					// requête ok il faut traiter la réponse
					// tant qu'il y a des ligne à traiter
					while ( $row =mysqli_fetch_assoc($result))
					{
						// on recupere les champs de la ligne
						$numpersonne 	= utf8_encode ($row['numpersonne']);
						$numlivre		= utf8_encode ($row['numlivre']);
						$sortie		= utf8_encode ($row['sortie']);
						$retour		= utf8_encode ($row['retour']);
						
						
						// afficher la ligne
						echo "<tr><td>$numpersonne</td><td>$numlivre</td><td>$sortie</td> 
						<td>$retour</td></tr>";
					}
				}
				else{
					// erreur de requête
					die ("erreur de requête");
				}
			}
			else
			{
					// echec de la connexion à la BD 
				die("problême de connexion au serveur de base de données");	
			}
		}
		else
			{
				echo "il faut se connecter pour afficher les livres <BR>";
				echo '<a href ="connexion1.php"> se connecter </a>';
			}
		  ?>
		 	</TABLE>
		<BR>
		  <P align = "center"> <A href="index.html"> acceuil </A> </P> <BR>

	</body>
</html>