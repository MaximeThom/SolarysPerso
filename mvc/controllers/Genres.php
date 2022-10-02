<?php

class Genres extends Controller{
    public function index(){
        $this->loadModel("Genre");
        $Genre = $this->Genre->getAll();
        
        $this->render('index', compact('Genre'));
    }

    public function lire($id){
        $this ->loadModel('Genre');
        $genre = $this->Genre->findById($id);

        $this->render('lire', compact('genre'));
    }

    public function create(){
        // var_dump($_POST);
        // die();        
        $this ->loadModel('Genre');
        $genre = $this->Genre->add();

        $this->render('create', compact('genre'));
    }

    public function update($id){
        $this ->loadModel('Genre');
        $genre = $this->Genre->update($id);
        $genre = $this->Genre->findById($id);
        // var_dump($genre);
        $this->render('update', compact('genre'));
    }
}


?>