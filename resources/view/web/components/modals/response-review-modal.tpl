<h3 class="modal-title mf-modal__title" > <strong><?php echo translate("tr_ccc4a1473d3b6d88130261cf2b113798"); ?></strong> </h3>

<form class="modal-response-review-form mf-form ds-stack-16" >

	<span><i class="ti ti-share-3"></i> <?php echo translate("tr_6e031df7c0f55ea671d26b205c889a6f"); ?></span>
	<div class="modal-response-review-whom-user" ><?php echo $data->name; ?></div>

	<textarea class="form-control-textarea mf-textarea" rows="5" placeholder="<?php echo translate("tr_79228a0ada4008a1cd5d51033c362aa8"); ?>" name="text" ></textarea>

	<input type="hidden" name="id" value="<?php echo $data->id; ?>" >

</form>

<div class="mf-modal__actions mf-modal__actions--end">
	<button class="btn-custom button-color-scheme5 actionSendResponseReview" ><?php echo translate("tr_6da0f0ae044012e784cdb53ab72a16f1"); ?></button>
</div>