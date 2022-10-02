<h1>Liste des genres</h1>

<form action = "/Genres/create/" method= "post" class = "formAjout">
    <div class = "form-example">
        <label for = "gen_nom"> Nom du genre : </label>
        <input type = "text" name = "gen_nom" required>
    </div>
    <div class = "form-example">
        <label for = "gen_desc"> Description du genre : </label>
        <input type = "text" name = "gen_desc" required>
    </div>
    <!-- <div class = "form-example">
        <label for = "gen_id"> Identifiant du genre : </label>
        <input type = "text" name = "gen_id" required>
    </div> -->
    <div class = "form-example">
        <input type = "submit" name = "genSubmit" value = "Ajouter un genre" class = "btnAjout"> </br>
    </div>



<?php foreach($Genre as $Genre): ?>

<h2>
<a 
href="/Genres/lire/<?=$Genre['gen_id']?>">
<?=$Genre['gen_nom']?> 
</a>
</h2>
<p><?=$Genre['gen_desc']?></p>

<?php endforeach;?>