<?php

class AutosModel {

    private $db;

    public function __construct() {
        $this->db = new PDO('mysql:host=localhost;'.'dbname=gestionestacionamiento;charset=utf8', 'root', '');
    }
    
    public function getAll($sort){
        $query = $this->db->prepare("SELECT * FROM 	autos ORDER BY id " . $sort);
        $query->execute();
        
        return $query->fetchAll(PDO::FETCH_OBJ);

    }

    public function getAuto($id){
        $query = $this->db->prepare("SELECT * FROM autos WHERE id = ?");
        $query->execute(array($id));
        
        return $query->fetchAll(PDO::FETCH_OBJ);
    }


    public function addAuto($patente,  $cliente, $estacionamiento){
        $query = $this->db->prepare("INSERT INTO autos (patente, entrada, cliente, estacionamiento, salida) VALUES(?,?,?,?,?)");
        $query->execute([$patente, null, $cliente, $estacionamiento, null]);
        
        return $this->db->lastInsertId();
    }

    public function deleteAuto($id){
        $query = $this->db->prepare("DELETE FROM autos WHERE id = ?");
        $query->execute(array($id));
        
        return $query->rowCount();
    }

    public function updateAuto($id, $patente, $cliente, $estacionamiento){
        $query = $this->db->prepare("UPDATE autos SET patente = ?, cliente = ?, estacionamiento = ? WHERE id = ?");
        $query->execute(array($patente, $cliente, $estacionamiento, $id));
        
        return $query->rowCount();
    }

}


?>