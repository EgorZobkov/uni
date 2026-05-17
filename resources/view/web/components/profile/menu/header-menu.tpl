<?php
$profileLinkLabel = htmlspecialchars(translate('tr_bc3500041be69b4e1e837c95995dd325'), ENT_QUOTES, 'UTF-8');
?>

<div class="header-user-dropdown-menu">
    <div class="mf-header-user-trigger-row">
        <a class="mf-header-user-profile-link" href="<?php echo outRoute('profile'); ?>" title="<?php echo $profileLinkLabel; ?>">
            <span class="mini-avatar">
                <span class="mini-avatar-img"><?php echo $app->user->avatar($app->user->data); ?></span>
            </span>
            <span class="mf-header-user-profile-name"><?php echo $profileLinkLabel; ?></span>
        </a>
        <button type="button" class="mf-header-user-menu-toggle" aria-label="<?php echo htmlspecialchars(translate('tr_ceac57c52ec2d76a3ccdc3df4dfdab6f'), ENT_QUOTES, 'UTF-8'); ?>" aria-expanded="false">
            <i class="ti ti-chevron-down" aria-hidden="true"></i>
        </button>
    </div>

    <div class="header-user-dropdown-menu-box" >
        <div class="header-user-dropdown-menu-box-link">

            <div class="container-user-rating-stars menu-user-rating-stars" >
                <?php echo $app->component->profile->outStarsRating($app->user->data->total_rating); ?>
                <span class="user-rating-stars-count-reviews" ><?php echo $app->component->profile->outTotalReviews($app->user->data->total_reviews); ?></span>
            </div>

            <div class="mt5" >
                <?php echo $app->component->profile->getMenu(); ?>
            </div>

            <hr class="mt10 mb10" >

            <a href="<?php echo outRoute("profile-settings"); ?>"><i class="ti ti-settings"></i> <?php echo translate("tr_c919d65bd95698af8f15fa8133bf490d"); ?></a>
            <a href="<?php echo outRoute("profile-logout"); ?>"><i class="ti ti-logout"></i> <?php echo translate("tr_8ef2d61ae629c63b155ae66c3d2fc9fa"); ?></a>

        </div>
    </div>
</div>
