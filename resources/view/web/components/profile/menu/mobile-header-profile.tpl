<?php
$profileAria = htmlspecialchars(translate('tr_bc3500041be69b4e1e837c95995dd325'), ENT_QUOTES, 'UTF-8');
?>
<a class="mf-mobile-header__profile-link" href="<?php echo outRoute('profile'); ?>" title="<?php echo $profileAria; ?>" aria-label="<?php echo $profileAria; ?>">
    <span class="mini-avatar mf-mobile-header__profile-avatar">
        <span class="mini-avatar-img"><?php echo $app->user->avatar($app->user->data); ?></span>
    </span>
</a>
