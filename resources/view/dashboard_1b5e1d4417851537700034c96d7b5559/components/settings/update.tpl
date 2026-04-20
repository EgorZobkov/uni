
<?php
$manualUpdates = $app->model->system_manual_updates->sort("id desc")->getAll();
?>

<div class="sticky-wrapper-container" >

<div class="card mb-4">
<div class="card-header">
  <h3 class="card-title m-0"><?php echo translate("tr_3390c7422cc9b03c76358751a5be6cc1"); ?></h3>
</div>
<div class="card-body">

  <p class="text-muted mb-3"><?php echo translate("tr_c1502c78b9e44f9eed787e4a3946a442"); ?></p>

  <div class="manual-update-upload row g-3 align-items-end">
    <div class="col-12 col-md-8">
      <label class="form-label"><?php echo translate("tr_f303455bdf986e1fd72d958a7d36d378"); ?></label>
      <input type="file" class="form-control manual-update-archive-input" name="archive" accept=".zip,application/zip" />
    </div>
    <div class="col-12 col-md-4">
      <button type="button" class="btn btn-primary waves-effect waves-light manual-update-upload-btn w-100" data-route-name="dashboard-settings-manual-update-upload"><?php echo translate("tr_23641d8e2ebacd0eb8382d66d9ab9d3e"); ?></button>
    </div>
  </div>

</div>
</div>

<div class="card mb-4">
<div class="card-header">
  <h3 class="card-title m-0"><?php echo translate("tr_44c14175223df9bae3aff6309c061f4d"); ?></h3>
</div>
<div class="card-body p-0">
  <div class="table-responsive">
    <table class="table table-striped mb-0">
      <thead>
        <tr>
          <th><?php echo translate("tr_f15b55777d025acb538d1a65aff19855"); ?></th>
          <th><?php echo translate("tr_38ca0af80cd7bd241500e81ba2e6efff"); ?></th>
          <th><?php echo translate("tr_368d9975ebd408cfc80c66cc215a23e6"); ?></th>
        </tr>
      </thead>
      <tbody>
        <?php
        if($manualUpdates){
            foreach ($manualUpdates as $row) {
                $filesDecoded = _json_decode($row["files"], true);
                if(!is_array($filesDecoded)){
                    $filesDecoded = [];
                }
                $filesText = $filesDecoded ? implode("\n", $filesDecoded) : '';
                ?>
                <tr>
                  <td><?php echo htmlspecialchars($row["time_upload"] ?? '', ENT_QUOTES, 'UTF-8'); ?></td>
                  <td><?php echo nl2br(htmlspecialchars((string)($row["description"] ?? ''), ENT_QUOTES, 'UTF-8')); ?></td>
                  <td><pre class="mb-0 small text-wrap" style="white-space:pre-wrap;max-height:12rem;overflow:auto;"><?php echo htmlspecialchars($filesText, ENT_QUOTES, 'UTF-8'); ?></pre></td>
                </tr>
                <?php
            }
        }else{
            ?>
            <tr>
              <td colspan="3" class="text-muted"><?php echo translate("tr_60ef1e001c00f0001a8472bda0ee9ec1"); ?></td>
            </tr>
            <?php
        }
        ?>
      </tbody>
    </table>
  </div>
</div>
</div>

</div>
