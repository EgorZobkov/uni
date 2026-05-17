public function modal($id=null, $size="medium", $data=[]){
    global $app;

    $tpl = $this->tpl;
    $this->tpl = null;

    if(isset($tpl)){

        $mfSize = 'mf-modal--md';
        if ($size === 'nano' || $size === 'small') {
            $mfSize = 'mf-modal--sm';
        } elseif ($size === 'medium') {
            $mfSize = 'mf-modal--md';
        } elseif ($size === 'big' || $size === 'mega') {
            $mfSize = 'mf-modal--lg';
        }

        return '
          <div class="modal fade mf-modal '.$mfSize.' mf-modal--fullscreen-mobile" id="'.$id.'Modal" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered modal-fullscreen-md-down mf-modal__dialog" style="'.$this->modalSize($size).'">
            <div class="modal-content mf-modal__content">
              <button type="button" class="btn-close closeModal mf-modal__close" data-bs-dismiss="modal" aria-label="Close"></button>
              <div class="modal-body mf-modal__body">
              '.$app->view->setParamsComponent(["data"=>(object)$data])->includeComponent($tpl).'
              </div>
            </div>
          </div>
          </div>
        ';            

    }

}
