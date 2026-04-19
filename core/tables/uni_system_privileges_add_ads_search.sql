--
-- Обновление uni_system_privileges: привилегия "Поиск товаров" (dashboard-ads-search)
-- Приводит БД в соответствие с core/tables/uni_system_privileges.sql
--

START TRANSACTION;

INSERT INTO `uni_system_privileges` (`id`, `name`, `group_id`, `permissions`, `route_id`) VALUES
(33, 'tr_dashboard_ads_search', 'ads-search', 'view,control', 'dashboard-ads-search')
ON DUPLICATE KEY UPDATE
  `name`        = VALUES(`name`),
  `group_id`    = VALUES(`group_id`),
  `permissions` = VALUES(`permissions`),
  `route_id`    = VALUES(`route_id`);

COMMIT;
