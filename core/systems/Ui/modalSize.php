public function modalSize($id=null){
    if($id == "nano"){
        return "--mf-modal-max-width: 450px;";
    }elseif($id == "small"){
        return "--mf-modal-max-width: 550px;";
    }elseif($id == "medium"){
        return "--mf-modal-max-width: 650px;";
    }elseif($id == "big"){
        return "--mf-modal-max-width: 750px;";
    }elseif($id == "mega"){
        return "--mf-modal-max-width: 950px;";
    }else{
        return "--mf-modal-max-width: ".$id.";";
    }
}
