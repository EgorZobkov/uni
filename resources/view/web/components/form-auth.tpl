<form class="formAuthentication mf-form ds-stack-24" >



  <?php if($app->settings->registration_authorization_view == "combined"){ ?>



    <div class="auth-block-tab-input ds-stack-16" >



        <h4> <strong><?php echo translate("tr_f4df302a883648fa6ef12cde8a608ebc"); ?></strong> </h4>



        <p><?php echo $app->ui->outHintAuth(); ?></p>



        <?php echo $app->ui->outInputLogin(); ?>



        <div class="mf-form-actions ds-stack-12" >

        <button class="btn-custom mf-btn mf-btn-md mf-btn-primary width100 buttonActionAuthCombined" ><?php echo translate("tr_e9c3a648ce9e5dcf3c96940e682a72a2"); ?></button>

        <span class="btn-custom mf-btn mf-btn-md mf-btn-ghost width100 actionOpenStaticModal" data-modal-target="authForgot" ><?php echo translate("tr_4db41095bc0af5864c402d438a8fed34"); ?></span>

        </div>



       <?php if($app->settings->auth_services_list){ ?>

       

       <div class="text-center" >

         <div class="block-social-auth-list" >

            <?php echo $app->component->profile->outAuthServices(); ?>

         </div>

       </div>

       

       <?php } ?>



       <p class="mb0" ><?php echo translate("tr_f6b5ddb88ccdf6ee17a187bb3e775a19"); ?> <a href="<?php echo outLink("rules"); ?>"><?php echo translate("tr_27a22056aa959ee988c1d6bef8ae7a1c"); ?></a> <?php echo translate("tr_4bfb6432d7bb214319efc6d48e31988d"); ?> <a href="<?php echo outLink("privacy-policy"); ?>"><?php echo translate("tr_83ab26432c3b91c4615e5ea607868ddd"); ?></a></p>



    </div>



    <div class="auth-block-tab-check-password ds-stack-16" >



        <div><span class="auth-check-password-back auth-block-tab-back" ><i class="ti ti-arrow-left"></i></span></div>



        <h4> <strong class="auth-block-welcome" ></strong> </h4>



        <input type="password"  class="form-control" placeholder="<?php echo translate("tr_d304162d4168085c50aa8b15ded4c2fa"); ?>" name="auth_password">



        <label class="form-label-error" data-name="auth_password" ></label>



        <div>

          <label class="switch">

          <input type="checkbox" class="switch-input" name="remember_me" value="1" >

          <span class="switch-toggle-slider">

            <span class="switch-on"></span>

            <span class="switch-off"></span>

          </span>

          <span class="switch-label"><?php echo translate("tr_978f6ae28acd9e1d2d15f598f0d3ff8c"); ?></span>

        </label>

        </div>



        <div class="mf-form-actions ds-stack-12" >

        <button class="btn-custom mf-btn mf-btn-md mf-btn-primary buttonActionAuthCombined width100" ><?php echo translate("tr_e9c3a648ce9e5dcf3c96940e682a72a2"); ?></button>

        <span class="btn-custom mf-btn mf-btn-md mf-btn-ghost width100 actionOpenStaticModal" data-modal-target="authForgot" ><?php echo translate("tr_4db41095bc0af5864c402d438a8fed34"); ?></span>

        </div>



    </div>



    <div class="auth-block-tab-verify-code" >

    </div>



    <div class="auth-block-tab-registration-data ds-stack-16" >



        <h4> <strong><?php echo translate("tr_cdf3a5a470f70ce9df04fa3713a3eda4"); ?></strong> </h4>



        <input type="text"  class="form-control" autocomplete="off" placeholder="<?php echo translate("tr_51ebfc2ff6ad41a51b45c6d44ff65b7f"); ?>" name="registration_name">

        <label class="form-label-error" data-name="registration_name" ></label>



        <input type="password"  class="form-control" autocomplete="off" placeholder="<?php echo translate("tr_5ebe553e01799a927b1d045924bbd4fd"); ?>" name="registration_password">

        <label class="form-label-error" data-name="registration_password" ></label>



        <button class="btn-custom mf-btn mf-btn-md mf-btn-primary buttonActionAuthCombined width100" ><?php echo translate("tr_9f4469cd15821d96559ee65c24349e3f"); ?></button>



    </div>



  <?php }elseif($app->settings->registration_authorization_view == "separate"){ ?>



    <div class="auth-block-tab-list-action" >

        <span class="active" data-tab="1" ><?php echo translate("tr_4c3fdc5cabeed8ffb73ba8c3cdc1596f"); ?></span>

        <span data-tab="2" ><?php echo translate("tr_0b93f81293f084dbfa4dbe93a8280555"); ?></span>

    </div>



    <div class="auth-block-tab-1 ds-stack-16" >



      <?php echo $app->ui->outInputLogin(); ?>



      <input type="password" class="form-control" placeholder="<?php echo translate("tr_5ebe553e01799a927b1d045924bbd4fd"); ?>" name="auth_password">

      <label class="form-label-error" data-name="auth_password" ></label>



      <div>

        <label class="switch">

        <input type="checkbox" class="switch-input" name="remember_me" value="1" >

        <span class="switch-toggle-slider">

          <span class="switch-on"></span>

          <span class="switch-off"></span>

        </span>

        <span class="switch-label"><?php echo translate("tr_978f6ae28acd9e1d2d15f598f0d3ff8c"); ?></span>

      </label>

      </div>



      <div class="mf-form-actions ds-stack-12" >

      <button class="btn-custom mf-btn mf-btn-md mf-btn-primary width100 buttonActionAuthSeparate" ><?php echo translate("tr_63a753751e8899416d62b1d1bbb61720"); ?></button>

      <span class="btn-custom mf-btn mf-btn-md mf-btn-ghost width100 actionOpenStaticModal" data-modal-target="authForgot" ><?php echo translate("tr_4db41095bc0af5864c402d438a8fed34"); ?></span>

      </div>



     <?php if($app->settings->auth_services_list){ ?>

     

     <div class="text-center" >

       <div class="block-social-auth-list" >

          <?php echo $app->component->profile->outAuthServices(); ?>

       </div>

     </div>

     

     <?php } ?>



    </div>



    <div class="auth-block-tab-2" >



      <div class="auth-block-tab-2-data ds-stack-16" >

      <?php echo $app->ui->outInputRegistration(); ?>



      <input type="text" class="form-control" placeholder="<?php echo translate("tr_51ebfc2ff6ad41a51b45c6d44ff65b7f"); ?>" name="registration_name">

      <label class="form-label-error" data-name="registration_name" ></label>



      <input type="password" class="form-control" placeholder="<?php echo translate("tr_5ebe553e01799a927b1d045924bbd4fd"); ?>" name="registration_password">

      <label class="form-label-error" data-name="registration_password" ></label>



      <button class="btn-custom mf-btn mf-btn-md mf-btn-primary width100 buttonActionRegistrationSeparate" ><?php echo translate("tr_e9c3a648ce9e5dcf3c96940e682a72a2"); ?></button>

      </div>



      <div class="auth-block-tab-2-check-verify" >



        <div><span class="registration-verify-code-back auth-block-tab-back" ><i class="ti ti-arrow-left"></i></span></div>



      </div>



    </div>



    <p class="mb0" ><?php echo translate("tr_f6b5ddb88ccdf6ee17a187bb3e775a19"); ?> <a href="<?php echo outLink("rules"); ?>"><?php echo translate("tr_27a22056aa959ee988c1d6bef8ae7a1c"); ?></a> <?php echo translate("tr_4bfb6432d7bb214319efc6d48e31988d"); ?> <a href="<?php echo outLink("privacy-policy"); ?>"><?php echo translate("tr_83ab26432c3b91c4615e5ea607868ddd"); ?></a></p>



  <?php }elseif($app->settings->registration_authorization_view == "services"){ ?>



    <div class="auth-block-tab-input ds-stack-16" >



        <h4> <strong><?php echo translate("tr_f4df302a883648fa6ef12cde8a608ebc"); ?></strong> </h4>



        <p><?php echo $app->ui->outHintAuth(); ?></p>



       <?php if($app->settings->auth_services_list){ ?>

       

       <div class="text-center" >

         <div class="block-social-auth-buttons" >

            <?php echo $app->component->profile->outAuthServices(true); ?>

         </div>

       </div>

       

       <?php } ?>



        <span class="btn-custom mf-btn mf-btn-md mf-btn-secondary width100 actionOpenStaticModal" data-modal-target="authForgot" ><?php echo translate("tr_4db41095bc0af5864c402d438a8fed34"); ?></span>



       <p class="mb0" ><?php echo translate("tr_f6b5ddb88ccdf6ee17a187bb3e775a19"); ?> <a href="<?php echo outLink("rules"); ?>"><?php echo translate("tr_27a22056aa959ee988c1d6bef8ae7a1c"); ?></a> <?php echo translate("tr_4bfb6432d7bb214319efc6d48e31988d"); ?> <a href="<?php echo outLink("privacy-policy"); ?>"><?php echo translate("tr_83ab26432c3b91c4615e5ea607868ddd"); ?></a></p>



    </div>



  <?php } ?>



</form>

