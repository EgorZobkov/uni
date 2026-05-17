const CATEGORIES_STRIP_MQ = '(max-width: 991.98px)';
const CATEGORIES_STRIP_MIN_VISIBLE = 3;

export function layoutCategoriesStrip(selector) {
   const track = typeof selector === 'string' ? document.querySelector(selector) : selector;
   if (!track) return;

   const moreBtn = track.querySelector('.mf-home-hero__category-more');
   const items = Array.from(track.querySelectorAll('.mf-home-hero__category-item'));

   const reset = () => {
      items.forEach((el) => el.classList.remove('is-collapsed'));
      if (moreBtn) moreBtn.classList.add('d-none');
      track.classList.remove('is-strip-layout-ready');
   };

   if (!window.matchMedia(CATEGORIES_STRIP_MQ).matches) {
      reset();
      return;
   }

   if (!items.length) {
      reset();
      return;
   }

   if (!moreBtn && items.length <= CATEGORIES_STRIP_MIN_VISIBLE) {
      reset();
      track.classList.add('is-strip-layout-ready');
      return;
   }

   const gap = parseFloat(getComputedStyle(track).columnGap || getComputedStyle(track).gap) || 4;
   const trackWidth = track.clientWidth;
   const sampleWidth = items[0].offsetWidth || 72;

   let moreWidth = sampleWidth;
   if (moreBtn) {
      moreBtn.classList.remove('d-none');
      moreWidth = moreBtn.offsetWidth || sampleWidth;
   }

   let used = moreWidth + gap;
   let visibleCount = 0;

   for (let i = 0; i < items.length; i++) {
      const itemWidth = items[i].offsetWidth || sampleWidth;

      if (used + itemWidth <= trackWidth + 1) {
         used += itemWidth + gap;
         visibleCount++;
      } else {
         break;
      }
   }

   const minVisible = Math.min(CATEGORIES_STRIP_MIN_VISIBLE, items.length);
   if (visibleCount < minVisible) {
      visibleCount = minVisible;
   }

   if (visibleCount >= items.length) {
      reset();
      track.classList.add('is-strip-layout-ready');
      return;
   }

   items.forEach((el, index) => {
      el.classList.toggle('is-collapsed', index >= visibleCount);
   });

   if (moreBtn) {
      moreBtn.classList.remove('d-none');
   }

   track.classList.add('is-strip-layout-ready');
}

let categoriesStripResizeTimer;
export function scheduleCategoriesStripLayout(selector) {
   window.clearTimeout(categoriesStripResizeTimer);
   categoriesStripResizeTimer = window.setTimeout(() => {
      if (typeof selector === 'string') {
         document.querySelectorAll(selector).forEach((track) => layoutCategoriesStrip(track));
      } else {
         layoutCategoriesStrip(selector);
      }
   }, 80);
}

export function initAllCategoriesStrips() {
   document.querySelectorAll('.mf-categories-strip').forEach((track) => layoutCategoriesStrip(track));
}

if (typeof document !== 'undefined') {
   if (document.readyState === 'loading') {
      document.addEventListener('DOMContentLoaded', initAllCategoriesStrips, { once: true });
   } else {
      initAllCategoriesStrips();
   }
}
