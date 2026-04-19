public function outAvatarStories($image=null, $user_id=0){
    global $app;
    ?>

      <div>
          <div class="user-avatar-by-stories" >
            <div>
                <div class="user-avatar-by-stories-circle" >
                    <img class="image-autofocus" src="<?php echo $app->storage->name($image)->get(); ?>">
                </div>
            </div>
          </div>
      </div>

    <?php
}
