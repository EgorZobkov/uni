<h3 class="modal-title mb-3"><strong><?php echo translate("tr_header_add_type_search"); ?></strong></h3>

<p class="text-muted mb-4"><?php echo translate("tr_ad_search_create_placeholder"); ?></p>

<form class="form-ad-search-create">
	<div class="mb-3">
		<label class="form-label"><?php echo translate("tr_602680ed8916dcc039882172ef089256"); ?></label>
		<input type="text" name="title" class="form-control" maxlength="255">
	</div>
	<div class="mb-3">
		<label class="form-label"><?php echo translate("tr_d52903a8cc07f11a84ce2a2d9876bee8"); ?></label>
		<textarea name="text" class="form-control" rows="4"></textarea>
	</div>
	<div class="text-end mt-4">
		<button type="button" class="btn-custom button-color-scheme2 closeModal" data-bs-dismiss="modal"><?php echo translate("tr_591cca300870eb571563ef4b8c8756ff"); ?></button>
		<button type="button" class="btn-custom button-color-scheme1"><?php echo translate("tr_6da0f0ae044012e784cdb53ab72a16f1"); ?></button>
	</div>
</form>
