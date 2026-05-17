<h3 class="modal-title mf-modal__title" > <strong><?php echo translate("tr_f7ac6fc5c5a477063add9c6d0701985d"); ?></strong> </h3>

<form class="params-form-modal live-filters mf-form ds-stack-16" >

<?php echo $app->component->ads_filters->outFiltersByModal($data->filters, $data->category_id); ?>

<div class="mf-form-actions text-end">
	<button class="btn-custom mf-btn mf-btn-md mf-btn-primary actionApplyLiveFilters"><?php echo translate("tr_130bbbc068f7a58df5d47f6587ff4b43"); ?></button>
</div>

</form>