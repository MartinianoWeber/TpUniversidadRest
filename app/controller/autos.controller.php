<?php
    require_once './app/model/autos.model.php';
    require_once './app/view/api.view.php';

class AutosController {
        private $model;
        private $view;

        public function __construct() {
            $this->model = new AutosModel();
            $this->view = new ApiView();

            $this->data = file_get_contents("php://input");
        }

        private function getData() {
            return json_decode($this->data);
        }


        public function defaultRouter()
        {
            $this->view->response("No encontrado", 404);
        }
    

        public function autos() {

            $sortDefault = "asc";

            if (isset($_GET["sort"])) {
                $sort = $_GET["sort"];
            } else {
                $sort = $sortDefault;
            }

            $res = $this->model->getAll($sort);
            $this->view->response($res);
        }

        public function getAuto($params = null) {
            $id = $params[':ID'];
            $res = $this->model->getAuto($id);
            if($res){
                $this->view->response($res);

            }else{
                $this->view->response("No existe el auto con el id={$id}", 404);
            }
        }
    
        public function addAuto() {
            $body = $this->getData();
            if(!empty($body->patente) && !empty($body->cliente) && !empty($body->estacionamiento)){
                $id = $this->model->addAuto($body->patente, $body->cliente, $body->estacionamiento);
                $this->view->response("El auto con el id={$id} se agrego correctamente", 200);
            }else{
                $this->view->response("Complete todos los campos", 400);
            }
        }

        public function deleteAuto($params = null) {
            $id = $params[':ID'];
            $res = $this->model->deleteAuto($id);
            if($res){
                $this->view->response("El auto con el id={$id} se borro correctamente", 200);
            }else{
                $this->view->response("No existe el auto con el id={$id}", 404);
            }
        }

        public function updateAuto($params = null) {
            $id = $params[':ID'];
            $body = $this->getData();
            if(!empty($body->patente) && !empty($body->cliente) && !empty($body->estacionamiento)){
                $res = $this->model->updateAuto($id, $body->patente, $body->cliente, $body->estacionamiento);
                if($res){
                    $this->view->response("El auto con el id={$id} se actualizo correctamente", 200);
                }else{
                    $this->view->response("No existe el auto con el id={$id}", 404);
                }
            }else{
                $this->view->response("Complete todos los campos", 400);
            }
        }


}

?>