<h3 class="modal-title mb-3" > <strong><?php echo translate("tr_b55f93057a8db9aa5c7d9c253aa4b015"); ?></strong> </h3>

<p><?php echo translate("tr_30b0be6d2f7de4c5cd080efabb264e18"); ?></p>

<?php if (empty($data->is_ads_search)) { ?>
<button class="btn-custom button-color-scheme1 actionAdSold width100 mt10" data-id="<?php echo $data->id; ?>" ><?php echo translate("tr_cf4d3d8aa9a7e4ea5a60612dc7a12bf7"); ?> <?php echo $app->settings->project_name; ?></button>
<?php } ?>

<?php if (!empty($data->is_ads_search)) { ?>
<button class="btn-custom button-color-scheme2 actionAdSearchRemovePublication width100 mt10" data-id="<?php echo $data->id; ?>" data-is-ads-search="1" data-reason="found" ><?php echo translate("tr_ad_search_remove_reason_found"); ?></button>
<button class="btn-custom button-color-scheme2 actionAdSearchRemovePublication width100 mt10" data-id="<?php echo $data->id; ?>" data-is-ads-search="1" data-reason="other" ><?php echo translate("tr_15291f4233174b813811b7489b48c712"); ?></button>
<?php } else { ?>
<button class="btn-custom button-color-scheme2 actionAdRemovePublication width100 mt10" data-id="<?php echo $data->id; ?>" ><?php echo translate("tr_15291f4233174b813811b7489b48c712"); ?></button>
<?php } ?>
