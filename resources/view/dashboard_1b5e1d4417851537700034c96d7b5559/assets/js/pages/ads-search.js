import Helpers from '../helpers.class.js';

$(document).ready(function () {

   const helpers = new Helpers();

   helpers.loadBody(null, function () {});

   $(document).on('click', '.deleteAdSearch', function (e) {

      helpers.deleteByAlert("dashboard-ad-search-delete", { id: $(this).data("id") });

      e.preventDefault();

   });

   $(document).on('click', '.loadAdSearchCard', function (e) {

      helpers.openModal("loadContentModal");

      helpers.request({ url: "dashboard-ad-search-load-card", data: { id: $(this).data("ad-id") } }, function (data) {

         $("#loadContentModal .load-content-container").html(data["content"]);

      });

      e.preventDefault();

   });

   $(document).on('click','.actionChangeMultiStatus', function (e) {  

      helpers.showUiLoadingScreen();

      helpers.request({url:"dashboard-ad-search-multi-change-status", data: $(".formItemsList").serialize()+"&status="+$(this).data("status")}, function() {
         location.reload();
      });

      e.preventDefault();

   });

   $(document).on('click','.actionAdsMultiToExtend', function (e) {  

      helpers.showUiLoadingScreen();

      helpers.request({url:"dashboard-ad-search-multi-extend", data: $(".formItemsList").serialize()}, function() {
         location.reload();
      });

      e.preventDefault();

   });

   $(document).on('click','.actionAdsMultiDelete', function (e) {  

      helpers.showUiLoadingScreen();

      helpers.request({url:"dashboard-ad-search-multi-delete", data: $(".formItemsList").serialize()}, function() {
         location.reload();
      });

      e.preventDefault();

   });

});
