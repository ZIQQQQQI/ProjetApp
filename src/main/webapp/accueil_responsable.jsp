<!DOCTYPE html>
<html>
<head>
	<title>Accueil</title>
	<!-- Accepter les caractères spécieaux -->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <!--Logo icon ut1 capitole-->
	<link rel="icon" href="Images/favicon.ico" type="image/x-icon" />
	<!-- Style de la barre de navigation de bootstrap-->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css" integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy" crossorigin="anonymous">
    <!-- Le fichier est associé à styleAccueil.css qui est chargé de la mise en forme-->
    <link rel="stylesheet" href="../../../../../../../../../../Dcm/UT1C/2021_M2/S1/Java/SemBloquee2/Interfaces/CSS/styleForm.css">

	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/js/bootstrap.min.js" integrity="sha384-a5N7Y/aK3qNeh15eJKGWxsqtnX/wWdSZSKp+81YjTmS15nvnvxKHuzaWwXHDli+4" crossorigin="anonymous"></script>
</head>
<body>
	 <!-- Création de la barre de navigation -->
    <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #B22222;">

        <a class="navbar-brand" href="accueil_responsable.jsp"><img src="Images/logo_grid.gif" alt="Logo ut1"></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">

        </ul>
            <a class="nav-link disabled" href="" style="color:#FFFFFF;">Déconnexion</a>
        </div>
    </nav>

  <div id="global">
	<div id="titrePage">
	  <!-- Titre du tableau-->
	  <h2>Consulter un TP :</h2>
	</div>
	<form name="consult" method="get" action="/GestionMachine/ServletConsulterFor<%--detailFormation.jsp--%>">
		<!--Champ qui contient la liste des TP de l'enseignant
			Récuperer les vrais valeurs dans la BD-->
		<label for="nomTP">Liste de mes TP:</label>
		<select name="nomTP" id="nomTP">
			<!--Value=codeTP-->
			<option value="1">M2 IPM Groupe 1</option>
			<option value="2">M2 IPM Groupe 2</option>
<%--			<option value="1"> Programmation M2 Miage IPM Grp1<!--On affiche ici nomTP--></option>--%>
		</select>

		</br>
		<!--Conteneur du bouton Consulter-->
	    <div id='conteneurBouton'>
			<!-- Création du bouton Enregistrer de type Submit-->
	      <input type="submit" id="consulter" value="Consulter" name="Consulter" class="bouton"/>
	    </div>
	</form>
  </div>  

</body>
</html>