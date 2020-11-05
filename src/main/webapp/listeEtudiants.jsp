<%@ page import="Model.Utilisateur" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
	<title>Listes des etudiants</title>
	<!-- Accepter les caractères spécieaux -->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <!--Logo icon ut1 capitole-->
	<link rel="icon" href="Images/favicon.ico" type="image/x-icon" />
	<!-- Style de la barre de navigation de bootstrap-->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css" integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy" crossorigin="anonymous">
    <!-- Le fichier est associé à styleAccueil.css qui est chargé de la mise en forme-->
    <link rel="stylesheet" href="CSS/styleAccueil.css">
    <link rel="stylesheet" href="../../../../../../../../../Dcm/UT1C/2021_M2/S1/Java/SemBloquee2/Interfaces/CSS/styleForm.css">

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
        <li class="nav-item">
            <a class="nav-link disabled" href="accueil_responsable.jsp" style="color:#FFFFFF;">Accueil</a>
        </li>
        <li class="nav-item">
            <a class="nav-link disabled" href="listeEtudiants.jsp" style="color:#FFFFFF;">Consulter liste des Etudiants</a>
        </li>
        <li class="nav-item">
            <a class="nav-link disabled" href="listTp.jsp" style="color:#FFFFFF;">Consulter les TPs</a>
        </li>
        <li class="nav-item">
            <a class="nav-link disabled" href="choisirDateTp.jsp" style="color:#FFFFFF;">Réserver une salle</a>
        </li>
        </ul>
            <a class="nav-link disabled" href="" style="color:#FFFFFF;">Déconnexion</a>
        </div>
    </nav>

  <div id="global">
  <br/>
	  <div id="titrePage">
		  <%
			  String codeG = (String) request.getAttribute("codeG");
			  out.print("<h2>Groupe: " + codeG + "</h2>");
		  %>
	  </div>

	<div id="titrePage">
	  <!-- Titre du tableau-->
	  <h2>Ajouter un nouvel étudiant dans le Groupe:</h2>
	</div>
	<form>
	  <form method="get" action="/GestionMachine/ServletAddEtu">
  		<!--Champ identifiant-->
		<label for="identifiantU">Identifiant:</label>
		<input type="text" name="identifiantU" id="identifiantU" placeholder="2*******" />
  		<!--Champ mot de passe-->
		<label for="motdepasseU">Mot de passe:</label>
		<input type="text" name="motdepasseU" id="motdepasseU" placeholder="00000N" />
  		<!--Champ nom-->
		<label for="nomU">Nom:</label>
		<input type="text" name="nomU" id="nomU" placeholder="TRUMP" />
  		<!--Champ prenom-->
		<label for="identifiantU">Prenom:</label>
		<input type="text" name="prenomU" id="prenomU" placeholder="DONALD" />
  		<!--Champ Groupe, qui est automatique-->
		<label for="nomG">Groupe:</label>
		<input type="text" name="nomG" id="nomG" value="" readonly="readonly" />
		</br>
		<!-- Création du bouton Ajouter de type Submit-->
	    <input type="submit" id="ajouter" value="Ajouter" name="Ajouter" class="bouton"/>
	</form>
	<div id="titrePage">
	  <!-- Titre du tableau-->
	  <h2>Liste des etudiants du Groupe:</h2>
	</div>

	<!-- Création du tableau-->
	<div id="conteneurTab">
		<table id="myTable">
			<tr class="header">
				<th id="identifiantE">Numéro etudiant</th>
				<th id="nomE">Nom </th>
				<th id="prenomE">Prenom </th>
				<th id="supprimer">Supprimer</th>
			</tr>

			<%
				List<Utilisateur> lstU = (List<Utilisateur>) request.getAttribute("lstU");

				for (Utilisateur utilisateur : lstU) {
					out.print("<tr><td>"+utilisateur.getIdentifiantU()+"</td>");
					out.print("<td>"+utilisateur.getNomU()+"</td>");
					out.print("<td>"+utilisateur.getPrenomU()+"</td>");
					out.print("<td><a class='bouton' href=ServletSupprimerEtudiant?idU="+ utilisateur.getIdentifiantU()
							+ "&codeG="+ codeG +"> Supprimer</a></td></tr>");
				}
			%>
		</table>

	</div>  

</body>
</html>