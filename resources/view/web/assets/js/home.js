import Helpers from './helpers.class.js';
import { initAllCategoriesStrips, scheduleCategoriesStripLayout } from './categories-strip-layout.js';

$(document).ready(function () {

   const helpers = new Helpers();
   const urlParams = new URLSearchParams(window.location.search);
   const searchQuery = (urlParams.get('search') || '').trim();

   var currentPageLoadItems = 1;

   function loadItems(page=1,button,scroll=false){

      var showLoadError = function(){
         var errorHtml = '<div class="catalog-load-error text-center py-5">' +
            '<p class="text-muted mb-3">' + (helpers.translate && helpers.translate.content ? helpers.translate.content("tr_catalog_load_error") : "Не удалось загрузить объявления") + '</p>' +
            '<button type="button" class="btn-custom mf-btn mf-btn-md mf-btn-primary button-color-scheme1 actionRetryLoadItems">' + (helpers.translate && helpers.translate.content ? helpers.translate.content("tr_catalog_load_retry") : "Попробовать снова") + '</button>' +
            '</div>';
         $(".container-load-items").html(errorHtml);
      };

      helpers.request({
         url:"home-load-items",
         data: {page: page, search: searchQuery},
         timeout: 15000,
         button: button,
         error: function(){
            if(button){ helpers.endProcessLoadButton && helpers.endProcessLoadButton($(button)); }
            if(page == 1){ showLoadError(); } else { helpers.showNotice && helpers.showNotice("warning", (helpers.translate && helpers.translate.content ? helpers.translate.content("tr_catalog_load_error") : "Не удалось загрузить объявления")); }
         }
      }, function(data) {

         if(button){ helpers.endProcessLoadButton($(button)); }

         if(!data || data["content"] === undefined){
            if(page == 1){ showLoadError(); }
            return;
         }

         if(page == 1){
            $(".container-load-items").html("");
         }

         $(".container-load-items").append('<div class="load-items-page'+page+' col-lg-12" ></div>'+data["content"]);
         
         $('.load-items-page'+page).next().fadeIn('slow');

         $(button).remove();

         if(scroll){

             $('html, body').animate({
               scrollTop: $('.load-items-page'+page).offset().top-50
             }, 300, 'linear');

         }

      });

   }

   $(document).on('click','.actionShowMoreItems', function () {
       
       currentPageLoadItems = currentPageLoadItems + 1;

       helpers.startProcessLoadButton($(this));
       
       loadItems(currentPageLoadItems, this, true);   
     
   });

   $(document).on('click','.actionRetryLoadItems', function () {
       currentPageLoadItems = 1;
       helpers.startProcessLoadButton($(this));
       loadItems(1, this);
   });

   loadItems();

   initAllCategoriesStrips();
   $(window).on('resize orientationchange', () => scheduleCategoriesStripLayout('.mf-categories-strip'));
   document.querySelectorAll('.mf-categories-strip .mf-home-hero__category-item img').forEach((img) => {
      if (!img.complete) img.addEventListener('load', () => scheduleCategoriesStripLayout('.mf-categories-strip'), { once: true });
   });

});