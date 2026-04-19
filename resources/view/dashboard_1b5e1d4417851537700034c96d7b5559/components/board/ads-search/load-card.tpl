<div class="mb-4">
  <h2 class="role-title font-weight-bold"><?php echo translate("tr_37f992f04c262206e619a98008935515"); ?></h2>
</div>

<div class="mb-3">
  <strong><?php echo translate("tr_602680ed8916dcc039882172ef089256"); ?>:</strong> <?php echo htmlspecialchars($data->title ?? ''); ?>
</div>
<div class="mb-3">
  <strong><?php echo translate("tr_7203f7a4ff564cb876e8db54c903dbfc"); ?>:</strong>
  <span class="badge rounded-pill bg-label-<?php echo $app->component->ads->status($data->status)->label; ?>"><?php echo $app->component->ads->status($data->status)->name; ?></span>
</div>
<?php if (!empty($data->text)) { ?>
<div class="mb-3">
  <strong>Описание:</strong>
  <div class="mt-1"><?php echo nl2br(htmlspecialchars(mb_substr($data->text, 0, 500))); ?><?php echo mb_strlen($data->text) > 500 ? '…' : ''; ?></div>
</div>
<?php } ?>
<div class="mb-3">
  <strong>Автор:</strong> <?php echo htmlspecialchars($data->user->short_name ?? $data->user->name ?? ''); ?>
</div>
<div class="mb-3">
  <strong><?php echo translate("tr_93928aafced6398c7dbc2ee42e498ad9"); ?>:</strong> <?php echo $app->datetime->outDate($data->time_create); ?>
</div>
<div class="mb-3">
  <strong><?php echo translate("tr_1eba25e25df42c7f39caf2fabdda5b5f"); ?>:</strong> <?php echo $data->time_expiration ? $app->datetime->outDate($data->time_expiration) : '—'; ?>
</div>

<div class="mt-4">
  <button type="button" class="btn btn-label-danger waves-effect waves-light deleteAdSearch" data-id="<?php echo $data->id; ?>">
    <i class="ti ti-trash"></i> Удалить
  </button>
</div>
