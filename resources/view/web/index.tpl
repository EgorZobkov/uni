<!doctype html>

<html lang="{{ $template->translate->current->iso }}" >
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

    <title>{{ $seo->meta_title }}</title>

    <meta name="description" content="{{ $seo->meta_desc }}">
    {{ $template->ui->metaCsrf() }}

    <link type="image/png" rel="shortcut icon" href="{{ $template->storage->name($template->settings->favicon)->get() }}">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <!-- Manrope: только веса из десктопной типографики (400 / 600 / 700); display=swap не блокирует рендер -->
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;600;700&display=swap" rel="stylesheet">

    <meta property="og:site_name" content="{{ $template->settings->project_name }}">
    <meta property="og:type" content="website">

    {% yield head %}

    {{ $template->asset->getCss('web') }}

  </head>

  <body>

    <section class="flex-wrapper" >

      {% extends header.tpl %}

      {% yield content %}

    </section>

    {% extends footer.tpl %}

    {{ $template->asset->getJs('web') }}
    {% if($template->router->currentRoute->name == "home"): %}
    <script>
      (function () {
        var loaded = false;
        function loadNext(scripts, idx) {
          if (idx >= scripts.length) return;
          var holder = scripts[idx];
          var src = holder.getAttribute('data-src');
          if (!src) {
            loadNext(scripts, idx + 1);
            return;
          }
          var s = document.createElement('script');
          s.src = src;
          var t = holder.getAttribute('data-type');
          if (t) s.type = t;
          s.onload = function () { loadNext(scripts, idx + 1); };
          s.onerror = function () { loadNext(scripts, idx + 1); };
          document.body.appendChild(s);
          holder.parentNode && holder.parentNode.removeChild(holder);
        }

        function loadHomeLazyScripts() {
          if (loaded) return;
          loaded = true;
          var scripts = Array.prototype.slice.call(document.querySelectorAll('script[data-home-lazy-script="1"][data-src]'));
          if (!scripts.length) return;
          loadNext(scripts, 0);
        }

        if ('requestIdleCallback' in window) {
          requestIdleCallback(loadHomeLazyScripts, { timeout: 2500 });
        } else {
          setTimeout(loadHomeLazyScripts, 1200);
        }
        window.addEventListener('load', loadHomeLazyScripts, { once: true });
        window.addEventListener('scroll', loadHomeLazyScripts, { once: true, passive: true });
        window.addEventListener('pointerdown', loadHomeLazyScripts, { once: true });
      })();
    </script>
    {% endif %}

    <noindex>

    {{ $template->ui->tpl('modals/geo-modal.tpl')->modal("geo", "big") }}
    {{ $template->ui->tpl('profile/chat/modal.tpl')->modal("chat", "big") }}
    {{ $template->ui->tpl('modals/payment-modal.tpl')->modal("payment", "medium") }}

    {{ htmlspecialchars_decode($template->settings->frontend_scripts) }}

    </noindex>

  </body>
</html>