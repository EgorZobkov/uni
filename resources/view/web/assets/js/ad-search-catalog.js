import Helpers from './helpers.class.js';

$(document).ready(function () {

  const helpers = new Helpers();
  var currentPageLoadItems = 1;

  function loadItems(page = 1, button, scroll = false) {

    var showLoadError = function () {
      var errorHtml = '<div class="catalog-load-error text-center py-5">' +
        '<p class="text-muted mb-3">' + (helpers.translate && helpers.translate.content ? helpers.translate.content('tr_catalog_load_error') : 'Не удалось загрузить объявления') + '</p>' +
        '<button type="button" class="btn-custom mf-btn mf-btn-md mf-btn-primary button-color-scheme1 actionRetryAdSearchLoadItems">' + (helpers.translate && helpers.translate.content ? helpers.translate.content('tr_catalog_load_retry') : 'Попробовать снова') + '</button>' +
        '</div>';
      $('.ad-search-catalog-page .container-load-items').html(errorHtml);
    };

    helpers.request({
      url: 'ad-search-load-items',
      data: helpers.paramsForm('.ad-search-live-filters, .modal-geo-form') + '&page=' + page,
      timeout: 15000,
      button: button,
      error: function () {
        if (button) { helpers.endProcessLoadButton && helpers.endProcessLoadButton($(button)); }
        if (page === 1) { showLoadError(); } else {
          helpers.showNotice && helpers.showNotice('warning', (helpers.translate && helpers.translate.content ? helpers.translate.content('tr_catalog_load_error') : 'Не удалось загрузить объявления'));
        }
      }
    }, function (data) {

      if (button) { helpers.endProcessLoadButton($(button)); }

      if (!data || data['content'] === undefined) {
        if (page === 1) { showLoadError(); }
        return;
      }

      if (page === 1) {
        $('.ad-search-catalog-page .container-load-items').html('');
      }

      $('.ad-search-catalog-page .container-load-items').append('<div class="load-ad-search-items-page' + page + ' col-lg-12"></div>' + data['content']);

      $('.load-ad-search-items-page' + page).next().fadeIn('slow');

      $(button).remove();

      if (scroll) {
        $('html, body').animate({
          scrollTop: $('.load-ad-search-items-page' + page).offset().top - 50
        }, 300, 'linear');
      }

    });

  }

  loadItems(1);

  $(document).on('click', '.actionShowMoreAdSearchItems', function () {
    currentPageLoadItems = currentPageLoadItems + 1;
    helpers.startProcessLoadButton($(this));
    loadItems(currentPageLoadItems, this, true);
  });

  $(document).on('click', '.actionRetryAdSearchLoadItems', function () {
    currentPageLoadItems = 1;
    helpers.startProcessLoadButton($(this));
    loadItems(1, this);
  });

  $(document).on('click', '.actionAdSearchMyCity', function (e) {
    e.preventDefault();
    var cityId = $(this).data('geo-city-id');
    var alias = $(this).data('geo-alias');
    if (!cityId || !alias) {
      return;
    }
    $('.modal-geo-form input[name=geo_alias]').val(alias);
    helpers.request({ url: 'geo-change', data: { id: cityId, purpose: 'city' } }, function () {
      helpers.request({
        url: 'geo-change-options',
        data: helpers.paramsForm('.ad-search-live-filters, .modal-geo-form') + '&url=' + encodeURIComponent(window.location.pathname)
      }, function (data) {
        if (data && data.link) {
          location.href = data.link;
        }
      });
    });
  });

});
