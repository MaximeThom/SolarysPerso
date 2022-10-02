<?php

abstract class Model{
    // infos bdd
    private $host = "DESKTOP-LJNOGCK";
    private $db_name = "Solarys";
    private $username = "admin_bdd";
    private $password = "admin_bdd123";

    // propriété contenant la connexion
    protected $_connexion;

    // propriétés contenant les informations de requêtes
    public $table;
    public $id;

    public function getConnection(){
        $this->_connexion = null;

        try{
            $this->_connexion = new PDO('sqlsrv:Server='. $this->host . '; Database=' . $this->db_name, $this->username, $this->password);
        }catch(PDOException $exception){
            echo 'Erreur de connexion: ' . $exception->getMessage();
        }
    }

    public function getAll(){
        $sql = "SELECT * FROM " . $this->table;
        $query = $this->_connexion->prepare($sql);
        $query->execute();
        return $query->fetchAll();
    }

    // public function getOne(){
    //     $sql = "SELECT * FROM " . $this->table ."WHERE id=" .$this->id;
    //     $query = $this->_connexion->prepare($sql);
    //     $query->execute();
    //     return $query->fetch();
    // }


//     public function add(){
//     if(isset($_POST["genSubmit"])){
//         // on vérifie que les champs ne sont pas vide
//         if(!empty($_POST["gen_nom"]) && !empty($_POST["gen_desc"])){
            
//             $gen_nom = $_POST["gen_nom"];
//             $gen_desc = $_POST["gen_desc"];
    
//             $req = "INSERT INTO Genre (gen_nom, gen_desc) VALUES ($gen_nom, $gen_desc)";
//             $RequestStatement = $_connexion->query($req);
            
//             // on vérifie si le statement =/ false
//             if($RequestStatement){
//                 // la bdd rep 00000 si c'est un succès
//                 if( $RequetStatement ->errorCode()=='00000'){
//                     echo "Réussite de l'insertion";
//                     echo "le genre : ".$gen_nom." a bien été ajouté. ";
//                 }else{
//                     echo "Erreur N°".$RequestStatement->errorCode()." lors de l'insertion.";
//                 }
//             }else{
//                 echo "Erreur dans le format de la requête";
//             }
//         }
//     }
// }
}


