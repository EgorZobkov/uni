<h3 class="modal-title mf-modal__title" > <strong><?php echo translate("tr_87bc9c656c25424d5160ac6db78467f4"); ?></strong> </h3>

<?php
	$isAdsSearch = !empty($data->is_ads_search);
	echo $app->component->ads->outShareSocialLinks($data->id, $isAdsSearch);
?>

<div class="mf-modal__actions mf-modal__actions--end">
	<button class="btn-custom button-color-scheme2" data-bs-dismiss="modal" ><?php echo translate("tr_dd9463bd5d0c650b468fc5d6cfa1073c"); ?></button>
</div>
