--
-- Обновление uni_system_menu: вкладка "Поиск товаров" в разделе Маркет (после "Объявления")
-- Приводит БД в соответствие с core/tables/uni_system_menu.sql
--

START TRANSACTION;

-- Добавить пункт меню "Поиск товаров" (id 51)
INSERT INTO `uni_system_menu` (`id`, `name`, `parent_id`, `icon`, `route_alias`, `sorting`, `submenu`, `route_id`) VALUES
(51, 'tr_dashboard_ads_search', 7, NULL, 'dashboard-ads-search', 1, 0, 'dashboard-ads-search')
ON DUPLICATE KEY UPDATE
  `name`       = VALUES(`name`),
  `parent_id`  = VALUES(`parent_id`),
  `route_alias`= VALUES(`route_alias`),
  `sorting`    = VALUES(`sorting`),
  `submenu`    = VALUES(`submenu`),
  `route_id`   = VALUES(`route_id`);

-- Сортировка подменю Маркет (parent_id=7): Объявления 0, Поиск товаров 1, Категории 2, Фильтры 3, Жалобы 4, Отзывы 5, Магазины 7
UPDATE `uni_system_menu` SET `sorting` = 0 WHERE `id` = 8;
UPDATE `uni_system_menu` SET `sorting` = 2 WHERE `id` = 9;
UPDATE `uni_system_menu` SET `sorting` = 3 WHERE `id` = 10;
UPDATE `uni_system_menu` SET `sorting` = 4 WHERE `id` = 12;
UPDATE `uni_system_menu` SET `sorting` = 5 WHERE `id` = 13;

COMMIT;
