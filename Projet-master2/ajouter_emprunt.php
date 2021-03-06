<!doctype html>
<html lang="fr">
	<head>
	  <meta charset="utf-8">
	  <title>Accueil du site</title>
	  <link rel="stylesheet" type="text/css" href="Monstyle2.css"> 
	</head>
	<body>
		<?php
			/*************************************************************************
				nom du script : ajouter_emprunt.php
				Description   : Ce script est un formulaire d'emprunt.
								Une fois le formulaire soumis les données sont vérifiées et
								les éléments ajoutés à la base de données.
				Version : 1.0
				Date	: 13/12/2019
				Auteur	: Blondel/Gauthier
			*************************************************************************/
				session_start();
		if (isset($_SESSION['emailUser']))
		{
			// on determine si on doit afficher ou traiter le formulaire
			if (isset($_POST["Valider"]))
			{
				// traitement des données envoyées par le formulaire
				
				/* on recupere les données du formulaire et on les "aseptise" avant de les utiliser 
				   pour cela on va creer une fonction de nettoyage qu'on va utiliser
				*/
				  /* on recupere de manière brut les données */
                  $numpersonne_lue 	= utf8_decode ($_POST['numpersonne']);
                  $numlivre_lue		= utf8_decode ($_POST['numlivre']);
                  $sortie_lue		= utf8_decode ($_POST['sortie']);
				
				/* on aseptise les données récupérées avant de les utiliser pour 
				   lutter contre la faille XSS */
						$numpersonne 	= sanitizeString ($numpersonne_lue);
						$numlivre		= sanitizeString ($numlivre_lue);
						$sortie		    = sanitizeString ($sortie_lue);
								
				// on se connecte au SGBD
				
				// paramètres de connexion
				$host 	= 'localhost';
				$user 	= 'user' ;   
				$passwd = 'snir@snir2019';
				$mabase = 'biblio';
			
				
				//tentative de connexion au SGBD MySQL  
				if ($conn = mysqli_connect($host,$user,$passwd,$mabase))
				{
					
							
					
					// preparation de la requete d'insertion des données
					$reqInsert = "INSERT INTO emprunt(numpersonne,numlivre,sortie)
					              VALUES ('$numpersonne_lue','$numlivre_lue','$sortie_lue')";
					// on tente d'envoyer la requête
					if($result = mysqli_query($conn, $reqInsert, MYSQLI_USE_RESULT))
					{
						// requete on appelle le script "affiche_livre.php"
						echo "emprunt réalisée ";
					}
					else
					{
						// erreur de requête
						echo $reqInsert ;
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
				// afficher le formulaire
				?>
				<h1>Ajouter un emprunt  </h1>
				<form action="<?php $_SERVER['PHP_SELF'] ?>" method="post">
					<div>
						<!-- zone de numpersonne -->
						<label for="numpersonne">N° de personne : </label>
						<input type="number" id="numpersonne" placeholder="Entrez le numero de la personne"
						  name = "numpersonne" min="0" required>
					</div>
					<div>
						<!-- zone de numlivre -->
						<label for="numlivre">N° du Livre : </label>
						<input type="number" id="numlivre" placeholder="Entrez le numero du livre"
						  name = "numlivre" min="0" required>
					</div>
					<div>
						<label for="sortie">Date de l'emprunt : </label>
						<input type="date" id="sortie" name = "sortie" required>
					</div>
					<div class="button">
						<!-- Zone du bouton valider -->
						<button type="submit" name= "Valider"> Valider </button>
					</div>
				</form>
				<?php
				
				
			}
		}
		else
			{
				echo "il faut se connecter pour afficher les livres <BR>";
				echo '<a href ="connexion1.php"> se connecter </a>';
			}
			
			/* Fonctions pour aseptiser les données utilisateurs */
			// aseptiser les chaines de caractères
			function sanitizeString($var)
			{
				if (get_magic_quotes_gpc())
				{
					// supprimer les slashes
					$var = stripslashes($var);
				}
				// suppression des tags
				$var = strip_tags($var);
				// convertir la chaine en HTML
				$var = htmlentities ($var);
				return $var;
			}
			
				
		?>	
	
	</body>
</html>