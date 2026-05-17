<h3 class="modal-title mf-modal__title" > <strong><?php echo translate("tr_395169ffbfda45e29596b9d2236d9b91"); ?></strong> </h3>

<form class="modal-ad-complain-form mf-form ds-stack-16" >

	<p><?php echo translate("tr_c5f9d5595eb159c22ec1fed1bf239aa5"); ?></p>

	<textarea name="text" class="form-control-textarea mf-textarea" rows="5" ></textarea>

	<input type="hidden" name="id" value="<?php echo $data->id; ?>" >	

</form>

<div class="mf-modal__actions mf-modal__actions--end">
	<button class="btn-custom mf-btn mf-btn-md mf-btn-primary actionSendAdComplaint"><?php echo translate("tr_6da0f0ae044012e784cdb53ab72a16f1"); ?></button>
</div>
