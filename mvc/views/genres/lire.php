<h2> 
    <a href="/genres/lire/<?= $genre['gen_id'] ?>"> 
</h2>

<h1>
    <a href="/genres/lire/<?= $genre['gen_id'] ?>"><?= $genre['gen_nom']?></a>
</h1>

<p> 
    
    <?= $genre['gen_desc']?> 
</p>
<a href="/genres/update/<?= $genre['gen_id'] ?>">
<input type="button" name="update" value="Modifier le contenu">
</a>



