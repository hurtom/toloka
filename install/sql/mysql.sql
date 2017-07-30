-- phpMyAdmin SQL Dump
-- version 4.7.2
-- https://www.phpmyadmin.net/
--
-- Хост: mysql
-- Час створення: Лип 17 2017 р., 16:56
-- Версія сервера: 10.2.7-MariaDB-10.2.7+maria~jessie
-- Версія PHP: 7.0.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База даних: `toloka`
--
CREATE DATABASE IF NOT EXISTS `toloka` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `toloka`;

-- --------------------------------------------------------

--
-- Структура таблиці `bb_attach_quota`
--

CREATE TABLE `bb_attach_quota` (
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `group_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `quota_type` smallint(2) NOT NULL DEFAULT 0,
  `quota_limit_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `bb_attachments`
--

CREATE TABLE `bb_attachments` (
  `attach_id` mediumint(8) UNSIGNED NOT NULL,
  `post_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `user_id_1` mediumint(8) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `bb_attachments_config`
--

CREATE TABLE `bb_attachments_config` (
  `config_name` varchar(255) NOT NULL DEFAULT '',
  `config_value` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `bb_attachments_config`
--

INSERT INTO `bb_attachments_config` (`config_name`, `config_value`) VALUES
('allow_pm_attach', '1'),
('attachment_quota', '52428800'),
('attach_version', '2.3.14'),
('default_pm_quota', '0'),
('default_upload_quota', '0'),
('disable_mod', '0'),
('display_order', '0'),
('flash_autoplay', '0'),
('img_create_thumbnail', '0'),
('img_display_inlined', '1'),
('img_imagick', '/usr/bin/convert'),
('img_link_height', '0'),
('img_link_width', '0'),
('img_max_height', '200'),
('img_max_width', '200'),
('img_min_thumb_filesize', '12000'),
('max_attachments', '1'),
('max_attachments_pm', '1'),
('max_filesize', '262144'),
('max_filesize_pm', '262144'),
('topic_icon', 'styles/images/icon_clip.gif'),
('upload_dir', 'data/torrent_files'),
('upload_img', 'styles/images/icon_clip.gif'),
('use_gd2', '1'),
('wma_autoplay', '0');

-- --------------------------------------------------------

--
-- Структура таблиці `bb_attachments_desc`
--

CREATE TABLE `bb_attachments_desc` (
  `attach_id` mediumint(8) UNSIGNED NOT NULL,
  `physical_filename` varchar(255) NOT NULL DEFAULT '',
  `real_filename` varchar(255) NOT NULL DEFAULT '',
  `download_count` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `comment` varchar(255) NOT NULL DEFAULT '',
  `extension` varchar(100) NOT NULL DEFAULT '',
  `mimetype` varchar(100) NOT NULL DEFAULT '',
  `filesize` int(20) NOT NULL DEFAULT 0,
  `filetime` int(11) NOT NULL DEFAULT 0,
  `thumbnail` tinyint(1) NOT NULL DEFAULT 0,
  `tracker_status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `bb_auth_access`
--

CREATE TABLE `bb_auth_access` (
  `group_id` mediumint(8) NOT NULL DEFAULT 0,
  `forum_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `forum_perm` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `bb_auth_access_snap`
--

CREATE TABLE `bb_auth_access_snap` (
  `user_id` mediumint(9) NOT NULL DEFAULT 0,
  `forum_id` smallint(6) NOT NULL DEFAULT 0,
  `forum_perm` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `bb_banlist`
--

CREATE TABLE `bb_banlist` (
  `ban_id` mediumint(8) UNSIGNED NOT NULL,
  `ban_userid` mediumint(8) NOT NULL DEFAULT 0,
  `ban_ip` varchar(42) NOT NULL DEFAULT '0',
  `ban_email` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `bb_bt_dlstatus`
--

CREATE TABLE `bb_bt_dlstatus` (
  `user_id` mediumint(9) NOT NULL DEFAULT 0,
  `topic_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `user_status` tinyint(1) NOT NULL DEFAULT 0,
  `last_modified_dlstatus` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `bb_bt_dlstatus_snap`
--

CREATE TABLE `bb_bt_dlstatus_snap` (
  `topic_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `dl_status` tinyint(4) NOT NULL DEFAULT 0,
  `users_count` smallint(5) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `bb_bt_last_torstat`
--

CREATE TABLE `bb_bt_last_torstat` (
  `topic_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` mediumint(9) NOT NULL DEFAULT 0,
  `dl_status` tinyint(1) NOT NULL DEFAULT 0,
  `up_add` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `down_add` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `release_add` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `bonus_add` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `speed_up` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `speed_down` bigint(20) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `bb_bt_last_userstat`
--

CREATE TABLE `bb_bt_last_userstat` (
  `user_id` mediumint(9) NOT NULL DEFAULT 0,
  `up_add` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `down_add` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `release_add` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `bonus_add` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `speed_up` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `speed_down` bigint(20) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `bb_bt_tor_dl_stat`
--

CREATE TABLE `bb_bt_tor_dl_stat` (
  `topic_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` mediumint(9) NOT NULL DEFAULT 0,
  `attach_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `t_up_total` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `t_down_total` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `t_bonus_total` bigint(20) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `bb_bt_torhelp`
--

CREATE TABLE `bb_bt_torhelp` (
  `user_id` mediumint(9) NOT NULL DEFAULT 0,
  `topic_id_csv` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `bb_bt_torrents`
--

CREATE TABLE `bb_bt_torrents` (
  `info_hash` varbinary(20) NOT NULL DEFAULT '',
  `post_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `poster_id` mediumint(9) NOT NULL DEFAULT 0,
  `topic_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `forum_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `attach_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `size` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `reg_time` int(11) NOT NULL DEFAULT 0,
  `call_seed_time` int(11) NOT NULL DEFAULT 0,
  `complete_count` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `seeder_last_seen` int(11) NOT NULL DEFAULT 0,
  `tor_status` tinyint(4) NOT NULL DEFAULT 0,
  `checked_user_id` mediumint(8) NOT NULL DEFAULT 0,
  `checked_time` int(11) NOT NULL DEFAULT 0,
  `tor_type` tinyint(1) NOT NULL DEFAULT 0,
  `speed_up` int(11) NOT NULL DEFAULT 0,
  `speed_down` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `bb_bt_torstat`
--

CREATE TABLE `bb_bt_torstat` (
  `topic_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` mediumint(9) NOT NULL DEFAULT 0,
  `last_modified_torstat` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `completed` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `bb_bt_tracker`
--

CREATE TABLE `bb_bt_tracker` (
  `peer_hash` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `topic_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `peer_id` varchar(20) NOT NULL DEFAULT '0',
  `user_id` mediumint(9) NOT NULL DEFAULT 0,
  `ip` varchar(42) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0',
  `ipv6` varchar(32) DEFAULT NULL,
  `port` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `client` varchar(51) NOT NULL DEFAULT 'Unknown',
  `seeder` tinyint(1) NOT NULL DEFAULT 0,
  `releaser` tinyint(1) NOT NULL DEFAULT 0,
  `tor_type` tinyint(1) NOT NULL DEFAULT 0,
  `uploaded` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `downloaded` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `remain` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `speed_up` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `speed_down` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `up_add` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `down_add` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `update_time` int(11) NOT NULL DEFAULT 0,
  `complete_percent` bigint(20) NOT NULL DEFAULT 0,
  `complete` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `bb_bt_tracker_snap`
--

CREATE TABLE `bb_bt_tracker_snap` (
  `topic_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `seeders` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `leechers` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `speed_up` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `speed_down` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `bb_bt_user_settings`
--

CREATE TABLE `bb_bt_user_settings` (
  `user_id` mediumint(9) NOT NULL DEFAULT 0,
  `tor_search_set` text NOT NULL,
  `last_modified` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `bb_bt_users`
--

CREATE TABLE `bb_bt_users` (
  `user_id` mediumint(9) NOT NULL DEFAULT 0,
  `auth_key` char(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `u_up_total` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `u_down_total` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `u_up_release` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `u_up_bonus` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `up_today` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `down_today` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `up_release_today` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `up_bonus_today` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `points_today` float(16,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `up_yesterday` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `down_yesterday` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `up_release_yesterday` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `up_bonus_yesterday` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `points_yesterday` float(16,2) UNSIGNED NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `bb_categories`
--

CREATE TABLE `bb_categories` (
  `cat_id` smallint(5) UNSIGNED NOT NULL,
  `cat_title` varchar(100) NOT NULL DEFAULT '',
  `cat_order` smallint(5) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `bb_categories`
--

INSERT INTO `bb_categories` (`cat_id`, `cat_title`, `cat_order`) VALUES
(1, 'Форум', 20),
(2, 'Нове', 10),
(3, 'Пошук та замовлення', 30),
(4, 'Інструкції', 40),
(5, 'Проект Відео Гуртом', 50),
(6, 'Фільми українською', 60),
(7, 'Українська музика', 70),
(8, 'Література українською', 80),
(9, 'Програми українською', 90),
(10, 'Ігри українською', 100),
(11, 'Архів та смітник', 110);

-- --------------------------------------------------------

--
-- Структура таблиці `bb_config`
--

CREATE TABLE `bb_config` (
  `config_name` varchar(255) NOT NULL DEFAULT '',
  `config_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `bb_config`
--

INSERT INTO `bb_config` (`config_name`, `config_value`) VALUES
('allow_autologin', '1'),
('allow_bbcode', '1'),
('allow_namechange', '0'),
('allow_sig', '1'),
('allow_smilies', '1'),
('birthday_check_day', '7'),
('birthday_enabled', '1'),
('birthday_max_age', '99'),
('birthday_min_age', '10'),
('board_disable', '0'),
('board_startdate', '0'),
('board_timezone', '0'),
('bonus_upload', ''),
('bonus_upload_price', ''),
('bt_add_auth_key', '1'),
('bt_allow_spmode_change', '1'),
('bt_announce_url', 'http://demo.torrentpier.me/bt/announce.php'),
('bt_check_announce_url', '0'),
('bt_del_addit_ann_urls', '1'),
('bt_disable_dht', '0'),
('bt_dl_list_only_1st_page', '1'),
('bt_dl_list_only_count', '1'),
('bt_newtopic_auto_reg', '1'),
('bt_replace_ann_url', '1'),
('bt_search_bool_mode', '1'),
('bt_set_dltype_on_tor_reg', '1'),
('bt_show_dl_but_cancel', '1'),
('bt_show_dl_but_compl', '1'),
('bt_show_dl_but_down', '0'),
('bt_show_dl_but_will', '1'),
('bt_show_dl_list', '0'),
('bt_show_dl_list_buttons', '1'),
('bt_show_dl_stat_on_index', '1'),
('bt_show_ip_only_moder', '1'),
('bt_show_peers', '1'),
('bt_show_peers_mode', '1'),
('bt_show_port_only_moder', '1'),
('bt_tor_browse_only_reg', '0'),
('bt_unset_dltype_on_tor_unreg', '1'),
('callseed', '0'),
('cron_check_interval', '180'),
('cron_enabled', '0'),
('cron_last_check', '1500310450'),
('default_dateformat', 'Y-m-d H:i'),
('default_lang', 'uk'),
('flood_interval', '15'),
('gender', '1'),
('hot_threshold', '300'),
('latest_news_count', '5'),
('latest_news_forum_id', '1'),
('login_reset_time', '30'),
('magnet_links_enabled', '1'),
('max_autologin_time', '10'),
('max_login_attempts', '5'),
('max_net_title', '50'),
('max_news_title', '50'),
('max_poll_options', '6'),
('max_sig_chars', '255'),
('network_news_count', '5'),
('network_news_forum_id', '2'),
('posts_per_page', '15'),
('premod', '0'),
('prune_enable', '1'),
('record_online_date', '0'),
('record_online_users', '2'),
('seed_bonus_enabled', '1'),
('seed_bonus_points', ''),
('seed_bonus_release', ''),
('seed_bonus_tor_size', '0'),
('seed_bonus_user_regdate', '0'),
('show_latest_news', '1'),
('show_mod_index', '0'),
('show_network_news', '1'),
('sitemap_time', '1500271320'),
('sitename', 'TorrentPier - Bittorrent-tracker engine'),
('site_desc', 'A little text to describe your forum'),
('smilies_path', 'styles/images/smiles'),
('static_sitemap', ''),
('terms', ''),
('topics_per_page', '50'),
('tor_comment', '1'),
('tor_stats', '1'),
('whois_info', 'http://whatismyipaddress.com/ip/'),
('xs_use_cache', '1');

-- --------------------------------------------------------

--
-- Структура таблиці `bb_cron`
--

CREATE TABLE `bb_cron` (
  `cron_id` smallint(5) UNSIGNED NOT NULL,
  `cron_active` tinyint(4) NOT NULL DEFAULT 1,
  `cron_title` char(120) NOT NULL DEFAULT '',
  `cron_script` char(120) NOT NULL DEFAULT '',
  `schedule` enum('hourly','daily','weekly','monthly','interval') NOT NULL DEFAULT 'daily',
  `run_day` enum('1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28') DEFAULT NULL,
  `run_time` time DEFAULT '04:00:00',
  `run_order` tinyint(4) UNSIGNED NOT NULL DEFAULT 0,
  `last_run` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `next_run` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `run_interval` time DEFAULT '00:00:00',
  `log_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `log_file` char(120) NOT NULL DEFAULT '',
  `log_sql_queries` tinyint(4) NOT NULL DEFAULT 0,
  `disable_board` tinyint(1) NOT NULL DEFAULT 0,
  `run_counter` bigint(20) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `bb_cron`
--

INSERT INTO `bb_cron` (`cron_id`, `cron_active`, `cron_title`, `cron_script`, `schedule`, `run_day`, `run_time`, `run_order`, `last_run`, `next_run`, `run_interval`, `log_enabled`, `log_file`, `log_sql_queries`, `disable_board`, `run_counter`) VALUES
(1, 1, 'Attach maintenance', 'attach_maintenance.php', 'daily', '', '05:00:00', 40, '2017-07-17 05:02:00', '2017-07-18 05:00:00', '00:00:00', 1, '', 0, 1, 29),
(2, 1, 'Board maintenance', 'board_maintenance.php', 'daily', '', '05:00:00', 40, '2017-07-17 05:02:10', '2017-07-18 05:00:00', '00:00:00', 1, '', 0, 1, 29),
(3, 1, 'Prune forums', 'prune_forums.php', 'daily', '', '05:00:00', 50, '2017-07-17 05:02:10', '2017-07-18 05:00:00', '00:00:00', 1, '', 0, 1, 29),
(4, 1, 'Prune topic moved stubs', 'prune_topic_moved.php', 'daily', '', '05:00:00', 60, '2017-07-17 05:02:10', '2017-07-18 05:00:00', '00:00:00', 1, '', 0, 1, 29),
(5, 1, 'Logs cleanup', 'clean_log.php', 'daily', '', '05:00:00', 70, '2017-07-17 05:02:10', '2017-07-18 05:00:00', '00:00:00', 1, '', 0, 1, 29),
(6, 1, 'Tracker maintenance', 'tr_maintenance.php', 'daily', '', '05:00:00', 90, '2017-07-17 05:02:10', '2017-07-18 05:00:00', '00:00:00', 1, '', 0, 1, 29),
(7, 1, 'Clean dlstat', 'clean_dlstat.php', 'daily', '', '05:00:00', 100, '2017-07-17 05:02:10', '2017-07-18 05:00:00', '00:00:00', 1, '', 0, 1, 29),
(8, 1, 'Prune inactive users', 'prune_inactive_users.php', 'daily', '', '05:00:00', 110, '2017-07-17 05:02:10', '2017-07-18 05:00:00', '00:00:00', 1, '', 0, 1, 29),
(9, 1, 'Sessions cleanup', 'sessions_cleanup.php', 'interval', '', '00:00:00', 255, '2017-07-17 16:54:02', '2017-07-17 16:57:02', '00:03:00', 0, '', 0, 0, 5762),
(10, 1, 'DS update cat_forums', 'ds_update_cat_forums.php', 'interval', '', '00:00:00', 255, '2017-07-17 16:54:02', '2017-07-17 16:59:02', '00:05:00', 0, '', 0, 0, 2901),
(11, 1, 'DS update stats', 'ds_update_stats.php', 'interval', '', '00:00:00', 255, '2017-07-17 16:50:02', '2017-07-17 17:00:02', '00:10:00', 0, '', 0, 0, 1938),
(12, 1, 'Flash topic view', 'flash_topic_view.php', 'interval', '', '00:00:00', 255, '2017-07-17 16:50:02', '2017-07-17 17:00:02', '00:10:00', 0, '', 0, 0, 1938),
(13, 1, 'Clean search results', 'clean_search_results.php', 'interval', '', '00:00:00', 255, '2017-07-17 16:50:02', '2017-07-17 17:00:02', '00:10:00', 0, '', 0, 0, 1938),
(14, 1, 'Tracker cleanup and dlstat', 'tr_cleanup_and_dlstat.php', 'interval', '', '00:00:00', 20, '2017-07-17 16:54:02', '2017-07-17 17:09:02', '00:15:00', 0, '', 0, 0, 1457),
(15, 1, 'Accrual seedbonus', 'tr_seed_bonus.php', 'interval', '', '00:00:00', 25, '2017-07-17 16:54:02', '2017-07-17 17:09:02', '00:15:00', 0, '', 0, 0, 1457),
(16, 1, 'Make tracker snapshot', 'tr_make_snapshot.php', 'interval', '', '00:00:00', 10, '2017-07-17 16:50:02', '2017-07-17 17:00:02', '00:10:00', 0, '', 0, 0, 1938),
(17, 1, 'Seeder last seen', 'tr_update_seeder_last_seen.php', 'interval', '', '00:00:00', 255, '2017-07-17 16:38:10', '2017-07-17 17:38:10', '01:00:00', 0, '', 0, 0, 385),
(18, 1, 'Tracker dl-complete count', 'tr_complete_count.php', 'interval', '', '00:00:00', 255, '2017-07-17 11:50:01', '2017-07-17 17:50:01', '06:00:00', 0, '', 0, 0, 77),
(19, 1, 'Cache garbage collector', 'cache_gc.php', 'interval', '', '00:00:00', 255, '2017-07-17 16:54:02', '2017-07-17 16:59:02', '00:05:00', 0, '', 0, 0, 2901),
(20, 1, 'Sitemap update', 'sitemap.php', 'daily', '', '06:00:00', 30, '2017-07-17 06:02:20', '2017-07-18 06:00:00', '00:00:00', 0, '', 0, 0, 29),
(21, 1, 'Update forums atom', 'update_forums_atom.php', 'interval', '', '00:00:00', 255, '2017-07-17 16:54:02', '2017-07-17 17:09:02', '00:15:00', 0, '', 0, 0, 1457);

-- --------------------------------------------------------

--
-- Структура таблиці `bb_disallow`
--

CREATE TABLE `bb_disallow` (
  `disallow_id` mediumint(8) UNSIGNED NOT NULL,
  `disallow_username` varchar(25) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `bb_extension_groups`
--

CREATE TABLE `bb_extension_groups` (
  `group_id` mediumint(8) NOT NULL,
  `group_name` varchar(20) NOT NULL DEFAULT '',
  `cat_id` tinyint(2) NOT NULL DEFAULT 0,
  `allow_group` tinyint(1) NOT NULL DEFAULT 0,
  `download_mode` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `upload_icon` varchar(100) NOT NULL DEFAULT '',
  `max_filesize` int(20) NOT NULL DEFAULT 0,
  `forum_permissions` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `bb_extension_groups`
--

INSERT INTO `bb_extension_groups` (`group_id`, `group_name`, `cat_id`, `allow_group`, `download_mode`, `upload_icon`, `max_filesize`, `forum_permissions`) VALUES
(1, 'Images', 1, 1, 1, '', 262144, ''),
(2, 'Archives', 0, 1, 1, '', 262144, ''),
(3, 'Plain text', 0, 0, 1, '', 262144, ''),
(4, 'Documents', 0, 0, 1, '', 262144, ''),
(5, 'Real media', 0, 0, 2, '', 262144, ''),
(6, 'Torrent', 0, 1, 1, '', 122880, '');

-- --------------------------------------------------------

--
-- Структура таблиці `bb_extensions`
--

CREATE TABLE `bb_extensions` (
  `ext_id` mediumint(8) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `extension` varchar(100) NOT NULL DEFAULT '',
  `comment` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `bb_extensions`
--

INSERT INTO `bb_extensions` (`ext_id`, `group_id`, `extension`, `comment`) VALUES
(1, 1, 'gif', ''),
(2, 1, 'png', ''),
(3, 1, 'jpeg', ''),
(4, 1, 'jpg', ''),
(5, 1, 'tif', ''),
(6, 1, 'tga', ''),
(7, 2, 'gtar', ''),
(8, 2, 'gz', ''),
(9, 2, 'tar', ''),
(10, 2, 'zip', ''),
(11, 2, 'rar', ''),
(12, 2, 'ace', ''),
(13, 3, 'txt', ''),
(14, 3, 'c', ''),
(15, 3, 'h', ''),
(16, 3, 'cpp', ''),
(17, 3, 'hpp', ''),
(18, 3, 'diz', ''),
(19, 4, 'xls', ''),
(20, 4, 'doc', ''),
(21, 4, 'dot', ''),
(22, 4, 'pdf', ''),
(23, 4, 'ai', ''),
(24, 4, 'ps', ''),
(25, 4, 'ppt', ''),
(26, 5, 'rm', ''),
(27, 6, 'torrent', '');

-- --------------------------------------------------------

--
-- Структура таблиці `bb_forums`
--

CREATE TABLE `bb_forums` (
  `forum_id` smallint(5) UNSIGNED NOT NULL,
  `cat_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `forum_name` varchar(150) NOT NULL DEFAULT '',
  `forum_desc` text NOT NULL,
  `forum_status` tinyint(4) NOT NULL DEFAULT 0,
  `forum_order` smallint(5) UNSIGNED NOT NULL DEFAULT 1,
  `forum_posts` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `forum_topics` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `forum_last_post_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `forum_tpl_id` smallint(6) NOT NULL DEFAULT 0,
  `prune_days` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `auth_view` tinyint(2) NOT NULL DEFAULT 0,
  `auth_read` tinyint(2) NOT NULL DEFAULT 0,
  `auth_post` tinyint(2) NOT NULL DEFAULT 0,
  `auth_reply` tinyint(2) NOT NULL DEFAULT 0,
  `auth_edit` tinyint(2) NOT NULL DEFAULT 0,
  `auth_delete` tinyint(2) NOT NULL DEFAULT 0,
  `auth_sticky` tinyint(2) NOT NULL DEFAULT 0,
  `auth_announce` tinyint(2) NOT NULL DEFAULT 0,
  `auth_vote` tinyint(2) NOT NULL DEFAULT 0,
  `auth_pollcreate` tinyint(2) NOT NULL DEFAULT 0,
  `auth_attachments` tinyint(2) NOT NULL DEFAULT 0,
  `auth_download` tinyint(2) NOT NULL DEFAULT 0,
  `allow_reg_tracker` tinyint(1) NOT NULL DEFAULT 0,
  `allow_porno_topic` tinyint(1) NOT NULL DEFAULT 0,
  `self_moderated` tinyint(1) NOT NULL DEFAULT 0,
  `forum_parent` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `show_on_index` tinyint(1) NOT NULL DEFAULT 1,
  `forum_display_sort` tinyint(1) NOT NULL DEFAULT 0,
  `forum_display_order` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `bb_forums`
--

INSERT INTO `bb_forums` (`forum_id`, `cat_id`, `forum_name`, `forum_desc`, `forum_status`, `forum_order`, `forum_posts`, `forum_topics`, `forum_last_post_id`, `forum_tpl_id`, `prune_days`, `auth_view`, `auth_read`, `auth_post`, `auth_reply`, `auth_edit`, `auth_delete`, `auth_sticky`, `auth_announce`, `auth_vote`, `auth_pollcreate`, `auth_attachments`, `auth_download`, `allow_reg_tracker`, `allow_porno_topic`, `self_moderated`, `forum_parent`, `show_on_index`, `forum_display_sort`, `forum_display_order`) VALUES
(1, 1, 'Обговорення роботи трекера', '', 0, 40, 2, 2, 3, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 1, 0, 1, 0, 1, 0, 0),
(2, 1, 'Питання та проблеми', '', 0, 10, 1, 1, 8, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0),
(3, 2, 'Анонси релізів', '', 0, 10, 4, 2, 7, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0),
(4, 1, 'Про все', '', 0, 80, 1, 1, 10, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0),
(5, 1, 'Поїздки та зустрічі', '', 0, 130, 1, 1, 11, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0),
(6, 1, 'Чим допомогти?', 'Замість що робити? )', 0, 140, 1, 1, 12, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0),
(7, 3, 'Відео', '', 0, 10, 1, 1, 13, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0),
(8, 3, 'Музика', '', 0, 20, 1, 1, 14, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0),
(9, 3, 'Програми', '', 0, 30, 1, 1, 15, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0),
(10, 3, 'Ігри', '', 0, 40, 1, 1, 16, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0),
(11, 3, 'Література', '', 0, 50, 1, 1, 17, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0),
(12, 3, 'Інше', '', 0, 60, 1, 1, 18, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0),
(13, 4, 'Питання (ЧаПи)', '', 0, 10, 1, 1, 19, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0),
(14, 4, 'Кодування', '', 0, 20, 1, 1, 20, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0),
(15, 4, 'Субтитри', '', 0, 30, 1, 1, 21, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0),
(16, 4, 'Запис з ТБ', '', 0, 40, 1, 1, 22, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0),
(17, 4, 'Програми для роботи', '', 0, 50, 1, 1, 23, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0),
(18, 5, 'Як стати учасником?', '', 0, 10, 1, 1, 24, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0),
(19, 5, 'Підтримка та поширення', '', 0, 20, 1, 1, 25, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0),
(20, 5, 'Запис з ТБ', '', 0, 30, 1, 1, 26, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0),
(21, 5, 'Дизайнери', '', 0, 40, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0),
(22, 5, 'Субтитрування', '', 0, 50, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0),
(23, 5, 'Синхронізація', '', 0, 60, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0),
(24, 1, 'Проект \"Безконтакт\"', '', 0, 120, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 4, 1, 0, 0),
(25, 1, 'Флудильня', '', 0, 110, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 4, 1, 0, 0),
(26, 1, 'Новинки кіно', '', 0, 100, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 4, 1, 0, 0),
(27, 1, 'Обговорюємо серіали', '', 0, 90, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 4, 1, 0, 0),
(28, 1, 'Розширені ЧаПи (FAQ)', '', 0, 30, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 2, 1, 0, 0),
(29, 1, 'Глюки та баги Толоки', '', 0, 20, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 2, 1, 0, 0),
(30, 1, 'Вдосконалення структури толоки', '', 0, 70, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0),
(31, 1, 'Модернізація толоки', '', 0, 60, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0),
(32, 1, 'Голосування щодо озвучення фільмів', '', 0, 50, 1, 1, 9, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0),
(33, 6, 'Українське кіно', '', 0, 10, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0),
(34, 6, 'Українське озвучення', '', 0, 80, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0),
(35, 6, 'Українські субтитри', '', 0, 170, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0),
(36, 6, 'Документальні фільми українською', '', 0, 250, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0),
(37, 6, 'Телепередачі українською', '', 0, 330, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0),
(38, 6, 'Український спорт', '', 0, 360, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0),
(39, 6, 'HD українською', '', 0, 490, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0),
(40, 6, 'DVD українською', '', 0, 550, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0),
(41, 6, 'Відео для мобільних (iOS, Android, Windows Phone)', '', 0, 590, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0),
(42, 6, 'Звукові доріжки та субтитри', '', 0, 600, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0),
(43, 6, 'Фільмографії акторів та фільми з їхньою участю', '', 0, 610, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0),
(44, 6, 'Фільми за жанрами', '', 0, 620, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0),
(45, 6, 'Мультфільми і казки', '', 0, 70, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 33, 1, 0, 0),
(46, 6, 'Художні фільми', '', 0, 60, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 33, 1, 0, 0),
(47, 6, 'Телесеріали', '', 0, 50, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 33, 1, 0, 0),
(48, 6, 'Мультсеріали', '', 0, 40, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 33, 1, 0, 0),
(49, 6, 'АртХаус', '', 0, 30, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 33, 1, 0, 0),
(50, 6, 'Аматорське відео', '', 0, 20, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 33, 1, 0, 0),
(51, 6, 'Фільми', '', 0, 160, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 34, 1, 0, 0),
(52, 6, 'Телесеріали', '', 0, 150, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 34, 1, 0, 0),
(53, 6, 'Мультфільми', '', 0, 140, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 34, 1, 0, 0),
(54, 6, 'Мультсеріали', '', 0, 130, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 34, 1, 0, 0),
(55, 6, 'Аніме', '', 0, 120, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 34, 1, 0, 0),
(56, 6, 'АртХаус', '', 0, 110, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 34, 1, 0, 0),
(57, 6, 'Трейлери', '', 0, 100, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 34, 1, 0, 0),
(58, 6, 'Короткометражні', '', 0, 90, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 34, 1, 0, 0),
(59, 6, 'Фільми', '', 0, 240, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 35, 1, 0, 0),
(60, 6, 'Телесеріали', '', 0, 230, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 35, 1, 0, 0),
(61, 6, 'Мультфільми', '', 0, 220, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 35, 1, 0, 0),
(62, 6, 'Мультсеріали', '', 0, 210, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 35, 1, 0, 0),
(63, 6, 'Аніме', '', 0, 200, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 35, 1, 0, 0),
(64, 6, 'АртХаус', '', 0, 190, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 35, 1, 0, 0),
(65, 6, 'Короткометражні', '', 0, 180, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 35, 1, 0, 0),
(66, 6, 'Українські наукові документальні фільми', '', 0, 320, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 36, 1, 0, 0),
(67, 6, 'Українські історичні документальні фільми', '', 0, 310, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 36, 1, 0, 0),
(68, 6, 'BBC', '', 0, 300, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 36, 1, 0, 0),
(69, 6, 'Discovery', '', 0, 290, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 36, 1, 0, 0),
(70, 6, 'National Geographic', '', 0, 280, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 36, 1, 0, 0),
(71, 6, 'History Channel', '', 0, 270, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 36, 1, 0, 0),
(72, 6, 'Інші іноземні документальні фільми', '', 0, 260, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 36, 1, 0, 0),
(73, 6, 'Музичне відео', '', 0, 350, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 37, 1, 0, 0),
(74, 6, 'Телевізійні шоу та програми', '', 0, 340, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 37, 1, 0, 0),
(75, 6, 'Олімпіада', '', 0, 480, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 38, 1, 0, 0),
(76, 6, 'Чемпіонати Європи з футболу', '', 0, 470, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 38, 1, 0, 0),
(77, 6, 'Чемпіонати світу з футболу', '', 0, 460, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 38, 1, 0, 0),
(78, 6, 'Чемпіонат та Кубок України з футболу', '', 0, 450, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 38, 1, 0, 0),
(79, 6, 'Єврокубки', '', 0, 440, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 38, 1, 0, 0),
(80, 6, 'Збірна України', '', 0, 430, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 38, 1, 0, 0),
(81, 6, 'Закордонні чемпіонати', '', 0, 420, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 38, 1, 0, 0),
(82, 6, 'Футбольне відео', '', 0, 410, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 38, 1, 0, 0),
(83, 6, 'Баскетбол, хоккей, волейбол, гандбол, футзал', '', 0, 400, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 38, 1, 0, 0),
(84, 6, 'Бокс, реслінг, бойові мистецтва', '', 0, 390, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 38, 1, 0, 0),
(85, 6, 'Авто, мото', '', 0, 380, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 38, 1, 0, 0),
(86, 6, 'Інший спорт, активний відпочинок', '', 0, 370, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 38, 1, 0, 0),
(87, 6, 'Фільми в HD', '', 0, 540, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 39, 1, 0, 0),
(88, 6, 'Серіали в HD', '', 0, 530, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 39, 1, 0, 0),
(89, 6, 'Мультфільми в HD', '', 0, 520, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 39, 1, 0, 0),
(90, 6, 'Мультсеріали в HD', '', 0, 510, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 39, 1, 0, 0),
(91, 6, 'Документальні фільми в HD', '', 0, 500, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 39, 1, 0, 0),
(92, 6, 'Художні фільми та серіали в DVD', '', 0, 580, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 40, 1, 0, 0),
(93, 6, 'Мультфільми та мультсеріали в DVD', '', 0, 570, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 40, 1, 0, 0),
(94, 6, 'Документальні фільми в DVD', '', 0, 560, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 40, 1, 0, 0),
(95, 7, 'Українська музика (lossy)', '', 0, 10, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0),
(96, 7, 'Поп, Естрада,', '', 0, 90, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 95, 1, 0, 0),
(97, 7, 'Джаз, Блюз,', '', 0, 80, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 95, 1, 0, 0),
(98, 7, 'Етно, Фольклор, Народна, Бардівська,', '', 0, 70, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 95, 1, 0, 0),
(99, 7, 'Інструментальна, Класична та неокласична,', '', 0, 60, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 95, 1, 0, 0),
(100, 7, 'Рок, Метал, Альтернатива, Панк, СКА,', '', 0, 50, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 95, 1, 0, 0),
(101, 7, 'Реп, Хіп-хоп, РнБ,', '', 0, 40, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 95, 1, 0, 0),
(102, 7, 'Електронна музика,', '', 0, 30, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 95, 1, 0, 0),
(103, 7, 'Невидане', '', 0, 20, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 95, 1, 0, 0),
(104, 7, 'Українська музика (lossless)', '', 0, 100, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0),
(105, 7, 'Поп, Естрада,', '', 0, 170, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 104, 1, 0, 0),
(106, 7, 'Джаз, Блюз,', '', 0, 160, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 104, 1, 0, 0),
(107, 7, 'Етно, Фольклор, Народна, Бардівська,', '', 0, 150, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 104, 1, 0, 0),
(108, 7, 'Інструментальна, Класична та неокласична,', '', 0, 140, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 104, 1, 0, 0),
(109, 7, 'Рок, Метал, Альтернатива, Панк, СКА,', '', 0, 130, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 104, 1, 0, 0),
(110, 7, 'Реп, Хіп-хоп, РнБ,', '', 0, 120, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 104, 1, 0, 0),
(111, 7, 'Електронна музика', '', 0, 110, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 104, 1, 0, 0),
(112, 8, 'Друкована література', '', 0, 10, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0),
(113, 8, 'Українська художня література (до 1991 р.),', '', 0, 100, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 112, 1, 0, 0),
(114, 8, 'Українська художня література (після 1991 р.),', '', 0, 90, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 112, 1, 0, 0),
(115, 8, 'Зарубіжна художня література,', '', 0, 80, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 112, 1, 0, 0),
(116, 8, 'Наукова література (гуманітарні дисципліни),', '', 0, 70, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 112, 1, 0, 0),
(117, 8, 'Наукова література (природничі дисципліни),', '', 0, 60, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 112, 1, 0, 0),
(118, 8, 'Навчальна та довідкова,', '', 0, 50, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 112, 1, 0, 0),
(119, 8, 'Періодика,', '', 0, 40, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 112, 1, 0, 0),
(120, 8, 'Батькам та малятам,', '', 0, 30, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 112, 1, 0, 0),
(121, 8, 'Графіка (комікси, манґа, BD та інше)', '', 0, 20, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 112, 1, 0, 0),
(122, 8, 'Аудіокниги українською', '', 0, 110, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0),
(123, 8, 'Українська художня література,', '', 0, 140, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 122, 1, 0, 0),
(124, 8, 'Зарубіжна художня література,', '', 0, 130, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 122, 1, 0, 0),
(125, 8, 'Історія, біографістика, спогади', '', 0, 120, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 122, 1, 0, 0),
(126, 8, 'Оцифрування книг Гуртом', '', 0, 150, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0),
(127, 8, 'Обговорення,', '', 0, 170, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 126, 1, 0, 0),
(128, 8, 'Сирий матеріал', '', 0, 160, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 126, 1, 0, 0),
(129, 9, 'Windows', '', 0, 10, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0),
(130, 9, 'Windows,', '', 0, 60, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 129, 1, 0, 0),
(131, 9, 'Офіс,', '', 0, 50, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 129, 1, 0, 0),
(132, 9, 'Антивіруси та безпека,', '', 0, 40, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 129, 1, 0, 0),
(133, 9, 'Мультимедія,', '', 0, 30, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 129, 1, 0, 0),
(134, 9, 'Утиліти, обслуговування, мережа', '', 0, 20, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 129, 1, 0, 0),
(135, 9, 'Linux, Mac OS', '', 0, 70, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0),
(136, 9, 'Linux,', '', 0, 90, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 135, 1, 0, 0),
(137, 9, 'Mac OS', '', 0, 80, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 135, 1, 0, 0),
(138, 9, 'Мобільні OС', '', 0, 100, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0),
(139, 9, 'Android,', '', 0, 140, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 138, 1, 0, 0),
(140, 9, 'iOS,', '', 0, 130, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 138, 1, 0, 0),
(141, 9, 'Windows Phone', '', 0, 120, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 138, 1, 0, 0),
(142, 9, 'Інші мобільні платформи', '', 0, 110, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 138, 1, 0, 0),
(143, 9, 'Інше', '', 0, 150, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0),
(144, 9, 'Інфодиски, електронні підручники, відеоуроки,', '', 0, 180, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 143, 1, 0, 0),
(145, 9, 'Шпалери, фотографії та зображення,', '', 0, 170, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 143, 1, 0, 0),
(146, 9, 'Веб-скрипти', '', 0, 160, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 143, 1, 0, 0),
(147, 9, 'Переклад програм українською', '', 0, 190, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0),
(148, 9, 'Активні проекти,', '', 0, 230, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 147, 1, 0, 0),
(149, 9, 'Заморожені проекти,', '', 0, 220, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 147, 1, 0, 0),
(150, 9, 'Обговорення,', '', 0, 210, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 147, 1, 0, 0),
(151, 9, 'Архів', '', 0, 200, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 147, 1, 0, 0),
(152, 10, 'Ігри українською', '', 0, 10, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0),
(153, 10, 'PC ігри,', '', 0, 60, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 152, 1, 0, 0),
(154, 10, 'Українізації, доповнення, патчі...,', '', 0, 50, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 152, 1, 0, 0),
(155, 10, 'Мобільні та консольні ігри,', '', 0, 40, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 152, 1, 0, 0),
(156, 10, 'iOS,', '', 0, 30, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 152, 1, 0, 0),
(157, 10, 'Android', '', 0, 20, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 152, 1, 0, 0),
(158, 10, 'Переклад ігор українською', '', 0, 70, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0),
(159, 10, 'Активні проекти,', '', 0, 110, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 158, 1, 0, 0),
(160, 10, 'Заморожені проекти,', '', 0, 100, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 158, 1, 0, 0),
(161, 10, 'Обговорення,', '', 0, 90, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 158, 1, 0, 0),
(162, 10, 'Архів', '', 0, 80, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 158, 1, 0, 0),
(163, 10, 'Розробка Mount And Blade Честь і Слава', '', 0, 120, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0),
(164, 11, 'Закритий розділ', '', 0, 10, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0),
(165, 11, 'Архіви', '', 0, 20, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0),
(166, 11, 'Архів відео,', '', 0, 80, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 165, 1, 0, 0),
(167, 11, 'Архів музики,', '', 0, 70, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 165, 1, 0, 0),
(168, 11, 'Архів програм,', '', 0, 60, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 165, 1, 0, 0),
(170, 11, 'Архів літератури,', '', 0, 40, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 165, 1, 0, 0),
(171, 11, 'Архів обговорень', '', 0, 30, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 165, 1, 0, 0),
(172, 11, 'Неоформлені', '', 0, 90, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0),
(173, 11, 'Архів ігор,', '', 0, 50, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 165, 1, 0, 0),
(174, 11, 'Неоформлене відео,', '', 0, 140, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 172, 1, 0, 0),
(175, 11, 'Неоформлена музика,', '', 0, 130, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 172, 1, 0, 0),
(176, 11, 'Неоформлене програмне забезпечення,', '', 0, 120, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 172, 1, 0, 0),
(177, 11, 'Неоформлені ігри,', '', 0, 110, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 172, 1, 0, 0),
(178, 11, 'Неоформлена література', '', 0, 100, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 172, 1, 0, 0),
(179, 11, 'Фінальний смітник', '', 0, 150, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблиці `bb_groups`
--

CREATE TABLE `bb_groups` (
  `group_id` mediumint(8) NOT NULL,
  `avatar_ext_id` int(15) NOT NULL DEFAULT 0,
  `group_time` int(11) NOT NULL DEFAULT 0,
  `mod_time` int(11) NOT NULL DEFAULT 0,
  `group_type` tinyint(4) NOT NULL DEFAULT 1,
  `release_group` tinyint(4) NOT NULL DEFAULT 0,
  `group_name` varchar(40) NOT NULL DEFAULT '',
  `group_description` text NOT NULL,
  `group_signature` text NOT NULL,
  `group_moderator` mediumint(8) NOT NULL DEFAULT 0,
  `group_single_user` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `bb_log`
--

CREATE TABLE `bb_log` (
  `log_type_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `log_user_id` mediumint(9) NOT NULL DEFAULT 0,
  `log_user_ip` varchar(42) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0',
  `log_forum_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `log_forum_id_new` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `log_topic_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `log_topic_id_new` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `log_topic_title` varchar(250) NOT NULL DEFAULT '',
  `log_topic_title_new` varchar(250) NOT NULL DEFAULT '',
  `log_time` int(11) NOT NULL DEFAULT 0,
  `log_msg` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `bb_poll_users`
--

CREATE TABLE `bb_poll_users` (
  `topic_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `vote_ip` varchar(42) NOT NULL DEFAULT '0',
  `vote_dt` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `bb_poll_votes`
--

CREATE TABLE `bb_poll_votes` (
  `topic_id` int(10) UNSIGNED NOT NULL,
  `vote_id` tinyint(4) UNSIGNED NOT NULL,
  `vote_text` varchar(255) NOT NULL,
  `vote_result` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `bb_poll_votes`
--

INSERT INTO `bb_poll_votes` (`topic_id`, `vote_id`, `vote_text`, `vote_result`) VALUES
(6, 0, 'Які документальні фільми ви б хотіли побачити?', 0),
(6, 1, 'Земля картелів / Cartel Land (2015)', 0),
(6, 2, 'Туман війни / The Fog of War: Eleven Lessons from the Life of Robert S. McNamara (2003)', 0),
(6, 3, 'Фільм ще не має рейтингу / Фільм ще не оцінено / This Film Is Not Yet Rated (2006)', 0),
(6, 4, 'Земляни / Earthlings (2005)', 0),
(6, 5, 'Сіль землі / The Salt of the Earth (2014)', 0),
(6, 6, 'Бухта / The Cove (2009)', 0);

-- --------------------------------------------------------

--
-- Структура таблиці `bb_posts`
--

CREATE TABLE `bb_posts` (
  `post_id` mediumint(8) UNSIGNED NOT NULL,
  `topic_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `forum_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `poster_id` mediumint(8) NOT NULL DEFAULT 0,
  `post_time` int(11) NOT NULL DEFAULT 0,
  `poster_ip` char(42) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0',
  `poster_rg_id` mediumint(8) NOT NULL DEFAULT 0,
  `attach_rg_sig` tinyint(4) NOT NULL DEFAULT 0,
  `post_username` varchar(25) NOT NULL DEFAULT '',
  `post_edit_time` int(11) NOT NULL DEFAULT 0,
  `post_edit_count` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `post_attachment` tinyint(1) NOT NULL DEFAULT 0,
  `user_post` tinyint(1) NOT NULL DEFAULT 1,
  `mc_comment` text DEFAULT NULL,
  `mc_type` tinyint(1) NOT NULL DEFAULT 0,
  `mc_user_id` mediumint(8) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `bb_posts`
--

INSERT INTO `bb_posts` (`post_id`, `topic_id`, `forum_id`, `poster_id`, `post_time`, `poster_ip`, `poster_rg_id`, `attach_rg_sig`, `post_username`, `post_edit_time`, `post_edit_count`, `post_attachment`, `user_post`, `mc_comment`, `mc_type`, `mc_user_id`) VALUES
(1, 1, 1, 2, 0, '0', 0, 0, '', 0, 0, 0, 1, '', 0, 0),
(3, 2, 1, 2, 1497868665, '2886860801', 0, 0, '', 0, 0, 0, 1, NULL, 0, 0),
(4, 3, 3, 2, 1499088533, '2886860801', 0, 0, '', 0, 0, 0, 1, NULL, 0, 0),
(5, 3, 3, 2, 1499088554, '2886860801', 0, 0, '', 0, 0, 0, 1, NULL, 0, 0),
(6, 4, 3, 2, 1499089675, '2886860801', 0, 0, '', 0, 0, 0, 1, NULL, 0, 0),
(7, 4, 3, 2, 1499089689, '2886860801', 0, 0, '', 0, 0, 0, 1, NULL, 0, 0),
(8, 5, 2, 2, 1499090454, '2886860801', 0, 0, '', 0, 0, 0, 1, NULL, 0, 0),
(9, 6, 32, 2, 1499153976, '2886860801', 0, 0, '', 0, 0, 0, 1, NULL, 0, 0),
(10, 7, 4, 2, 1499156274, '2886860801', 0, 0, '', 0, 0, 0, 1, NULL, 0, 0),
(11, 8, 5, 2, 1499156519, '2886860801', 0, 0, '', 0, 0, 0, 1, NULL, 0, 0),
(12, 9, 6, 2, 1499156727, '2886860801', 0, 0, '', 0, 0, 0, 1, NULL, 0, 0),
(13, 10, 7, 2, 1499157438, '2886860801', 0, 0, '', 0, 0, 0, 1, NULL, 0, 0),
(14, 11, 8, 2, 1499346326, '2886860801', 0, 0, '', 0, 0, 0, 1, NULL, 0, 0),
(15, 12, 9, 2, 1499346368, '2886860801', 0, 0, '', 0, 0, 0, 1, NULL, 0, 0),
(16, 13, 10, 2, 1499346556, '2886860801', 0, 0, '', 0, 0, 0, 1, NULL, 0, 0),
(17, 14, 11, 2, 1499346679, '2886860801', 0, 0, '', 0, 0, 0, 1, NULL, 0, 0),
(18, 15, 12, 2, 1499346743, '2886860801', 0, 0, '', 0, 0, 0, 1, NULL, 0, 0),
(19, 16, 13, 2, 1499347326, '2886860801', 0, 0, '', 0, 0, 0, 1, NULL, 0, 0),
(20, 17, 14, 2, 1499347552, '2886860801', 0, 0, '', 0, 0, 0, 1, NULL, 0, 0),
(21, 18, 15, 2, 1499348155, '2886860801', 0, 0, '', 0, 0, 0, 1, NULL, 0, 0),
(22, 19, 16, 2, 1499348219, '2886860801', 0, 0, '', 0, 0, 0, 1, NULL, 0, 0),
(23, 20, 17, 2, 1499348604, '2886860801', 0, 0, '', 0, 0, 0, 1, NULL, 0, 0),
(24, 21, 18, 2, 1499348831, '2886860801', 0, 0, '', 0, 0, 0, 1, NULL, 0, 0),
(25, 22, 19, 2, 1499349716, '2886860801', 0, 0, '', 0, 0, 0, 1, NULL, 0, 0),
(26, 23, 20, 2, 1499349889, '2886860801', 0, 0, '', 0, 0, 0, 1, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблиці `bb_posts_html`
--

CREATE TABLE `bb_posts_html` (
  `post_id` mediumint(9) NOT NULL DEFAULT 0,
  `post_html_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `post_html` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `bb_posts_html`
--

INSERT INTO `bb_posts_html` (`post_id`, `post_html_time`, `post_html`) VALUES
(1, '2017-07-04 08:56:49', '<span class=\"post-b\">Бонуси за роздачу власних та непопулярних торрентів </span><span class=\"post-br\"><br /></span><span class=\"post-u\">власний </span><br />бонус = віддане<br />іншими словами, на власних релізах роздача подвоюється<span class=\"post-br\"><br /></span><span class=\"post-u\">не більше 10 сідерів </span><br />бонус = віддане / кількість сідерів<br />наприклад, якщо 5 сідерів, кожен з них отримає як бонус 20% від роздачі<span class=\"post-br\"><br /></span><span class=\"post-b\">Бонуси за годину перебування на роздачі </span><br />почали діяти 23.11.2014<span class=\"post-br\"><br /></span>Чим більший і старіший торрент, тим більше бонусу нараховується за час перебування на роздачі.<br />В середньому це 3 МБ за годину. Наприклад, залишаючись на роздачі 10-ти торрентів, ви отримаєте 720 МБ бонусу за день.<div class=\"sp-wrap\"><div class=\"sp-body\" title=\"Формула\"><h3 class=\"sp-title\">Формула</h3>0,01 * кількість місяців від реєстрації торренту<span class=\"post-br\"><br /></span>+<span class=\"post-br\"><br /></span>0,0 = 0-1 ГБ<br />0,2 = 1-3 ГБ<br />0,3 = 3-6 ГБ<br />0,4 = 6-10 ГБ<br />0,5 = 10-20 ГБ<br />0,6 = 20+ ГБ<span class=\"post-br\"><br /></span>+<span class=\"post-br\"><br /></span>0,1 від 10 сідів<br />0,2 до 10 сідів<span class=\"post-br\"><br /></span>Число, яке вийшло, множимо на 5, і отримуємо кількість МБ за годину.<span class=\"post-br\"><br /></span>Типові приклади:<span class=\"post-br\"><br /></span>Книга і музика<br />Нова 0,05 + 0 + 0,2 = 0,25 * 5 = 1,25 МБ<br />Стара 0,36 + 0 + 0,2 = 0,56 * 5 = 2,8 МБ<span class=\"post-br\"><br /></span>Фільм<br />Новий 0,05 + 0,2 + 0,1 = 0,35 * 5 = 1,75<br />Старий 0,36 + 0,2 + 0,2 = 0,76 * 5 = 3,8 МБ<span class=\"post-br\"><br /></span>HD<br />Новий 0,05 + 0,4 + 0,2 = 0,65 * 5= 3,25 МБ<br />Старий 0,36 + 0,4 + 0,2 = 0,96 * 5 = 4,8 МБ</div></div>'),
(3, '2017-07-03 13:51:28', '<span style=\"color: green;\"><span style=\"font-size: 22px; line-height: normal;\"><span class=\"post-b\"><span class=\"post-align\" style=\"text-align: center;\">Модернізації візуально толоки</span></span></span></span><span class=\"post-br\"><br /></span><span class=\"post-b\">1.</span> Чи можна з лівого боку, чи десь зверху на стартовій сторінці зробити посилання за жанрами?<br />Маю на увазі: зробити такі кнопки в алфавітному порядку:<br /><a href=\"https://toloka.to/f130\" class=\"postLink\" rel=\"nofollow\">https://toloka.to/f130</a><span class=\"post-br\"><br /></span><span class=\"post-b\"><span style=\"color: green;\">[ВИПРАВЛЕНО]</span>2.</span> Як Ви ставитесь до того, щоб перейти на 10-бальну систему оцінювання релізів?<br />адже нею користуються фактично усі. IMDB, Multikino...<span class=\"post-br\"><br /></span><span class=\"post-b\"><span style=\"color: green;\">[ВИПРАВЛЕНО]</span>3.</span> Перейменувати напис у шапці з \"Головна\" на \"Портал\".<br />А то багато хто думає, що це головна сторінка трекера.<span class=\"post-br\"><br /></span><span class=\"post-b\"><span style=\"color: green;\">[ВИПРАВЛЕНО]</span>4. </span>Пропоную цю сторінку <a href=\"https://toloka.to/dorizhky.php\" class=\"postLink\" rel=\"nofollow\">https://toloka.to/dorizhky.php</a> також десь вгорі прикріпити - там, де модератори, правила і т.д., бо я думаю, більша половина гуртомівців про її наявність і не здогадується.<span class=\"post-br\"><br /></span><span class=\"post-b\">5. </span>Також було б добре, якщо б у профілі користувача був список не тільки релізів, а й інших тем, відкритих користувачем, обговорень, інструкцій, пошук чогось, бо свій реліз знайти можна і через пошук, а якусь тему з обговоренням або з запитанням дедалі важче'),
(4, '2017-07-03 13:29:10', '<span class=\"post-b\">Загальні правила та оформлення</span><span class=\"post-br\"><br /></span>1. Анонси можуть створювати тільки учасники Проекту Відео Гуртом<br />2. Анонс повинен мати повну назву за правилами відповідного розділу<br />3. Опис необов\'язковий, але необхідно вказати посилання на imdb та приблизну дату релізу. Якщо це запис з ТБ, потрібно також вказати телеканал<br />4. Кожен учасник може створити не більше 10 анонсів. Наприклад, якщо ви створите восьмий, перший втратить пріоритет<br />5. Анонс втрачає свою актуальність після 21 дня, після цього його не буде видалено, але він втратить пріоритет<br /><span class=\"post-b\"><br />Пріоритет анонсів</span><span class=\"post-br\"><br /></span>Анонс має пріоритет 3 години.<span class=\"post-br\"><br /></span>Приклад:<br />1. Ви (автор анонсу) першими створили реліз. Все добре, правило не застосовується.<br />2. Ви створили реліз після когось. Якщо ви додали торрент до 3 годин після іншої людини, зберігається ваш реліз.<br />3. Якщо ви запізнилися зі створенням релізу більше, ніж на 3 години, зберігається реліз того, хто створив його перед вами. Зрозуміло, що це правило стосується тільки випадків, коли релізи себе повторюють (див. Правила відео).<span class=\"post-br\"><br /></span><span class=\"post-b\">Опублікування релізу</span><span class=\"post-br\"><br /></span>Прошу НІКОЛИ не переносити анонс у смітник. Замість того, щоб створювати нову тему, перенесіть його у відповідний розділ і додайте торрент.<span class=\"post-br\"><br /></span>Причина проста - Google проіндексує анонс, і, якщо він опиниться у смітнику, люди не зможуть з пошуку потрапити на ваш реліз.<span class=\"post-br\"><br /></span>Посилання на перенесення знаходиться зліва внизу сторінки.'),
(5, '2017-07-03 13:29:15', 'Правила оновлено.'),
(6, '2017-07-03 13:48:02', '<span style=\"font-size: 18px; line-height: normal;\"><span class=\"post-b\"><span style=\"color: red;\"><span class=\"post-align\" style=\"text-align: center;\">12 липня<br />Elektroz 1080</span></span></span></span><span class=\"post-br\"><br /></span><span style=\"font-family: Georgia;\"><span class=\"post-align\" style=\"text-align: center;\"><span style=\"color: blue;\"><span class=\"post-i\"><span style=\"font-size: 26px; line-height: normal;\"><span class=\"post-b\">Красиво піти / Going in Style (2017) WEB-DL 720p Ukr/Eng | Sub Eng</span></span></span></span></span></span><span class=\"post-align\" style=\"text-align: center;\"><var class=\"postImg\" title=\"https://toloka.to/photos/170702114004124631_f0_0.jpg\">&#10;</var></span><span style=\"color: blue;\"><span class=\"post-b\">Жанр:</span></span> комедія, кримінальний<br /><span style=\"color: blue;\"><span class=\"post-b\">Країна: </span></span>США<span class=\"post-br\"><br /></span><span style=\"color: darkblue;\"><span class=\"post-b\">Кінокомпанія: </span></span>Metro-Goldwyn-Mayer (MGM), New Line Cinema, Warner Bros. Pictures<br /><span style=\"color: blue;\"><span class=\"post-b\">Режисер:</span></span> Зак Брафф<br /><span class=\"post-b\"><span style=\"color: blue;\">Актори: </span></span>Морган Фрімен, Джої Кінг, Енн-Маргрет, Крістофер Ллойд, Майкл Кейн, Пітер Серафіновіч, Метт Діллон<span class=\"post-br\"><br /></span><span class=\"post-b\"><span style=\"color: blue;\">Сюжет:</span></span><br />Їх невеселе життя складається в основному з сидіння на лавці в парку, критики нинішньої молоді та годування голубів. Втомившись від буденності, трійця пенсіонерів вирішує хоча б піти з цього життя красиво. Ідея дідусів полягає в тому, що їм всього лише потрібно... пограбувати банк і метнутися в Вегас!<span class=\"post-br\"><br /></span><span class=\"post-b\"><span style=\"color: blue;\">Тривалість:</span></span> 01:00:сс<br /><span class=\"post-b\"><span style=\"color: blue;\">Якість: </span></span>WEB-DL 720p<span class=\"post-br\"><br /></span><span class=\"post-b\"><span style=\"color: blue;\">Відео: </span></span><br /><span class=\"post-i\"><span style=\"color: green;\">кодек: </span></span>H.264<br /><span class=\"post-i\"><span style=\"color: green;\">розмір кадру:</span></span> ширина х висота<br /><span class=\"post-i\"><span style=\"color: green;\">бітрейт: </span></span>кб/с<span class=\"post-br\"><br /></span><span class=\"post-b\"><span style=\"color: blue;\">Аудіо # 1:</span></span><br /><span class=\"post-i\"><span style=\"color: green;\">мова:</span></span> українська  <var class=\"postImg\" title=\"https://img.hurtom.com/i/2016/07/ukraine-flag-animation_25x17.gif\">&#10;</var><br /><span class=\"post-i\"><span style=\"color: green;\">переклад: </span></span>професійний дубльований  <var class=\"postImg\" title=\"https://img.hurtom.com/i/2014/08/logok18O5.png\">&#10;</var><br /><span class=\"post-i\"><span style=\"color: green;\">кодек: </span></span>AC3 2.0<br /><span class=\"post-i\"><span style=\"color: green;\">бітрейт:</span></span> 192 кб/с<span class=\"post-br\"><br /></span><span class=\"post-b\"><span style=\"color: blue;\">Аудіо # 2: </span></span><br /><span class=\"post-i\"><span style=\"color: green;\">мова:</span></span> англійська  <var class=\"postImg\" title=\"https://thumb.hurtom.com/image/i41.tinypic.com/fa7vo0.gif\">&#10;</var><br /><span class=\"post-i\"><span style=\"color: green;\">переклад: </span></span>оригінал<br /><span class=\"post-i\"><span style=\"color: green;\">кодек: </span></span>AC3 5.1<br /><span class=\"post-i\"><span style=\"color: green;\">бітрейт: </span></span>384 кб/с<span class=\"post-br\"><br /></span><span class=\"post-b\"><span style=\"color: blue;\">Субтитри: </span></span><br /><span class=\"post-i\"><span style=\"color: green;\">мова: </span></span>англійська  <var class=\"postImg\" title=\"https://thumb.hurtom.com/image/i41.tinypic.com/fa7vo0.gif\">&#10;</var><br /><span class=\"post-i\"><span style=\"color: green;\">тип:</span></span> програмні (м\'які)<br /><span class=\"post-i\"><span style=\"color: green;\">формат: </span></span>*.srt<div class=\"sp-wrap\"><div class=\"sp-body\" title=\"MediaInfo\"><h3 class=\"sp-title\">MediaInfo</h3>[cove][/code]</div></div><div class=\"sp-wrap\"><div class=\"sp-body\" title=\"Скріншоти\"><h3 class=\"sp-title\">Скріншоти</h3>2</div></div><span class=\"post-b\"><span style=\"color: blue;\">Джерело: </span></span> <var class=\"postImg\" title=\"https://toloka.to/img/%D0%9F%D1%80%D0%BE%D0%B5%D0%BA%D1%82_%D0%92%D1%96%D0%B4%D0%B5%D0%BE_%D0%93%D1%83%D1%80%D1%82%D0%BE%D0%BC.gif\">&#10;</var> &amp;  <var class=\"postImg\" title=\"https://toloka.to/img/HDclub.com.ua.gif\">&#10;</var><br /><span class=\"post-b\"><span style=\"color: blue;\">Особиста оцінка:</span></span> 0 - не дивився'),
(7, '2017-07-03 13:48:10', 'Питання: фільм буде без корейських сабів чи з ними? ДЯкую!'),
(8, '2017-07-17 00:27:55', '<span class=\"post-b\"><span style=\"font-size: 22px; line-height: normal;\"><span style=\"color: green;\"><span class=\"post-align\" style=\"text-align: center;\">Навіщо потрібен рейтинг на торрент-трекері?</span></span></span></span><span class=\"post-align\" style=\"text-align: center;\"><var class=\"postImg\" title=\"https://thumb.hurtom.com/image/s2.share.te.ua/b485323/gszsny9qek.png\">&#10;</var></span>Існує багато різних сайтів, що дають можливість завантажувати файли.<br />Завантаження файлів за допомогою торрентів відбувається по-іншому, ніж з файлосховища. У файлосховищах типу ex.ua Ви тиснете на кнопку “завантажити” і зберігаєте в себе файл, розташований на сервері — потужному, швидкому комп\'ютерові з хорошим виходом в інтернет. Такий спосіб можуть собі дозволити багаті організації, бо він потребує значних коштів.<span class=\"post-br\"><br /></span>Натомість існує інший спосіб, коли сервер не зберігає в себе файли, і відповідно не повинен бути дуже сильним. Такий сервер всього-навсього знає, де лежать потрібні файли. Вони лежать на комп\'ютерах користувачів, — звичайних людей, що колись завантажили ті файли один в одного, і тепер зберігають їх на своїх домашніх ПК чи ноутах.<br />Цей сервер називається “торрент-трекер”. <span class=\"post-b\">Коли з\'являється новий користувач, і хоче завантажити потрібні файли, сервер просто підказує йому адреси, де вони лежать. </span>Таким чином, <span class=\"post-b\">сервер є тільки посередником між комп\'ютерами користувачів,</span> знайомить їх між собою. Після цього знайомства завантаження файлів відбувається прямо з комп\'ютера іншого користувача.<span class=\"post-br\"><br /></span>Якщо Ви вже маєте досвід користування торрентами, можете заперечити, що нічого подібного не відбувається: ні за якими посиланнями Ви не переходите, і ні з ким там не знайомитесь. Насправді все це відбувається на рівні комп\'ютерних програм, — вони виконують за Вас всю цю роботу. Програми, так звані “торрент-клієнти”, сконструйовані саме так, щоб шукати і допомагати завантажити файли один в одного. Найпопулярніші серед них, — uTorrent, BitTorrent, Vuze, Transmission. По великому рахунку, всі ці програми створені так, що можуть обійтись без додаткових налаштувань, — достатньо просто віддати їм торрент-файл (файл з розширенням *.torrent), а далі вони вже самі розберуться, звідки завантажити потрібний Вам файл, і кому його потім роздати. Файл з розширенням *.torrent і є тим самим “посиланням” на комп\'ютери, де зберігається потрібний Вам файл.<span class=\"post-br\"><br /></span>Отже, ми з\'ясували, що <span class=\"post-b\">завантаження файлу відбувається з комп\'ютерів звичайних відвідувачів інтернету, </span>таких, як Ви. Тепер запитання: що треба зробити, щоб це завантаження було легким і якісним? Потрібна хороша швидкість. А досягти її можна тільки тоді, коли файл буде знаходитись у якомога більшої кількості людей. Тоді кожен з них віддаватиме його з невеликою швидкістю, а всі разом вони забезпечать Вам хороше, швидке завантаження. <span class=\"post-b\">Чим більше людей роздає файл, тим більшою буде швидкість Вашого завантаження. </span><span class=\"post-br\"><br /></span>Нарешті файл був Вами завантажений, і тепер торрент-клієнт автоматично починає його роздавати. (Тільки не треба йому в цьому заважати, наприклад вимикати торрент-клієнт чи видаляти з нього торрент-файл! Або видаляти файл, що був завантажений.) Зараз пора подумати про інших людей, наступних відвідувачів, котрі прийшли після Вас і теж вирішили завантажити цей файл. Вони також будуть вантажити його з комп\'ютерів користувачів, в тому числі й з Вашого комп\'ютера. А для того, щоб їхнє завантаження було не менш комфортним ніж Ваше, <span class=\"post-b\">потрібно, щоб Ваш торрент-клієнт працював \"на роздачу\" багато часу. </span>Тобто <span class=\"post-b\">Ваша задача — роздавати цей файл якнайдовше.</span> Для цього, як було сказано вище, просто потрібно не заважати торрент-програмі. Тільки в такий спосіб наступні відвідувачі зможуть завантажити файли.<span class=\"post-br\"><br /></span>А що відбудеться, <span class=\"post-b\">якщо у Вас немає бажання роздавати файл?</span> Тоді ті, хто прийде після Вас, завантажать його з поганою швидкістю. Або взагалі не завантажать, якщо ніхто не захоче його роздавати. І дуже скоро <span class=\"post-b\">настане момент, коли Ви забажаєте завантажити якийсь інший файл, а завантаження зовсім не буде, — бо інші теж роздавати не хочуть!</span> Так і залишитесь без потрібного Вам файлу, бо хтось вирішив, що не має бажання роздавати. Так все й зупиниться, — файли є, роздати нікому.<span class=\"post-br\"><br /></span>Звичайно, торрент-трекер найбільше зацікавлений, щоб роздача відбувалась якнайкраще, бо від цього залежить ефективність сервера. Для цього підраховується сукупний розмір файлів, що були Вами завантажені і роздані. Така собі <span class=\"post-b\">бухгалтерія, щоб знати, чи повернули Ви наданий кредит в повному обсязі. Цей облік постійно проводиться для кожного відвідувача сайту. </span>Підрахунок називається “рейтинг”, і є співвідношенням відданого до завантаженого. Якщо ви завантажили файл розміром 1 Гігабайт, а роздали його двом людям, тобто віддали 2 Гігабайта, — Ваш рейтинг буде дорівнювати “2” (2 розділити на 1 дорівнює 2). І навпаки, якщо, не віддали нічого, нуль, то й рейтинг Ваш буде “0” (бо 0 розділити на 1 дорівнює 0). <span class=\"post-b\">З нульовим рейтингом (0.15 і нижче) завантажувати нові файли не можна. Це зроблено, щоб заохотити Вас до роздачі завантажених файлів. </span><br /><a href=\"https://toloka.to/t35477\" class=\"postLink\" rel=\"nofollow\">Детальніше, що робити, якщо рейтинг опустився до нуля, можна в темі “Розширені ЧаПи”.</a><span class=\"post-br\"><br /></span>У Вас може виникнути запитання <span class=\"post-b\">“Невже не можна обійтись без цих рейтингів, обмежень? Хіба не можна просто завантажувати файли?!” </span>Власне, цю тему й було написано як відповідь на подібні запитання. Відповідь така: <span class=\"post-b\">якщо всі перестануть роздавати, то нікому не вдастся нічого завантажити. </span><br />Торрент-трекер “Толока” періодично влаштовує дні, коли рейтинг не враховується, і вантажити можна донесхочу. Цей період називається “фріліч”, і відбувається переважно на Різдво та Великдень. Також існують бонусні файли, так звані “золоті, срібні, бронзові роздачі”. В інші дні рейтинг нараховується в повному обсязі. Детальніше про них і про фріліч прочитати можна в темі “Розширені ЧаПи”.<span class=\"post-br\"><br /></span>Так, в світі існують торрент-трекери, де рейтингу немає взагалі. Але переважно в них важко щось завантажити, з тієї-таки причини: нікому роздавати, а завантажити хочуть всі. Працюють такі рейтинги виключно за рахунок надлишкової чисельності, - якщо багато людей роздасть по-трошки, то буде завантаження. Такий метод — вибір трекерів, що відвідують дуже багато користувачів, вони можуть собі це дозволити. <span class=\"post-b\">Гуртом, на жаль, не має зайвих роздавальників, щоб запровадити безрейтингову систему на щодень. </span>В Україні, станом на сьогоднішній день, практично немає безрейтингових трекерів з солідною роздачею.<span class=\"post-br\"><br /></span><span class=\"post-b\">Тому рейтингова система може бути несприятливою для одної людини в певний час, але загалом, для цілого сайту, — вона сприяє хорошій роздачі. Роздача файлів — це інвестиція у Ваші майбутні завантаження, і в майбутнє торрент-трекеру.</span>'),
(9, '2017-07-04 07:42:29', 'Шановні Гуртомівці!<span class=\"post-br\"><br /></span>Цього разу буде обрано 5 нових, 5 класичних та 2 документальні фільми.<span class=\"post-align\" style=\"text-align: center;\"><var class=\"postImg\" title=\"https://img.hurtom.com/i/2017/01/4-1000.jpg\">&#10;</var></span>Голосування поділяється на 3 теми:<br />1. Новинки<br />2. Класика<br />3. Документальні<div class=\"sp-wrap\"><div class=\"sp-body\" title=\"Бухта / The Cove (2009&amp;#41;\"><h3 class=\"sp-title\">Бухта / The Cove (2009&amp;#41;</h3><span style=\"font-size: 20px; line-height: normal;\"><span style=\"color: red;\"><span class=\"post-b\"><span class=\"post-align\" style=\"text-align: center;\">Бухта / The Cove (2009)</span></span></span></span><span class=\"post-align\" style=\"text-align: center;\"><var class=\"postImg\" title=\"https://img.hurtom.com/i/2017/01/cove.md.jpg\">&#10;</var></span><span class=\"post-b\">Жанр: </span>документальний<br /><span class=\"post-b\">Країна:</span> США<span class=\"post-br\"><br /></span><span class=\"post-b\">Кіностудія / кінокомпанія: </span>Diamond Docs, Fish Films, Oceanic Preservation Society, Quickfire Films<br /><span class=\"post-b\">Режисер:</span> Луі Псіхойос<span class=\"post-br\"><br /></span><span class=\"post-b\">Сюжет:</span><br />У фільмі «Бухта» мова йде про щорічне полювання на дельфінів, яке влаштовують жителі міста Таїджі. Рибалки заганяють ссавців у вузьку бухту, частину з них відловлюють для продажу в океанаріум, але більшу частину вбивають, щоб продати м\'ясо на ринках. Щороку в прибережних водах Таїджі гине до 23000 дельфінів.</div></div><div class=\"sp-wrap\"><div class=\"sp-body\" title=\"Вірунга / Virunga (2014&amp;#41;\"><h3 class=\"sp-title\">Вірунга / Virunga (2014&amp;#41;</h3><span style=\"font-size: 20px; line-height: normal;\"><span style=\"color: red;\"><span class=\"post-b\"><span class=\"post-align\" style=\"text-align: center;\">Вірунга / Virunga (2014)</span></span></span></span><span class=\"post-align\" style=\"text-align: center;\"><var class=\"postImg\" title=\"https://img.hurtom.com/i/2017/01/viruga.md.jpg\">&#10;</var></span><span class=\"post-b\">Жанр: </span>документальний, військовий<br /><span class=\"post-b\">Країна:</span> Великобританія, Конго<span class=\"post-br\"><br /></span><span class=\"post-b\">Режисер:</span> Орландо фон Айнсідель<span class=\"post-br\"><br /></span><span class=\"post-b\">Сюжет:</span><br />Група сміливців ризикує власним життям, щоб врятувати останнього в світі представника виду гірських горил, в розпал нової громадянської війни і боротьби за природні ресурси Конго.</div></div><div class=\"sp-wrap\"><div class=\"sp-body\" title=\"Земляни / Earthlings (2005&amp;#41; \"><h3 class=\"sp-title\">Земляни / Earthlings (2005&amp;#41; </h3><span style=\"font-size: 20px; line-height: normal;\"><span style=\"color: red;\"><span class=\"post-b\"><span class=\"post-align\" style=\"text-align: center;\">Земляни / Earthlings (2005)</span></span></span></span><span class=\"post-align\" style=\"text-align: center;\"><var class=\"postImg\" title=\"https://img.hurtom.com/i/2017/01/earthlings.md.jpg\">&#10;</var></span><span class=\"post-b\">Жанр: </span>документальний<br /><span class=\"post-b\">Країна:</span> США<span class=\"post-br\"><br /></span><span class=\"post-b\">Режисер:</span> Шон Монсон<span class=\"post-br\"><br /></span><span class=\"post-b\">Сюжет:</span><br />Фільм про проблему експлуатації тварин людьми для одомашнювання, розваг, наукових досліджень або ж для виробництва одягу і їжі.</div></div><div class=\"sp-wrap\"><div class=\"sp-body\" title=\"Земля картелів / Cartel Land (2015&amp;#41; \"><h3 class=\"sp-title\">Земля картелів / Cartel Land (2015&amp;#41; </h3><span style=\"font-size: 20px; line-height: normal;\"><span style=\"color: red;\"><span class=\"post-b\"><span class=\"post-align\" style=\"text-align: center;\">Земля картелів / Cartel Land (2015)</span></span></span></span><span class=\"post-align\" style=\"text-align: center;\"><var class=\"postImg\" title=\"https://img.hurtom.com/i/2017/01/land.md.jpg\">&#10;</var></span><span class=\"post-b\">Жанр: </span>документальний<br /><span class=\"post-b\">Країна:</span> США<span class=\"post-br\"><br /></span><span class=\"post-b\">Режисер:</span> Метт Хейнеман<span class=\"post-br\"><br /></span><span class=\"post-b\">Сюжет:</span><br />Фільм про боротьбу з мексиканськими наркокартелями з обох боків кордону із США.</div></div><div class=\"sp-wrap\"><div class=\"sp-body\" title=\"Людина на канаті / Man on Wire (2008&amp;#41; \"><h3 class=\"sp-title\">Людина на канаті / Man on Wire (2008&amp;#41; </h3><span style=\"font-size: 20px; line-height: normal;\"><span style=\"color: red;\"><span class=\"post-b\"><span class=\"post-align\" style=\"text-align: center;\">Людина на канаті / Man on Wire (2008)</span></span></span></span><span class=\"post-align\" style=\"text-align: center;\"><var class=\"postImg\" title=\"https://img.hurtom.com/i/2017/01/AManonWire.md.jpg\">&#10;</var></span><span class=\"post-b\">Жанр: </span>документальний<br /><span class=\"post-b\">Країна:</span> Великобританія, США<span class=\"post-br\"><br /></span><span class=\"post-b\">Режисер:</span> Джеймс Марш<span class=\"post-br\"><br /></span><span class=\"post-b\">Сюжет:</span><br />Оскароносний фільм про Філіпа Петі і його проходження по канаті між будівлями Всесвітнього торгового центру в 1974 році. Цей вчинок був протизаконним, але отримав славу \"мистецького злочину століття\".</div></div><div class=\"sp-wrap\"><div class=\"sp-body\" title=\"Погляд тиші / The Look of Silence (2014&amp;#41;\"><h3 class=\"sp-title\">Погляд тиші / The Look of Silence (2014&amp;#41;</h3><span style=\"font-size: 20px; line-height: normal;\"><span style=\"color: red;\"><span class=\"post-b\"><span class=\"post-align\" style=\"text-align: center;\">Погляд тиші / The Look of Silence (2014)</span></span></span></span><span class=\"post-align\" style=\"text-align: center;\"><var class=\"postImg\" title=\"https://img.hurtom.com/i/2017/01/look.md.jpg\">&#10;</var></span><span class=\"post-b\">Жанр: </span>документальний<br /><span class=\"post-b\">Країна:</span> Данія, Індонезія, Фінляндія, Норвегія, Великобританія, Ізраїль, Франція, США, Німеччина, Нідерланди<span class=\"post-br\"><br /></span><span class=\"post-b\">Режисер:</span> Джошуа Оппенхаймер<span class=\"post-br\"><br /></span><span class=\"post-b\">Сюжет:</span><br />Фільм розповідає про геноцид в Індонезії в період 1965-1966 років. Історія зосереджується навколо сім\'ї, яка вижила в ті страшні часи і намагається знайти відповідальних за смерть декількох своїх членів.</div></div><div class=\"sp-wrap\"><div class=\"sp-body\" title=\"Сіль землі / The Salt of the Earth (2014&amp;#41; \"><h3 class=\"sp-title\">Сіль землі / The Salt of the Earth (2014&amp;#41; </h3><span style=\"font-size: 20px; line-height: normal;\"><span style=\"color: red;\"><span class=\"post-b\"><span class=\"post-align\" style=\"text-align: center;\">Сіль землі / The Salt of the Earth (2014)</span></span></span></span><span class=\"post-align\" style=\"text-align: center;\"><var class=\"postImg\" title=\"https://img.hurtom.com/i/2017/01/salt.md.jpg\">&#10;</var></span><span class=\"post-b\">Жанр: </span> документальний, біографія, історія<br /><span class=\"post-b\">Країна:</span> Франція, Бразилія, Італія<span class=\"post-br\"><br /></span><span class=\"post-b\">Режисер:</span> Джуліано Рібейру Сальгадо, Вім Вендерс<span class=\"post-br\"><br /></span><span class=\"post-b\">Сюжет:</span><br />Себастьян Сальгадо - видатний фотограф сучасності. Жодна подія не сховалося від його об\'єктива. Погляньте на світ іншими очима! Відкрийте для себе чарівну історію життя, що проникає прямо в серце.</div></div><div class=\"sp-wrap\"><div class=\"sp-body\" title=\"Туман війни / The Fog of War&amp;#58; Eleven Lessons from the Life of Robert S. McNamara (2003&amp;#41;\"><h3 class=\"sp-title\">Туман війни / The Fog of War&amp;#58; Eleven Lessons from the Life of Robert S. McNamara (2003&amp;#41;</h3><span style=\"font-size: 20px; line-height: normal;\"><span style=\"color: red;\"><span class=\"post-b\"><span class=\"post-align\" style=\"text-align: center;\">Туман війни / The Fog of War: Eleven Lessons from the Life of Robert S. McNamara (2003)</span></span></span></span><span class=\"post-align\" style=\"text-align: center;\"><var class=\"postImg\" title=\"https://img.hurtom.com/i/2017/01/fog.md.jpg\">&#10;</var></span><span class=\"post-b\">Жанр: </span> документальний, військовий, біографія, історія<br /><span class=\"post-b\">Країна:</span> США<span class=\"post-br\"><br /></span><span class=\"post-b\">Режисер:</span> Еррол Морріс<span class=\"post-br\"><br /></span><span class=\"post-b\">Сюжет:</span><br />Фільм є розповіддю про історію воєн 20-го століття з вуст одного з найбільш контроверсійних і впливових персонажів світової політики, колишнього міністра оборони США Роберта С. Макнамари. Чому минуле століття було настільки насичене всякого роду війнами і катастрофами? Чи справді людство приречене на вчинення одних і тих же непоправних помилок? Починаючи з бомбардування 100 тисяч мирних жителів Токіо в 1945 році і закінчуючи жахливими наслідками в\'єтнамської війни, «Туман війни» намагається проаналізувати хід думок глав провідних світових держав, що посилають своїх людей на війну.</div></div><div class=\"sp-wrap\"><div class=\"sp-body\" title=\"Фільм ще не має рейтингу / Фільм ще не оцінено / This Film Is Not Yet Rated (2006&amp;#41; \"><h3 class=\"sp-title\">Фільм ще не має рейтингу / Фільм ще не оцінено / This Film Is Not Yet Rated (2006&amp;#41; </h3><span style=\"font-size: 20px; line-height: normal;\"><span style=\"color: red;\"><span class=\"post-b\"><span class=\"post-align\" style=\"text-align: center;\">Фільм ще не має рейтингу / Фільм ще не оцінено / This Film Is Not Yet Rated (2006)</span></span></span></span><span class=\"post-align\" style=\"text-align: center;\"><var class=\"postImg\" title=\"https://img.hurtom.com/i/2017/01/film.md.jpg\">&#10;</var></span><span class=\"post-b\">Жанр: </span> документальний<br /><span class=\"post-b\">Країна:</span> США<span class=\"post-br\"><br /></span><span class=\"post-b\">Режисер:</span> Кірбі Дік<span class=\"post-br\"><br /></span><span class=\"post-b\">Сюжет:</span><br />Фільм про асоціацію MPAA і критерії присудження рейтингів тим чи іншим фільмам.</div></div><span class=\"post-b\">Щиро вдячні вам за участь у замовленні фільмів і підтримці українського озвучення!</span><div class=\"sp-wrap\"><div class=\"sp-body\" title=\"Як це робиться?\"><h3 class=\"sp-title\">Як це робиться?</h3>1) Обираємо фільм, який варто озвучити<br />2) Перевіряємо, чи не було і не буде показу<br />3) Проводимо публічне голосування<br />4) Домовляємося про ціну зі студіями<br />5) Замовляємо озвучення<br />6) Чекаємо<br />7) Завантажуємо реліз</div></div><div class=\"sp-wrap\"><div class=\"sp-body\" title=\"FAQ\"><h3 class=\"sp-title\">FAQ</h3>Хто вибрав \"кандидатів\" на озвучення?<br />Список складений адміністрацією Гуртом з врахуванням пропозицій користувачів.<br />Базові критерії:<br />- не було і не буде показу<br />- наявність Blu-Ray<span class=\"post-br\"><br /></span>Куди відправляти гроші?<br />Рахунок буде опубліковано пізніше.<span class=\"post-br\"><br /></span>Хто збиратиме гроші?<br />Цим займатиметься адміністрація Гуртом.<span class=\"post-br\"><br /></span>Де можна побачити список фільмів, які вже озвучено?<br /><a href=\"http://t.hurtom.com/10films\" class=\"postLink\" rel=\"nofollow\">http://t.hurtom.com/10films</a><br /><a href=\"https://toloka.to/t44797\" class=\"postLink\" rel=\"nofollow\">https://toloka.to/t44797</a></div></div>'),
(11, '2017-07-04 08:22:49', 'Любі Гуртомівці!<br />Прошу приєднуватися до ініціативи і робити собі футболки з символікою Гуртом!<div class=\"sp-wrap\"><div class=\"sp-body\" title=\"Лого\"><h3 class=\"sp-title\">Лого</h3><span class=\"post-align\" style=\"text-align: center;\"><var class=\"postImg\" title=\"https://toloka.to/files/gurtom3.2_945.png\">&#10;</var></span></div></div>Для того, щоб було легше обрати поліграфію, у якій друкуватимете, трохи розкажу про технологію. При цьому зупинюся лише на друці повно кольорового зображення. Адже таке воно у нас і є.<br />Існує кілька технологій повно кольорового друку: безпосереднє нанесення чорнил на футболку, термопереніс та сублімація.<span class=\"post-br\"><br /></span><span class=\"post-b\">1.Цифровий друк. </span><br />Саме так досягається найкраща стійкість зображення. Але у нашому випадку – 1 екземпляр – зазвичай ціна надто висока: називають від 20 до 50 грн., і скоріше 50.<br />І тут є ще один підводний камінь – чорнила. Якщо використовуються сольвентні – то це дуже шкідливо по-перше, і по-друге, футболка матиме неприємний запах.<br />Є також варіант УФ-затверджуваних чорнил – вони не мають запаху, і досить екологічні. Саме цей варіант я обрала як оптимальний. Хоча, нажаль скористатися ним не вийшло – мені треба було встигнути до відпустки, а єдина фірма у місті, яка використовує ці чорнила вичерпала їх запас, і чекала нової поставки.<br />14.04.2010 - зараз вони відмовляються працювати з малими партіями.<span class=\"post-br\"><br /></span><span class=\"post-b\">2. Термопереніс. </span><br />Саме результат термопереносу ви бачите на фотографії.<br />Варіант найдешевший та найдоступніший для одиничного замовлення. Але має цілий ряд недоліків, які виходять з технології.<br />Технологія полягає у тому, що зображення у дзеркальному відображенні друкується на звичайному струменевому принтері, але на спеціальному папері. Отримане зображення переноситься на футболку за допомогою термопресу при відповідній температурі. Футболка, звичайно, має бути 100% бавовняна, синтетика не витримає температури.<br />Готовий виріб витримує максимум 20 разів ручного прання без застосування сушки та відбілювачів.<br />Варто відмітити, що саме цим способом друкує більшість інтернет-магазинів.<br /><span class=\"post-b\"><br />3. Сублімація. </span><br />Технологія дуже схожа на попередню, але використовується виключно синтетична тканина, і при переносі чорнила вступають з нею у реакцію, і залишаються на тканині надовго.<br />Цей спосіб також дуже популярний серед інтернет-магазинів, але в моєму місті його пропонує лише одна фірма. І мене не влаштував варіант синтетичного виробу.<span class=\"post-br\"><br /></span><span class=\"post-b\">4. Нанесення спеціальних фарб через трафарет, або малювання по тканині. </span><br />Технологія досить проста, найекологічніша. У випадку використання трафарету потребує створення макету у векторі і вирізання трафарету на плоттері. хоча у крайньому випадку можна і руками.<br />Ось і все, що я хотіла розповісти про технології.<span class=\"post-br\"><br /></span><span class=\"post-i\"><span style=\"color: green;\">Величезна подяка пану hodek\'у за картинку!</span></span>'),
(12, '2017-07-04 08:25:30', '<span class=\"post-align\" style=\"text-align: center;\"><span style=\"font-size: 24px; line-height: normal;\"><span style=\"color: Red;\"><span class=\"post-b\">На</span></span><span style=\"color: Green;\"> <span class=\"post-b\">Толоці</span></span> <span style=\"color: Red;\"><span class=\"post-b\">критична нестача інструкцій для \"чайників\"</span></span></span></span><span class=\"post-align\" style=\"text-align: center;\"><var class=\"postImg\" title=\"http://img.hurtom.com/i/2016/10/1473765264_manualtic42544.jpg\">&#10;</var></span>Якщо Ви володієте такими уміннями та навичками як:<ul><li>Синхронізація аудіо доріжок з відео (сирих аудіо доріжок)<br /><li>Субтитрування відеоконтенту<br /><li>Запис з ТБ звукових доріжок<br /><li>Підтримкою та поширенням релізів</ul>Ви можете створити мануал/інструкцію з детальним алгоритмом дій для новачків, що захочуть продовжити Ваші починання заради загальновідомої мети - поширення українського в мережі, що відіграє важливу роль в теперішні часи інформаційних воєн.<span class=\"post-br\"><br /></span><span class=\"post-b\">P.S.</span> Відеоуроки <var class=\"postImg\" title=\"http://img.hurtom.com/i/2016/10/15.png\">&#10;</var>  вітаються! :)');
INSERT INTO `bb_posts_html` (`post_id`, `post_html_time`, `post_html`) VALUES
(13, '2017-07-04 08:46:29', '<span class=\"post-b\"><span style=\"font-size: 22px; line-height: normal;\"><span style=\"color: red;\"><span class=\"post-align\" style=\"text-align: center;\">ЯКЩО ХОЧЕТЕ БОДАЙ ЯКОСЬ ВПЛИНУТИ НА НЕВТІШНУ СИТУАЦІЮ,<br />ПИШІТЬ ЗВЕРНЕННЯ. ОСЬ ПОСИЛАННЯ З ДЕТАЛЬНОЮ ІНФОРМАЦІЄЮ </span></span></span><span class=\"post-align\" style=\"text-align: center;\"><span style=\"font-size: 20px; line-height: normal;\"><span class=\"post-b\"><a href=\"http://toloka.to/t37400\" class=\"postLink\" rel=\"nofollow\">http://toloka.to/t37400</a></span></span></span><span class=\"post-align\" style=\"text-align: center;\"><span style=\"font-size: 20px; line-height: normal;\"><span style=\"color: red;\"><br />Втрачені дубляжі</span></span></span><div class=\"q-wrap\"><div class=\"q\">вирішив створити тему, де будуть перераховуватись усі ті стрічки, які були ДУБЛЬОВАНІ на українську мову, але по тим чи іншим причинам на даний момент втрачені.</div></div><div class=\"q-wrap\"><div class=\"q\">Дублювання (від слова «дубль» — подвійний) або дубляж, або дубльований переклад — вид перекладу аудіовізуальних творів (фільмів, серіалів, мультфільмів), за якого відбувається повна заміна оригінального мовлення на іншу мову. Зазвичай це робиться з метою транслювання фільму у країні, де не говорять тією мовою, якою говорять персонажі цього аудіовізуального твору.<span class=\"post-align\" style=\"text-align: right;\"><a href=\"http://uk.wikipedia.org/wiki/%D0%94%D1%83%D0%B1%D0%BB%D1%8E%D0%B2%D0%B0%D0%BD%D0%BD%D1%8F\" class=\"postLink\" rel=\"nofollow\">&gt;&gt; Детальніше на ВІКІПЕДІЇ &lt;&lt;</a></span></div></div><span class=\"post-hr\">-</span><span class=\"post-hr\">-</span><span class=\"post-b\"><span style=\"font-size: 20px; line-height: normal;\"><span class=\"post-align\" style=\"text-align: center;\"><span class=\"post-b\">Оригінальне озвучення </span></span></span></span><span class=\"post-hr\">-</span><span class=\"post-hr\">-</span><div class=\"sp-wrap\"><div class=\"sp-body\" title=\"Список, на жаль, не повний\"><h3 class=\"sp-title\">Список, на жаль, не повний</h3>Літа молодії 1958 рік (фільм Кіностудії Довженка)<br />------------<br />Веселі Жабокричі (Весёлые Жабокричи) 1971 рік<br />------------<br />Лебедине озеро. Зона / Swan Lake. The Zone (1990)<br />(скрізь поверх ориґінальної укр. доріжки рашн. одноголоска, хоча в архівів можливо збереглась укр. ориґінальна версія звукової доріжки)<br />------------<br />Роксолана. Володарка темряви [серіал з 24-х серій] 2002-2003 рік</div></div><span class=\"post-hr\">-</span><span class=\"post-hr\">-</span><span class=\"post-b\"><span style=\"font-size: 20px; line-height: normal;\"><span class=\"post-align\" style=\"text-align: center;\"><span class=\"post-b\">НАШЕ, Російське та Радянське кіно</span></span></span></span><span class=\"post-hr\">-</span><span class=\"post-hr\">-</span><div class=\"sp-wrap\"><div class=\"sp-body\" title=\"Список (далеко не повний&amp;#41;\"><h3 class=\"sp-title\">Список (далеко не повний&amp;#41;</h3>Виборзька сторона (Выборгская сторона) 1938 рік [дубльовано в роки СРСР]<br />------------<br />Таємниця двох океанів (Тайна двух океанов) 1955-1956 роки [дубльовано в роки СРСР]<br />------------<br />Людина без паспорту (Человек без паспорта) 1965 рік [дубльовано в роки СРСР]<br />------------<br />Державний злочинець (Государственный преступник) 1965 рік [дубльовано в роки СРСР]<br />------------<br />Невловимі месники (Неуловимые мстители) 1966 рік [дубльовано в роки СРСР]<br />------------<br />Республіка ШКІД (Республика ШКИД) 1966 рік [дубльовано в роки СРСР]<br />На київській студії \"ім. Довженка\"<br />------------<br />Вій (Вий) 1967 рік [дубльовано в роки СРСР]<br />------------<br />Циган (Цыган) 1967 рік [дубльовано в роки СРСР]<br />На київській студії \"ім. Довженка\"<br />------------<br />Помилка Оноре де Бальзака 1968 рік [дубльовано в роки СРСР] фільм Студії Довженка<span class=\"post-br\"><br /></span>Джерело: 22 хв. 40 сек.<br />------------<br />Щит і меч (Щит и меч) 1968 рік [дубльовано в роки СРСР]<br />На київській студії \"ім. Довженка\"<br />------------<br />Чортова дюжина (Чертова дюжина) 1970 рік [дубльовано в роки СРСР]<br />На Одеській кіностудії<br />------------<br />Один з нас (Один из нас) 1970 рік [дубльовано в роки СРСР]<br />------------<br />Жодного дня без пригод (Ни дня без приключений) 1971 рік [дубльовано в роки СРСР]<br />На київській студії \"ім. Довженка\"<br />------------<br />Відвага (Дерзость) 1973 рік [дубльовано в роки СРСР]<br />На Одеській кіностудії<br />------------<br />Докер (Докер) 1973 рік [дубльовано в роки СРСР]<br />------------<br />17 миттєвостей весни (Семнадцать мгновений весны) 1973 рік [для ТБ]<br />Студією \"З Ранку До Ночі\" у 2006-му році, на замовлення телеканалу \"ТВі\"<br />------------<br />Іду своїм курсом (Следую своим курсом) 1974 рік [дубльовано в роки СРСР]<br />На Одеській кіностудії<br />------------<br />Військово-польовий роман 1983 рік [дубльовано в роки СРСР]<br />На Одеській кіностудії (дублювали Владислав Пупков - Миколу Бурляєва, Людмила Логійко - Інна Чурікова)<br />------------<br />Там, вдалині за рікою (Там вдали, за рекой) 1975 рік [дубльовано в роки СРСР]<br />На київській студії \"ім. Довженка\"<br />------------<br />Дама з папугою 1989 рік [дубльовано в роки СРСР] (фільм студії Довженка)<br />Джерело<br />------------<br />Діви ночі (Девы ночи) 2007 рік<br />------------<br />Таємничій острів (Таинственный остров) 2008 рік<br />------------<br />Райські птахи (Райские птицы) 2009 рік<br />------------</div></div><span class=\"post-hr\">-</span><span class=\"post-hr\">-</span><span class=\"post-b\"><span style=\"font-size: 20px; line-height: normal;\"><span class=\"post-align\" style=\"text-align: center;\"><span class=\"post-b\">Для телебачення</span></span></span></span><span class=\"post-hr\">-</span><span class=\"post-hr\">-</span><div class=\"sp-wrap\"><div class=\"sp-body\" title=\"Для телебачення\"><h3 class=\"sp-title\">Для телебачення</h3>Глибина (Below) 2002 рік [для ТБ]<br />Студією \"Pteroduction Sound\" у 2006-му році, на замовлення телеканалу \"СТБ\"<br />------------<br />Наталі (Nathalie...) 2003 рік [для ТБ]<br />Студією \"Pteroduction Sound\" у 2006-му році, на замовлення телеканалу \"СТБ\"<br />------------<br />Відкритий простір (Open Range) 2003 рік [для ТБ]<br />Студією \"Pteroduction Sound\" у 2006-му році, на замовлення телеканалу \"СТБ\"<br />------------<br />Привид опери (The Phantom of the Opera) 2004 рік [для ТБ]<br />Студією \"Pteroduction Sound\" у 2006-му році, на замовлення телеканалу \"СТБ\"<br />------------<br />Голова у хмарах (Head in the Clouds) 2004 рік [для ТБ]<br />Студією \"Pteroduction Sound\" у 2006-му році, на замовлення телеканалу \"СТБ\"<br />------------<br />Твої, мої та наші (Yours, Mine and Ours) 2005 рік [для ТБ, канал 1+1]<br />------------<br />88 хвилин / 88 minutes (2007) [для ТБ]<br />Студією \"Мова\" у 2006-му році, на замовлення телеканалу Україна</div></div></span><span class=\"post-hr\">-</span><span class=\"post-hr\">-</span><span class=\"post-b\"><span style=\"font-size: 20px; line-height: normal;\"><span class=\"post-align\" style=\"text-align: center;\"><span class=\"post-b\">Іноземне кіно (кіно-теятральні дубляжі) та для діяспори</span></span></span></span><span class=\"post-hr\">-</span><span class=\"post-hr\">-</span><div class=\"sp-wrap\"><div class=\"sp-body\" title=\"80-90 роки\"><h3 class=\"sp-title\">80-90 роки</h3>Роман з каменем (Romancing the Stone) 1984 рік [дубльовано в роки СРСР]<br />На київській студії \"ім. Довженка\"<br />------------<br />Несусвітні шахраї (Dirty Rotten Scoundrels) 1988 рік [дубльовано в роки СРСР]<br />На київській студії \"ім. Довженка\"<br />------------<br />Одружена з мафією (Married to the Mob) 1988 рік [дубльовано в роки СРСР]<br />На київській студії \"ім. Довженка\"<br />7 листопада 1992, УТ-1 перший показ, <a href=\"http://issuu.com/livoberezhna/docs/_91_1992\" class=\"postLink\" rel=\"nofollow\">http://issuu.com/livoberezhna/docs/_91_1992</a><br /><a href=\"http://toloka.to/t48753#666621\" class=\"postLink\" rel=\"nofollow\">http://toloka.to/t48753#666621</a><br />------------<br />Непристойна пропозиція / Indecent Proposal (1993) [дубльовано на студії Хлопушка 92-93 рік]<br />Інформація від Тетяни Антонової. Фільм з укр. дубляжем показували в Нью-Йорку 1993 року для української діяспори. (Діяспора і замовляла цей дубляж.)<br />------------<br />Зона висадки (Drop Zone) 1994 рік<br />На київській студії \"ім. Довженка\" для Львівського кіно-прокату<br />------------<br />Патруль часу (Timecop) 1994 рік<br />На київській студії \"ім. Довженка\" для Львівського кіно-прокату<br />------------</div></div><div class=\"sp-wrap\"><div class=\"sp-body\" title=\"2006-й рік\"><h3 class=\"sp-title\">2006-й рік</h3>Я, він, та ще один (You, Me and Dupree) 2006 рік<br />Студією \"Pteroduction Sound\" у 2006-му році, на замовлення \"B&amp;H\"<br />------------<br />Прокляття 2 (The Grudge 2) 2006 рік<br />Студією \"Пілот\" у 2006-му році, для кіно-прокату<br />------------<br />Чорна орхідея (The Black Dahlia) 2006 рік — Universal Pictures<br />Студією \"Пілот\" у 2006-му році, для кіно-прокату<br />------------<br />Відступники (The Departed) 2006 рік — Warner Bros<br />Кіно-прокатник \"Сінерґія\" (дубляж невідомої студії)<br />------------<br />Останній нащадок Землі (Children of Men) 2006 рік — Universal Pictures<br />Студією \"Лємма\" у 2006-му році, для кіно-прокату<br />------------<br />Диявол носить \"Прада\" (The Devil Wears Prada) 2006 рік — Twentieth Century Fox<br />Студією \"Невафільм Україна\" у 2006-му році, на замовлення \"Геміні\"<br />------------</div></div><div class=\"sp-wrap\"><div class=\"sp-body\" title=\"2007-й рік\"><h3 class=\"sp-title\">2007-й рік</h3>Година пік 3 (Rush Hour 3) 2007 рік<br />------------<br />Міст до Терабітії (Bridge to Terabithia) 2007 рік — Buena Vista Pictures<br />Студією \"Невафільм Україна\" у 2007-му році, на замовлення \"Геміні\"<br />------------<br />Трошки вагітна (Knocked Up) 2007 рік — Universal Pictures<br />Студією \"AdiozProduction Studio\" у 2007-му році, на замовлення \"B&amp;H\"<br />------------<br />Королівство (The Kingdom) 2007 рік — Universal Pictures<br />Студією \"AdiozProduction Studio\" у 2007-му році, на замовлення \"B&amp;H\"<br />------------<br />Красунчик (Keinohrhasen) 2007 рік<br />Студією \"Tretyakoff production\" у 2007-му році, на замовлення \"Геміні\"<br />------------<br />Мій домашній динозавр (The Water Horse) 2007 рік [стрічка була дубльована, але в прокат так і не вийшла]<br />Студією \"Postmodern\" у 2007-му році, для кіно-прокату<br />------------<br />Містер Бін у відпустці (Mr. Bean\'s Holiday) 2007 рік [стрічка була дубльована, але в прокат так і не вийшла]<br />Студією \"LeDoyen Studio\" у 2007-му році, для кіно-прокату<br />------------</div></div><div class=\"sp-wrap\"><div class=\"sp-body\" title=\"2008-й рік\"><h3 class=\"sp-title\">2008-й рік</h3>Мумія. Гробниця імператора драконів (The Mummy: Tomb of the Dragon Emperor) 2008 рік — Universal Pictures<br />Студією \"LeDoyen Studio\" у 2008-му році, на замовлення \"B&amp;H\"<br />------------<br />Так, ні, не знаю (Definitely, Maybe) 2008 рік — Universal Pictures<br />Студією \"AdiozProduction Studio\" у 2008-му році, на замовлення \"B&amp;H\"<br />------------<br />Той, що не залишає сліду (Untraceable) 2008 рік<br />Дистриб’ютор: \"JRC\" (дубляж невідомої студії)<br />------------<br />Смертельні перегони (Death Race) 2008 рік — Universal Pictures<br />Студією \"LeDoyen Studio\" у 2008-му році, на замовлення \"B&amp;H\"<br />------------<br />Mamma Mia! 2008 рік — Universal Pictures<br />Студією \"LeDoyen Studio\" у 2008-му році, на замовлення \"B&amp;H\"<br />------------<br />Війна Чарлі Вілсона (Charlie Wilson’s War) 2008 рік — Universal Pictures<br />Студією \"AdiozProduction Studio\" у 2008-му році, на замовлення \"B&amp;H\"<br />------------<br />Кохання поза правилами (Leatherheads) 2008 рік — Universal Pictures<br />Дистриб’ютор: \"B&amp;H\" (дубляж невідомої студії)<br />------------<br />В прольоті (Forgetting Sarah Marshall) 2008 рік — Universal Pictures<br />Студією \"LeDoyen Studio\" у 2008-му році, на замовлення \"B&amp;H\"<br />------------<br />Підміна (Changeling) 2008 рік — Universal Pictures<br />Дистриб’ютор: \"B&amp;H\" (дубляж невідомої студії)<br />------------<br />Пила V (Saw V) 2008 рік<br />Студією \"KyivPostModern\" у 2008-му році, на замовлення \"Каскад Україна\"<br />------------<br />Ворог держави №1 (Instinct de mort, L’) 2008 рік<br />Студією \"AdiozProduction Studio\" у 2008-му році, на замовлення \"JRC\"<br />------------<br />Відчайдушні шахраї / Ca$h (2008)<br />формально дублювали на AdiozProduction Studio, на замовлення \"Sinergia\"<br />------------</div></div><div class=\"sp-wrap\"><div class=\"sp-body\" title=\"2009-й рік\"><h3 class=\"sp-title\">2009-й рік</h3>Бруно (Brüno) 2009 рік [стрічка була дубльована, але в прокат так і не вийшла]<br />Студією \"Остання Барикада\" у 2009-му році, для кіно-прокату<br />------------<br />Геймер (Gamer) 2009 рік<br />Студією \"Tretyakoff production\" у 2009-му році, на замовлення \"Геміні\"<br />------------<br />Асистент вампіра (Cirque du Freak: The Vampire’s Assistant) 2009 рік — Universal Pictures<br />Студією \"LeDoyen Studio\" у 2009-му році, на замовлення \"B&amp;H\"<br />------------<br />Рок-хвиля (The Boat That Rocked) 2009 рік — Universal Pictures<br />Студією \"LeDoyen Studio\" у 2009-му році, на замовлення \"B&amp;H\"<br />------------<br />Бій без правил (Fighting) 2009 рік — Universal Pictures<br />Студією \"LeDoyen Studio\" у 2009-му році, на замовлення \"B&amp;H\"<br />------------<br />Ненароджений (The Unborn) 2009 рік — Universal Pictures<br />Студією \"LeDoyen Studio\" у 2009-му році, на замовлення \"B&amp;H\"<br />------------<br />Пригоди Геркулеса у 3D (Little Hercules in 3-D) 2009 рік<br />Дистриб’ютор: \"Геміні\" (дубляж невідомої студії)<br />------------<br />Ігри влади (State of Play) 2009 рік — Universal Pictures<br />Студією \"LeDoyen Studio\" у 2009-му році, на замовлення \"B&amp;H\"<br />------------<br />Справа 39 (Case 39) 2009 рік — Universal Pictures<br />Студією \"LeDoyen Studio\" у 2009-му році, на замовлення \"B&amp;H\"<br />------------</div></div><div class=\"sp-wrap\"><div class=\"sp-body\" title=\"2010-й рік\"><h3 class=\"sp-title\">2010-й рік</h3>Врата в 3D (The Hole) 2010 рік<br />Дистриб’ютор: \"Сінерґія\" (дубляж невідомої студії)<br />------------<br />Зірковий експорт (Get Him to the Greek) 2010 рік — Universal Pictures<br />Студією \"LeDoyen Studio\" у 2010-му році, на замовлення \"B&amp;H\"<br />------------<br />Диявол (Devil) 2010 рік — Universal Pictures<br />Студією \"LeDoyen Studio\" у 2010-му році, на замовлення \"B&amp;H\"<br />------------</div></div><div class=\"sp-wrap\"><div class=\"sp-body\" title=\"2011-й рік\"><h3 class=\"sp-title\">2011-й рік</h3>Без обману (The Dilemma) 2011 рік — Universal Pictures<br />Студією \"LeDoyen Studio\" у 2011-му році, на замовлення \"B&amp;H\"<br />------------<br />Земля забуття / La terre outragée (2011)<br />На замовлення “ТОВ “ОПЕРА ФІЛЬМ” (дубляж невідомої студії)<br />Офіційно в Україні, ліцензійні носії ще не вийшли<br />------------<br />Механік (The Mechanic) 2011 рік<br />Дистриб’ютор: \"Геміні\" (дубляж невідомої студії)<br />------------<br />Міняючи реальність (The Adjustment Bureau) 2011 рік — Universal Pictures<br />Студією \"LeDoyen Studio\" у 2011-му році, на замовлення \"B&amp;H\"<br />------------<br />Хочу як ти (The Change-Up) 2011 рік — Universal Pictures<br />Студією \"LeDoyen Studio\" у 2011-му році, на замовлення \"B&amp;H\"<br />Офіційно в Україні, ліцензійні носії ще не вийшли<br />------------<br />Як обікрасти хмарочос (Tower Heist) 2011 рік — Universal Pictures<br />Студією \"LeDoyen Studio\" у 2011-му році, на замовлення \"B&amp;H\"<br />Офіційно в Україні, ліцензійні носії ще не вийшли<br />------------</div></div><div class=\"sp-wrap\"><div class=\"sp-body\" title=\"2012-й рік\"><h3 class=\"sp-title\">2012-й рік</h3>Джунглі. В пошуках Марсупіламі / Sur la piste du Marsupilami (2012)<br />Студією \"Ді Ар\", на замовлення \"Вольга Україна\"<br />Офіційно в Україні, ліцензійні носії ще не вийшли<br />------------<br />Дикуни / Savages (2012) — Universal Pictures<br />Студією \"LeDoyen Studio\" у 2012-му році, на замовлення \"B&amp;H\"<br />Офіційно в Україні, ліцензійні носії ще не вийшли<br />------------<br />Захисник / Safe (2012)<br />На замовлення “Ukrainian Film Distribution ” (дубляж Tretyakoff production)<br />Розповсюджувач DVD в Україні — Астра<br />------------<br />Зоряні війни. Епізод I – прихована загроза (Star Wars: Episode I – The Phantom Menace) 1999/2012 рік 20th Century Fox<br />Студією \"Postmodern\", кіно-прокатник: \"Ukrainian Film Discribution\"<br />------------<br />Контрабанда (Contraband) 2012 рік — Universal Pictures<br />Студією \"LeDoyen Studio\" у 2012-му році, на замовлення \"B&amp;H\"<br />Офіційно в Україні, ліцензійні носії ще не вийшли<br />------------<br />Любий друг / Bel Ami (2012) —<br />Студією \"LeDoyen Studio\" у 2012-му році, на замовлення \"B&amp;H\"<br />Офіційно в Україні, ліцензійні носії ще не вийшли<br />------------<br />Любов об’єднує людей (LOL) 2012 рік<br />Студією \"LeDoyen Studio\" у 2012-му році, на замовлення \"Вольга Україна\"<br />Офіційно в Україні, ліцензійні носії ще не вийшли<br />------------<br />Нестримні 2 / The Expendables 2 (2012)<br />Студією \"Tretyakoff production\", на замовлення “Ukrainian Film Distribution ”<br />Офіційно в Україні, ліцензійні носії ще не вийшли<br />------------<br />Обладунки Бога 3. Місія Зодіак / Chinese Zodiac (2012)<br />Студією \"Ді Ар\", на замовлення \"Інтер-фільм\"<br />Офіційно в Україні, ліцензійні носії ще не вийшли<br />------------<br />Пограбування казино / Killing Them Softly (2012)<br />Студією \"Tretyakoff production\", на замовлення “Ukrainian Film Distribution ”<br />Офіційно в Україні, ліцензійні носії ще не вийшли<br />------------<br />Спадок Борна / The Bourne Legacy (2012) — Universal Pictures<br />Студією \"LeDoyen Studio\" у 2012-му році, на замовлення \"B&amp;H\"<br />Офіційно в Україні, ліцензійні носії ще не вийшли<br />------------<br />Третій зайвий / Ted (2012) — Universal Pictures<br />Студією \"LeDoyen Studio\" у 2012-му році, на замовлення \"B&amp;H\"<br />Офіційно в Україні, ліцензійні носії ще не вийшли<br />------------<br />Чоловік нарозхват / Playing for Keeps (2012)<br />Студією \"Tretyakoff production\", на замовлення “Ukrainian Film Distribution ”<br />Офіційно в Україні, ліцензійні носії ще не вийшли<br />------------</div></div><div class=\"sp-wrap\"><div class=\"sp-body\" title=\"2013-й рік\"><h3 class=\"sp-title\">2013-й рік</h3>....<span class=\"post-br\"><br /></span>07.02.2013 - Знедолені / Les Misérables (2012) | Мейджор – Universal Pictures | Дистриб’ютор - “B&amp;H” |<br />07.02.2013 - Хапай і тікай / Hit and Run (2013) | Дистриб’ютор - “Ukrainian Film Distribution” |<br />11.02.2013 - Стукач / Snitch (2013) | Дистриб’ютор - “Аврора-фільм” |<br />11.02.2013 - Повернення героя / The Last Stand (2013) | Дистриб’ютор - “Інтер-фільм” |<br />28.02.2013 - Кохання по-дорослому / This Is 40 (2012) | Мейджор – Universal Pictures | Дистриб’ютор - “B&amp;H” |<br />14.03.2013 - Останнє вигнання диявола. Друге пришестя / The Last Exorcism Part II (2013) | Дистриб’ютор - “Ukrainian Film Distribution” |<br />04.04.2013 - Одним менше / Dead Man Down (2013) | Дистриб’ютор - “Інтер-фільм” |<br />18.04.2013 - Мьобіус / Möbius (2013) | Дистриб’ютор - “Аврора-фільм” |<br />04.07.2013 - Спокусник 2 / Kokowääh 2 (2013) | Дистриб’ютор - “Ukrainian Film Distribution” |<br />01.08.2013 - РЕД 2 / Red 2 (2013) | Дистриб’ютор - “Інтер-фільм” |<br />15.08.2013 - Параноя / Paranoia (2013) | Дистриб’ютор - “Інтер-фільм” |<br />24.10.2013 - +1 / +1 (2013) | Дистриб’ютор - “Ukrainian Film Distribution” |<span class=\"post-br\"><br /></span>....<span class=\"post-br\"><br /></span>01.01.2013 - Анна Кареніна / Anna Karenina (2012) | Мейджор – Universal Pictures | Дистриб’ютор - “B&amp;H” |<br />17.01.2013 - Мама / Mama (2013) | Мейджор – Universal Pictures | Дистриб’ютор - “B&amp;H” |<br />21.03.2013 - Піймай шахрайку, якщо зможеш / Identity Thief (2013) | Мейджор – Universal Pictures | Дистриб’ютор - “B&amp;H” |<br />04.04.2013 - Парк Юрського періоду / Jurassic Park (1993) | Мейджор – Universal Pictures | Дистриб’ютор - “B&amp;H” |<br />04.04.2013 - Падіння Олімпу / Olympus Has Fallen (2013) | Дистриб’ютор - “Аврора-фільм” |<br />11.04.2013 - Світ забуття / Oblivion (2013) | Мейджор – Universal Pictures | Дистриб’ютор - “B&amp;H” |<br />25.04.2013 - Кров’ю і потом: Анаболіки / Pain &amp; Gain (2013) | Дистриб’ютор - “Аврора-фільм” |<br />23.05.2013 - Форсаж 6 / Furious 6 (2013) | Мейджор – Universal Pictures | Дистриб’ютор - “B&amp;H” |<br />12.06.2013 - Ілюзія обману / Now You See Me (2013) | Дистриб’ютор - “Інтер-фільм” |<br />25.07.2013 - R.I.P.D. Примарний патруль / R.I.P.D. (2013) | Мейджор – Universal Pictures | Дистриб’ютор - “B&amp;H” |<br />08.08.2013 - З ким переспати?!! / The To Do List (2013) | Дистриб’ютор - “Ukrainian Film Distribution” |<br />15.08.2013 - Пипець 2 / Kick-Ass 2 (2013) | Дистриб’ютор - “B&amp;H” |<br />10.10.2013 - Полонянки / Prisoners (2013) | Дистриб’ютор - “Ukrainian Film Distribution” |<br />17.10.2013 - Ромео і Джульєтта / Romeo and Juliet (2013) | Дистриб’ютор - “Вольга Україна” |<br />31.10.2013 - Індики: назад в майбутнє / Free Birds (2013) | Дистриб’ютор - “Аврора-фільм” |<br />05.12.2013 - Паганіні: скрипаль диявола / The Devil’s Violinist (2013) | Дистриб’ютор - “Галеон Кіно” |<span class=\"post-br\"><br /></span>------------</div></div><div class=\"sp-wrap\"><div class=\"sp-body\" title=\"2014-й рік\"><h3 class=\"sp-title\">2014-й рік</h3>....<span class=\"post-br\"><br /></span>16.01.2014 - Надія не згасне / All Is Lost (2014) | Мейджор – Universal Pictures | Дистриб’ютор - “B&amp;H” |<br />06.03.2014 - Люблю. Назавжди / Endless Love (2014) | Мейджор – Universal Pictures | Дистриб’ютор - “B&amp;H” |<br />10.04.2014 - Дівергент / Divergent (2014) | Дистриб’ютор - “Інтер-фільм” |<br />01.05.2014 - Танцюй звідси! / Cuban Fury (2014) | Дистриб’ютор - “Вольга Україна” |<br />12.05.2014 - Принцеса Монако / Grace of Monaco (2014) | Дистриб’ютор - “Аврора-фільм” |<br />11.09.2014 - Наднебезпечний / A Most Wanted Man (2014) | Дистриб’ютор - “Вольга Україна” |<br />11.09.2014 - Одержимість Майкла Кінга / The Possession of Michael King (2014) | Дистриб’ютор - “Ukrainian Film Distribution” |<br />18.09.2014 - Небеса реальні / Heaven Is for Real (2014) | Мейджор – Sony Pictures Releasing | Дистриб’ютор - “B&amp;H” |<br />02.10.2014 - Клуб Вінкс: Таємниця морської безодні / Winx Club: Il mistero degli abissi (2014) | Дистриб’ютор - “Галеон кіно” |<br />16.10.2014 - Магія місячного сяйва / Magic in the Moonlight (2014) | Дистриб’ютор - “Мульти Медіа Дистриб’юшн” |<span class=\"post-br\"><br /></span>....<br />02.01.2014 - 47 Ронін / 47 Ronin (2013) | Мейджор – Universal Pictures | Дистриб’ютор - “B&amp;H” |<br />09.01.2014 - Тарзан / Tarzan (2013) | Дистриб’ютор - “Інтер-фільм” | ознайомитись |<br />13.03.2014 - Повітряний маршал / Non-Stop (2014) | Дистриб’ютор - “Аврора-фільм” |<br />10.04.2014 - 3 дні на вбивство / 3 Days to Kill (2014) | Дистриб’ютор - “Аврора-фільм” |<br />10.04.2014 - Шалений патруль / Ride Along (2014) | Мейджор – Universal Pictures | Дистриб’ютор - “B&amp;H” |<br />08.05.2014 - 13-й район: Цегляні маєтки / Brick Mansions (2014) | Дистриб’ютор - “Галеон кіно” |<br />03.07.2014 - Почати знову / Begin Again (2014) | Дистриб’ютор - “Ukrainian Film Distribution” |<br />17.07.2014 - Юність / Boyhood (2014) | Мейджор – Universal Pictures | Дистриб’ютор - “B&amp;H” |<br />28.08.2014 - Посвячений / The Giver (2014) | Дистриб’ютор - “Аврора-фільм” |<br />04.09.2014 - Париж: Місто мертвих / As Above, So Below (2014) | Мейджор – Universal Pictures | Дистриб’ютор - “B&amp;H” | ознайомитись |<br />11.09.2014 - Сьомий гном / Der 7bte Zwerg (2014) | Дистриб’ютор - “Ukrainian Film Distribution” |<br />11.09.2014 - Прянощі та пристрасті / The Hundred-Foot Journey (2014) | Дистриб’ютор - “Інтер-фільм” |<br />16.10.2014 - Прогулянка серед могил / A Walk Among the Tombstones (2014) | Мейджор – Universal Pictures | Дистриб’ютор - “B&amp;H” |<br />11.09.2014 - Віджа. Смертельна гра / Ouija (2014) | Мейджор – Universal Pictures | Дистриб’ютор - “B&amp;H” | ознайомитись |<span class=\"post-br\"><br /></span>------------</div></div><div class=\"sp-wrap\"><div class=\"sp-body\" title=\"2015-й рік\"><h3 class=\"sp-title\">2015-й рік</h3>....<span class=\"post-br\"><br /></span>\"Multi Media Distribution або Мульти Медіа Дистриб’юшн\" до жовтня 2014 була під назвою \"Аврора-фільм\"<span class=\"post-br\"><br /></span>....<span class=\"post-br\"><br /></span>01.01.2015 - Снігова королева 2: Перезаморозка / Снежная королева 2: Перезаморозка (2015) | Дистриб’ютор - “Мульти Медіа Дистриб’юшн” |<br />26.02.2015 - Барбі. Супер принцеса / Barbie in Princess Power (2015) | Мейджор – Universal Pictures | Дистриб’ютор - “B&amp;H” |<br />30.04.2015 - Небезпечне занурення / Pressure (2015) | Дистриб’ютор - “TFD” |<br />04.05.2015 - Астрал. Частина третя / Insidious: Chapter 3 (2015) | Мейджор – Columbia Pictures | Дистриб’ютор - “B&amp;H” |<br />30.05.2015 - Із темряви / Out of the Dark (2015) | Мейджор – Vertical Entertainment | Дистриб’ютор - “Ukrainian Film Distribution” |<br />30.07.2015 - Прискорення / Momentum (2015) | Дистриб’ютор - “Мульти Медіа Дистриб’юшн” |<br />30.07.2015 - Ватиканські записи / The Vatican Tapes (2015) | Мейджор – Lionsgate | Дистриб’ютор - “Мульти Медіа Дистриб’юшн” |<br />13.08.2015 - Хто я? / Who Am I – Kein System ist sicher (2015) | Мейджор – Sony Pictures Releasing | Дистриб’ютор - “Мульти Медіа Дистриб’юшн” |<br />27.08.2015 - Упс… Ной відплив! / Ooops! Noah is Gone… (2015) | Мейджор – Entertainment One | Дистриб’ютор - “Ukrainian Film Distribution” |<br />27.08.2015 - Атака титанів. Фільм перший. Жорстокий світ / Shingeki no kyojin: Attack on Titan (2015) | Дистриб’ютор - “Ukrainian Film Distribution” |<span class=\"post-br\"><br /></span>....<span class=\"post-br\"><br /></span>15.01.2015 - Хакер / Blackhat (2015) | Мейджор – Universal Pictures | Дистриб’ютор - “B&amp;H” |<br />19.02.2015 - Теорія всього / The Theory of Everything (2015) | Мейджор – Universal Pictures | Дистриб’ютор - “B&amp;H” |<br />16.04.2015 - Екс машина / Ex Machina (2015) | Мейджор – Universal Pictures | Дистриб’ютор - “B&amp;H” |<br />14.05.2015 - Ідеальний голос 2 / Pitch Perfect 2 (2015) | Мейджор – Universal Pictures | Дистриб’ютор - “B&amp;H” |<br />11.06.2015 - Викрадення містера Хайнекена / Kidnapping Mr. Heineken (2015) | Дистриб’ютор - “UFD” |<br />03.09.2015 - Втікач / The Runner (2015) | Дистриб’ютор - “Мульти Медіа Дистриб’юшн” |<br />15.10.2015 - Багряний пік / Crimson Peak (2015) | Мейджор – Universal Pictures | Дистриб’ютор - “B&amp;H” | ознайомитись |<br />12.11.2015 - Зелене пекло / The Green Inferno (2013) | Дистриб’ютор - “Ukrainian Film Distribution” | ознайомитись |<br />12.11.2015 - Стів Джобс / Steve Jobs (2015) | Мейджор – Universal Pictures | Дистриб’ютор - “B&amp;H” | ознайомитись |<br />19.11.2015 - Секрет у їхніх очах / Secret in Their Eyes (2013) | Дистриб’ютор - “Ukrainian Film Distribution” | ознайомитись |<br />СКОРІШ ЗА ВСЕ БУЛО ДУБЛЬОВАНО, ПРОТЕ В ПРОКАТ ТАК І НЕ ВИЙШЛО, ТА ДЕІНДЕ НЕ З\'ЯВИЛОСЬ<span class=\"post-br\"><br /></span>Спецоперація “Інтерв\'ю” (The Interview) (2015) | Дистриб’ютор - “B&amp;H” |<span class=\"post-br\"><br /></span>------------</div></div><div class=\"sp-wrap\"><div class=\"sp-body\" title=\"2016-й рік\"><h3 class=\"sp-title\">2016-й рік</h3>....<span class=\"post-br\"><br /></span>14.01.2016 - Крід / Creed (2015) | Дистриб’ютор - “Кіноманія” |<br />04.02.2016 - Затемнення / Regression (2015) | Дистриб’ютор - “Вольга Україна” |<br />18.02.2016 - Барбі: Шпигунська історія / Barbie: Spy Squad (2016) | Мейджор – Universal Pictures | Дистриб’ютор - “B&amp;H” |<br />11.07.2016 - У чорта на куличках / Quo vado? (2016) | Дистриб’ютор - “Мульти Медіа Дистриб’юшн” |<br />25.07.2016 - Будь-якою ціною / Hell or High Water (2016) | Дистриб’ютор - “Мульти Медіа Дистриб’юшн” |<br />29.09.2016 - Дуелянт / Дуэлянт (2016) | Мейджор – Sony Pictures | Дистриб’ютор - “B&amp;H”<br />06.10.2016 - Крейсер «Індіанаполіс» / USS Indianapolis: Men of Courage (2016) | Дистриб’ютор - “Мульти Медіа Дистриб’юшн” |<br />20.10.2016 - Колектор / Коллектор (2016) | Дистриб’ютор - “Мульти Медіа Дистриб’юшн” |<br />10.11.2016 - Розлучення з хвостом / Who Gets The Dog? (2016) | Дистриб’ютор - “Мульти Медіа Дистриб’юшн” |<br />24.11.2016 - Палає, палає, палає / Burn Burn Burn (2016) | Дистриб’ютор - “Cinemaker Distribution” |<br />24.11.2016 - Моє велике грецьке весілля 2 / My Big Fat Greek Wedding 2 (2016) | Дистриб’ютор - “Ukrainian Film Distribution” |<br />08.12.2016 - Синдбад. Пірати семи штормів / Синдбад. Пираты семи штормов (2016) | Дистриб’ютор - “Мульти Медіа Дистриб’юшн” |<br />15.12.2016 - Провина / Misconduct (2016) | Дистриб’ютор - “Ukrainian Film Distribution” |<br />....<br />01.01.2016 - Іван Царевич та Сірий Вовк 3 / Иван Царевич и Серый Волк 3 (2016) | Дистриб’ютор - “Галеон Кіно” | ознайомитись |<br />07.01.2016 - Сестри / Sisters (2015) | Мейджор – Universal Pictures | Дистриб’ютор - “B&amp;H” | ознайомитись |<br />21.01.2016 - Дівчина з Данії / The Danish Girl (2015) | Мейджор – Focus Features | Дистриб’ютор - “B&amp;H” | ознайомитись |<br />СКОРІШ ЗА ВСЕ БУЛО ДУБЛЬОВАНО, ПРОТЕ В ПРОКАТ ТАК І НЕ ВИЙШЛО, ТА ДЕІНДЕ НЕ З\'ЯВИЛОСЬ<br />Аве, Цезар! (Hail, Caesar!) (2016) | Мейджор – Universal Pictures | Дистриб’ютор - “B&amp;H” | офіційний український трейлер |</div></div>'),
(14, '2017-07-06 13:05:34', 'Вітання.<br />Колись вмирав зі сміху від тої творчості цього прекрасного чоловіка.<br />Тепер в неті лише 2 гуморески йогоє і то Про Гриця Совківа обрізана дуже...<span class=\"post-br\"><br /></span>Хтось шось знає чи може поділитися???<br />Буду дуже вдячний!!!<span class=\"post-br\"><br /></span>Трохи інфи:<br />Стася і Дзюньо — союз психіатра і депутата<br />Людмила ПУЛЯЄВА Фото Володимира ДУБАСА<br />18 квітня Львівська обласна філармонія зібрала два аншлагові концерти: 15-річчя свого сценічного «шлюбу» святкували пані Стася і пан Дзюньо з львівського театру “Не журись!”<br />Стася і Дзюньо — союз психіатра і депутата<span class=\"post-br\"><br /></span>Як і годиться, привітати ювілярів прийшли і їхні друзі та колеги по сцені: народний артист України Роман Вітошинський, заслужена артистка України Наталія Романюк, соліст Вашингтонської опери Стефан П’ятничко, співак Валерій Степовий, гурт Олега Кульчицького, батяр-бенд “Галичина” і художній керівник театру “Не журись!” Віктор Морозов.<span class=\"post-br\"><br /></span>Союз Стасі і Дзюня почався з вистави театру “Не журись!” “Картотека пана Базя”. Пан Базьо займався тим, що сватав самотніх людей.<span class=\"post-br\"><br /></span>Хто ж ховається за цими сценічними масками, особливість яких полягає у незмінності і стабільності образів впродовж усіх 15-ти років? Хай розкажуть самі.<span class=\"post-br\"><br /></span>Пан Дзюньо (Богдан Рибка): “Я молюся двом богам – Мельпомені і Гіппократу. Працюю в Обласній клінічній психіатричній лікарні лікарем-психіатром. Мистецтво іде паралельно. Ми недержавний театр, хоча я і є членом Спілки театральних діячів України.<span class=\"post-br\"><br /></span>Саме знання психології людей підштовхнуло мене до створення образу пана Дзюня. Стася і Дзюньо - з нашого середовища, хоча і є трохи гротесковими, акцінтуйованими. Акцінтуйована особистість - у психології не патологія, а такий собі пограничний стан. За 15 років ми уже так зжилися зі своїми масками, що я відгукуюсь на “пана Дзюня”.<span class=\"post-br\"><br /></span>Пані Стася (заслужений діяч мистецтв України Остап Федоришин): “У житті я буваю похмурим і розважливим. Але думаю собі: якщо всі такими будуть, то не варто жити. І тоді намагаюся жартами розвеселити ще більш похмурих за мене людей. А взагалі, я багато чим займаюся. Працюю над антологією українського анекдоту, віддаю час обласній раді як депутат від Жидачівського району, буваю двічі на тиждень у своєму окрузі і намагаюся допомогти нужденним, чиї права утискають можновладці. Люди у селі дуже делікатні, а чиновники знахабнілі… Також люблю працювати на дачі. У моїх парниках першими з’являються редька, часник, свіжа цибулька. На дачі мені легко працюється і творчо. Туди часто приїжджають Дзюньо і Віктор Морозов, обговорюємо плани на перспективу.<span class=\"post-br\"><br /></span>У Віктора Морозова я запитала про особливість цього дуету і відмінність його від інших естрадних пар.<span class=\"post-br\"><br /></span>- Перш за все вони відрізняються тим, що обігрують суто наші, галицькі, події, - відповів пан Віктор, - і коментують їх на галицькому діалекті. Цим специфічним діалектом на сцені більше ніхто так не володіє. Вони знайшли свій неповторний образ. Їхня константа залишається незмінною від часу їх народження у виставі “Картотека пана Базя”. Їм вдалося створити колоритні образи львівського пузатенького міщука – своєрідного Санчо Панси – і Дон Кіхота, який є чи то жінкою, чи то трансвеститом. Це настільки гармонійна пара, що окремо їх уявити тепер уже дуже важко.'),
(15, '2017-07-06 13:06:15', 'Гуртомівці щукаю такі програми бажано з рідним інтерфейсом!!<br />Фотошоп (Adobe Photoshop CS4),<br />Дримвівер (Adobe Dreamweaver CS4),<br />Флеш (Adobe Flash CS4 Professional),<br />Свіш (SwishMax 2.0),<br />Афтер Ефектс (Adobe After Effects CS4),<br />Прем’єр (Adobe Premier CS4 Pro).<br />Хто може викласти їх??..Вуду вдячний!!'),
(16, '2017-07-06 13:09:23', '<span class=\"post-align\" style=\"text-align: center;\"><a href=\"http://img.hurtom.com/image/LUT\" class=\"postLink\" rel=\"nofollow\"><var class=\"postImg\" title=\"http://img.hurtom.com/i/2017/07/video-games-pacman_icon-icons.com_48378.png\">&#10;</var></a></span>1.<br />Crazy Machines 1<br />Crazy Machines 2<br />Crazy Machines 3<span class=\"post-br\"><br /></span>2.<br />The Sims 2 - Collection13in1<span class=\"post-br\"><br /></span>3.<br />Billiard Deluxe<br />PerfectPool<span class=\"post-br\"><br /></span>4.<br />Crashday<span class=\"post-br\"><br /></span>5.<br />El Matador [PCDVD][English]<span class=\"post-br\"><br /></span>6.<br />Farcry<br />Far Cry Illusion of War<br />FarCry - Дьявольский остров<br />FarCry_Commando<span class=\"post-br\"><br /></span>7.<br />HITMAN_Blood_Money<span class=\"post-br\"><br /></span>8.<br />Land Rover vs Ford<span class=\"post-br\"><br /></span>9.<br />Need For Speed 3<br />NFS Underground<br />The Need For Speed Underground 2<br />NFS_MW<br />NFS Carbon<br />Need For Speed Pro Street<span class=\"post-br\"><br /></span>10.<br />Quake 3 Arena<span class=\"post-br\"><br /></span>11.<br />Xpand Rally Xtreme<span class=\"post-br\"><br /></span>12.<br />Антологія JUICED<span class=\"post-br\"><br /></span>13.<br />Bus Driver<span class=\"post-br\"><br /></span>14.<br />COMMANCH 4<span class=\"post-br\"><br /></span>15.<br />RACE 07 - Чемпіонат WTCC<span class=\"post-br\"><br /></span>16.<br />Micro Machines 4<span class=\"post-br\"><br /></span>17.<br />Half.Life.2.Episode.One<br />Half.Life.2.Episode.Two-Unleashed<span class=\"post-br\"><br /></span>18.<br />Battlefield 2<span class=\"post-br\"><br /></span>19.<br />Alarm_Crash_Time(Arcade2007)<span class=\"post-br\"><br /></span>20.<br />Worms 4 Mayhem<br />Worms portable<span class=\"post-br\"><br /></span>21.<br />CounterStrike 1.6 [інтернет+боти+моделі зброї і персонажі зі SOURCE]<br />CounterStrike: Русский Спецназ<br />CounterStrike Source<br />CounterStrike: FusionPack<span class=\"post-br\"><br /></span>22.<br />3DSexVilla_v2.034.001_Cracked (якщо Konfucius дозволить Wide grin  Wide grin  Wide grin )<span class=\"post-br\"><br /></span>23.<br />25 To Life<span class=\"post-br\"><br /></span>24.<br />Mafia Modern Mod<span class=\"post-br\"><br /></span>25.<br />GTA San Andreas (original)<span class=\"post-br\"><br /></span>26.<br />True Crime<span class=\"post-br\"><br /></span>Це ще не повний список. Можу викласти кожну гру з цього списку.<br />P.S.: якщо під номером вказано кілька ігор, то це тільки для впорядкування, викладаю кожну гру окремо. Wide grin'),
(17, '2017-07-06 13:11:26', 'Гуртом як проект підтримки всього українського розвивається зусиллями тисяч ентузіастів, які поступово наповнюють його усім, що надибали українського в Інтернетрях.<span class=\"post-br\"><br /></span>Разом з тим, <span class=\"post-u\">абсолютна більшість українського контенту все ще залишається поза нашим проектом. </span><br />Знаходить, приміром, людина рідкісну українську книгу / музичний альбом / ще щось на якомусь із файлообмінників, торрент-трекерів і т.д. Однак чи то в неї інтернет помегабайтний, чи немає аккаунта/довго чекати для завантаження.<span class=\"post-br\"><br /></span><span style=\"color: green;\">Впевнений, що чимало користувачів Гуртом мають в активі золоті аккаунти на рапідшеа / депозит / інші, високу швидкість + безлімітний інтернет і могли б пачками вантажити знайдений таким чином український контент на Гуртом.<span class=\"post-br\"><br /></span>Така програма діє здебільшого на обмінниках, хостингах сайтів (не буду називати яких).<br />Якось подумав, чи не можна було б таке застосувати і для нашого, для багатьох вже рідного Hurtom?Happy </span><span class=\"post-br\"><br /></span>Для цього і створена дана тема.<br /><span class=\"post-b\"><br />Організіція процесу перезаливання відбувається за наступною схемою: </span><span class=\"post-br\"><br /></span>1. будь-хто із небайдужих до українського знаходить десь під час перегляду найрізноманітніших ресурсів якийсь український контент (фільм, книгу, програму і т.д.), якого немає на Гуртом (для перевірки використовується Пошук)<span class=\"post-br\"><br /></span>після віднайдення гуртівець копіює посилання, переходить у цю тему і створює невелике повідомлення, що обов\'язково має включати наступні складові:<br />- назва знайденого (фільму, книги, програми - тип знайденого теж доцільно зазначити у дужках)<br />- розмір знайденого<br />- під спойлером (і тільки так) - саме посилання.<br /><span style=\"color: green;\"><br />приклад:<br />(диск) Київ. Історична енциклопедія. З найдавніших часів до 1917 р. (UKR/RUS/x86)<br />442.07 MB</span><br />2. будь-хто із небайдужих (що має хвильку вільного часу та достатні кодиції інтернету для завантаження + привілейовані аккаунти) бере посилання із теми, завантажує контент і розміщує його на Гуртом.<span class=\"post-br\"><br /></span>методика роботи буде постійно вдосконалюватися.<br /><span class=\"post-b\"><br />Наразі відбувається перезаливання: </span><span class=\"post-br\"><br /></span>Konfucius - Бібліотека \"Літера\" (понад 4 тисячі книг у різноманітних форматах)<br />cizarion - Бібліотека \"Читанка\" (1400 книг і журналів для дітей у djvu форматі)'),
(19, '2017-07-06 13:22:12', 'Дана інструкція написана для людей, які не можуть самотужки розібратися як же потрібно користуватися торрентами і задають питання, молять модераторів та користувачів, щоб їм допомогли завантажити фільм, книжку, музику, бо їм дуже требаHappy . Інструкція писалася для програми µTorrent, яка працює в операційних системах windows, mac та linux (через wine). Програм існує багато, хоча за великим рахунком послідовність дії не буде сильно відрізнятися від розписаних тут, якщо є бажання і час можете зробити щось подібне і для інших програм. Скріншоти, які використані тут для ілюстрації зроблені на Вісті x64 SP1.<span class=\"post-br\"><br /></span>1. Для початку Вам потрібно завантажуємо і встановлюємо µTorrent. Завантажити інсталяційний файл та українізатор (Для встановлення українізатора копіюємо файл utorrent.exe.lang.txt в папку куди встановили програму)<span class=\"post-br\"><br /></span>2. При першому запуску програми з\'явиться вікно майстра швидкості. Тут відповідно до швидкості вашого інтернету (якщо точніше швидкості віддачі) вибираємо з варіантів. Тут же проводимо тест на відкритість порту, який буде використовуватися. (Для тесту відкритості порту відкриється ваш браузер)<div class=\"sp-wrap\"><div class=\"sp-body\" title=\"Вікно майстра швидкості µTorrent\"><h3 class=\"sp-title\">Вікно майстра швидкості µTorrent</h3><var class=\"postImg\" title=\"https://toloka.to/files/fotky-files/15352_f74ob.png\">&#10;</var></div></div><div class=\"sp-wrap\"><div class=\"sp-body\" title=\"Перевірка відкритості порту µTorrent\"><h3 class=\"sp-title\">Перевірка відкритості порту µTorrent</h3><var class=\"postImg\" title=\"https://toloka.to/files/fotky-files/15351_o3bbn.png\">&#10;</var></div></div>Також зверніть увагу на значки індикатори мережі по середині знизу.<div class=\"sp-wrap\"><div class=\"sp-body\" title=\"Значки-індикатори мережі в µTorrent\"><h3 class=\"sp-title\">Значки-індикатори мережі в µTorrent</h3><var class=\"postImg\" title=\"https://toloka.to/files/fotky-files/3729_wfe9g.png\">&#10;</var> - Індикатор стає зеленим при появі першого ж вхідного з\'єднання. Це означає, що ваш порт точно доступний.<br /> <var class=\"postImg\" title=\"https://toloka.to/files/fotky-files/3727_4akup.png\">&#10;</var>- Відразу після старту µTorrent показує внизу жовтий індикатор, що означає, що вхідних з\'єднань поки що немає. Якщо ваш клієнт з\'єднаний з невеликою кількістю пірів, то індикатор може залишатися жовтим довго.<br /><var class=\"postImg\" title=\"https://toloka.to/files/fotky-files/3728_fqmqv.png\">&#10;</var> - Червоний гурток з\'являється, коли клієнт остаточно вирішує, що ваш порт недоступний - у нього вже давно є безліч вихідних з\'єднань, але до цього часу ні одного вхідного.<br /> <var class=\"postImg\" title=\"https://toloka.to/files/fotky-files/3728_fqmqv.png\">&#10;</var> - Якщо червоний індикатор з\'являється відразу при старті клієнта, і при підведенні до нього курсору з\'являється напис «Помилка порту. Потрібно змінити порт, як правило, це означає, що порт вже зайнятий іншою програмою - наприклад, у вас вже запущений інший торрент клієнт, у якого в настройках вказано той же номер порту.</div></div>Якщо порт відкритий переходимо далі, якщо ж ні читаємо тут. В деяких випадках закритий порт не є перешкодою для завантаження, але він обмежить швидкість і можуть виникнути проблеми з завантаженням. (Про це дивись в пункті 1 цієї інструкції)<span class=\"post-br\"><br /></span>3. Тепер знаходимо щось на трекері з того що хочеться завантажити і шукаємо знизу шапки релізу посилання на торрент-файл і завантажуємо його. Для прикладу почнемо завантажувати ось цей реліз Хоробре серце / Braveheart (1995) DVDRip Ukr/Eng. Якщо Вам сподобався реліз тиснемо також кнопку Дякую, релізерам буде приємно. Тут також можна проставити оцінку роздачі і переглянути список файлів які будуть завантажуватися.<div class=\"sp-wrap\"><div class=\"sp-body\" title=\"Завантаження торрент файлу з нашого трекеру\"><h3 class=\"sp-title\">Завантаження торрент файлу з нашого трекеру</h3><var class=\"postImg\" title=\"https://toloka.to/files/fotky-files/15354_3vsja.png\">&#10;</var></div></div>4. Відкриваємо завантажений нами торрент-файл в µTorrent.<div class=\"sp-wrap\"><div class=\"sp-body\" title=\"Відкриття торрент файлу в µTorrent\"><h3 class=\"sp-title\">Відкриття торрент файлу в µTorrent</h3><var class=\"postImg\" title=\"https://toloka.to/files/fotky-files/15375_bmkoo.png\">&#10;</var><br />Або просто два рази клацаємо на торрент-файлі який вже був завантажений у випадку якщо файли *.torrent запрограмовані на відкриття в µTorrent</div></div>5. Далі потрібно у вікні вибирати куди завантажувати файли (1) та які саме файли, якщо в роздачі їх декілька і всі не потрібні (2). Ставимо галочку запустити торрент і тиснемо кнопку добре<div class=\"sp-wrap\"><div class=\"sp-body\" title=\"Вікно додавання завантаження в µTorrent\"><h3 class=\"sp-title\">Вікно додавання завантаження в µTorrent</h3><var class=\"postImg\" title=\"https://toloka.to/files/fotky-files/15374_fjipt.png\">&#10;</var></div></div>Надіюсь написанні та перекладені мною інструкції допоможуть Вам і ми отримуємо декількох Робін-Гудів для нашої торрент-толоки. Зауважу це лише базові налаштування, які необхідні для завантаження але більшості їх достатньо.<span class=\"post-br\"><br /></span>Слід зауважити, що вся система працює на користувачах, які підтримують роздачі після завантаження, тому не полишайте роздачі одразу після завантаження, це допоможе іншим завантажити і ви отримаєте рейтинг.<br />Рейтинг - це співвідношення між завантаженим і розданим<div class=\"sp-wrap\"><div class=\"sp-body\" title=\"Всіх з Новим роком!\"><h3 class=\"sp-title\">Всіх з Новим роком!</h3><var class=\"postImg\" title=\"https://toloka.to/files/fotky-files/3730_mgcuf.png\">&#10;</var><br />Це не фотожаба це моя статистика десь вночі 1 січня 2009 рокуHappy</div></div>');
INSERT INTO `bb_posts_html` (`post_id`, `post_html_time`, `post_html`) VALUES
(20, '2017-07-06 13:26:52', '<span class=\"post-b\">Необхідні інструменти </span><br />MeGUI<br />Avisynth<br />AvsPmod<br />K-Lite Codec Pack Mega<br />FFmpeg<span class=\"post-br\"><br /></span><span class=\"post-b\"><br />Створення скрипту Avisynth </span><br />1. Відкрийте ремукс за допомогою AvsPmod<br />2. Знайдіть світлий кадр і обріжте чорні смуги через Video - Crop Editor<span class=\"post-br\"><br /></span>3. Вирахуйте розмір:<br />Наприклад, після обрізання вийшло 1920x1040<br />1920 поділити на 1040 = 1,846153846153846<br />1280 (бажана ширина) поділити на 1,846153846153846 = 693,3333333333334<br />4. Беріть найближче число, яке ділиться на 4, в даному випадку це 692<br />5. Після Crop додайте:<br />Lanczos4Resize(1280,692)<span class=\"post-br\"><br /></span>В результаті вийде:<div class=\"q-wrap\"><div class=\"q\">Цитата:<br />DirectShowSource(\"00010.m2ts\")<br />Crop(0, 20, -0, -20)<br />Lanczos4Resize(1280,692)</div></div>Щоб згладити banding, раджу ще в кінці додати:<div class=\"q-wrap\"><div class=\"q\">Цитата:<br />GradFun3(thr=0.4, smode=2)</div></div>Щоб прибрати шум, в першу чергу на старих фільмах, додайте після Lanczos4Resize:<span class=\"post-br\"><br /></span>Слабкий шум<div class=\"q-wrap\"><div class=\"q\">Цитата:<br />RemoveGrain(mode=2)</div></div>Середній шум<div class=\"q-wrap\"><div class=\"q\">Цитата:<br />FluxSmoothST(7,7)</div></div><span class=\"post-b\">Ріпання відео</span><br />1. Відкрийте .avs у MeGUI<br />2. Виберіть x264: *scratchpad* у Encoder settings<br />3. Виберіть File format: MKV<br />4. Відкрийте Config<br />5. Поставте галочку на Show Advanced Settings<br />6. Виберіть Const. Quality<br />7. Встановіть Quality на 19 для нових фільмів і 21 для старих або зернистих (чим нижче значення, тим вища якість, не раджу переходити межі 18-22, з досвіду можу сказати, що 19 - більш, ніж достатньо)<div class=\"q-wrap\"><div class=\"q\">Цитата:<br />Preset - Slower<br />Tuning - Film<br />AVC Profile - High Profile<br />AVC Level - Level 4.1<br />Frame-Type - Number of B-frames - 3 (для сумісності із пристроями як Xbox 360; при використанні режиму Const. Quality значення не впливає на якість - якби воно було вищим, це би дозволило досягнути дещо меншого розміру файлу)<br />Rate Control - VBV Buffer Size - 31250; VBV Maximum Bitrate - 31250 (замість стандартних 78125 та 62500 для сумісності; їх більш, ніж достатньо для 720p і цілком достатньо для 1080p)<br />Analysis - M.E. Range - 32, M.E. Algorithm - 10, No Fast P-Skip</div></div>Замість того, щоб параметри вибирати вручну, ви також можете завантажити мій профіль (називається x264: Film). File - Import Presets<span class=\"post-br\"><br /></span>8. Натисніть Queue<span class=\"post-br\"><br /></span><span class=\"post-b\">Ріпання аудіо</span><br />1. Завантажте найновіший FFmpeg-static<br />2. Відкрийте командний рядок через Пуск - Виконати - cmd (Windows 7) або Win+R - cmd (Windows 8+)<br />3. Перетягніть ffmpeg.exe у командний рядок<br />4. Допишіть \" -i \" та однаковим способом перетягніть у вікно ремукс, і натисніть Enter<span class=\"post-br\"><br /></span>У вас мала вийти така команда:<div class=\"q-wrap\"><div class=\"q\">Цитата:<br />\"C:\\Program Files\\ffmpeg\\ffmpeg.exe\" -i C:\\Files\\Movie\\STREAM\\00010.m2ts</div></div>5. FFmpeg покаже інформацію про файл. Нас цікавить id оригінальної доріжки аудіо<br />6. Стрілкою вверх поверніться до попередньої команди, і доповніть її:<br />map - це id доріжки<br />c:a ac3 - формат<br />b:a 448k - бітрейт<div class=\"q-wrap\"><div class=\"q\">Цитата:<br />\"C:\\Program Files\\ffmpeg\\ffmpeg.exe\" -i C:\\Files\\Movie\\STREAM\\00010.m2ts -map 0:1 -c:a ac3 -b:a 448k \"C:\\Files\\Movie\\eng.ac3\"</div></div>Чому не ec3to? Він використовує Aften, дуже застарілий енкодер ac3. Порівняння:<span class=\"post-br\"><br /></span>AC3-448 Aften<br />AC3-448 Sonic Foundry (Dolby Encoder 6.2.2)<br />AC3-448 Sony Studio (Dolby Consumer Encoder)<br />AC3-448 Sony Pro (Dolby Encoder 7.0)<br />AC3-448 FFmpeg<br />DTS-HD Оригінал<span class=\"post-br\"><br /></span>Для AAC замість AC3:<div class=\"q-wrap\"><div class=\"q\">Цитата:<br />\"C:\\Program Files\\ffmpeg\\ffmpeg.exe\" -i C:\\Files\\Movie\\STREAM\\00010.m2ts -map 0:1 -c:a libfdk_aac -b:a 224k -cutoff 18000 \"C:\\Files\\Movie\\eng.aac\"</div></div>Для 5.1 -&gt; 2.0<div class=\"q-wrap\"><div class=\"q\">Цитата:<br />\"C:\\Program Files\\ffmpeg\\ffmpeg.exe\" -i C:\\Files\\Movie\\STREAM\\00010.m2ts -map 0:1 -c:a libfdk_aac -b:a 160k -cutoff 18000 -ac 2 \"C:\\Files\\Movie\\eng.aac\"</div></div>Чому libfdk_aac? Порівняння:<span class=\"post-br\"><br /></span>AAC-224 libfdk_aac<br />AAC-224 native<br />PCM-1536 оригінал<span class=\"post-br\"><br /></span>При кодуванні напряму із .dts, ffmpeg може видати \"unknown error\". Тоді треба додати \"-f dts\":<div class=\"q-wrap\"><div class=\"q\">Цитата:<br />\"C:\\Program Files\\ffmpeg\\ffmpeg.exe\" -f dts -i C:\\Files\\Movie\\eng.dts -c:a libfdk_aac -b:a 160k -cutoff 18000 -ac 2 \"C:\\Files\\Movie\\eng.aac\"</div></div>Із DTS-HD витягнути DTS 1509 (core):<div class=\"q-wrap\"><div class=\"q\">Цитата:<br />\"C:\\Program Files\\ffmpeg\\ffmpeg.exe\" -f dts -i C:\\Files\\Movie\\eng.dts -bsf:a dca_core -c:a copy \"C:\\Files\\Movie\\eng_core.dts\"</div></div>Додати затримку 1.5 секунди:<div class=\"q-wrap\"><div class=\"q\">Цитата:<br />\"C:\\Program Files\\ffmpeg\\ffmpeg.exe\" -f lavfi -i anullsrc=channel_layout=5.1:sample_rate=48000 -t 1.5 -b:a 448k \"C:\\Files\\Movie\\silence-1.5.ac3\"<br />\"C:\\Program Files\\ffmpeg\\ffmpeg.exe\" -i concat:\"C:\\Files\\Movie\\silence-1.5.ac3|C:\\Files\\Movie\\ukr.ac3\" -qscale 0 -codec copy \"C:\\Files\\Movie\\ukr-delayed.ac3\"</div></div><span class=\"post-b\">Муксування</span><br />1. Відкрийте mkvmerge GUI через C:\\Program Files (x86)\\MeGUI\\tools\\mkvmerge\\mmg.exe<br />2. Додайте файли<br />3. Переконайтеся, що вони у правильній послідовності<br />4. Виберіть \'none\' для всіх доріжок у Extra options - Compression<br />5. Виберіть мову доріжки у General track options - Language<br />6. Виберіть \'no\' у General track options - Default track flag для всіх доріжок, крім відео і української<br />7. Вкажіть назву фільму у Global - File/segment title<br />8. Натисніть Start muxing<span class=\"post-br\"><br /></span>Кожен крок у інструкції важливий, будьте уважні.'),
(21, '2017-07-06 13:35:58', '<span class=\"post-align\" style=\"text-align: center;\"><span style=\"font-size: 22px; line-height: normal;\"><span style=\"color: red;\"><span class=\"post-b\">ЧАП для новачків з субтитрування </span></span></span><br /><var class=\"postImg\" title=\"https://img.hurtom.com/i/2016/01/TheReward_001_2625.th.png\">&#10;</var><br /><span style=\"font-size: 16px; line-height: normal;\"><span style=\"color: red;\"><span class=\"post-i\">…або як не наступати на ті самі граблі.</span> </span> </span>  <img class=\"smile\" src=\"styles/images/smiles/ab.gif\" alt=\"ab\" align=\"absmiddle\" border=\"0\" /></span>Що ж, не знаю чого мене вважає так чимало люду гарним знавцем, але з власного досвіду щось, та й спробую порадити.<br />Згодом якось лепсько й текст теми оформиться, й інформація впорядкується.<span class=\"post-br\"><br /></span><span style=\"font-size: 22px; line-height: normal;\"><span class=\"post-align\" style=\"text-align: center;\">Отож, гіпотетично уявімо, що починаємо «з нуля».<br />З якими негараздами та труднощами зіткнемося та що нам найбільш необхідне?</span></span><span class=\"post-br\"><br /></span><span class=\"post-b\">1</span> Бажання<br /><span class=\"post-b\">2</span> Наполегливість<br /><span class=\"post-b\">3 </span>Визначення своїх цілей<br /><span class=\"post-b\">4 </span>Усвідомлення своїх можливостей<br /><span class=\"post-b\">5</span> Пошук спільнодумців<br /><span class=\"post-b\">6</span> Пошук інструментів досягнення мети<br /><span class=\"post-b\">7</span> Тестова жертва<br /><span class=\"post-b\">8</span> …мабуть не забувати хоча б про пункти 1-4<br />Й от зараз ми маємо якийсь список незрозумілої мотивації. Спробуймо пояснити більш розгорнуто.<span class=\"post-br\"><br /></span><span style=\"color: green;\"><span class=\"post-b\">1</span> </span>Причини можуть бути різними, можуть й однаковими, але в людини виникло бажання створити щось корисне, гарне й значне. Без нього — нікуди, й важливо щоб воно нікуди не зникало з появою труднощів.<br /><span style=\"color: green;\"><span class=\"post-b\"><br />2</span> </span>Субтитрування почасти може бути важкуватим, в залежності від обраної картини — навіть нудним. Коли зникає бажання потрібно продовжувати йти вперед. Але є й гарний бік — це непогано вчить друкувати (наприклад, можна закріпити сліпу навичку друку, замість того, щоб просиджувати в тренажерах). Інший плюс — ми розглядаємо історію як книгу, тому почасти знаємо її майже досконало до останніх натяків й читання значень «між рядків». Тому варто обирати цікавий собі матеріал, бо і взнаєте щось нове, і людям користь. Але з нецікавим може бути важкувато, і якщо обирати зовсім нецікаві собі фільми, то ніяких бажання й наполегливості не вистачить.<span class=\"post-br\"><br /></span><span style=\"color: green;\"><span class=\"post-b\">3 </span></span>Ну, з цим доволі просто. Просто пошукайте цікавих собі кандидатів, створіть список бажаного й цікавого, якийсь …не те що розклад, просто змоделюйте наперед виділений час й те, коли зможете завершити. (і помножте цей час десь на 1,5 бо людина завжди оптимістична в прогнозах =) )<br />Одним словом, хоч мінімально організуйтеся.<span class=\"post-br\"><br /></span><span style=\"color: green;\"><span class=\"post-b\">4 </span></span>Важливий пункт. Подумаємо, які мови знаємо, чи можемо самостійно й нашвидку перекладати. Навіть якщо ні — за бажання можна знайти спільника-перекладача й займатися оформленням (про це трохи згодом), або ж самому обкластися словниками. Тут все залежить від бажаня.<br />Не варто робити помилки й брати щось надто довге й складне. Спробуйте спочатку кілька короткометражок. Чи чогось, де не дуже багато розмов і написів. Також важливо розуміти, чому варто приділити більш уваги, а що можна й пропустити.<br />Дивіться роботи інших, думайте як їм вдалося досягти такого результату.<span class=\"post-br\"><br /></span><span style=\"color: green;\"><span class=\"post-b\">5</span></span> Додав цей пункт, бо хоча й роблю майже завжди все сам, але для однієї людини це часто може бути важкувато.<br />Знайдіть спільнодумців, з тими самими жанровими інтересами, якось розподіліться, будьте в активній взаємодії (не зникайте невідомо куди не попередивши інших).<br />Хтось має бути перекладачем і непогано набирати основне тіло тексту, в когось може бути гарне володіння українською для вичитки, у когось просто художнє чуття, хтось може працювати з пошуком іншомовних субтитрів, відео, аудіо, збіркою, конвертацією, релізами й взагалі — розповсюдженням. Це значно полегшує життя субтитрувальника, хоча й початковий друк з простеньким перекладом «абияк» все одно складатиме з третину необхідних зусиль.<span class=\"post-br\"><br /></span><span style=\"color: green;\"><span class=\"post-b\">6 </span></span>Тут в нас важлива навичка пошуку. Пошуку відеозаписів, аудіо, субтирів в різних місцях.<br />По програмам. Що ж, погляну що в мене є й використовується:<span class=\"post-br\"><br /></span>- словники (треба буде згодом додати посилання на електронні)<br />- для перекидання файлів: торрент-клієнт, дропбокс, гуглдиск, ба навіть <a href=\"http://expirebox.com/\" class=\"postLink\" rel=\"nofollow\">http://expirebox.com/</a> можна скористатися<br />- перевірка граматики, мені вистачає звичайного F7 ворду з текстом в .srt, позначеним як українська перед перевіркою. Багато чого не вистачає, але елементарний хибодрук знайти легко й виправити паралельно в редакторі субтитрів, знайшовши за часом.<br />- перевірка змін, beyond compare встановлена в total commander, актуально можна побачити зміни в тексті, особливо коли працює кілька людей<br />- програма для роботи з субтитрами aegisub, зберігати в .ass для кращого вигляду й функціоналу. .srt більш сумісний.<br />- k-lite codeck pack + media player classic (кодеки та плеєр, встановлювати максимально все)<br />- daemon tools lite (якщо треба для образів дисків)<br />- fast stone capture (чи ще щось для скріншотів)<br />- MediaInfo (дуже необхідна, інформація про медіафайли)<br />- mkvmerge GUI + MKVToolNix GUI (теж дуже необхідна, робота з .mkv контейнером, куди збирається відео, аудіо, субтитри, шрифти, навіть логотип та розділи)<br />- VOB2MPG v3 (лише якщо треба нарізати багатосерійки з DVD)<br />- XviD4PSP 5 <a href=\"https://toloka.to/t70370\" class=\"postLink\" rel=\"nofollow\">https://toloka.to/t70370</a> (конвертер)<span class=\"post-br\"><br /></span><span style=\"color: green;\"><span class=\"post-b\">7 </span></span>Знову ж, почніть з короткометражки, десь після 3-4 можна й до повнорозмірного 1,5-годинного фільму переходити.<span class=\"post-br\"><br /></span>Згодом як щось субтитруватиму, спробую поетапно описати та наочно зробити якісь світлини. (хоча б куди тиснути та навіщо) Wink (1)<div class=\"sp-wrap\"><div class=\"sp-body\" title=\"Приклади перекладів\"><h3 class=\"sp-title\">Приклади перекладів</h3><var class=\"postImg\" title=\"https://img.hurtom.com/i/2016/02/TimeTrapShortFilm_001_649.th.png\">&#10;</var><var class=\"postImg\" title=\"https://img.hurtom.com/i/2016/01/Girl_and_Robot2008.HDTVRip.720p_001_774.th.png\">&#10;</var><var class=\"postImg\" title=\"https://img.hurtom.com/i/2016/02/TimeTrapShortFilm_001_1604.th.png\">&#10;</var><var class=\"postImg\" title=\"https://img.hurtom.com/i/2016/02/TIEFighter-shortfilm_001_70.th.png\">&#10;</var></div></div>'),
(23, '2017-07-06 13:43:27', '<span style=\"font-size: 22px; line-height: normal;\"><span class=\"post-b\"><span style=\"color: green;\"><span class=\"post-align\" style=\"text-align: center;\">Створення DTS доріжки до фільму у форматі 5.1</span></span></span></span><span class=\"post-br\"><br /></span>Напевно у кожного колись виникало бажання, переглядаючи фільм - отримати від нього весь той максимум відчуттів, тобто не лише шикарну картинку але і те, що так бракує у фільмах з українським перекладом - саме так, це якісна аудіодоріжка з великим бітрейтом.<br />Тому в цій темі я пропоную розглянути наступне, а саме - як своїми зусиллями можна створити якісну аудіодоріжку до фільму.<br />Отже, найчастішим випадком є таке:<br />- скачав фільм в мега крутій якості, а от український переклад підвів - бітрейт не задовіляняє ваші моральні погляди на фільм - і ви не хочете травмувати ваші вушні перепонки цим неякісним звучанням, що виходить із ваших колонок, робим так:<br />Скачали фільм, у якому є укр доріжка ( або окремо скачали її саму ), припустим її бітрейт 448 Кбит/с ( аас 5.1 або 2.0 ) і є оригінальна доріжка DTS-HD MA, 6 ch, 4018 Кбит/с ... ( або інша - більш якісна доріжка ) Вам потрібно витягнути центральний канал з укр доріжки і вставити його замість центрального каналу у DTS-HD MA, 6 ch, 4018 Кбит/с - таким чином ви отримаєте доріжку з великим бітрейтом і укр перекладом...<span class=\"post-br\"><br /></span>Тепер все по порядку...<span class=\"post-br\"><br /></span><span class=\"post-b\">1.</span> Щоб витягнути аудіодоріжку ви можете скористатись цими програмами:<br />для avi - VirtualDubMod<br />для mkv - MKV Demux Tool ( MKV Extract Gui )<br />для TS, M2TS - TS Muxer GUI<span class=\"post-br\"><br /></span><span class=\"post-b\">2.</span> Наступним кроком буде розкладання доріжок на канали , у цьому нам допоможе TranzcodeGUI<span class=\"post-br\"><br /></span><span class=\"post-b\">2.1</span> Із укр доріжки 5.1 нам потрібно витягнути тільки центральний канал (якщо доріжка, наприклад, 2.0 то витягуємо любий канал - на практиці вони ідентичні, але уже через програму Sound Forge Pro, як витягнути через транзкод 2.0 не знаю ).<br />((( У мене з цим була проблема - додаю інфу - Sound Forge Pro - якщо 44 100 Кh і 23.976 а треба перевести у 48 000 - 23.976 .....відкриваю файл з 44 100 ... створюю новий файл у вигляді 44 100 а от зберігаю в 48 000 ........ якщо при 44 100 нема моно 24 біт зберігаю у 16 біт ... потім відкриваю уже створену 48 000 - 23.976 - 16 біт ...... створюю новий файл у вигляді 48 000 + уже 24 біта ....перекидую 16 бітну дорогу у новий файл з 24 бітами і зберігаю ... у шаблоні автоматично виставлено 24 тому моно там в переліку не буде !!! )))))<br />Відкриваємо в програмі вхідну аудіодоріжку, потім вказуємо місце де її зберегти уже в розкладеному на канали вигляді ( обовязково зазначати вкінці назви ВИХІДНОЇ доріжки \".wav\" - замість dts, aac і тд )<br />В програмі потрібно ОБОВЯЗКОВО виставити ту розрядність ( бітність ) і дискретизацію, що і у доріжки з більшим бітрейтом ( тобто та доріжка в яку і буде переміщено центральний канал ), згладжування - ставимо позначку \"залишити\".<span class=\"post-br\"><br /></span><span class=\"post-b\">2.2</span> Відкриваємо DTS-HD MA ( ту кращу доріжку ) в програмі, потім вказуємо місце де її зберегти уже в розкладеному на канали вигляді ( обовязково зазначати вкінці назви ВИХІДНОЇ доріжки \".wav\" - замість dts, aac і тд ), для економії часу можна зняти галочку з центрального каналу - він і так не буде нам потрібний Wink (1) , висавляєм ту розрядність ( бітність ) і дискретизацію що і є в цій доріжці ( не рекомендується виставляти малу бітність - 24, 32 найбільш оптимальні варіанти, але при виході матимуть дуже великий обєм ), згладжування - ставим позначку \"залишити\"<span class=\"post-br\"><br /></span><span class=\"post-b\">3.</span> Тепер потрібно обєднати всі канали в один аудіо файл, в цьому нам допоможе DTS-HD Master Audio Suite Encoder:<span class=\"post-br\"><br /></span>- 1 Вибираємо вихідний формат:<br />Blu-ray Disc (.dtshd) - формат для Blu-ray<br />DVD(.cpt) - формат для DVD ( файл із .cpt - можна перейменувати в .dts - і все буде ок )<br />- 2 Вибираємо потік<br />- 3 Вибираємо кількість каналів ( 5.1 буде норм )<br />- 4 Вибираємо дискритизацю ( 48 000 буде норм )<br />- 5 Перетягуємо канали ( які здобуті програмою TranzcodeGUI )<br />Центральний укр канал - перетягуєм в центральний відділ<br />Всі інші канали із dts-hd ma крім центрального перетягуєм по призначенню у відділи каналів<br />( Бітність і дискритизація у СВІХ каналів має бути ОБОВЯЗКОВО ОДНАКОВА !!!! )<br />- 6 Виставляємо нормалізацію ( -31 буде норм .... тобто без ніяких змін )<br />- 7 Виставляємо бітрейт ( чим більший тим краще, звичайно відштовхуючись від оригіналу Wink (1)<br />- 8 Вибираємо місце збереження доріжки<br />- 9 Вказуєм назву доріжки<br />- 10 Клісаєм Encode<br />Вітаю - тепер у Вас є готова доріжка з крутим звуком ( ні, Ви не володар світу - спускаємось з небес і пробуємо прикріпити доріжку до фільму Wide grin<span class=\"post-br\"><br /></span><span class=\"post-b\">4. 1.</span> Щоб прикріпити ( добавити ) аудіодоріжку ви можете скористатись цими програмами:<br />--для avi - VirtualDub ( тут дуже просто - даєм назву аудіодоріжці таку ж саму як і у фільма - крім останніх букв після крапочки Wink (1) . Дивимось фільм через MPC - клікаєм правою кнопкою по центру плеєра міняємо аудіодоріжку - у відділі аудіо на нашу НОВУ<br />--для mkv - MKVtoolnix ( MKV merge gue )( в програму додаєм фільм - додаєм готову доріжку - клікаєм мультиплекс (Start muxing).<br />--для TS, M2TS - TS Muxer GUI ( в програму додаєм фільм - додаєм готову доріжку - вибираємо або TS Muxing, або M2TSMuxing ( дивлячись який у вас файл ) - клікаєм Start muxing.<br />Це все. Всім приємного перегляду.<span class=\"post-br\"><br /></span>Тема присвячується 60-ти гіговому фільму \"Темний Лицар повертається / The Dark Knight Rises (2012) {2-Disc Edition} Blu-ray CEE\", \"Батьки / Parenthood (1989) BD Remux\"<br />і фільму \"50 перших поцілунків / 50 First Dates 2004 BDRip 1080p\"﻿<div class=\"sp-wrap\"><div class=\"sp-body\" title=\"Скріни\"><h3 class=\"sp-title\">Скріни</h3><a href=\"http://img.hurtom.com/image/LUz\" class=\"postLink\" rel=\"nofollow\"><var class=\"postImg\" title=\"http://img.hurtom.com/i/2017/07/dts-hd_master_audio_suite_encoder_149.md.png\">&#10;</var></a><br /><a href=\"http://img.hurtom.com/image/LUE\" class=\"postLink\" rel=\"nofollow\"><var class=\"postImg\" title=\"http://img.hurtom.com/i/2017/07/tranzcodegui_626.md.png\">&#10;</var></a></div></div>'),
(24, '2017-07-06 13:47:18', 'Проводиться набір у команду Гуртом.<span class=\"post-br\"><br /></span>Є набір у 5 різних груп. Кожна група відповідає за свою власну роботу.<span class=\"post-br\"><br /></span><span class=\"post-b\">Перша група </span>(Г1 - так зазначати у повідомленні долучення до групи)<br /><span class=\"post-b\">Синхронізація аудіо доріжок з відео</span> (сирих аудіо доріжок)<br />1) Чи синхронізували Ви колись аудіо доріжки з відео?<br />2) Якими програмами Ви синхронізували?<br />3) Скільки часу Ви можете працювати над синхронізацією на добу?<br />4) Яку кількість \"сирих\" аудіо доріжок Ви готові взяти на опрацювання на місяць?<br />5) Чому Ви хочете займатись саме синхронізацією доріжок?<span class=\"post-br\"><br /></span><span class=\"post-b\">Друга група (Г2) </span><br /><span class=\"post-b\">Субтитрування фільмів, серіалів, мультсеріалів, аніме, документального кіно та іншого. </span><br />1) Якими мовами Ви володієте?<br />2) Який з напрямків субтитрування Ви хочете обрати?<br />3) Скільки часу Ви можете працювати над перекладом субтитрів на добу?<span class=\"post-br\"><br /></span><span class=\"post-b\">Третя група (Г3)<br />Запис з ТБ звукових доріжок до фільмів, серіалів, мультсеріалів, аніме, документального кіно та іншого. </span><br />1) З яких каналів Ви маєте змогу записувати?<br />2) Яка якість запису?<br />3) Що саме Ви б хотіли записувати? (фільми, серіали, мультсеріали, аніме, документальне кіно та інше)<br />4) У який час Ви маєте змогу записувати напротязі доби?<span class=\"post-br\"><br /></span><span class=\"post-b\">Четверта група (Г4)<br />Озвучування фільмів, серіалів, мультсеріалів, аніме, документального кіно та іншого. </span><br />1) Ви мали справу з озвучуванням чогось, яку саме? (описати все, що вважаєте за потрібне)<br />2) Що бажаєте озвучувати?<br />3) Яку кількість часу Ви можете виділити для озвучування на добу?<br />* нажаль, зараз немає активної діяльності по озвученню від проекту \"Відео Гуртом\", активно озвучують лише партнерські студії, звертайтесь до них в приват: Студія Hurtom, НеЗупиняйПродакшн, Струґачка, FanVoxUA (вибачаюсь, якщо когось пропустив з неактивних тепер проектів, прим. igor911).<span class=\"post-br\"><br /></span><span class=\"post-b\">П\'ята група (Г5)<br />Підтримка роздач та поширення по інтернету </span><br />1) Скільки вільного місця на жорсткому диску Ви можете запропонувати для підтримки релізів?<br />2) Яка Ваша швидкість віддачі контенту, чи відкритий порт для вхідних з\'єднань і скільки часу на добу Ви можете виділити для підтримки роздачі релізів?<br />3) Якщо бажаєте займатись поширенням релізів в інтернеті, де саме Ви хочете поширювати контент і чому?<br />4) Які саме релізи (фільми, серіали і т.д.) для Вас мають більше значення і Ви на цих релізах стоятимете на роздачі?<br />5) Якщо Ви не бажаєте стояти на роздачі постійно, скільки вільного місця Ви можете дати на своєму комп\'ютері для зберігання релізів, та якщо хтось захоче скачати його, встати на роздачу?<span class=\"post-br\"><br /></span>Ну от і все! Якщо Вас це зацікавило пишіть у коментарях, але по шаблону. Якщо виникли інші питання, прошу писати мені у приват, ми знайдемо рішення!'),
(25, '2017-07-06 14:02:00', '<span class=\"post-align\" style=\"text-align: center;\"><span style=\"font-size: 24px; line-height: normal;\"><span style=\"color: Green;\"><span class=\"post-b\"><br />Підтримка та поширення</span></span> </span></span><span class=\"post-align\" style=\"text-align: center;\"><span class=\"post-b\"><span style=\"color: Red;\"><span style=\"font-size: 16px; line-height: normal;\"><a href=\"https://toloka.to/t72494\" class=\"postLink\" rel=\"nofollow\">[Приєднуйся]</a></span></span> </span> :)</span><span class=\"post-align\" style=\"text-align: center;\"><var class=\"postImg\" title=\"http://img.hurtom.com/i/2016/10/pidtrumka_ta_poshupennia_video_hurtom_3.png\">&#10;</var></span><span class=\"post-align\" style=\"text-align: center;\"><span style=\"font-size: 20px; line-height: normal;\"><span style=\"color: Red;\"><span class=\"post-b\">На даний момент необхідна Ваша допомога<br />в поширенні контенту із розділу <a href=\"https://toloka.to/f96-3420?sort=5\" class=\"postLink\" rel=\"nofollow\"><span class=\"post-u\">HD українською</span></a></span></span></span><div class=\"sp-wrap\"><div class=\"sp-body\" title=\"Що робити?\"><h3 class=\"sp-title\">Що робити?</h3><span style=\"font-size: 12px; line-height: normal;\"> <span class=\"post-b\">1)</span> Зайти у розділ <a href=\"https://toloka.to/f96-3420?sort=5\" class=\"postLink\" rel=\"nofollow\"><span class=\"post-u\">Фільми в HD</span></a>.<br /><span class=\"post-b\">2)</span> Ставити на завантаження релізи, що роздаються 1-м сідом.</span></div></div><div class=\"sp-wrap\"><div class=\"sp-body\" title=\"Ви маєте навички монтажу або синхронізації фільмів/серіалів в 4К?\"><h3 class=\"sp-title\">Ви маєте навички монтажу або синхронізації фільмів/серіалів в 4К?</h3><span style=\"font-size: 12px; line-height: normal;\">Тоді Ви попали за адресою! :)<br />Нам якраз потрібен користувач, що зможе створювати та викладати релізи в форматі ультрависокої роздільної здатності 4K(UHD).<br />Відпишіть в цій темі або завітайте до <a href=\"https://toloka.to/t81020\" class=\"postLink\" rel=\"nofollow\"><span class=\"post-u\">Фільми та серіали в 4К Ultra HD Video українською</span></a> та перегляньте уже існуючі напрацювання :)</span></div></div><div class=\"sp-wrap\"><div class=\"sp-body\" title=\"Є пару вільних терабайт на HDD?\"><h3 class=\"sp-title\">Є пару вільних терабайт на HDD?</h3><span style=\"font-size: 12px; line-height: normal;\">Тоді Вам сюди!)<br />Завантажуйте опубліковані <a href=\"https://toloka.to/t81020\" class=\"postLink\" rel=\"nofollow\"><span class=\"post-u\">фільми/серіали в 4К/HD</span></a> та діліться україномовним контентом зі всіма українцями! :)</span></div></div></span><span class=\"post-b\">Що таке команда \"Підтримка та поширення\"?</span><span class=\"post-br\"><br /></span>Це група активістів, головною метою якої є поширення україномовного відеоконтенту в мережі Інтернет.<br />Команда активістів структурно відноситься до реліз-групи <a href=\"https://toloka.to/t72494\" class=\"postLink\" rel=\"nofollow\"><var class=\"postImg\" title=\"https://toloka.to/img/%D0%9F%D1%80%D0%BE%D0%B5%D0%BA%D1%82_%D0%92%D1%96%D0%B4%D0%B5%D0%BE_%D0%93%D1%83%D1%80%D1%82%D0%BE%D0%BC.gif\">&#10;</var></a>.<span class=\"post-br\"><br /></span><span class=\"post-b\">Напрямки роботи</span><ul><li><span class=\"post-u\">Поширення</span><ul><li>Релізер Hurtom - публікація та оформлення україномовного контенту відсутнього на Толоці</ul><li><span class=\"post-u\">Підтримка</span><ul><li><a href=\"http://senfil.net/index.php?newsid=329\" class=\"postLink\" rel=\"nofollow\">Сід</a>- роздача завантаженого контенту, надання смуги швидкого завантаження файлів</ul></ul><span class=\"post-b\"><span style=\"color: Red;\">Набір до команди</span></span><div class=\"sp-wrap\"><div class=\"sp-body\" title=\"Поширення (релізери&amp;#41;\"><h3 class=\"sp-title\">Поширення (релізери&amp;#41;</h3><span class=\"post-b\">Схема роботи</span><span class=\"post-align\" style=\"text-align: center;\"><var class=\"postImg\" title=\"http://img.hurtom.com/i/2016/10/shema_pidtrumka_i_poshurennia_video_hurtom.png\">&#10;</var></span><span class=\"post-b\">Як приєднатися?</span><span class=\"post-br\"><br /></span>Написати в темі заявку для вступу у вигляді:<br /><span class=\"post-b\">1) Цільовий сайт для публікацій:</span> <span class=\"post-i\"><span style=\"color: Green;\">Гуртом</span></span><br /><span class=\"post-b\">2) Релізів на Гуртом:</span> <span class=\"post-i\"><span style=\"color: Green;\">25</span></span><br /><span class=\"post-b\">3) Стаж на Гуртом:</span>  <span class=\"post-i\"><span style=\"color: Green;\">3 роки</span></span><br /><span class=\"post-b\">4) Досвід роботи:</span>  <span class=\"post-i\"><span style=\"color: Green;\">Так</span></span><div class=\"sp-wrap\"><div class=\"sp-body\" title=\"Готовий BB код\"><h3 class=\"sp-title\">Готовий BB код</h3><div class=\"c-wrap\"><div class=\"c-body\">&#91;b&#93;1&#41; Цільовий сайт для публікацій&#58;&#91;/b&#93; &#91;i&#93;&#91;color=Green&#93;Гуртом&#91;/color&#93;&#91;/i&#93;<br />&#91;b&#93;2&#41; Релізів на Гуртом&#58;&#91;/b&#93; &#91;i&#93;&#91;color=Green&#93;25&#91;/color&#93;&#91;/i&#93;<br />&#91;b&#93;3&#41; Стаж на Гуртом&#58;&#91;/b&#93;&nbsp; &#91;i&#93;&#91;color=Green&#93;3 роки&#91;/color&#93;&#91;/i&#93;<br />&#91;b&#93;4&#41; Досвід роботи&#58;&#91;/b&#93;&nbsp; &#91;i&#93;&#91;color=Green&#93;Так&#91;/color&#93;&#91;/i&#93;</div></div></div></div><span class=\"post-b\"> </span><br /><span class=\"post-b\">Порядок роботи</span><span class=\"post-br\"><br /></span>1. Ви робите замовлення за шаблоном нижче<br />2. Ми завантажуємо<br />3. Відписуємо в темі або в шапці<br />4. Ви переглядаєте україномовний контент із улюбленого сайту :)<span class=\"post-br\"><br /></span><span class=\"post-b\">Як замовити завантаження?</span><span class=\"post-br\"><br /></span>Написати в темі повідомлення у вигляді:<br /><span class=\"post-b\">Куди завантажити:</span> <span class=\"post-i\"><span style=\"color: Green;\">FEX.NET</span></span><br /><span class=\"post-b\">Назва українською:</span> <span class=\"post-i\"><span style=\"color: Green;\">Хрещений батько / The GodFather (1972) DVDRip Ukr/Eng | Sub Eng </span></span><br /><span class=\"post-b\">Звідки:</span> <a href=\"https://toloka.to/t2090\" class=\"postLink\" rel=\"nofollow\">https://toloka.to/t2090</a><div class=\"sp-wrap\"><div class=\"sp-body\" title=\"Готовий BB код\"><h3 class=\"sp-title\">Готовий BB код</h3><div class=\"c-wrap\"><div class=\"c-body\">&#91;b&#93;Куди завантажити&#58;&#91;/b&#93; &#91;i&#93;&#91;color=Green&#93;EX.UA&#91;/color&#93;&#91;/i&#93;<br />&#91;b&#93;Назва українською&#58;&#91;/b&#93; &#91;i&#93;&#91;color=Green&#93;Хрещений батько / The GodFather (1972&#41; DVDRip Ukr/Eng | Sub Eng &#91;/color&#93;&#91;/i&#93;<br />&#91;b&#93;Звідки&#58;&#91;/b&#93; &#91;url=https&#58;//toloka.to/t2090&#93;https&#58;//toloka.to/t2090&#91;/url&#93;</div></div></div></div></div></div><div class=\"sp-wrap\"><div class=\"sp-body\" title=\"Підтримка (сіди&amp;#41;\"><h3 class=\"sp-title\">Підтримка (сіди&amp;#41;</h3><span class=\"post-b\">Умови вступу</span><span class=\"post-br\"><br /></span>1) Стаж на Толоці не менше <span style=\"color: Green;\">3 місяців</span><br />2) Кількість відданого не менше <span style=\"color: Green;\">70 ГБ</span><br />3) Рейтинг <span style=\"color: Green;\">1.5</span> і вище<span class=\"post-br\"><br /></span><span class=\"post-b\">Як приєднатися?</span><span class=\"post-br\"><br /></span>Написати в темі заявку для вступу у вигляді:<span class=\"post-br\"><br /></span><span class=\"post-b\">1) Швидкість віддачі(upload):</span> <span class=\"post-i\"><span style=\"color: Green;\">20 Мбіт</span></span> (<a href=\"http://speedtest.lviv.ua/\" class=\"postLink\" rel=\"nofollow\">виміряти швидкість</a>)<br /><span class=\"post-b\">2) Об\'єм пам\'яті під роздачі:</span> <span class=\"post-i\"><span style=\"color: Green;\">100 ГБ</span></span><br /><span class=\"post-b\">3) Час роздачі:</span>  <span class=\"post-i\"><span style=\"color: Green;\">24/7 </span></span><br /><span class=\"post-b\">4) Тип контенту:</span>  <span class=\"post-i\"><span style=\"color: Green;\">фільми, література, музика</span></span><div class=\"sp-wrap\"><div class=\"sp-body\" title=\"Готовий BB код\"><h3 class=\"sp-title\">Готовий BB код</h3><div class=\"c-wrap\"><div class=\"c-body\">&#91;b&#93;1&#41; Швидкість віддачі(upload&#41;&#58;&#91;/b&#93; &#91;i&#93;&#91;color=Green&#93;20 Мбіт&#91;/color&#93;&#91;/i&#93;<br />&#91;b&#93;2&#41; Об\'єм пам\'яті під роздачі&#58;&#91;/b&#93; &#91;i&#93;&#91;color=Green&#93;100 ГБ&#91;/color&#93;&#91;/i&#93;<br />&#91;b&#93;3&#41; Час роздачі&#58;&#91;/b&#93;&nbsp; &#91;i&#93;&#91;color=Green&#93;24/7 &#91;/color&#93;&#91;/i&#93;<br />&#91;b&#93;4&#41; Тип контенту&#58;&#91;/b&#93;&nbsp; &#91;i&#93;&#91;color=Green&#93;фільми, література, музика&#91;/color&#93;&#91;/i&#93;</div></div></div></div></div></div><span class=\"post-b\"> </span><br /><span class=\"post-b\">Навіщо тема?</span><span class=\"post-br\"><br /></span>Тема створена для:<ul><li>Набору молодих активістів для командної роботи<br /><li>Координації, організації роботи учасників команди<br /><li>Обговорення, взаємодії та співпраці<br /><li>Спільної роботи над обраними замовленнями<br /><li>Моніторингу роботи команди Підтримка та поширення<br /><li>Відображення стану речей щодо роботи команди <var class=\"postImg\" title=\"https://toloka.to/images/ranks/hurtom-support.png\">&#10;</var></ul><span class=\"post-b\">Спільні/схожі теми</span><ul><li><a href=\"https://toloka.to/t14616\" class=\"postLink\" rel=\"nofollow\">Допомога у поширенні української озвучки на інших сайтах</a><br /><li><a href=\"https://toloka.to/t6789\" class=\"postLink\" rel=\"nofollow\">Замовлення україномовних фільмів від Проекту Відео Гуртом</a></ul><span class=\"post-b\">Офіційний донат</span><ul><li><a href=\"http://www.hurtom.com/portal/33753/series-dubbing-10\" class=\"postLink\" rel=\"nofollow\">Озвучення серіалів - Студія Гуртом</a><br /><li><a href=\"http://www.hurtom.com/portal/donate\" class=\"postLink\" rel=\"nofollow\">Озвучення фільмів</a></ul><span class=\"post-b\">Інше</span><ul><li><a href=\"https://toloka.to/t77863\" class=\"postLink\" rel=\"nofollow\">Де подивитися фільми/серіали українською онлайн?</a><br /><li><a href=\"https://toloka.to/t77458\" class=\"postLink\" rel=\"nofollow\">Як дивитися фільми на Гуртом онлайн на пристроях Андроїд?</a><br /><li><a href=\"https://toloka.to/t76883\" class=\"postLink\" rel=\"nofollow\">Як дивитися фільми та серіали онлайн із Гуртом через Ace Stream?</a><br /><li><a href=\"https://toloka.to/t81012\" class=\"postLink\" rel=\"nofollow\">Як дивитися фільми та серіали онлайн на яблокоподібних пристроях? (Iphone, Ipad, IOS, Apple)?</a></ul>'),
(26, '2017-07-06 14:05:56', '<span class=\"post-align\" style=\"text-align: center;\"><span style=\"font-size: 24px; line-height: normal;\"><span style=\"color: Green;\"><span class=\"post-b\">Команда \"Запис з ТБ\"</span></span></span></span><span class=\"post-align\" style=\"text-align: center;\"><span class=\"post-b\"><span style=\"color: Red;\"><span style=\"font-size: 16px; line-height: normal;\">[Приєднуйся]</span></span> </span> :)</span><span class=\"post-align\" style=\"text-align: center;\"><var class=\"postImg\" title=\"http://img.hurtom.com/i/2016/07/komanda_zapuc_z_tb_hurtom_2.png\">&#10;</var></span><span class=\"post-b\">Що таке команда \"Запис з ТБ\"?</span><span class=\"post-br\"><br /></span>Це група активістів, головною метою якої є запис україномовного медіаконтенту, що доступний на телебаченні та його поширення в мережі Інтернет.<br />Команда користувачів структурно відноситься до реліз-групи <a href=\"https://toloka.to/t70619\" class=\"postLink\" rel=\"nofollow\">Video Hurtom</a>.<span class=\"post-br\"><br /></span><span class=\"post-b\">Учасники</span><span class=\"post-br\"><br /></span><a href=\"https://toloka.to/u100080\" class=\"postLink\" rel=\"nofollow\">4erkov</a>, <a href=\"https://toloka.to/u36872\" class=\"postLink\" rel=\"nofollow\">akon111</a>, <a href=\"https://toloka.to/u34221\" class=\"postLink\" rel=\"nofollow\">andic</a>, <a href=\"https://toloka.to/u67874\" class=\"postLink\" rel=\"nofollow\">AngryBirdsUA</a> <a href=\"https://toloka.to/u239315\" class=\"postLink\" rel=\"nofollow\">bambulla</a>, <a href=\"https://toloka.to/u8881\" class=\"postLink\" rel=\"nofollow\">dadabar</a>, <a href=\"https://toloka.to/u90132\" class=\"postLink\" rel=\"nofollow\">DareDevil96</a>, <a href=\"https://toloka.to/u18404\" class=\"postLink\" rel=\"nofollow\">Disturbed</a>, <a href=\"https://toloka.to/u105398\" class=\"postLink\" rel=\"nofollow\">Dvd-master</a>, <a href=\"https://toloka.to/u440\" class=\"postLink\" rel=\"nofollow\">dvorsky</a>, <a href=\"https://toloka.to/u129468\" class=\"postLink\" rel=\"nofollow\">foshter</a>, <a href=\"https://toloka.to/u83276\" class=\"postLink\" rel=\"nofollow\">gig_Panas</a>, <a href=\"https://toloka.to/u62733\" class=\"postLink\" rel=\"nofollow\">Gremlin_groj</a>, <a href=\"https://toloka.to/u141807\" class=\"postLink\" rel=\"nofollow\">Hanway</a>, <a href=\"https://toloka.to/u142973\" class=\"postLink\" rel=\"nofollow\">ilu</a>,  <a href=\"https://toloka.to/u63292\" class=\"postLink\" rel=\"nofollow\">legos25</a>, <a href=\"https://toloka.to/u129733\" class=\"postLink\" rel=\"nofollow\">Malamute</a>, <a href=\"https://toloka.to/u165719\" class=\"postLink\" rel=\"nofollow\">masha_k</a>, <a href=\"https://toloka.to/u4848\" class=\"postLink\" rel=\"nofollow\">Merdiff</a>, <a href=\"https://toloka.to/u132980\" class=\"postLink\" rel=\"nofollow\">Neytreenor</a>, <a href=\"https://toloka.to/u31481\" class=\"postLink\" rel=\"nofollow\">nick_89</a>, <a href=\"https://toloka.to/u108936\" class=\"postLink\" rel=\"nofollow\">OlegCena</a>, <a href=\"https://toloka.to/u5022\" class=\"postLink\" rel=\"nofollow\">olgaya</a>, <a href=\"https://toloka.to/u2697\" class=\"postLink\" rel=\"nofollow\">POMEO</a>, <a href=\"https://toloka.to/u1665\" class=\"postLink\" rel=\"nofollow\">salvateur</a>, <a href=\"https://toloka.to/u26074\" class=\"postLink\" rel=\"nofollow\">Sando7</a>, <a href=\"https://toloka.to/u101159\" class=\"postLink\" rel=\"nofollow\">SsashI</a>, <a href=\"https://toloka.to/u239143\" class=\"postLink\" rel=\"nofollow\">STONTS</a>, <a href=\"https://toloka.to/u3974\" class=\"postLink\" rel=\"nofollow\">SweetN</a>, <a href=\"https://toloka.to/u1161\" class=\"postLink\" rel=\"nofollow\">Tanat13</a>,  <a href=\"https://toloka.to/u117424\" class=\"postLink\" rel=\"nofollow\">Technomate</a>, <a href=\"https://toloka.to/u51261\" class=\"postLink\" rel=\"nofollow\">Yelovbasted</a>, <a href=\"https://toloka.to/u8323\" class=\"postLink\" rel=\"nofollow\">Кіт Баюн</a><span class=\"post-br\"><br /></span><span class=\"post-b\">Напрямки роботи</span><span class=\"post-br\"><br /></span>Завдання та обов\'язки групи поділяються на:<ul><li><span class=\"post-u\">Моніторинг телебачення</span> - пошук контенту, що відсутній на Гуртом на ТБ<br /><li><span class=\"post-u\">Запис контенту</span> - запис відеопотоку телевізора та його вивантаження в мережу<br /><li><span class=\"post-u\">Створення релізу</span> - обробка записаного відео, аудіоматеріалу та його публікація на Толоці<br /><li><span class=\"post-u\">Пошук активістів</span> - поширення інформації про команду Запис з ТБ на інших ресурсах та залучення нових активістів</ul><span class=\"post-b\">Порядок роботи</span><span class=\"post-br\"><br /></span>1. Запис відео + аудіопотоку чи аудіодоріжки<br />2. Публікація \"сирців\" на файлообміннику (<a href=\"https://toloka.to/t77980\" class=\"postLink\" rel=\"nofollow\">MEGA.NZ</a>)<br />3. Додавання аудіодоріжок до бази даних <a href=\"http://wiki.hurtom.com/\" class=\"postLink\" rel=\"nofollow\"><span class=\"post-b\">wiki.hurtom.com</span></a> (<a href=\"https://toloka.to/t42839\" class=\"postLink\" rel=\"nofollow\">детальніше</a>)<br />4. Публікація посилання в цій темі на сирці<br />5. Обробка сирців<br />6. Оформлення релізу на Гуртом / <a href=\"https://toloka.to/t77980\" class=\"postLink\" rel=\"nofollow\">MEGA.NZ</a><span class=\"post-br\"><br /></span><span class=\"post-b\">Навіщо тема?</span><span class=\"post-br\"><br /></span>Тема створена для:<ul><li>Координації, організації роботи учасників команди<br /><li>Обговорення, взаємодії та співпраці<br /><li>Спільної роботи над обраними замовленнями<br /><li>Уникнення повторного запису<br /><li>Відображення стану речей щодо роботи лише команди <var class=\"postImg\" title=\"https://toloka.to/images/ranks/hurtom-tv.png\">&#10;</var>[Hurtom]</ul><span class=\"post-b\">Інструкції по роботі</span><div class=\"sp-wrap\"><div class=\"sp-body\" title=\"Як приєднатися?\"><h3 class=\"sp-title\">Як приєднатися?</h3>Для того щоб вступити до команди \"Запис з ТБ\" подайте заяву в темі <a href=\"https://toloka.to/t72494\" class=\"postLink\" rel=\"nofollow\"><span class=\"post-b\">NEW2016! Набір у команду Гуртом!</span></a></div></div>[spoiler=Як моніторити ТБ?]<span class=\"post-b\">1.</span> Ви переглядаєте програму, знаходите там щось цікаве (фільм, мультфільм, серіал чи ще щось).<br /><span class=\"post-b\">2. </span>Заходите <a href=\"https://toloka.to/tracker.php\" class=\"postLink\" rel=\"nofollow\"><span class=\"post-b\">сюди</span></a> і шукаєте це (шукати треба за оригінальною назвою). Якщо не знаходите переходите до п. 3... (Те ж саме ви робите, якщо можлива нова озвучка. Якщо ж Ви знаходите на Гуртом вже готовий реліз з озвучкою від каналу на якому Ви знайшли щось цікаве (фільм, мультфільм, серіал чи ще щось), то Ви просто переходите до пошуку чогось іншого).<br /><span class=\"post-b\">3.</span> Шукаєте це <a href=\"http://wiki.hurtom.com/\" class=\"postLink\" rel=\"nofollow\"><span class=\"post-b\">тут</span></a> за тим же принципом, що і в попередньому пункті, якщо не знаходите - переходите до наступного.<br /><span class=\"post-b\">4.</span> Оформлення замовлення на запис. Робите це в <a href=\"https://toloka.to/t6081\" class=\"postLink\" rel=\"nofollow\"><span class=\"post-b\">цій темі</span></a>, обов\'язково згідно шаблону наведеного там. На цьому Ваша робота завершується, далі справа за звукозаписувачами.<span class=\"post-br\"><br /></span><span class=\"post-u\">Автор:</span> <a href=\"https://toloka.to/u136837\" class=\"postLink\" rel=\"nofollow\">patriot2305</a></div></div><div class=\"sp-wrap\"><div class=\"sp-body\" title=\"Як замовити запис з ТБ?\"><h3 class=\"sp-title\">Як замовити запис з ТБ?</h3>Замовити запис фільму, серіалу або телепрограми можна <a href=\"https://toloka.to/t6081\" class=\"postLink\" rel=\"nofollow\">ТУТ</a> за шаблоном (<span style=\"color: Red;\">обов\'язково!</span>)<div class=\"sp-wrap\"><div class=\"sp-body\" title=\"Шаблон\"><h3 class=\"sp-title\">Шаблон</h3><div class=\"q-wrap\"><div class=\"q\"><span class=\"post-b\">Назва українською:</span> <span class=\"post-i\"><span style=\"color: Green;\">Назва стрічки українською мовою</span></span><br /><span class=\"post-b\">Назва мовою оригіналу і рік:</span> <span class=\"post-i\"><span style=\"color: Green;\">Назва стрічки мовою оригіналу і рік</span></span><br /><span class=\"post-b\">IMDb:</span> посилання на сторінку IMDb<div class=\"sp-wrap\"><div class=\"sp-body\" title=\"Телетрансляція (якщо була чи буде&amp;#41;&amp;#58;\"><h3 class=\"sp-title\">Телетрансляція (якщо була чи буде&amp;#41;&amp;#58;</h3><span class=\"post-b\">Телеканал № 1:</span> <span class=\"post-i\"><span style=\"color: Green;\">назва телеканалу</span></span><br /><span class=\"post-b\">Дата та час (<span class=\"post-i\">включаючи повтори</span>):</span> <span class=\"post-i\"><span style=\"color: Green;\">дата та час трансляції, для зручності орієнтації в записі</span></span><span class=\"post-br\"><br /></span><span class=\"post-b\">Телеканал № 2 (<span class=\"post-i\">якщо є</span>):</span> <span class=\"post-i\"><span style=\"color: Green;\">назва телеканалу</span></span><br /><span class=\"post-b\">Дата та час (<span class=\"post-i\">включаючи повтори</span>):</span> <span class=\"post-i\"><span style=\"color: Green;\">дата та час трансляції, для зручності орієнтації в записі</span></div></div></div></div><div class=\"c-wrap\"><div class=\"c-body\">&#91;b&#93;Назва українською&#58;&#91;/b&#93; &#91;i&#93;&#91;color=Green&#93;Назва стрічки українською мовою&#91;/color&#93;&#91;/i&#93;<br />&#91;b&#93;Назва мовою оригіналу і рік&#58;&#91;/b&#93; &#91;i&#93;&#91;color=Green&#93;Назва стрічки мовою оригіналу і рік&#91;/color&#93;&#91;/i&#93;<br />&#91;b&#93;IMDb&#58;&#91;/b&#93; посилання на сторінку IMDb<br />&#91;spoiler=\"Телетрансляція (якщо була чи буде&#41;&#58;\"&#93;&#91;b&#93;Телеканал № 1&#58;&#91;/b&#93; &#91;i&#93;&#91;color=Green&#93;назва телеканалу&#91;/color&#93;&#91;/i&#93;<br />&#91;b&#93;Дата та час (&#91;i&#93;включаючи повтори&#91;/i&#93;&#41;&#58;&#91;/b&#93; &#91;i&#93;&#91;color=Green&#93;дата та час трансляції, для зручності орієнтації в записі&#91;/color&#93;&#91;/i&#93;<span class=\"post-br\"><br /></span>&#91;b&#93;Телеканал № 2 (&#91;i&#93;якщо є&#91;/i&#93;&#41;&#58;&#91;/b&#93; &#91;i&#93;&#91;color=Green&#93;назва телеканалу&#91;/color&#93;&#91;/i&#93;<br />&#91;b&#93;Дата та час (&#91;i&#93;включаючи повтори&#91;/i&#93;&#41;&#58;&#91;/b&#93; &#91;i&#93;&#91;color=Green&#93;дата та час трансляції, для зручності орієнтації в записі&#91;/color&#93;&#91;/spoiler&#93;</div></div></div></div></div></div><span class=\"post-b\"> </span><br /><span class=\"post-b\">Спільні/схожі теми</span><ul><li> <a href=\"https://toloka.to/t74610\" class=\"postLink\" rel=\"nofollow\">Команда поширення контенту [UA]</a><br /><li> <a href=\"https://toloka.to/t6081\" class=\"postLink\" rel=\"nofollow\">Замовлення запису з ТБ</a><br /><li> <a href=\"https://toloka.to/t70619\" class=\"postLink\" rel=\"nofollow\">Набір у проект \"Відео Гуртом\"</a><br /><li> <a href=\"https://toloka.to/t36840\" class=\"postLink\" rel=\"nofollow\">Запис відео з онлайн ТБ</a><br /><li> <a href=\"https://toloka.to/t72494\" class=\"postLink\" rel=\"nofollow\">NEW2016! Набір у команду Гуртом!</a><br /><li> <a href=\"https://toloka.to/t42277\" class=\"postLink\" rel=\"nofollow\">Запис ТБ</a><br /><li> <a href=\"https://toloka.to/t31494\" class=\"postLink\" rel=\"nofollow\">[Запис з ТБ] Новорічні і різдвяні фільми і мультфільми 2012</a><br /><li> <a href=\"https://toloka.to/t19872\" class=\"postLink\" rel=\"nofollow\">Щотижневий моніторинг ТБ: хф/звукові доріжки, які відсутні на Hurtom/ВІК</a></ul>');

-- --------------------------------------------------------

--
-- Структура таблиці `bb_posts_search`
--

CREATE TABLE `bb_posts_search` (
  `post_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `search_words` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `bb_posts_search`
--

INSERT INTO `bb_posts_search` (`post_id`, `search_words`) VALUES
(1, 'бонуси\nроздачу\nвласних\nнепопулярних\nторрентів\nвласний\nбонус\nвіддане\nіншими\nсловами\nрелізах\nроздача\nподвоюється\nбільше\nсідерів\nкількість\nнаприклад\nякщо\nкожен\nних\nотримає\n20%\nвід\nроздачі\nгодину\nперебування\nпочали\nдіяти\n2014\nчим\nбільший\nстаріший\nторрент\nтим\nбонусу\nнараховується\nчас\nсередньому\nзалишаючись\n10-ти\nотримаєте\n720\nдень\nмісяців\nреєстрації\nторренту\n0-1\n1-3\n3-6\n6-10\n10-20\n20+\nсідів\nчисло\nяке\nвийшло\nмножимо\nотримуємо\nтипові\nприклади\nкнига\nмузика\nнова\nстара\nфільм\nновий\nстарий'),
(3, 'модернізація\nтолоки\n(тема\nоновлюється)\nмодернізації\nвізуально\nможна\nлівого\nбоку\nдесь\nзверху\nстартовій\nсторінці\nзробити\nпосилання\nжанрами\nмаю\nувазі\nтакі\nкнопки\nалфавітному\nпорядку\n[виправлено]2\nставитесь\nтого\nщоб\nперейти\n10-бальну\nсистему\nоцінювання\nрелізів\nадже\nнею\nкористуються\nфактично\nусі\nimdb\nmultikino\n[виправлено]3\nперейменувати\nнапис\nшапці\n\"головна\"\n\"портал\"\nбагато\nхто\nдумає\nголовна\nсторінка\nтрекера\n[виправлено]4\nпропоную\nсторінку\nтакож\nвгорі\nприкріпити\nтам\nмодератори\nправила\nдумаю\nбільша\nполовина\nгуртомівців\nпро\nнаявність\nздогадується\nбуло\nдобре\nякщо\nпрофілі\nкористувача\nбув\nсписок\nтільки\nінших\nтем\nвідкритих\nкористувачем\nобговорень\nінструкцій\nпошук\nчогось\nсвій\nреліз\nзнайти\nчерез\nякусь\nтему\nобговоренням\nабо\nзапитанням\nдедалі\nважче'),
(4, 'правила\nрозділу\nанонси\nзагальні\nоформлення\nможуть\nстворювати\nтільки\nучасники\nпроекту\nвідео\nгуртом\nанонс\nповинен\nмати\nповну\nназву\nправилами\nвідповідного\nопис\nнеобов\'язковий\nале\nнеобхідно\nвказати\nпосилання\nimdb\nприблизну\nдату\nрелізу\nякщо\nзапис\nпотрібно\nтакож\nтелеканал\nкожен\nучасник\nможе\nстворити\nбільше\nанонсів\nнаприклад\nстворите\nвосьмий\nперший\nвтратить\nпріоритет\nвтрачає\nсвою\nактуальність\nпісля\nдня\nцього\nйого\nбуде\nвидалено\nвін\nмає\nгодини\nприклад\n(автор\nанонсу)\nпершими\nстворили\nреліз\nвсе\nдобре\nправило\nзастосовується\nкогось\nдодали\nторрент\nгодин\nіншої\nлюдини\nзберігається\nваш\nзапізнилися\nстворенням\nніж\nтого\nхто\nстворив\nперед\nвами\nзрозуміло\nстосується\nвипадків\nколи\nрелізи\nсебе\nповторюють\n(див\nвідео)\nопублікування\nпрошу\nніколи\nпереносити\nсмітник\nзамість\nщоб\nнову\nтему\nперенесіть\nвідповідний\nрозділ\nдодайте\nпричина\nпроста\ngoogle\nпроіндексує\nопиниться\nсмітнику\nлюди\nзможуть\nпошуку\nпотрапити\nперенесення\nзнаходиться\nзліва\nвнизу\nсторінки'),
(5, 'правила\nрозділу\nанонси\nоновлено'),
(6, 'красиво\nпіти\ngoing\nstyle\n(2017)\nweb-dl\n720p\nukr/eng\nsub\neng\nлипня\nelektroz\n1080\nжанр\nкомедія\nкримінальний\nкраїна\nсша\nкінокомпанія\nmetro-goldwyn-mayer\n(mgm)\nnew\nline\ncinema\nwarner\nbros\npictures\nрежисер\nзак\nбрафф\nактори\nморган\nфрімен\nджої\nкінг\nенн-маргрет\nкрістофер\nллойд\nмайкл\nкейн\nпітер\nсерафіновіч\nметт\nділлон\nсюжет\nневеселе\nжиття\nскладається\nосновному\nсидіння\nлавці\nпарку\nкритики\nнинішньої\nмолоді\nгодування\nголубів\nвтомившись\nвід\nбуденності\nтрійця\nпенсіонерів\nвирішує\nхоча\nцього\nідея\nдідусів\nполягає\nтому\nвсього\nлише\nпотрібно\nпограбувати\nбанк\nметнутися\nвегас\nтривалість\nякість\nвідео\nкодек\n264\nрозмір\nкадру\nширина\nвисота\nбітрейт\nкб/с\nаудіо\nмова\nукраїнська\nпереклад\nпрофесійний\nдубльований\nac3\n192\nанглійська\nоригінал\n[i]бітрейт\n384\nсубтитри\n[i]мова\n[img]\n[i]тип\nпрограмні\n(м\'які)\n[i]формат\nsrt\n[cove][/code]\nджерело\nособиста\nоцінка\nдивився'),
(7, 'красиво\nпіти\ngoing\nstyle\n(2017)\nweb-dl\n720p\nukr/eng\nsub\neng\nпитання\nфільм\nбуде\nбез\nкорейських\nсабів\nними\nдякую'),
(8, 'навіщо\nпотрібен\nрейтинг\nторрент-трекері\n(пояснення\nдля\nновачків)\n[img]\nіснує\nбагато\nрізних\nсайтів\nдають\nможливість\nзавантажувати\nфайли\nзавантаження\nфайлів\nдопомогою\nторрентів\nвідбувається\nпо-іншому\nніж\nфайлосховища\nфайлосховищах\nтипу\nтиснете\nкнопку\n“завантажити”\nзберігаєте\nсебе\nфайл\nрозташований\nсервері\nпотужному\nшвидкому\nкомп\'ютерові\nхорошим\nвиходом\nінтернет\nтакий\nспосіб\nможуть\nсобі\nдозволити\nбагаті\nорганізації\nвін\nпотребує\nзначних\nкоштів\nнатомість\nінший\nколи\nсервер\nзберігає\nвідповідно\nповинен\nбути\nдуже\nсильним\nвсього-навсього\nзнає\nлежать\nпотрібні\nвони\nкомп\'ютерах\nкористувачів\nзвичайних\nлюдей\nколись\nзавантажили\nодин\nодного\nтепер\nзберігають\nсвоїх\nдомашніх\nноутах\nцей\nназивається\n“торрент-трекер”\nз\'являється\nновий\nкористувач\nхоче\nзавантажити\nпросто\nпідказує\nйому\nадреси\nтаким\nчином\nтільки\nпосередником\nміж\nкомп\'ютерами\nзнайомить\nсобою\nпісля\nцього\nзнайомства\nпрямо\nкомп\'ютера\nіншого\nкористувача\nякщо\nвже\nмаєте\nдосвід\nкористування\nторрентами\nможете\nзаперечити\nнічого\nподібного\nякими\nпосиланнями\nпереходите\nким\nтам\nзнайомитесь\nнасправді\nвсе\nрівні\nкомп\'ютерних\nпрограм\nвиконують\nвас\nвсю\nроботу\nпрограми\nтак\nзвані\n“торрент-клієнти”\nсконструйовані\nсаме\nщоб\nшукати\nдопомагати\nнайпопулярніші\nсеред\nних\nutorrent\nbittorrent\nvuze\ntransmission\nвеликому\nрахунку\nвсі\nстворені\nобійтись\nбез\nдодаткових\nналаштувань\nдостатньо\nвіддати\nторрент-файл\n(файл\nрозширенням\ntorrent)\nдалі\nсамі\nрозберуться\nзвідки\nпотрібний\nвам\nкому\nйого\nпотім\nроздати\ntorrent\nтим\nсамим\n“посиланням”\nкомп\'ютери\nзберігається\nотже\nз\'ясували\nфайлу\nкомп\'ютерів\nвідвідувачів\nінтернету\nтаких\nзапитання\nтреба\nзробити\nбуло\nлегким\nякісним\nпотрібна\nхороша\nшвидкість\nдосягти\nможна\nтоді\nбуде\nзнаходитись\nякомога\nбільшої'),
(9, 'хочеш\nкіно\nукраїнською\nзамовляй\nчотирнадцятий\nтур\nголосування\nдокументальні\nфільми\nшановні\nгуртомівці\nцього\nразу\nбуде\nобрано\nнових\nкласичних\n[img]\nподіляється\nтеми\nновинки\nкласика\nбухта\nthe\ncove\n(2009)\nжанр\nдокументальний\nкраїна\nсша\nкіностудія\nкінокомпанія\ndiamond\ndocs\nfish\nfilms\noceanic\npreservation\nsociety\nquickfire\nрежисер\nлуі\nпсіхойос\nсюжет\nфільмі\n«бухта»\nмова\nйде\nпро\nщорічне\nполювання\nдельфінів\nяке\nвлаштовують\nжителі\nміста\nтаїджі\nрибалки\nзаганяють\nссавців\nвузьку\nбухту\nчастину\nних\nвідловлюють\nдля\nпродажу\nокеанаріум\nале\nбільшу\nвбивають\nщоб\nпродати\nм\'ясо\nринках\nщороку\nприбережних\nводах\nгине\n23000\nвірунга\nvirunga\n(2014)\nвійськовий\nвеликобританія\nконго\nорландо\nфон\nайнсідель\nгрупа\nсміливців\nризикує\nвласним\nжиттям\nврятувати\nостаннього\nсвіті\nпредставника\nвиду\nгірських\nгорил\nрозпал\nнової\nгромадянської\nвійни\nборотьби\nприродні\nресурси\nземляни\nearthlings\n(2005)\nшон\nмонсон\nфільм\nпроблему\nексплуатації\nтварин\nлюдьми\nодомашнювання\nрозваг\nнаукових\nдосліджень\nабо\nвиробництва\nодягу\nїжі\nземля\nкартелів\ncartel\nland\n(2015)\nметт\nхейнеман\nборотьбу\nмексиканськими\nнаркокартелями\nобох\nбоків\nкордону\nлюдина\nканаті\nman\nwire\n(2008)\nджеймс\nмарш\nоскароносний\nфіліпа\nпеті\nйого\nпроходження\nміж\nбудівлями\nвсесвітнього\nторгового\nцентру\n1974\nроці\nцей\nвчинок\nбув\nпротизаконним\nотримав\nславу\n\"мистецького\nзлочину\nстоліття\"\nпогляд\nтиші\nlook\nsilence\nданія\nіндонезія\nфінляндія\nнорвегія\nізраїль\nфранція\nнімеччина\nнідерланди\nджошуа\nоппенхаймер\nрозповідає\nгеноцид\nіндонезії\nперіод\n1965-1966\nроків\nісторія\nзосереджується\nнавколо\nсім\'ї\nяка\nвижила\nстрашні\nчаси\nнамагається\nзнайти\nвідповідальних\nсмерть\nдекількох'),
(10, 'недобросовісні\nпереклади\nкнижок\nросійської\nінших\nмов\nвирішив\nстворити\nсписок\nукраїнських\nперекладів\nякі\nвиконані\nмови\nоригіналу\nмета\nзапобігти\nпридбанню\nнеякісних\nвидань\nтакож\nстатистику\nнедобросовісних\nвидавництв\nбуду\nвдячний\nдопомогу\nувага\nпосиланнях\nдокази\nприсутні\nсторінки\nмежами\n\"гуртом\"\nбао\nдевід\nморрелл\n\"рембо\"\nтарас\nілик\n2006)\nрендалл\nфрейкс\nвільям\nвішер\n\"термінатор\"\nклименко\nвидавництво\nанетти\nантоненко\nкларісе\nліспектор\n\"час\nзірки\"\n(ймовірно\nярослав\nгубарев\n2016)\nдоказ\nсумнівно\nвнтл-класика\nпетер\nзілагі\n\"остання\nвікножирафа\"\nнімецької\nгалина\nпетросаняк\n2002)\nклуб\nсімейного\nдозвілля\nджоан\nгаррис\n\"шоколад\"\nволодимир\nполяков\n2015)\nстівен\nкінг\n\"воно\"\n(1/4\nкнижки\nроман\nтрифонов\nмихайло\nкаменюк\n2015\nперевидано\nякісним\nперекладом\n\"кладовище\nдомашніх\nтварин\"\nгерберт\nвеллс\n\"машина\nчасу\"\nнаталія\nдідушок\n2011)\nbooks\n(країна\nмрій)\nгрегорі\nробертс\n\"шантарам\"\nвадим\nалександров\n2013)\nджеймс\nдешнер\n\"той\nбіжить\nлабіринтом\"\nнаталя\nвишневська\n\"п\'ятдесят\nвідтінків\"\n2012)\nвідтінків\nтемряви\"\nсвободи\"\nпол\nекман\n\"теорія\nбрехні\"\nmikko\nймовірно\nусі\nвидавництва\nранок\nкорнелія\nфунке\n\"володар\nдраконів\"\nігор\nбондар-терещенко\nсвічадо\nлусі\nмод\nмонтгомері\n\"емілі\nвиростає\"\nпольської\nолег\nбурячківський\n2014)\nмісячного\nсерпа\"\nвирі\nжиття\"\nфоліо\nджек\nкеруак\nдорозі\"\nмарія\nкозлова\nвидано\nіншим\nвидавництвом\nджон\nтолкієн\nперснів\nхранителі\nперсня\"\nаліна\nнемірова\n2003)\nдві\nвежі\"\nповернення\nкороля\"\n\"безсоння\"\nборисенко\n2008)\n\"сяйво\"\nіван\nандрусяк\nшмуель\nйосеф\nагнон\n\"нічний\nпостоялець\"\nанглійської\nгорбатько\nнесбьо\n\"сніговик\"\nбезматьєва\n\"таргани\"\nдуброва\nшкола\n(харків)\nсерії\n\"бібліотека\nпригод\"\n(+\"бібліотека\nпригод\nзолота\nсерія\")'),
(11, 'футболки\nсимволікою\nгуртом\nлюбі\nгуртомівці\nпрошу\nприєднуватися\nініціативи\nробити\nсобі\n[spoiler=\"лого\"]\nдля\nтого\nщоб\nбуло\nлегше\nобрати\nполіграфію\nякій\nдрукуватимете\nтрохи\nрозкажу\nпро\nтехнологію\nпри\nцьому\nзупинюся\nлише\nдруці\nповно\nкольорового\nзображення\nадже\nтаке\nвоно\nнас\nіснує\nкілька\nтехнологій\nдруку\nбезпосереднє\nнанесення\nчорнил\nфутболку\nтермопереніс\nсублімація\nцифровий\nдрук\nсаме\nтак\nдосягається\nнайкраща\nстійкість\nале\nнашому\nвипадку\nекземпляр\nзазвичай\nціна\nнадто\nвисока\nназивають\nвід\nгрн\nскоріше\nтут\nодин\nпідводний\nкамінь\nчорнила\nякщо\nвикористовуються\nсольвентні\nдуже\nшкідливо\nпо-перше\nпо-друге\nфутболка\nматиме\nнеприємний\nзапах\nтакож\nваріант\nуф-затверджуваних\nвони\nмають\nзапаху\nдосить\nекологічні\nцей\nобрала\nоптимальний\nхоча\nнажаль\nскористатися\nним\nвийшло\nмені\nтреба\nвстигнути\nвідпустки\nєдина\nфірма\nмісті\nяка\nвикористовує\nвичерпала\nзапас\nчекала\nнової\nпоставки\n2010\nзараз\nвідмовляються\nпрацювати\nмалими\nпартіями\nрезультат\nтермопереносу\nбачите\nфотографії\nнайдешевший\nнайдоступніший\nодиничного\nзамовлення\nмає\nцілий\nряд\nнедоліків\nякі\nвиходять\nтехнології\nтехнологія\nполягає\nтому\nдзеркальному\nвідображенні\nдрукується\nзвичайному\nструменевому\nпринтері\nспеціальному\nпапері\nотримане\nпереноситься\nдопомогою\nтермопресу\nвідповідній\nтемпературі\nзвичайно\nбути\n100%\nбавовняна\nсинтетика\nвитримає\nтемператури\nготовий\nвиріб\nвитримує\nмаксимум\nразів\nручного\nпрання\nбез\nзастосування\nсушки\nвідбілювачів\nварто\nвідмітити\nцим\nспособом\nдрукує\nбільшість\nінтернет-магазинів\nсхожа\nпопередню\nвикористовується\nвиключно\nсинтетична\nтканина\nпереносі\nвступають\nнею\nреакцію\nзалишаються\nтканині\nнадовго\nспосіб\nпопулярний\nсеред\nмоєму\nйого\nпропонує\nодна\nмене\nвлаштував\nсинтетичного\nвиробу\nспеціальних\nфарб'),
(12, 'створити\nмануал\nдля\nтолоці\nкритична\nнестача\nінструкцій\n\"чайників\"\n[img]\nякщо\nволодієте\nтакими\nуміннями\nнавичками\nсинхронізація\nаудіо\nдоріжок\nвідео\n(сирих\nдоріжок)\nсубтитрування\nвідеоконтенту\nзапис\nзвукових\nпідтримкою\nпоширенням\nрелізівви\nможете\nмануал/інструкцію\nдетальним\nалгоритмом\nдій\nновачків\nзахочуть\nпродовжити\nваші\nпочинання\nзаради\nзагальновідомої\nмети\nпоширення\nукраїнського\nмережі\nвідіграє\nважливу\nроль\nтеперішні\nчаси\nінформаційних\nвоєн\nвідеоуроки\nвітаються'),
(13, '[розшукуються]\nвтрачені\nдубляжі\ndvd\nvhs\nінших\nносіях\nякщо\nхочете\nбодай\nякось\nвплинути\nневтішну\nситуацію\nпишіть\nзвернення\nось\nпосилання\nдетальною\nінформацією\nоригінальне\nозвучення\nліта\nмолодії\n1958\nрік\n(фільм\nкіностудії\nдовженка)\n------------\nвеселі\nжабокричі\n(весёлые\nжабокричи)\n1971\nлебедине\nозеро\nзона\nswan\nlake\nthe\nzone\n(1990)\n(скрізь\nповерх\nориґінальної\nукр\nдоріжки\nрашн\nодноголоска\nхоча\nархівів\nможливо\nзбереглась\nориґінальна\nверсія\nзвукової\nдоріжки)\nроксолана\nволодарка\nтемряви\n[серіал\n24-х\nсерій]\n2002-2003\nнаше\nросійське\nрадянське\nкіно\nвиборзька\nсторона\n(выборгская\nсторона)\n1938\n[дубльовано\nроки\nсрср]\nтаємниця\nдвох\nокеанів\n(тайна\nдвух\nокеанов)\n1955-1956\nлюдина\nбез\nпаспорту\n(человек\nпаспорта)\n1965\nдержавний\nзлочинець\n(государственный\nпреступник)\nневловимі\nмесники\n(неуловимые\nмстители)\n1966\nреспубліка\nшкід\n(республика\nшкид)\nкиївській\nстудії\n\"ім\nдовженка\"\nвій\n(вий)\n1967\nциган\n(цыган)\nпомилка\nоноре\nбальзака\n1968\nфільм\nдовженка\nджерело\nсек\nщит\nмеч\n(щит\nмеч)\nчортова\nдюжина\n(чертова\nдюжина)\n1970\nодеській\nодин\nнас\n(один\nнас)\nжодного\nдня\nпригод\n(ни\nприключений)\nвідвага\n(дерзость)\n1973\nдокер\n(докер)\nмиттєвостей\nвесни\n(семнадцать\nмгновений\nвесны)\n[для\nтб]\nстудією\nранку\nночі\"\n2006-му\nроці\nзамовлення\nтелеканалу\n\"тві\"\nіду\nсвоїм\nкурсом\n(следую\nсвоим\nкурсом)\n1974\nвійськово-польовий\nроман\n1983\n(дублювали\nвладислав\nпупков\nмиколу\nбурляєва\nлюдмила\nлогійко\nінна\nчурікова)\nтам\nвдалині\nрікою\n(там\nвдали\nрекой)\n1975\nдама\nпапугою\n1989\nдіви\nночі\n(девы\nночи)\n2007\nтаємничій\nострів\n(таинственный\nостров)\n2008\nрайські\nптахи'),
(14, 'шукаю\nгуморески\nпана\nдзюня\nжурись\nвітання\nколись\nвмирав\nсміху\nвід\nтої\nтворчості\nцього\nпрекрасного\nчоловіка\nтепер\nнеті\nлише\nйогоє\nпро\nгриця\nсовківа\nобрізана\nдуже\nхтось\nшось\nзнає\nможе\nподілитися\nбуду\nвдячний\nтрохи\nінфи\nстася\nдзюньо\nсоюз\nпсихіатра\nдепутата\nлюдмила\nпуляєва\nфото\nволодимира\nдубаса\nквітня\nльвівська\nобласна\nфілармонія\nзібрала\nдва\nаншлагові\nконцерти\n15-річчя\nсвого\nсценічного\n«шлюбу»\nсвяткували\nпані\nпан\nльвівського\nтеатру\n“не\nгодиться\nпривітати\nювілярів\nприйшли\nїхні\nдрузі\nколеги\nсцені\nнародний\nартист\nукраїни\nроман\nвітошинський\nзаслужена\nартистка\nнаталія\nроманюк\nсоліст\nвашингтонської\nопери\nстефан\nп’ятничко\nспівак\nвалерій\nстеповий\nгурт\nолега\nкульчицького\nбатяр-бенд\n“галичина”\nхудожній\nкерівник\nвіктор\nморозов\nстасі\nпочався\nвистави\n“картотека\nбазя”\nбазьо\nзаймався\nтим\nсватав\nсамотніх\nлюдей\nхто\nховається\nцими\nсценічними\nмасками\nособливість\nяких\nполягає\nнезмінності\nстабільності\nобразів\nвпродовж\nусіх\n15-ти\nроків\nхай\nрозкажуть\nсамі\n(богдан\nрибка)\nмолюся\nдвом\nбогам\nмельпомені\nгіппократу\nпрацюю\nобласній\nклінічній\nпсихіатричній\nлікарні\nлікарем-психіатром\nмистецтво\nіде\nпаралельно\nнедержавний\nтеатр\nхоча\nчленом\nспілки\nтеатральних\nдіячів\nсаме\nзнання\nпсихології\nпідштовхнуло\nмене\nстворення\nобразу\nнашого\nсередовища\nгротесковими\nакцінтуйованими\nакцінтуйована\nособистість\nпатологія\nтакий\nсобі\nпограничний\nстан\nуже\nтак\nзжилися\nсвоїми\nвідгукуюсь\n“пана\nдзюня”\n(заслужений\nдіяч\nмистецтв\nостап\nфедоришин)\nжитті\nбуваю\nпохмурим\nрозважливим\nале\nдумаю\nякщо\nвсі\nтакими\nбудуть\nварто\nжити\nтоді\nнамагаюся\nжартами\nрозвеселити\nбільш\nпохмурих\nвзагалі\nбагато\nчим\nзаймаюся\nнад'),
(15, 'допоможіть\nзнайти\nтакі\nпрограми\nгуртомівці\nщукаю\nбажано\nрідним\nінтерфейсом\nфотошоп\n(adobe\nphotoshop\ncs4)\nдримвівер\ndreamweaver\nфлеш\nflash\ncs4\nprofessional)\nсвіш\n(swishmax\nафтер\nефектс\nafter\neffects\nпрем’єр\npremier\npro)\nхто\nможе\nвикласти\nвуду\nвдячний'),
(16, 'пропоную\nігри\ncrazy\nmachines\nthe\nsims\ncollection13in1\nbilliard\ndeluxe\nperfectpool\ncrashday\nmatador\n[pcdvd][english]\nfarcry\nfar\ncry\nillusion\nwar\nдьявольский\nостров\nfarcry_commando\nhitman_blood_money\nland\nrover\nford\nneed\nfor\nspeed\nnfs\nunderground\nnfs_mw\ncarbon\npro\nstreet\nquake\narena\nxpand\nrally\nxtreme\nантологія\njuiced\nbus\ndriver\ncommanch\nrace\nчемпіонат\nwtcc\nmicro\nhalf\nlife\nepisode\none\ntwo-unleashed\nbattlefield\nalarm_crash_time(arcade2007)\nworms\nmayhem\nportable\ncounterstrike\n[інтернет+боти+моделі\nзброї\nперсонажі\nsource]\nрусский\nспецназ\nsource\nfusionpack\n3dsexvilla_v2\n034\n001_cracked\n(якщо\nkonfucius\nдозволить\nwide\ngrin\nmafia\nmodern\nmod\ngta\nsan\nandreas\n(original)\ntrue\ncrime\nповний\nсписок\nможу\nвикласти\nкожну\nгру\nцього\nсписку\nякщо\nпід\nномером\nвказано\nкілька\nігор\nтільки\nдля\nвпорядкування\nвикладаю\nокремо'),
(17, 'перезаливання\nукраїномовного\nконтенту\nрізних\nресурсів\nгуртом\nпроект\nпідтримки\nвсього\nукраїнського\nрозвивається\nзусиллями\nтисяч\nентузіастів\nякі\nпоступово\nнаповнюють\nйого\nусім\nнадибали\nінтернетрях\nразом\nтим\nабсолютна\nбільшість\nвсе\nзалишається\nпоза\nнашим\nпроектом\nзнаходить\nприміром\nлюдина\nрідкісну\nукраїнську\nкнигу\nмузичний\nальбом\nщось\nякомусь\nфайлообмінників\nторрент-трекерів\nоднак\nнеї\nінтернет\nпомегабайтний\nнемає\nаккаунта/довго\nчекати\nдля\nзавантаження\nвпевнений\nчимало\nкористувачів\nмають\nактиві\nзолоті\nаккаунти\nрапідшеа\nдепозит\nінші\nвисоку\nшвидкість\nбезлімітний\nмогли\nпачками\nвантажити\nзнайдений\nтаким\nчином\nукраїнський\nконтент\nтака\nпрограма\nдіє\nздебільшого\nобмінниках\nхостингах\nсайтів\n(не\nбуду\nназивати\nяких)\nякось\nподумав\nможна\nбуло\nтаке\nзастосувати\nнашого\nбагатьох\nвже\nрідного\nhurtom\nhappy\nцього\nстворена\nдана\nтема\nорганізіція\nпроцесу\nвідбувається\nнаступною\nсхемою\nбудь-хто\nнебайдужих\nдесь\nпід\nчас\nперегляду\nнайрізноманітніших\nякийсь\n(фільм\nпрограму\nякого\n(для\nперевірки\nвикористовується\nпошук)\nпісля\nвіднайдення\nгуртівець\nкопіює\nпосилання\nпереходить\nтему\nстворює\nневелике\nповідомлення\nобов\'язково\nмає\nвключати\nнаступні\nскладові\nназва\nзнайденого\n(фільму\nкниги\nпрограми\nтип\nтеж\nдоцільно\nзазначити\nдужках)\nрозмір\nспойлером\nтільки\nтак)\nсаме\nприклад\n(диск)\nкиїв\nісторична\nенциклопедія\nнайдавніших\nчасів\n1917\n(ukr/rus/x86)\n442\n(що\nхвильку\nвільного\nчасу\nдостатні\nкодиції\nінтернету\nпривілейовані\nаккаунти)\nбере\nтеми\nзавантажує\nрозміщує\nметодика\nроботи\nбуде\nпостійно\nвдосконалюватися\nнаразі\nkonfucius\nбібліотека\n\"літера\"\n(понад\nтисячі\nкниг\nрізноманітних\nформатах)\ncizarion\n\"читанка\"\n(1400\nжурналів\nдітей\ndjvu\nформаті)'),
(18, 'шукаю\nстаттю\nшановні\nпанове\nльвова\nмені\nхотілося\nвідсканувати\nвозняка\nжурналу\n\"шлях\nвиховання\nнавчання\"\n(число\n1936\nрік\n16-27)\nмає\nхтось\nзмогу\nдопомогти\nкрім\nлннбу\nцієї\nстатті\nнапевно\nвже\nніде\nнемає\nвідшукати\nінші\nпримірники\nцього\nчасопису\nвдалося'),
(19, 'faq\nµtorrent\nдана\nінструкція\nнаписана\nдля\nлюдей\nякі\nможуть\nсамотужки\nрозібратися\nпотрібно\nкористуватися\nторрентами\nзадають\nпитання\nмолять\nмодераторів\nкористувачів\nщоб\nдопомогли\nзавантажити\nфільм\nкнижку\nмузику\nдуже\nтребаhappy\nписалася\nпрограми\nяка\nпрацює\nопераційних\nсистемах\nwindows\nmac\nlinux\n(через\nwine)\nпрограм\nіснує\nбагато\nхоча\nвеликим\nрахунком\nпослідовність\nдії\nбуде\nсильно\nвідрізнятися\nвід\nрозписаних\nтут\nякщо\nбажання\nчас\nможете\nзробити\nщось\nподібне\nінших\nскріншоти\nвикористані\nілюстрації\nзроблені\nвісті\nx64\nsp1\nпочатку\nвам\nзавантажуємо\nвстановлюємо\nінсталяційний\nфайл\nукраїнізатор\n(для\nвстановлення\nукраїнізатора\nкопіюємо\nutorrent\nexe\nlang\ntxt\nпапку\nкуди\nвстановили\nпрограму)\nпри\nпершому\nзапуску\nз\'явиться\nвікно\nмайстра\nшвидкості\nвідповідно\nвашого\nінтернету\n(якщо\nточніше\nвіддачі)\nвибираємо\nваріантів\nпроводимо\nтест\nвідкритість\nпорту\nякий\nвикористовуватися\nтесту\nвідкритості\nвідкриється\nваш\nбраузер)\n[img]\nтакож\nзверніть\nувагу\nзначки\nіндикатори\nмережі\nсередині\nзнизу\nіндикатор\nстає\nзеленим\nпояві\nпершого\nвхідного\nз\'єднання\nозначає\nпорт\nточно\nдоступний\nвідразу\nпісля\nстарту\nпоказує\nвнизу\nжовтий\nвхідних\nз\'єднань\nпоки\nнемає\nклієнт\nз\'єднаний\nневеликою\nкількістю\nпірів\nможе\nзалишатися\nжовтим\nдовго\nчервоний\nгурток\nз\'являється\nколи\nостаточно\nвирішує\nнедоступний\nнього\nвже\nдавно\nбезліч\nвихідних\nале\nцього\nчасу\nодного\nстарті\nклієнта\nпідведенні\nкурсору\nнапис\n«помилка\nзмінити\nправило\nзайнятий\nіншою\nпрограмою\nнаприклад\nвас\nзапущений\nінший\nторрент\nякого\nнастройках\nвказано\nтой\nномер\nвідкритий\nпереходимо\nдалі\nчитаємо\nдеяких\nвипадках\nзакритий\nперешкодою\nзавантаження\nвін\nобмежить\nшвидкість'),
(20, 'створення\nрелізів\nh264\nmkv\nнеобхідні\nінструменти\nmegui\navisynth\navspmod\nk-lite\ncodec\npack\nmega\nffmpeg\nскрипту\nвідкрийте\nремукс\nдопомогою\nзнайдіть\nсвітлий\nкадр\nобріжте\nчорні\nсмуги\nчерез\nvideo\ncrop\neditor\nвирахуйте\nрозмір\nнаприклад\nпісля\nобрізання\nвийшло\n1920x1040\n1920\nподілити\n1040\n846153846153846\n1280\n(бажана\nширина)\n693\n3333333333334\nберіть\nнайближче\nчисло\nяке\nділиться\nданому\nвипадку\n692\nдодайте\nlanczos4resize(1280\n692)\nрезультаті\nвийде\nщоб\nзгладити\nbanding\nраджу\nкінці\nдодати\nприбрати\nшум\nпершу\nчергу\nстарих\nфільмах\nlanczos4resize\nслабкий\nсередній\nріпання\nвідео\navs\nвиберіть\nx264\n*scratchpad*\nencoder\nsettings\nfile\nformat\nconfig\nпоставте\nгалочку\nshow\nadvanced\nconst\nquality\nвстановіть\nдля\nнових\nфільмів\nабо\nзернистих\n(чим\nнижче\nзначення\nтим\nвища\nякість\nпереходити\nмежі\n18-22\nдосвіду\nможу\nсказати\nбільш\nніж\nдостатньо)\nзамість\nтого\nпараметри\nвибирати\nвручну\nтакож\nможете\nзавантажити\nмій\nпрофіль\n(називається\nfilm)\nimport\npresets\nнатисніть\nqueue\nаудіо\nзавантажте\nнайновіший\nffmpeg-static\nкомандний\nрядок\nпуск\nвиконати\ncmd\n(windows\nwin+r\n8+)\nперетягніть\nexe\nдопишіть\nоднаковим\nспособом\nвікно\nenter\nвас\nмала\nвийти\nтака\nкоманда\nпокаже\nінформацію\nпро\nфайл\nнас\nцікавить\nоригінальної\nдоріжки\nстрілкою\nвверх\nповерніться\nпопередньої\nкоманди\nдоповніть\nmap\nac3\nформат\n448k\nбітрейт\nчому\nec3to\nвін\nвикористовує\naften\nдуже\nзастарілий\nенкодер\nпорівняння\nac3-448\nsonic\nfoundry\n(dolby\nsony\nstudio\nconsumer\nencoder)\npro\ndts-hd\nоригінал\naac\nlibfdk_aac\naac-224\nnative\npcm-1536\nпри\nкодуванні\nнапряму\ndts\nможе\nвидати'),
(21, 'чап\nдля\nновачків\nсубтитрування\n[i]…або\nнаступати\nсамі\nграблі\nзнаю\nчого\nмене\nвважає\nтак\nчимало\nлюду\nгарним\nзнавцем\nале\nвласного\nдосвіду\nщось\nспробую\nпорадити\nзгодом\nякось\nлепсько\nтекст\nтеми\nоформиться\nінформація\nвпорядкується\nотож\nгіпотетично\nуявімо\nпочинаємо\nнуля»\nякими\nнегараздами\nтруднощами\nзіткнемося\nнам\nнайбільш\nнеобхідне\nбажання\nнаполегливість\nвизначення\nсвоїх\nцілей\nусвідомлення\nможливостей\nпошук\nспільнодумців\nінструментів\nдосягнення\nмети\nтестова\nжертва\n…мабуть\nзабувати\nхоча\nпро\nпункти\n1-4\nзараз\nмаємо\nякийсь\nсписок\nнезрозумілої\nмотивації\nспробуймо\nпояснити\nбільш\nрозгорнуто\nпричини\nможуть\nбути\nрізними\nоднаковими\nлюдини\nвиникло\nстворити\nкорисне\nгарне\nзначне\nбез\nнього\nнікуди\nважливо\nщоб\nвоно\nзникало\nпоявою\nтруднощів\nпочасти\nможе\nважкуватим\nзалежності\nвід\nобраної\nкартини\nнавіть\nнудним\nколи\nзникає\nпотрібно\nпродовжувати\nйти\nвперед\nгарний\nбік\nнепогано\nвчить\nдрукувати\n(наприклад\nможна\nзакріпити\nсліпу\nнавичку\nдруку\nзамість\nтого\nпросиджувати\nтренажерах)\nінший\nплюс\nрозглядаємо\nісторію\nкнигу\nтому\nзнаємо\nмайже\nдосконало\nостанніх\nнатяків\nчитання\nзначень\n«між\nрядків»\nварто\nобирати\nцікавий\nсобі\nматеріал\nвзнаєте\nнове\nлюдям\nкористь\nнецікавим\nважкувато\nякщо\nзовсім\nнецікаві\nфільми\nніяких\nнаполегливості\nвистачить\nцим\nдоволі\nпросто\nпошукайте\nцікавих\nкандидатів\nстворіть\nбажаного\nцікавого\n…не\nрозклад\nзмоделюйте\nнаперед\nвиділений\nчас\nзможете\nзавершити\nпомножте\nцей\nдесь\nлюдина\nзавжди\nоптимістична\nпрогнозах\nодним\nсловом\nхоч\nмінімально\nорганізуйтеся\nважливий\nпункт\nподумаємо\nякі\nмови\nможемо\nсамостійно\nнашвидку\nперекладати\nзнайти\nспільника-перекладача\nзайматися\nоформленням\n(про\nтрохи'),
(22, 'запис\nандроід\nпроблеми\nпереном\nhdd\nхтів\nзаписати\nамс\nсеріали\nвони\nнедавно\nканал\nукраїнізували\nале\nбіда\nтому\nтелевізор\nякого\nпідключено\nформатує\nйого\nпід\nсвій\nформат\nпісля\nзапису\nможу\nпродивитися\nкомп\'ютері\nвін\nбачить\nдиск\nщоб\nпобачив\nтреба\nформатувати\nнаново\nанглійському\nпрописував\nзнайшов\nможна\nякось\nзапустити\nчерез\nемулятор\nlinux\nбез\nформатування\nфайли\nбудуть\nвсе\nодно\nзашифровані\nхтось\nзнає\nзробити'),
(23, 'створення\ndts\nдоріжки\nфільму\nформаті\nнапевно\nкожного\nколись\nвиникало\nбажання\nпереглядаючи\nфільм\nотримати\nвід\nнього\nвесь\nтой\nмаксимум\nвідчуттів\nтобто\nлише\nшикарну\nкартинку\nале\nтак\nбракує\nфільмах\nукраїнським\nперекладом\nсаме\nякісна\nаудіодоріжка\nвеликим\nбітрейтом\nтому\nцій\nтемі\nпропоную\nрозглянути\nнаступне\nсвоїми\nзусиллями\nможна\nстворити\nякісну\nаудіодоріжку\nотже\nнайчастішим\nвипадком\nтаке\nскачав\nмега\nкрутій\nякості\nукраїнський\nпереклад\nпідвів\nбітрейт\nзадовіляняє\nваші\nморальні\nпогляди\nхочете\nтравмувати\nвушні\nперепонки\nцим\nнеякісним\nзвучанням\nвиходить\nваших\nколонок\nробим\nскачали\nякому\nукр\nдоріжка\nабо\nокремо\nсаму\nприпустим\n448\nкбит/с\nаас\nоригінальна\ndts-hd\n4018\nінша\nбільш\nвам\nпотрібно\nвитягнути\nцентральний\nканал\nвставити\nйого\nзамість\nцентрального\nканалу\nтаким\nчином\nотримаєте\nдоріжку\nтепер\nвсе\nпорядку\nщоб\nможете\nскористатись\nцими\nпрограмами\nдля\navi\nvirtualdubmod\nmkv\ndemux\ntool\nextract\ngui\nm2ts\nmuxer\nнаступним\nкроком\nбуде\nрозкладання\nдоріжок\nканали\nцьому\nнам\nдопоможе\ntranzcodegui\nтільки\n(якщо\nнаприклад\nвитягуємо\nлюбий\nпрактиці\nвони\nідентичні\nуже\nчерез\nпрограму\nsound\nforge\npro\nтранзкод\nзнаю\n(((\nмене\nбула\nпроблема\nдодаю\nінфу\nякщо\n100\n976\nтреба\nперевести\n000\nвідкриваю\nфайл\nстворюю\nновий\nвигляді\nзберігаю\nпри\nнема\nмоно\nбіт\nпотім\nстворену\nбіта\nперекидую\nбітну\nдорогу\nбітами\nшаблоні\nавтоматично\nвиставлено\nтам\nпереліку\n)))))\nвідкриваємо\nпрограмі\nвхідну\nвказуємо\nмісце\nзберегти\nрозкладеному\nобовязково\nзазначати\nвкінці\nназви\nвихідної\nwav\"\naac\nвиставити\nрозрядність\nбітність\nдискретизацію'),
(24, 'новинка_2018\nнабір\nкоманду\nгуртом\nпроводиться\nрізних\nгруп\nкожна\nгрупа\nвідповідає\nсвою\nвласну\nроботу\nперша\n(г1\nтак\nзазначати\nповідомленні\nдолучення\nгрупи)\nсинхронізація\nаудіо\nдоріжок\nвідео\n(сирих\nдоріжок)\nсинхронізували\nколись\nдоріжки\nякими\nпрограмами\nскільки\nчасу\nможете\nпрацювати\nнад\nсинхронізацією\nдобу\nяку\nкількість\n\"сирих\"\nготові\nвзяти\nопрацювання\nмісяць\nчому\nхочете\nзайматись\nсаме\nдруга\n(г2)\nсубтитрування\nфільмів\nсеріалів\nмультсеріалів\nаніме\nдокументального\nкіно\nіншого\nмовами\nволодієте\nякий\nнапрямків\nобрати\nперекладом\nсубтитрів\nтретя\n(г3)\nзапис\nзвукових\nяких\nканалів\nмаєте\nзмогу\nзаписувати\nяка\nякість\nзапису\nхотіли\n(фільми\nсеріали\nмультсеріали\nдокументальне\nінше)\nчас\nнапротязі\nдоби\nчетверта\n(г4)\nозвучування\nмали\nсправу\nозвучуванням\nчогось\n(описати\nвсе\nвважаєте\nпотрібне)\nбажаєте\nозвучувати\nвиділити\nдля\nнажаль\nзараз\nнемає\nактивної\nдіяльності\nозвученню\nвід\nпроекту\n\"відео\nгуртом\"\nактивно\nозвучують\nлише\nпартнерські\nстудії\nзвертайтесь\nних\nприват\nстудія\nhurtom\nнезупиняйпродакшн\nструґачка\nfanvoxua\n(вибачаюсь\nякщо\nкогось\nпропустив\nнеактивних\nтепер\nпроектів\nприм\nigor911)\nп\'ята\n(г5)\nпідтримка\nроздач\nпоширення\nінтернету\nвільного\nмісця\nжорсткому\nдиску\nзапропонувати\nпідтримки\nрелізів\nваша\nшвидкість\nвіддачі\nконтенту\nвідкритий\nпорт\nвхідних\nз\'єднань\nроздачі\nпоширенням\nінтернеті\nпоширювати\nконтент\nякі\nрелізи\nвас\nмають\nбільше\nзначення\nцих\nрелізах\nстоятимете\nстояти\nпостійно\nдати\nсвоєму\nкомп\'ютері\nзберігання\nхтось\nзахоче\nскачати\nйого\nвстати\nроздачу\nзацікавило\nпишіть\nкоментарях\nале\nшаблону\nвиникли\nінші\nпитання\nпрошу\nписати\nмені\nзнайдемо\nрішення'),
(25, 'команда\nпідтримка\nпоширення\nданий\nмомент\nнеобхідна\nваша\nдопомога\nпоширенні\nконтенту\nрозділу\nукраїнською[/u][/url]\nзайти\nрозділ\nhd[/u][/url]\nставити\nзавантаження\nрелізи\nроздаються\n1-м\nсідом\nтоді\nпопали\nадресою\nнам\nякраз\nпотрібен\nкористувач\nзможе\nстворювати\nвикладати\nформаті\nультрависокої\nроздільної\nздатності\n4k(uhd)\nвідпишіть\nцій\nтемі\nабо\nзавітайте\nсеріали\nultra\nvideo\nперегляньте\nуже\nіснуючі\nнапрацювання\n[size=12]тоді\nвам\nсюди\nзавантажуйте\nопубліковані\n4к/hd[/u][/url]\nділіться\nукраїномовним\nконтентом\nвсіма\nукраїнцями\nтаке\n\"підтримка\nпоширення\"\nгрупа\nактивістів\nголовною\nметою\nякої\nукраїномовного\nвідеоконтенту\nмережі\nінтернет\nструктурно\nвідноситься\nреліз-групи\nнапрямки\nроботи\nрелізер\nhurtom\nпублікація\nоформлення\nвідсутнього\nтолоці\n[/url]-\nроздача\nзавантаженого\nнадання\nсмуги\nшвидкого\nфайлівнабір\nкоманди\nсхема\nприєднатися\nнаписати\nзаявку\nдля\nвступу\nвигляді\nцільовий\nсайт\nпублікацій\nгуртом\nрелізів\nстаж\nроки\nдосвід\nтак\nпорядок\nробите\nзамовлення\nшаблоном\nнижче\nзавантажуємо\nвідписуємо\nшапці\nпереглядаєте\nукраїномовний\nконтент\nулюбленого\nсайту\nзамовити\nповідомлення\nкуди\nзавантажити\nfex\nnet\nназва\nукраїнською\nхрещений\nбатько\nthe\ngodfather\n(1972)\ndvdrip\nukr/eng\nsub\neng\nзвідки\n\"готовий\nкод\"]\n[/spoiler]\nумови\nменше\nмісяців\nкількість\nвідданого\nрейтинг\nвище\nшвидкість\nвіддачі(upload)\nмбіт\nшвидкість[/url])\nоб\'єм\nпам\'яті\nпід\nроздачі\n100\nчас\n24/7\nтип\nфільми\nлітература\nмузика\n[i]24/7\n[i][color=green]фільми\nнавіщо\nтема\nстворена\nнабору\nмолодих\nкомандної\nкоординації\nорганізації\nучасників\nобговорення\nвзаємодії\nспівпраці\nспільної\nнад\nобраними\nзамовленнями\nмоніторингу\nвідображення\nстану\nречей\nщодо\n[img]\nспільні/схожі\nтеми\nукраїнської\nозвучки\nінших\nсайтах[/url]\nукраїномовних\nфільмів\nвід\nпроекту\nвідео\nгуртом[/url]\nофіційний\nдонат'),
(26, 'команда\nзапис\n\"запис\nтб\"\n[приєднуйся]\nтаке\nгрупа\nактивістів\nголовною\nметою\nякої\nукраїномовного\nмедіаконтенту\nдоступний\nтелебаченні\nйого\nпоширення\nмережі\nінтернет\nкористувачів\nструктурно\nвідноситься\nреліз-групи\nhurtom[/url]\nучасники\nбаюн[/url]\nнапрямки\nроботи\nзавдання\nобов\'язки\nгрупи\nподіляються\nмоніторинг\nтелебачення\nпошук\nконтенту\nвідсутній\nгуртом\nвідеопотоку\nтелевізора\nвивантаження\nмережу\nстворення\nрелізу\nобробка\nзаписаного\nвідео\nаудіоматеріалу\nпублікація\nтолоці\nінформації\nпро\nкоманду\nінших\nресурсах\nзалучення\nнових\nпорядок\nаудіопотоку\nаудіодоріжки\n\"сирців\"\nфайлообміннику\nдодавання\nаудіодоріжок\nбази\nданих\nпосилання\nцій\nтемі\nсирці\nсирців\nоформлення\nнавіщо\nтема\nстворена\nдля\nкоординації\nорганізації\nучасників\nкоманди\nобговорення\nвзаємодії\nспівпраці\nспільної\nнад\nобраними\nзамовленнями\nуникнення\nповторного\nзапису\nвідображення\nстану\nречей\nщодо\nлише\nінструкції\nроботі\nтого\nщоб\nвступити\nподайте\nзаяву\nнабір\n[/b][/url]\nпереглядаєте\nпрограму\nзнаходите\nтам\nщось\nцікаве\n(фільм\nмультфільм\nсеріал\nщось)\nзаходите\nшукаєте\n(шукати\nтреба\nоригінальною\nназвою)\nякщо\nпереходите\n(те\nсаме\nробите\nможлива\nнова\nозвучка\nвже\nготовий\nреліз\nозвучкою\nвід\nканалу\nякому\nзнайшли\nпросто\nпошуку\nчогось\nіншого)\nтим\nпринципом\nпопередньому\nпункті\nнаступного\nзамовлення\nтемі[/b][/url]\nобов\'язково\nзгідно\nшаблону\nнаведеного\nцьому\nваша\nробота\nзавершується\nдалі\nсправа\nзвукозаписувачами\nавтор\nзамовити\nфільму\nсеріалу\nабо\nтелепрограми\nможна\nшаблоном\n(обов\'язково\nназва\nукраїнською\nстрічки\nмовою\nоригіналу\nрік\nimdb\nсторінку\nтелеканал\nтелеканалу\nдата\nчас\n(включаючи\nповтори)\nтрансляції\nзручності\nорієнтації\nзаписі\n(якщо\n[i]назва\n([i]включаючи\n[i]дата\nспільні/схожі\nтеми\n[ua][/url]\nтб[/url]\nпроект\n\"відео\nгуртом\"[/url]\nонлайн\n[/url]\nтб]\nноворічні');

-- --------------------------------------------------------

--
-- Структура таблиці `bb_posts_text`
--

CREATE TABLE `bb_posts_text` (
  `post_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `post_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `bb_posts_text`
--

INSERT INTO `bb_posts_text` (`post_id`, `post_text`) VALUES
(1, '[b]Бонуси за роздачу власних та непопулярних торрентів [/b]\n\n[u]власний [/u]\nбонус = віддане\nіншими словами, на власних релізах роздача подвоюється\n\n[u]не більше 10 сідерів [/u]\nбонус = віддане / кількість сідерів\nнаприклад, якщо 5 сідерів, кожен з них отримає як бонус 20% від роздачі\n\n[b]Бонуси за годину перебування на роздачі [/b]\nпочали діяти 23.11.2014\n\nЧим більший і старіший торрент, тим більше бонусу нараховується за час перебування на роздачі.\nВ середньому це 3 МБ за годину. Наприклад, залишаючись на роздачі 10-ти торрентів, ви отримаєте 720 МБ бонусу за день.\n[spoiler=\"Формула\"]\n0,01 * кількість місяців від реєстрації торренту\n\n+\n\n0,0 = 0-1 ГБ\n0,2 = 1-3 ГБ\n0,3 = 3-6 ГБ\n0,4 = 6-10 ГБ\n0,5 = 10-20 ГБ\n0,6 = 20+ ГБ\n\n+\n\n0,1 від 10 сідів\n0,2 до 10 сідів\n\nЧисло, яке вийшло, множимо на 5, і отримуємо кількість МБ за годину.\n\nТипові приклади:\n\nКнига і музика\nНова 0,05 + 0 + 0,2 = 0,25 * 5 = 1,25 МБ\nСтара 0,36 + 0 + 0,2 = 0,56 * 5 = 2,8 МБ\n\nФільм\nНовий 0,05 + 0,2 + 0,1 = 0,35 * 5 = 1,75\nСтарий 0,36 + 0,2 + 0,2 = 0,76 * 5 = 3,8 МБ\n\nHD\nНовий 0,05 + 0,4 + 0,2 = 0,65 * 5= 3,25 МБ\nСтарий 0,36 + 0,4 + 0,2 = 0,96 * 5 = 4,8 МБ[/spoiler]'),
(3, '[color=green][size=22][b][align=center]Модернізації візуально толоки[/align][/b][/size][/color]\n\n[b]1.[/b] Чи можна з лівого боку, чи десь зверху на стартовій сторінці зробити посилання за жанрами?\nМаю на увазі: зробити такі кнопки в алфавітному порядку:\nhttps://toloka.to/f130\n\n[b][color=green][ВИПРАВЛЕНО][/color]2.[/b] Як Ви ставитесь до того, щоб перейти на 10-бальну систему оцінювання релізів?\nадже нею користуються фактично усі. IMDB, Multikino...\n\n[b][color=green][ВИПРАВЛЕНО][/color]3.[/b] Перейменувати напис у шапці з \"Головна\" на \"Портал\".\nА то багато хто думає, що це головна сторінка трекера.\n\n[b][color=green][ВИПРАВЛЕНО][/color]4. [/b]Пропоную цю сторінку https://toloka.to/dorizhky.php також десь вгорі прикріпити - там, де модератори, правила і т.д., бо я думаю, більша половина гуртомівців про її наявність і не здогадується.\n\n[b]5. [/b]Також було б добре, якщо б у профілі користувача був список не тільки релізів, а й інших тем, відкритих користувачем, обговорень, інструкцій, пошук чогось, бо свій реліз знайти можна і через пошук, а якусь тему з обговоренням або з запитанням дедалі важче'),
(4, '[b]Загальні правила та оформлення[/b]\n\n1. Анонси можуть створювати тільки учасники Проекту Відео Гуртом\n2. Анонс повинен мати повну назву за правилами відповідного розділу\n3. Опис необов\'язковий, але необхідно вказати посилання на imdb та приблизну дату релізу. Якщо це запис з ТБ, потрібно також вказати телеканал\n4. Кожен учасник може створити не більше 10 анонсів. Наприклад, якщо ви створите восьмий, перший втратить пріоритет\n5. Анонс втрачає свою актуальність після 21 дня, після цього його не буде видалено, але він втратить пріоритет\n[b]\nПріоритет анонсів[/b]\n\nАнонс має пріоритет 3 години.\n\nПриклад:\n1. Ви (автор анонсу) першими створили реліз. Все добре, правило не застосовується.\n2. Ви створили реліз після когось. Якщо ви додали торрент до 3 годин після іншої людини, зберігається ваш реліз.\n3. Якщо ви запізнилися зі створенням релізу більше, ніж на 3 години, зберігається реліз того, хто створив його перед вами. Зрозуміло, що це правило стосується тільки випадків, коли релізи себе повторюють (див. Правила відео).\n\n[b]Опублікування релізу[/b]\n\nПрошу НІКОЛИ не переносити анонс у смітник. Замість того, щоб створювати нову тему, перенесіть його у відповідний розділ і додайте торрент.\n\nПричина проста - Google проіндексує анонс, і, якщо він опиниться у смітнику, люди не зможуть з пошуку потрапити на ваш реліз.\n\nПосилання на перенесення знаходиться зліва внизу сторінки.'),
(5, 'Правила оновлено.'),
(6, '[size=18][b][color=red][align=center]12 липня\nElektroz 1080[/align][/color][/b][/size]\n\n[font=\"Georgia\"][align=center][color=blue][i][size=26][b]Красиво піти / Going in Style (2017) WEB-DL 720p Ukr/Eng | Sub Eng[/b][/size][/i][/color][/align][/font]\n\n[align=center][img]https://toloka.to/photos/170702114004124631_f0_0.jpg[/img][/align]\n\n[color=blue][b]Жанр:[/b][/color] комедія, кримінальний\n[color=blue][b]Країна: [/b][/color]США\n\n[color=darkblue][b]Кінокомпанія: [/b][/color]Metro-Goldwyn-Mayer (MGM), New Line Cinema, Warner Bros. Pictures\n[color=blue][b]Режисер:[/b][/color] Зак Брафф\n[b][color=blue]Актори: [/color][/b]Морган Фрімен, Джої Кінг, Енн-Маргрет, Крістофер Ллойд, Майкл Кейн, Пітер Серафіновіч, Метт Діллон\n\n[b][color=blue]Сюжет:[/color][/b]\nЇх невеселе життя складається в основному з сидіння на лавці в парку, критики нинішньої молоді та годування голубів. Втомившись від буденності, трійця пенсіонерів вирішує хоча б піти з цього життя красиво. Ідея дідусів полягає в тому, що їм всього лише потрібно... пограбувати банк і метнутися в Вегас!\n\n[b][color=blue]Тривалість:[/color][/b] 01:00:сс\n[b][color=blue]Якість: [/color][/b]WEB-DL 720p\n\n[b][color=blue]Відео: [/color][/b]\n[i][color=green]кодек: [/color][/i]H.264\n[i][color=green]розмір кадру:[/color][/i] ширина х висота\n[i][color=green]бітрейт: [/color][/i]кб/с\n\n[b][color=blue]Аудіо # 1:[/color][/b]\n[i][color=green]мова:[/color][/i] українська  [img]https://img.hurtom.com/i/2016/07/ukraine-flag-animation_25x17.gif[/img]\n[i][color=green]переклад: [/color][/i]професійний дубльований  [img]https://img.hurtom.com/i/2014/08/logok18O5.png[/img]\n[i][color=green]кодек: [/color][/i]AC3 2.0\n[i][color=green]бітрейт:[/color][/i] 192 кб/с\n\n[b][color=blue]Аудіо # 2: [/color][/b]\n[i][color=green]мова:[/color][/i] англійська  [img]https://thumb.hurtom.com/image/i41.tinypic.com/fa7vo0.gif[/img]\n[i][color=green]переклад: [/color][/i]оригінал\n[i][color=green]кодек: [/color][/i]AC3 5.1\n[i][color=green]бітрейт: [/color][/i]384 кб/с\n\n[b][color=blue]Субтитри: [/color][/b]\n[i][color=green]мова: [/color][/i]англійська  [img]https://thumb.hurtom.com/image/i41.tinypic.com/fa7vo0.gif[/img]\n[i][color=green]тип:[/color][/i] програмні (м\'які)\n[i][color=green]формат: [/color][/i]*.srt\n\n[spoiler=\"MediaInfo\"][cove][/code][/spoiler]\n[spoiler=\"Скріншоти\"]2[/spoiler]\n\n[b][color=blue]Джерело: [/color][/b] [img]https://toloka.to/img/%D0%9F%D1%80%D0%BE%D0%B5%D0%BA%D1%82_%D0%92%D1%96%D0%B4%D0%B5%D0%BE_%D0%93%D1%83%D1%80%D1%82%D0%BE%D0%BC.gif[/img] &amp;  [img]https://toloka.to/img/HDclub.com.ua.gif[/img]\n[b][color=blue]Особиста оцінка:[/color][/b] 0 - не дивився'),
(7, 'Питання: фільм буде без корейських сабів чи з ними? ДЯкую!'),
(8, '[b][size=22][color=green][align=center]Навіщо потрібен рейтинг на торрент-трекері? [/align][/color][/size][/b]\n\n[align=center][img]https://thumb.hurtom.com/image/s2.share.te.ua/b485323/gszsny9qek.png[/img][/align]\n\nІснує багато різних сайтів, що дають можливість завантажувати файли.\nЗавантаження файлів за допомогою торрентів відбувається по-іншому, ніж з файлосховища. У файлосховищах типу ex.ua Ви тиснете на кнопку “завантажити” і зберігаєте в себе файл, розташований на сервері — потужному, швидкому комп\'ютерові з хорошим виходом в інтернет. Такий спосіб можуть собі дозволити багаті організації, бо він потребує значних коштів.\n\nНатомість існує інший спосіб, коли сервер не зберігає в себе файли, і відповідно не повинен бути дуже сильним. Такий сервер всього-навсього знає, де лежать потрібні файли. Вони лежать на комп\'ютерах користувачів, — звичайних людей, що колись завантажили ті файли один в одного, і тепер зберігають їх на своїх домашніх ПК чи ноутах.\nЦей сервер називається “торрент-трекер”. [b]Коли з\'являється новий користувач, і хоче завантажити потрібні файли, сервер просто підказує йому адреси, де вони лежать. [/b]Таким чином, [b]сервер є тільки посередником між комп\'ютерами користувачів,[/b] знайомить їх між собою. Після цього знайомства завантаження файлів відбувається прямо з комп\'ютера іншого користувача.\n\nЯкщо Ви вже маєте досвід користування торрентами, можете заперечити, що нічого подібного не відбувається: ні за якими посиланнями Ви не переходите, і ні з ким там не знайомитесь. Насправді все це відбувається на рівні комп\'ютерних програм, — вони виконують за Вас всю цю роботу. Програми, так звані “торрент-клієнти”, сконструйовані саме так, щоб шукати і допомагати завантажити файли один в одного. Найпопулярніші серед них, — uTorrent, BitTorrent, Vuze, Transmission. По великому рахунку, всі ці програми створені так, що можуть обійтись без додаткових налаштувань, — достатньо просто віддати їм торрент-файл (файл з розширенням *.torrent), а далі вони вже самі розберуться, звідки завантажити потрібний Вам файл, і кому його потім роздати. Файл з розширенням *.torrent і є тим самим “посиланням” на комп\'ютери, де зберігається потрібний Вам файл.\n\nОтже, ми з\'ясували, що [b]завантаження файлу відбувається з комп\'ютерів звичайних відвідувачів інтернету, [/b]таких, як Ви. Тепер запитання: що треба зробити, щоб це завантаження було легким і якісним? Потрібна хороша швидкість. А досягти її можна тільки тоді, коли файл буде знаходитись у якомога більшої кількості людей. Тоді кожен з них віддаватиме його з невеликою швидкістю, а всі разом вони забезпечать Вам хороше, швидке завантаження. [b]Чим більше людей роздає файл, тим більшою буде швидкість Вашого завантаження. [/b]\n\nНарешті файл був Вами завантажений, і тепер торрент-клієнт автоматично починає його роздавати. (Тільки не треба йому в цьому заважати, наприклад вимикати торрент-клієнт чи видаляти з нього торрент-файл! Або видаляти файл, що був завантажений.) Зараз пора подумати про інших людей, наступних відвідувачів, котрі прийшли після Вас і теж вирішили завантажити цей файл. Вони також будуть вантажити його з комп\'ютерів користувачів, в тому числі й з Вашого комп\'ютера. А для того, щоб їхнє завантаження було не менш комфортним ніж Ваше, [b]потрібно, щоб Ваш торрент-клієнт працював \"на роздачу\" багато часу. [/b]Тобто [b]Ваша задача — роздавати цей файл якнайдовше.[/b] Для цього, як було сказано вище, просто потрібно не заважати торрент-програмі. Тільки в такий спосіб наступні відвідувачі зможуть завантажити файли.\n\nА що відбудеться, [b]якщо у Вас немає бажання роздавати файл?[/b] Тоді ті, хто прийде після Вас, завантажать його з поганою швидкістю. Або взагалі не завантажать, якщо ніхто не захоче його роздавати. І дуже скоро [b]настане момент, коли Ви забажаєте завантажити якийсь інший файл, а завантаження зовсім не буде, — бо інші теж роздавати не хочуть![/b] Так і залишитесь без потрібного Вам файлу, бо хтось вирішив, що не має бажання роздавати. Так все й зупиниться, — файли є, роздати нікому.\n\nЗвичайно, торрент-трекер найбільше зацікавлений, щоб роздача відбувалась якнайкраще, бо від цього залежить ефективність сервера. Для цього підраховується сукупний розмір файлів, що були Вами завантажені і роздані. Така собі [b]бухгалтерія, щоб знати, чи повернули Ви наданий кредит в повному обсязі. Цей облік постійно проводиться для кожного відвідувача сайту. [/b]Підрахунок називається “рейтинг”, і є співвідношенням відданого до завантаженого. Якщо ви завантажили файл розміром 1 Гігабайт, а роздали його двом людям, тобто віддали 2 Гігабайта, — Ваш рейтинг буде дорівнювати “2” (2 розділити на 1 дорівнює 2). І навпаки, якщо, не віддали нічого, нуль, то й рейтинг Ваш буде “0” (бо 0 розділити на 1 дорівнює 0). [b]З нульовим рейтингом (0.15 і нижче) завантажувати нові файли не можна. Це зроблено, щоб заохотити Вас до роздачі завантажених файлів. [/b]\n[url=https://toloka.to/t35477]Детальніше, що робити, якщо рейтинг опустився до нуля, можна в темі “Розширені ЧаПи”. [/url]\n\nУ Вас може виникнути запитання [b]“Невже не можна обійтись без цих рейтингів, обмежень? Хіба не можна просто завантажувати файли?!” [/b]Власне, цю тему й було написано як відповідь на подібні запитання. Відповідь така: [b]якщо всі перестануть роздавати, то нікому не вдастся нічого завантажити. [/b]\nТоррент-трекер “Толока” періодично влаштовує дні, коли рейтинг не враховується, і вантажити можна донесхочу. Цей період називається “фріліч”, і відбувається переважно на Різдво та Великдень. Також існують бонусні файли, так звані “золоті, срібні, бронзові роздачі”. В інші дні рейтинг нараховується в повному обсязі. Детальніше про них і про фріліч прочитати можна в темі “Розширені ЧаПи”.\n\nТак, в світі існують торрент-трекери, де рейтингу немає взагалі. Але переважно в них важко щось завантажити, з тієї-таки причини: нікому роздавати, а завантажити хочуть всі. Працюють такі рейтинги виключно за рахунок надлишкової чисельності, - якщо багато людей роздасть по-трошки, то буде завантаження. Такий метод — вибір трекерів, що відвідують дуже багато користувачів, вони можуть собі це дозволити. [b]Гуртом, на жаль, не має зайвих роздавальників, щоб запровадити безрейтингову систему на щодень. [/b]В Україні, станом на сьогоднішній день, практично немає безрейтингових трекерів з солідною роздачею.\n\n[b]Тому рейтингова система може бути несприятливою для одної людини в певний час, але загалом, для цілого сайту, — вона сприяє хорошій роздачі. Роздача файлів — це інвестиція у Ваші майбутні завантаження, і в майбутнє торрент-трекеру.[/b]'),
(9, 'Шановні Гуртомівці!\n\nЦього разу буде обрано 5 нових, 5 класичних та 2 документальні фільми.\n\n[align=center][img]https://img.hurtom.com/i/2017/01/4-1000.jpg[/img][/align]\n\nГолосування поділяється на 3 теми:\n1. Новинки\n2. Класика\n3. Документальні\n\n[spoiler=\"Бухта / The Cove (2009)\"][size=20][color=red][b][align=center]Бухта / The Cove (2009) [/align][/b][/color][/size]\n[align=center][img]https://img.hurtom.com/i/2017/01/cove.md.jpg[/img][/align]\n\n[b]Жанр: [/b]документальний\n[b]Країна:[/b] США\n\n[b]Кіностудія / кінокомпанія: [/b]Diamond Docs, Fish Films, Oceanic Preservation Society, Quickfire Films\n[b]Режисер:[/b] Луі Псіхойос\n\n[b]Сюжет:[/b]\nУ фільмі «Бухта» мова йде про щорічне полювання на дельфінів, яке влаштовують жителі міста Таїджі. Рибалки заганяють ссавців у вузьку бухту, частину з них відловлюють для продажу в океанаріум, але більшу частину вбивають, щоб продати м\'ясо на ринках. Щороку в прибережних водах Таїджі гине до 23000 дельфінів.\n[/spoiler]\n[spoiler=\"Вірунга / Virunga (2014)\"][size=20][color=red][b][align=center]Вірунга / Virunga (2014) [/align][/b][/color][/size]\n[align=center][img]https://img.hurtom.com/i/2017/01/viruga.md.jpg[/img][/align]\n\n[b]Жанр: [/b]документальний, військовий\n[b]Країна:[/b] Великобританія, Конго\n\n[b]Режисер:[/b] Орландо фон Айнсідель\n\n[b]Сюжет:[/b]\nГрупа сміливців ризикує власним життям, щоб врятувати останнього в світі представника виду гірських горил, в розпал нової громадянської війни і боротьби за природні ресурси Конго.\n[/spoiler]\n[spoiler=\"Земляни / Earthlings (2005) \"][size=20][color=red][b][align=center]Земляни / Earthlings (2005) [/align][/b][/color][/size]\n[align=center][img]https://img.hurtom.com/i/2017/01/earthlings.md.jpg[/img][/align]\n\n[b]Жанр: [/b]документальний\n[b]Країна:[/b] США\n\n[b]Режисер:[/b] Шон Монсон\n\n[b]Сюжет:[/b]\nФільм про проблему експлуатації тварин людьми для одомашнювання, розваг, наукових досліджень або ж для виробництва одягу і їжі.\n[/spoiler]\n[spoiler=\"Земля картелів / Cartel Land (2015) \"][size=20][color=red][b][align=center]Земля картелів / Cartel Land (2015) [/align][/b][/color][/size]\n[align=center][img]https://img.hurtom.com/i/2017/01/land.md.jpg[/img][/align]\n\n[b]Жанр: [/b]документальний\n[b]Країна:[/b] США\n\n[b]Режисер:[/b] Метт Хейнеман\n\n[b]Сюжет:[/b]\nФільм про боротьбу з мексиканськими наркокартелями з обох боків кордону із США.\n[/spoiler]\n[spoiler=\"Людина на канаті / Man on Wire (2008) \"][size=20][color=red][b][align=center]Людина на канаті / Man on Wire (2008) [/align][/b][/color][/size]\n[align=center][img]https://img.hurtom.com/i/2017/01/AManonWire.md.jpg[/img][/align]\n\n[b]Жанр: [/b]документальний\n[b]Країна:[/b] Великобританія, США\n\n[b]Режисер:[/b] Джеймс Марш\n\n[b]Сюжет:[/b]\nОскароносний фільм про Філіпа Петі і його проходження по канаті між будівлями Всесвітнього торгового центру в 1974 році. Цей вчинок був протизаконним, але отримав славу \"мистецького злочину століття\".\n[/spoiler]\n[spoiler=\"Погляд тиші / The Look of Silence (2014)\"][size=20][color=red][b][align=center]Погляд тиші / The Look of Silence (2014) [/align][/b][/color][/size]\n[align=center][img]https://img.hurtom.com/i/2017/01/look.md.jpg[/img][/align]\n\n[b]Жанр: [/b]документальний\n[b]Країна:[/b] Данія, Індонезія, Фінляндія, Норвегія, Великобританія, Ізраїль, Франція, США, Німеччина, Нідерланди\n\n[b]Режисер:[/b] Джошуа Оппенхаймер\n\n[b]Сюжет:[/b]\nФільм розповідає про геноцид в Індонезії в період 1965-1966 років. Історія зосереджується навколо сім\'ї, яка вижила в ті страшні часи і намагається знайти відповідальних за смерть декількох своїх членів.\n[/spoiler]\n[spoiler=\"Сіль землі / The Salt of the Earth (2014) \"][size=20][color=red][b][align=center]Сіль землі / The Salt of the Earth (2014) [/align][/b][/color][/size]\n[align=center][img]https://img.hurtom.com/i/2017/01/salt.md.jpg[/img][/align]\n\n[b]Жанр: [/b] документальний, біографія, історія\n[b]Країна:[/b] Франція, Бразилія, Італія\n\n[b]Режисер:[/b] Джуліано Рібейру Сальгадо, Вім Вендерс\n\n[b]Сюжет:[/b]\nСебастьян Сальгадо - видатний фотограф сучасності. Жодна подія не сховалося від його об\'єктива. Погляньте на світ іншими очима! Відкрийте для себе чарівну історію життя, що проникає прямо в серце.\n[/spoiler]\n[spoiler=\"Туман війни / The Fog of War: Eleven Lessons from the Life of Robert S. McNamara (2003)\"][size=20][color=red][b][align=center]Туман війни / The Fog of War: Eleven Lessons from the Life of Robert S. McNamara (2003) [/align][/b][/color][/size]\n[align=center][img]https://img.hurtom.com/i/2017/01/fog.md.jpg[/img][/align]\n\n[b]Жанр: [/b] документальний, військовий, біографія, історія\n[b]Країна:[/b] США\n\n[b]Режисер:[/b] Еррол Морріс\n\n[b]Сюжет:[/b]\nФільм є розповіддю про історію воєн 20-го століття з вуст одного з найбільш контроверсійних і впливових персонажів світової політики, колишнього міністра оборони США Роберта С. Макнамари. Чому минуле століття було настільки насичене всякого роду війнами і катастрофами? Чи справді людство приречене на вчинення одних і тих же непоправних помилок? Починаючи з бомбардування 100 тисяч мирних жителів Токіо в 1945 році і закінчуючи жахливими наслідками в\'єтнамської війни, «Туман війни» намагається проаналізувати хід думок глав провідних світових держав, що посилають своїх людей на війну.\n[/spoiler]\n[spoiler=\"Фільм ще не має рейтингу / Фільм ще не оцінено / This Film Is Not Yet Rated (2006) \"][size=20][color=red][b][align=center]Фільм ще не має рейтингу / Фільм ще не оцінено / This Film Is Not Yet Rated (2006) [/align][/b][/color][/size]\n[align=center][img]https://img.hurtom.com/i/2017/01/film.md.jpg[/img][/align]\n\n[b]Жанр: [/b] документальний\n[b]Країна:[/b] США\n\n[b]Режисер:[/b] Кірбі Дік\n\n[b]Сюжет:[/b]\nФільм про асоціацію MPAA і критерії присудження рейтингів тим чи іншим фільмам.\n[/spoiler]\n\n[b]Щиро вдячні вам за участь у замовленні фільмів і підтримці українського озвучення![/b]\n[spoiler=\"Як це робиться?\"]\n1) Обираємо фільм, який варто озвучити\n2) Перевіряємо, чи не було і не буде показу\n3) Проводимо публічне голосування\n4) Домовляємося про ціну зі студіями\n5) Замовляємо озвучення\n6) Чекаємо\n7) Завантажуємо реліз[/spoiler]\n\n[spoiler=\"FAQ\"]Хто вибрав \"кандидатів\" на озвучення?\nСписок складений адміністрацією Гуртом з врахуванням пропозицій користувачів.\nБазові критерії:\n- не було і не буде показу\n- наявність Blu-Ray\n\nКуди відправляти гроші?\nРахунок буде опубліковано пізніше.\n\nХто збиратиме гроші?\nЦим займатиметься адміністрація Гуртом.\n\nДе можна побачити список фільмів, які вже озвучено?\nhttp://t.hurtom.com/10films\nhttps://toloka.to/t44797[/spoiler]'),
(10, 'Вирішив створити [b]список українських перекладів, які виконані не з мови оригіналу, а з російської та інших мов. [/b]\nМета: запобігти придбанню неякісних видань, а також створити статистику недобросовісних видавництв.\n[b]Буду вдячний за допомогу! [/b]Увага, в посиланнях на докази присутні сторінки за межами \"Гуртом\"!\n\n[b]БАО[/b]\n\nДевід Моррелл — \"Рембо\" (з російської Тарас Ілик, 2006)\nРендалл Фрейкс, Вільям Вішер — \"Термінатор\" (з російської Н.Б. Клименко, 2006); докази\n[b]\nВидавництво Анетти Антоненко[/b]\n\nКларісе Ліспектор — \"Час зірки\" ([color=red]ймовірно[/color] з російської Ярослав Губарев, 2016); доказ №1 доказ №2; СУМНІВНО\n\n[b]ВНТЛ-Класика[/b]\n\nПетер Зілагі — \"Остання Вікножирафа\" (з німецької Галина Петросаняк, 2002); докази\n\n[color=green][b]Клуб сімейного дозвілля[/b][/color]\n\nДжоан Гаррис — \"Шоколад\" (з російської Володимир Поляков, 2015); докази\nСтівен Кінг — \"Воно\" (1/4 книжки з російської Роман Трифонов та Михайло Каменюк, 2015; докази [color=red]ПЕРЕВИДАНО З ЯКІСНИМ ПЕРЕКЛАДОМ [/color]\nСтівен Кінг — \"Кладовище домашніх тварин\" (з російської Володимир Поляков, 2015); докази [color=red]ПЕРЕВИДАНО З ЯКІСНИМ ПЕРЕКЛАДОМ [/color]\nГерберт Веллс — \"Машина часу\" (з російської Наталія Дідушок, 2011) докази\n\n[color=indigo][b]KM Books (Країна мрій)[/b][/color]\n\nГрегорі Девід Робертс — \"Шантарам\" (з російської Вадим Александров, 2013); докази\nДжеймс Дешнер — \"Той, що біжить Лабіринтом\" (з російської Наталя Вишневська, 2015); докази\nЕ.Л. Джеймс — \"П\'ятдесят відтінків\" (з російської, 2012); докази\nЕ.Л. Джеймс — \"П\'ятдесят відтінків темряви\" (з російської Вадим Александров, 2013); докази\nЕ.Л. Джеймс — \"П\'ятдесят відтінків свободи\" (з російської, 2013); докази\nПол Екман — \"Теорія брехні\" (з російської, 2012); докази\n\n[b]Mikko[/b]\n\n[color=red]ЙМОВІРНО, УСІ ПЕРЕКЛАДИ ВИДАВНИЦТВА ВИКОНАНІ З РОСІЙСЬКОЇ МОВИ [/color]\n\n[b]Ранок[/b]\n\nКорнелія Функе — \"Володар драконів\" (з російської Ігор Бондар-Терещенко, 2013); докази\n\n[b]Свічадо[/b]\n\nЛусі Мод Монтгомері — \"Емілі виростає\" (з польської Олег Бурячківський, 2014)\nЛусі Мод Монтгомері — \"Емілі з місячного серпа\" (з польської Олег Бурячківський, 2012)\nЛусі Мод Монтгомері — \"Емілі у вирі життя\" (з польської Олег Бурячківський, 2016)\n\n[color=blue][b]Фоліо[/b][/color]\n\nДжек Керуак — \"У дорозі\" (з російської Марія Козлова, 2015); докази [color=red]ВИДАНО З ЯКІСНИМ ПЕРЕКЛАДОМ ІНШИМ ВИДАВНИЦТВОМ [/color]\nДжон Толкієн — \"Володар перснів: Хранителі персня\" (з російської Аліна Немірова, 2003)\nДжон Толкієн — \"Володар перснів: Дві вежі\" (з російської Аліна Немірова, 2003)\nДжон Толкієн — \"Володар перснів: Повернення короля\" (з російської Аліна Немірова, 2003)\nСтівен Кінг — \"Безсоння\" (з російської К.Г. Борисенко, 2008)\nСтівен Кінг — \"Сяйво\" (з російської Іван Андрусяк, 2011) [color=red]ВИДАНО З ЯКІСНИМ ПЕРЕКЛАДОМ ІНШИМ ВИДАВНИЦТВОМ [/color]\nШмуель Йосеф Агнон — \"Нічний постоялець\" (з англійської Володимир Горбатько, 2012); докази\nЮ Несбьо — \"Сніговик\" (з російської Т. Безматьєва, 2014)\nЮ Несбьо — \"Таргани\" (з російської К. Г. Дуброва, 2013)\n\n[b]Школа (Харків)[/b]\n\n[color=red]УСІ ПЕРЕКЛАДИ СЕРІЇ \"БІБЛІОТЕКА ПРИГОД\" (+\"БІБЛІОТЕКА ПРИГОД. ЗОЛОТА СЕРІЯ\") ВИКОНАНІ З РОСІЙСЬКОЇ МОВИ, ПЕРЕКЛАДАЧКА ІННА БАЗИЛЯНСЬКА! [/color]Докази\n\n[b]Ярославів Вал[/b]\n\nПавло Халебський — \"Україна — земля козаків\" (з російської, 2009)\n\n[b]У СПИСОК НЕ ВКЛЮЧЕНІ ПЕРЕКЛАДИ В. ВЕРХОВНЯ І В. БОЙКА, ОСКІЛЬКИ ВСІ ВОНИ ВИКОНАНІ З РОСІЙСЬКОЇ МОВИ. ОСЬ ДЕЯКІ З НИХ (АЛЕ НЕ ВСІ): [/b]\n\nЖюль Верн — \"Діти капітана Гранта\" (з російської Володимир Верховень, \"Клуб сімейного дозвілля\" 2011)[color=red]ВИДАНО З ЯКІСНИМ ПЕРЕКЛАДОМ ІНШИМ ВИДАВНИЦТВОМ [/color]\nГенрик Сенкевич — \"Вогнем і мечем\" (з російської В.С. Бойко, \"Фоліо\" 2015); докази [color=red]ВИДАНО З ЯКІСНИМ ПЕРЕКЛАДОМ ІНШИМ ВИДАВНИЦТВОМ [/color]\nЖан-Жак Руссо — \"Сповідь\" (з російської Володимир Верховень, \"Фоліо\" 2014)\nЖан-Марі Ґюстав Ле Клезіо — \"Дієго і Фріда\" (з російської Володимир Верховень, \"Фоліо\" 2011)\nЖорж Санд — \"Консуело\" (з російської В.С. Бойко, \"Фоліо\" 2011); докази\nІрвін Шоу — \"Багач, бідняк\" (з російської Володимир Верховень, \"Фоліо\" 2007); докази\nЛоренс Стерн — \"Трістам Шенді\" (з російської В.С. Бойко, \"Фоліо\" 2014); докази\nМеїр Шалєв — \"Моя російська бабуся та її американський пилосос\" (з російської Володимир Верховень, \"Фоліо\" 2012)\nПетер Хьоґ — \"Тиша\" (з російської Володимир Верховень, \"Фоліо\" 2012)\nПетер Хьоґ — \"Смілла та її відчуття снігу\" (з російської Володимир Верховень, \"Фоліо\" 2013)\nРешат Нурі Гюнтекін — \"Пташка співуча\" (з російської Володимир Верховень, \"Фоліо\" 2012); докази [color=red]ВИДАНО З ЯКІСНИМ ПЕРЕКЛАДОМ ІНШИМ ВИДАВНИЦТВОМ [/color]\nРешат Нурі Гюнтекін — \"Стара хвороба\" (з російської Володимир Верховень, \"Фоліо\" 2011)\nСтіґ Ларссон — \"Дівчина, що гралася з вогнем\" (з російської Володимир Веховень, \"Фоліо\" 2011)\nСтіґ Ларссон — \"Повітряний замок, що вибухнув\" (з російської Володимир Верховень, \"Фоліо\" 2011)\nСтіґ Ларссон — \"Чоловіки, що ненавидять жінок\" (з російської Володимир Верховень, \"Фоліо\" 2010)\nТом Еґеланн — \"Євангеліє від Люцифера\" (з російської Володимир Верховень, \"Фоліо\" 2013)\nФрансуа Рене де Шатобріан — \"Замогильні записки\" (з російської Володимир Верховень, \"Фоліо\" 2014); докази\nШодерло де Лакло — \"Небезпечні зв\'язки\"; Антуан Франсуа Прево — \"Манон Леско\"(з російської В. Бойко, \"Фоліо\" 2011); докази\nЮ Несбьо — \"Безтурботний\" (з російської В.С. Бойко, \"Фоліо\" 2013)\nЮ Несбьо — \"Нетопир\" (з російської Володимир Верховень, \"Фоліо\" 2012)\nЮ Несбьо — \"Пентаграма\" (з російської В.С. Бойко, \"Фоліо\" 2014)\nЮ Несбьо — \"Червоногрудка\" (з російської Володимир Верховень, \"Фоліо\" 2012); докази'),
(11, 'Любі Гуртомівці!\nПрошу приєднуватися до ініціативи і робити собі футболки з символікою Гуртом!\n[spoiler=\"Лого\"]\n[align=center][img]https://toloka.to/files/gurtom3.2_945.png[/img][/align][/spoiler]\n\nДля того, щоб було легше обрати поліграфію, у якій друкуватимете, трохи розкажу про технологію. При цьому зупинюся лише на друці повно кольорового зображення. Адже таке воно у нас і є.\nІснує кілька технологій повно кольорового друку: безпосереднє нанесення чорнил на футболку, термопереніс та сублімація.\n\n[b]1.Цифровий друк. [/b]\nСаме так досягається найкраща стійкість зображення. Але у нашому випадку – 1 екземпляр – зазвичай ціна надто висока: називають від 20 до 50 грн., і скоріше 50.\nІ тут є ще один підводний камінь – чорнила. Якщо використовуються сольвентні – то це дуже шкідливо по-перше, і по-друге, футболка матиме неприємний запах.\nЄ також варіант УФ-затверджуваних чорнил – вони не мають запаху, і досить екологічні. Саме цей варіант я обрала як оптимальний. Хоча, нажаль скористатися ним не вийшло – мені треба було встигнути до відпустки, а єдина фірма у місті, яка використовує ці чорнила вичерпала їх запас, і чекала нової поставки.\n14.04.2010 - зараз вони відмовляються працювати з малими партіями.\n\n[b]2. Термопереніс. [/b]\nСаме результат термопереносу ви бачите на фотографії.\nВаріант найдешевший та найдоступніший для одиничного замовлення. Але має цілий ряд недоліків, які виходять з технології.\nТехнологія полягає у тому, що зображення у дзеркальному відображенні друкується на звичайному струменевому принтері, але на спеціальному папері. Отримане зображення переноситься на футболку за допомогою термопресу при відповідній температурі. Футболка, звичайно, має бути 100% бавовняна, синтетика не витримає температури.\nГотовий виріб витримує максимум 20 разів ручного прання без застосування сушки та відбілювачів.\nВарто відмітити, що саме цим способом друкує більшість інтернет-магазинів.\n[b]\n3. Сублімація. [/b]\nТехнологія дуже схожа на попередню, але використовується виключно синтетична тканина, і при переносі чорнила вступають з нею у реакцію, і залишаються на тканині надовго.\nЦей спосіб також дуже популярний серед інтернет-магазинів, але в моєму місті його пропонує лише одна фірма. І мене не влаштував варіант синтетичного виробу.\n\n[b]4. Нанесення спеціальних фарб через трафарет, або малювання по тканині. [/b]\nТехнологія досить проста, найекологічніша. У випадку використання трафарету потребує створення макету у векторі і вирізання трафарету на плоттері. хоча у крайньому випадку можна і руками.\nОсь і все, що я хотіла розповісти про технології.\n\n[i][color=green]Величезна подяка пану hodek\'у за картинку![/color][/i]'),
(12, '[align=center][size=24][color=Red][b]На[/b][/color][color=Green] [b]Толоці[/b][/color] [color=Red][b]критична нестача інструкцій для \"чайників\"[/b][/color][/size][/align]\n[align=center][img]http://img.hurtom.com/i/2016/10/1473765264_manualtic42544.jpg[/img][/align]\n\nЯкщо Ви володієте такими уміннями та навичками як:\n[list][*]Синхронізація аудіо доріжок з відео (сирих аудіо доріжок)\n[*]Субтитрування відеоконтенту\n[*]Запис з ТБ звукових доріжок\n[*]Підтримкою та поширенням релізів[/list]Ви можете створити мануал/інструкцію з детальним алгоритмом дій для новачків, що захочуть продовжити Ваші починання заради загальновідомої мети - поширення українського в мережі, що відіграє важливу роль в теперішні часи інформаційних воєн.\n\n[b]P.S.[/b] Відеоуроки [img]http://img.hurtom.com/i/2016/10/15.png[/img]  вітаються! :)');
INSERT INTO `bb_posts_text` (`post_id`, `post_text`) VALUES
(13, '[b][size=22][color=red][align=center]ЯКЩО ХОЧЕТЕ БОДАЙ ЯКОСЬ ВПЛИНУТИ НА НЕВТІШНУ СИТУАЦІЮ,\nПИШІТЬ ЗВЕРНЕННЯ. ОСЬ ПОСИЛАННЯ З ДЕТАЛЬНОЮ ІНФОРМАЦІЄЮ [/color][/size][/b]\n[align=center][size=20][b]http://toloka.to/t37400[/b][/size][/align]\n\n[align=center][size=20][color=red]\nВтрачені дубляжі[/color][/size][/align]\n\n[quote]вирішив створити тему, де будуть перераховуватись усі ті стрічки, які були ДУБЛЬОВАНІ на українську мову, але по тим чи іншим причинам на даний момент втрачені.[/quote]\n\n[quote]Дублювання (від слова «дубль» — подвійний) або дубляж, або дубльований переклад — вид перекладу аудіовізуальних творів (фільмів, серіалів, мультфільмів), за якого відбувається повна заміна оригінального мовлення на іншу мову. Зазвичай це робиться з метою транслювання фільму у країні, де не говорять тією мовою, якою говорять персонажі цього аудіовізуального твору.\n\n[align=right][url=http://uk.wikipedia.org/wiki/%D0%94%D1%83%D0%B1%D0%BB%D1%8E%D0%B2%D0%B0%D0%BD%D0%BD%D1%8F]&gt;&gt; Детальніше на ВІКІПЕДІЇ &lt;&lt;[/url][/align][/quote]\n[hr][hr]\n[b][size=20][align=center][b]Оригінальне озвучення [/b][/align][/size][/b]\n[hr][hr]\n[spoiler=\"Список, на жаль, не повний\"]Літа молодії 1958 рік (фільм Кіностудії Довженка)\n------------\nВеселі Жабокричі (Весёлые Жабокричи) 1971 рік\n------------\nЛебедине озеро. Зона / Swan Lake. The Zone (1990)\n(скрізь поверх ориґінальної укр. доріжки рашн. одноголоска, хоча в архівів можливо збереглась укр. ориґінальна версія звукової доріжки)\n------------\nРоксолана. Володарка темряви [серіал з 24-х серій] 2002-2003 рік[/spoiler]\n[hr][hr]\n[b][size=20][align=center][b]НАШЕ, Російське та Радянське кіно[/b][/align][/size][/b]\n[hr][hr]\n[spoiler=\"Список (далеко не повний)\"]Виборзька сторона (Выборгская сторона) 1938 рік [дубльовано в роки СРСР]\n------------\nТаємниця двох океанів (Тайна двух океанов) 1955-1956 роки [дубльовано в роки СРСР]\n------------\nЛюдина без паспорту (Человек без паспорта) 1965 рік [дубльовано в роки СРСР]\n------------\nДержавний злочинець (Государственный преступник) 1965 рік [дубльовано в роки СРСР]\n------------\nНевловимі месники (Неуловимые мстители) 1966 рік [дубльовано в роки СРСР]\n------------\nРеспубліка ШКІД (Республика ШКИД) 1966 рік [дубльовано в роки СРСР]\nНа київській студії \"ім. Довженка\"\n------------\nВій (Вий) 1967 рік [дубльовано в роки СРСР]\n------------\nЦиган (Цыган) 1967 рік [дубльовано в роки СРСР]\nНа київській студії \"ім. Довженка\"\n------------\nПомилка Оноре де Бальзака 1968 рік [дубльовано в роки СРСР] фільм Студії Довженка\n\nДжерело: 22 хв. 40 сек.\n------------\nЩит і меч (Щит и меч) 1968 рік [дубльовано в роки СРСР]\nНа київській студії \"ім. Довженка\"\n------------\nЧортова дюжина (Чертова дюжина) 1970 рік [дубльовано в роки СРСР]\nНа Одеській кіностудії\n------------\nОдин з нас (Один из нас) 1970 рік [дубльовано в роки СРСР]\n------------\nЖодного дня без пригод (Ни дня без приключений) 1971 рік [дубльовано в роки СРСР]\nНа київській студії \"ім. Довженка\"\n------------\nВідвага (Дерзость) 1973 рік [дубльовано в роки СРСР]\nНа Одеській кіностудії\n------------\nДокер (Докер) 1973 рік [дубльовано в роки СРСР]\n------------\n17 миттєвостей весни (Семнадцать мгновений весны) 1973 рік [для ТБ]\nСтудією \"З Ранку До Ночі\" у 2006-му році, на замовлення телеканалу \"ТВі\"\n------------\nІду своїм курсом (Следую своим курсом) 1974 рік [дубльовано в роки СРСР]\nНа Одеській кіностудії\n------------\nВійськово-польовий роман 1983 рік [дубльовано в роки СРСР]\nНа Одеській кіностудії (дублювали Владислав Пупков - Миколу Бурляєва, Людмила Логійко - Інна Чурікова)\n------------\nТам, вдалині за рікою (Там вдали, за рекой) 1975 рік [дубльовано в роки СРСР]\nНа київській студії \"ім. Довженка\"\n------------\nДама з папугою 1989 рік [дубльовано в роки СРСР] (фільм студії Довженка)\nДжерело\n------------\nДіви ночі (Девы ночи) 2007 рік\n------------\nТаємничій острів (Таинственный остров) 2008 рік\n------------\nРайські птахи (Райские птицы) 2009 рік\n------------[/spoiler]\n[hr][hr]\n[b][size=20][align=center][b]Для телебачення[/b][/align][/size][/b]\n[hr][hr]\n[spoiler=\"Для телебачення\"]Глибина (Below) 2002 рік [для ТБ]\nСтудією \"Pteroduction Sound\" у 2006-му році, на замовлення телеканалу \"СТБ\"\n------------\nНаталі (Nathalie...) 2003 рік [для ТБ]\nСтудією \"Pteroduction Sound\" у 2006-му році, на замовлення телеканалу \"СТБ\"\n------------\nВідкритий простір (Open Range) 2003 рік [для ТБ]\nСтудією \"Pteroduction Sound\" у 2006-му році, на замовлення телеканалу \"СТБ\"\n------------\nПривид опери (The Phantom of the Opera) 2004 рік [для ТБ]\nСтудією \"Pteroduction Sound\" у 2006-му році, на замовлення телеканалу \"СТБ\"\n------------\nГолова у хмарах (Head in the Clouds) 2004 рік [для ТБ]\nСтудією \"Pteroduction Sound\" у 2006-му році, на замовлення телеканалу \"СТБ\"\n------------\nТвої, мої та наші (Yours, Mine and Ours) 2005 рік [для ТБ, канал 1+1]\n------------\n88 хвилин / 88 minutes (2007) [для ТБ]\nСтудією \"Мова\" у 2006-му році, на замовлення телеканалу Україна[/spoiler]\n[/align]\n\n[hr][hr]\n[b][size=20][align=center][b]Іноземне кіно (кіно-теятральні дубляжі) та для діяспори[/b][/align][/size][/b]\n[hr][hr]\n\n[spoiler=\"80-90 роки\"]\nРоман з каменем (Romancing the Stone) 1984 рік [дубльовано в роки СРСР]\nНа київській студії \"ім. Довженка\"\n------------\nНесусвітні шахраї (Dirty Rotten Scoundrels) 1988 рік [дубльовано в роки СРСР]\nНа київській студії \"ім. Довженка\"\n------------\nОдружена з мафією (Married to the Mob) 1988 рік [дубльовано в роки СРСР]\nНа київській студії \"ім. Довженка\"\n7 листопада 1992, УТ-1 перший показ, http://issuu.com/livoberezhna/docs/_91_1992\nhttp://toloka.to/t48753#666621\n------------\nНепристойна пропозиція / Indecent Proposal (1993) [дубльовано на студії Хлопушка 92-93 рік]\nІнформація від Тетяни Антонової. Фільм з укр. дубляжем показували в Нью-Йорку 1993 року для української діяспори. (Діяспора і замовляла цей дубляж.)\n------------\nЗона висадки (Drop Zone) 1994 рік\nНа київській студії \"ім. Довженка\" для Львівського кіно-прокату\n------------\nПатруль часу (Timecop) 1994 рік\nНа київській студії \"ім. Довженка\" для Львівського кіно-прокату\n------------[/spoiler]\n[spoiler=\"2006-й рік\"]\n\nЯ, він, та ще один (You, Me and Dupree) 2006 рік\nСтудією \"Pteroduction Sound\" у 2006-му році, на замовлення \"B&amp;H\"\n------------\nПрокляття 2 (The Grudge 2) 2006 рік\nСтудією \"Пілот\" у 2006-му році, для кіно-прокату\n------------\nЧорна орхідея (The Black Dahlia) 2006 рік — Universal Pictures\nСтудією \"Пілот\" у 2006-му році, для кіно-прокату\n------------\nВідступники (The Departed) 2006 рік — Warner Bros\nКіно-прокатник \"Сінерґія\" (дубляж невідомої студії)\n------------\nОстанній нащадок Землі (Children of Men) 2006 рік — Universal Pictures\nСтудією \"Лємма\" у 2006-му році, для кіно-прокату\n------------\nДиявол носить \"Прада\" (The Devil Wears Prada) 2006 рік — Twentieth Century Fox\nСтудією \"Невафільм Україна\" у 2006-му році, на замовлення \"Геміні\"\n------------[/spoiler]\n[spoiler=\"2007-й рік\"]\n\nГодина пік 3 (Rush Hour 3) 2007 рік\n------------\nМіст до Терабітії (Bridge to Terabithia) 2007 рік — Buena Vista Pictures\nСтудією \"Невафільм Україна\" у 2007-му році, на замовлення \"Геміні\"\n------------\nТрошки вагітна (Knocked Up) 2007 рік — Universal Pictures\nСтудією \"AdiozProduction Studio\" у 2007-му році, на замовлення \"B&amp;H\"\n------------\nКоролівство (The Kingdom) 2007 рік — Universal Pictures\nСтудією \"AdiozProduction Studio\" у 2007-му році, на замовлення \"B&amp;H\"\n------------\nКрасунчик (Keinohrhasen) 2007 рік\nСтудією \"Tretyakoff production\" у 2007-му році, на замовлення \"Геміні\"\n------------\nМій домашній динозавр (The Water Horse) 2007 рік [стрічка була дубльована, але в прокат так і не вийшла]\nСтудією \"Postmodern\" у 2007-му році, для кіно-прокату\n------------\nМістер Бін у відпустці (Mr. Bean\'s Holiday) 2007 рік [стрічка була дубльована, але в прокат так і не вийшла]\nСтудією \"LeDoyen Studio\" у 2007-му році, для кіно-прокату\n------------[/spoiler]\n[spoiler=\"2008-й рік\"]\n\nМумія. Гробниця імператора драконів (The Mummy: Tomb of the Dragon Emperor) 2008 рік — Universal Pictures\nСтудією \"LeDoyen Studio\" у 2008-му році, на замовлення \"B&amp;H\"\n------------\nТак, ні, не знаю (Definitely, Maybe) 2008 рік — Universal Pictures\nСтудією \"AdiozProduction Studio\" у 2008-му році, на замовлення \"B&amp;H\"\n------------\nТой, що не залишає сліду (Untraceable) 2008 рік\nДистриб’ютор: \"JRC\" (дубляж невідомої студії)\n------------\nСмертельні перегони (Death Race) 2008 рік — Universal Pictures\nСтудією \"LeDoyen Studio\" у 2008-му році, на замовлення \"B&amp;H\"\n------------\nMamma Mia! 2008 рік — Universal Pictures\nСтудією \"LeDoyen Studio\" у 2008-му році, на замовлення \"B&amp;H\"\n------------\nВійна Чарлі Вілсона (Charlie Wilson’s War) 2008 рік — Universal Pictures\nСтудією \"AdiozProduction Studio\" у 2008-му році, на замовлення \"B&amp;H\"\n------------\nКохання поза правилами (Leatherheads) 2008 рік — Universal Pictures\nДистриб’ютор: \"B&amp;H\" (дубляж невідомої студії)\n------------\nВ прольоті (Forgetting Sarah Marshall) 2008 рік — Universal Pictures\nСтудією \"LeDoyen Studio\" у 2008-му році, на замовлення \"B&amp;H\"\n------------\nПідміна (Changeling) 2008 рік — Universal Pictures\nДистриб’ютор: \"B&amp;H\" (дубляж невідомої студії)\n------------\nПила V (Saw V) 2008 рік\nСтудією \"KyivPostModern\" у 2008-му році, на замовлення \"Каскад Україна\"\n------------\nВорог держави №1 (Instinct de mort, L’) 2008 рік\nСтудією \"AdiozProduction Studio\" у 2008-му році, на замовлення \"JRC\"\n------------\nВідчайдушні шахраї / Ca$h (2008)\nформально дублювали на AdiozProduction Studio, на замовлення \"Sinergia\"\n------------[/spoiler]\n[spoiler=\"2009-й рік\"]\n\nБруно (Brüno) 2009 рік [стрічка була дубльована, але в прокат так і не вийшла]\nСтудією \"Остання Барикада\" у 2009-му році, для кіно-прокату\n------------\nГеймер (Gamer) 2009 рік\nСтудією \"Tretyakoff production\" у 2009-му році, на замовлення \"Геміні\"\n------------\nАсистент вампіра (Cirque du Freak: The Vampire’s Assistant) 2009 рік — Universal Pictures\nСтудією \"LeDoyen Studio\" у 2009-му році, на замовлення \"B&amp;H\"\n------------\nРок-хвиля (The Boat That Rocked) 2009 рік — Universal Pictures\nСтудією \"LeDoyen Studio\" у 2009-му році, на замовлення \"B&amp;H\"\n------------\nБій без правил (Fighting) 2009 рік — Universal Pictures\nСтудією \"LeDoyen Studio\" у 2009-му році, на замовлення \"B&amp;H\"\n------------\nНенароджений (The Unborn) 2009 рік — Universal Pictures\nСтудією \"LeDoyen Studio\" у 2009-му році, на замовлення \"B&amp;H\"\n------------\nПригоди Геркулеса у 3D (Little Hercules in 3-D) 2009 рік\nДистриб’ютор: \"Геміні\" (дубляж невідомої студії)\n------------\nІгри влади (State of Play) 2009 рік — Universal Pictures\nСтудією \"LeDoyen Studio\" у 2009-му році, на замовлення \"B&amp;H\"\n------------\nСправа 39 (Case 39) 2009 рік — Universal Pictures\nСтудією \"LeDoyen Studio\" у 2009-му році, на замовлення \"B&amp;H\"\n------------[/spoiler]\n[spoiler=\"2010-й рік\"]\n\nВрата в 3D (The Hole) 2010 рік\nДистриб’ютор: \"Сінерґія\" (дубляж невідомої студії)\n------------\nЗірковий експорт (Get Him to the Greek) 2010 рік — Universal Pictures\nСтудією \"LeDoyen Studio\" у 2010-му році, на замовлення \"B&amp;H\"\n------------\nДиявол (Devil) 2010 рік — Universal Pictures\nСтудією \"LeDoyen Studio\" у 2010-му році, на замовлення \"B&amp;H\"\n------------[/spoiler]\n[spoiler=\"2011-й рік\"]\n\nБез обману (The Dilemma) 2011 рік — Universal Pictures\nСтудією \"LeDoyen Studio\" у 2011-му році, на замовлення \"B&amp;H\"\n------------\nЗемля забуття / La terre outragée (2011)\nНа замовлення “ТОВ “ОПЕРА ФІЛЬМ” (дубляж невідомої студії)\nОфіційно в Україні, ліцензійні носії ще не вийшли\n------------\nМеханік (The Mechanic) 2011 рік\nДистриб’ютор: \"Геміні\" (дубляж невідомої студії)\n------------\nМіняючи реальність (The Adjustment Bureau) 2011 рік — Universal Pictures\nСтудією \"LeDoyen Studio\" у 2011-му році, на замовлення \"B&amp;H\"\n------------\nХочу як ти (The Change-Up) 2011 рік — Universal Pictures\nСтудією \"LeDoyen Studio\" у 2011-му році, на замовлення \"B&amp;H\"\nОфіційно в Україні, ліцензійні носії ще не вийшли\n------------\nЯк обікрасти хмарочос (Tower Heist) 2011 рік — Universal Pictures\nСтудією \"LeDoyen Studio\" у 2011-му році, на замовлення \"B&amp;H\"\nОфіційно в Україні, ліцензійні носії ще не вийшли\n------------[/spoiler]\n[spoiler=\"2012-й рік\"]\n\nДжунглі. В пошуках Марсупіламі / Sur la piste du Marsupilami (2012)\nСтудією \"Ді Ар\", на замовлення \"Вольга Україна\"\nОфіційно в Україні, ліцензійні носії ще не вийшли\n------------\nДикуни / Savages (2012) — Universal Pictures\nСтудією \"LeDoyen Studio\" у 2012-му році, на замовлення \"B&amp;H\"\nОфіційно в Україні, ліцензійні носії ще не вийшли\n------------\nЗахисник / Safe (2012)\nНа замовлення “Ukrainian Film Distribution ” (дубляж Tretyakoff production)\nРозповсюджувач DVD в Україні — Астра\n------------\nЗоряні війни. Епізод I – прихована загроза (Star Wars: Episode I – The Phantom Menace) 1999/2012 рік 20th Century Fox\nСтудією \"Postmodern\", кіно-прокатник: \"Ukrainian Film Discribution\"\n------------\nКонтрабанда (Contraband) 2012 рік — Universal Pictures\nСтудією \"LeDoyen Studio\" у 2012-му році, на замовлення \"B&amp;H\"\nОфіційно в Україні, ліцензійні носії ще не вийшли\n------------\nЛюбий друг / Bel Ami (2012) —\nСтудією \"LeDoyen Studio\" у 2012-му році, на замовлення \"B&amp;H\"\nОфіційно в Україні, ліцензійні носії ще не вийшли\n------------\nЛюбов об’єднує людей (LOL) 2012 рік\nСтудією \"LeDoyen Studio\" у 2012-му році, на замовлення \"Вольга Україна\"\nОфіційно в Україні, ліцензійні носії ще не вийшли\n------------\nНестримні 2 / The Expendables 2 (2012)\nСтудією \"Tretyakoff production\", на замовлення “Ukrainian Film Distribution ”\nОфіційно в Україні, ліцензійні носії ще не вийшли\n------------\nОбладунки Бога 3. Місія Зодіак / Chinese Zodiac (2012)\nСтудією \"Ді Ар\", на замовлення \"Інтер-фільм\"\nОфіційно в Україні, ліцензійні носії ще не вийшли\n------------\nПограбування казино / Killing Them Softly (2012)\nСтудією \"Tretyakoff production\", на замовлення “Ukrainian Film Distribution ”\nОфіційно в Україні, ліцензійні носії ще не вийшли\n------------\nСпадок Борна / The Bourne Legacy (2012) — Universal Pictures\nСтудією \"LeDoyen Studio\" у 2012-му році, на замовлення \"B&amp;H\"\nОфіційно в Україні, ліцензійні носії ще не вийшли\n------------\nТретій зайвий / Ted (2012) — Universal Pictures\nСтудією \"LeDoyen Studio\" у 2012-му році, на замовлення \"B&amp;H\"\nОфіційно в Україні, ліцензійні носії ще не вийшли\n------------\nЧоловік нарозхват / Playing for Keeps (2012)\nСтудією \"Tretyakoff production\", на замовлення “Ukrainian Film Distribution ”\nОфіційно в Україні, ліцензійні носії ще не вийшли\n------------[/spoiler]\n[spoiler=\"2013-й рік\"]\n....\n\n07.02.2013 - Знедолені / Les Misérables (2012) | Мейджор – Universal Pictures | Дистриб’ютор - “B&amp;H” |\n07.02.2013 - Хапай і тікай / Hit and Run (2013) | Дистриб’ютор - “Ukrainian Film Distribution” |\n11.02.2013 - Стукач / Snitch (2013) | Дистриб’ютор - “Аврора-фільм” |\n11.02.2013 - Повернення героя / The Last Stand (2013) | Дистриб’ютор - “Інтер-фільм” |\n28.02.2013 - Кохання по-дорослому / This Is 40 (2012) | Мейджор – Universal Pictures | Дистриб’ютор - “B&amp;H” |\n14.03.2013 - Останнє вигнання диявола. Друге пришестя / The Last Exorcism Part II (2013) | Дистриб’ютор - “Ukrainian Film Distribution” |\n04.04.2013 - Одним менше / Dead Man Down (2013) | Дистриб’ютор - “Інтер-фільм” |\n18.04.2013 - Мьобіус / Möbius (2013) | Дистриб’ютор - “Аврора-фільм” |\n04.07.2013 - Спокусник 2 / Kokowääh 2 (2013) | Дистриб’ютор - “Ukrainian Film Distribution” |\n01.08.2013 - РЕД 2 / Red 2 (2013) | Дистриб’ютор - “Інтер-фільм” |\n15.08.2013 - Параноя / Paranoia (2013) | Дистриб’ютор - “Інтер-фільм” |\n24.10.2013 - +1 / +1 (2013) | Дистриб’ютор - “Ukrainian Film Distribution” |\n\n....\n\n01.01.2013 - Анна Кареніна / Anna Karenina (2012) | Мейджор – Universal Pictures | Дистриб’ютор - “B&amp;H” |\n17.01.2013 - Мама / Mama (2013) | Мейджор – Universal Pictures | Дистриб’ютор - “B&amp;H” |\n21.03.2013 - Піймай шахрайку, якщо зможеш / Identity Thief (2013) | Мейджор – Universal Pictures | Дистриб’ютор - “B&amp;H” |\n04.04.2013 - Парк Юрського періоду / Jurassic Park (1993) | Мейджор – Universal Pictures | Дистриб’ютор - “B&amp;H” |\n04.04.2013 - Падіння Олімпу / Olympus Has Fallen (2013) | Дистриб’ютор - “Аврора-фільм” |\n11.04.2013 - Світ забуття / Oblivion (2013) | Мейджор – Universal Pictures | Дистриб’ютор - “B&amp;H” |\n25.04.2013 - Кров’ю і потом: Анаболіки / Pain &amp; Gain (2013) | Дистриб’ютор - “Аврора-фільм” |\n23.05.2013 - Форсаж 6 / Furious 6 (2013) | Мейджор – Universal Pictures | Дистриб’ютор - “B&amp;H” |\n12.06.2013 - Ілюзія обману / Now You See Me (2013) | Дистриб’ютор - “Інтер-фільм” |\n25.07.2013 - R.I.P.D. Примарний патруль / R.I.P.D. (2013) | Мейджор – Universal Pictures | Дистриб’ютор - “B&amp;H” |\n08.08.2013 - З ким переспати?!! / The To Do List (2013) | Дистриб’ютор - “Ukrainian Film Distribution” |\n15.08.2013 - Пипець 2 / Kick-Ass 2 (2013) | Дистриб’ютор - “B&amp;H” |\n10.10.2013 - Полонянки / Prisoners (2013) | Дистриб’ютор - “Ukrainian Film Distribution” |\n17.10.2013 - Ромео і Джульєтта / Romeo and Juliet (2013) | Дистриб’ютор - “Вольга Україна” |\n31.10.2013 - Індики: назад в майбутнє / Free Birds (2013) | Дистриб’ютор - “Аврора-фільм” |\n05.12.2013 - Паганіні: скрипаль диявола / The Devil’s Violinist (2013) | Дистриб’ютор - “Галеон Кіно” |\n\n------------[/spoiler]\n[spoiler=\"2014-й рік\"]\n\n....\n\n16.01.2014 - Надія не згасне / All Is Lost (2014) | Мейджор – Universal Pictures | Дистриб’ютор - “B&amp;H” |\n06.03.2014 - Люблю. Назавжди / Endless Love (2014) | Мейджор – Universal Pictures | Дистриб’ютор - “B&amp;H” |\n10.04.2014 - Дівергент / Divergent (2014) | Дистриб’ютор - “Інтер-фільм” |\n01.05.2014 - Танцюй звідси! / Cuban Fury (2014) | Дистриб’ютор - “Вольга Україна” |\n12.05.2014 - Принцеса Монако / Grace of Monaco (2014) | Дистриб’ютор - “Аврора-фільм” |\n11.09.2014 - Наднебезпечний / A Most Wanted Man (2014) | Дистриб’ютор - “Вольга Україна” |\n11.09.2014 - Одержимість Майкла Кінга / The Possession of Michael King (2014) | Дистриб’ютор - “Ukrainian Film Distribution” |\n18.09.2014 - Небеса реальні / Heaven Is for Real (2014) | Мейджор – Sony Pictures Releasing | Дистриб’ютор - “B&amp;H” |\n02.10.2014 - Клуб Вінкс: Таємниця морської безодні / Winx Club: Il mistero degli abissi (2014) | Дистриб’ютор - “Галеон кіно” |\n16.10.2014 - Магія місячного сяйва / Magic in the Moonlight (2014) | Дистриб’ютор - “Мульти Медіа Дистриб’юшн” |\n\n....\n02.01.2014 - 47 Ронін / 47 Ronin (2013) | Мейджор – Universal Pictures | Дистриб’ютор - “B&amp;H” |\n09.01.2014 - Тарзан / Tarzan (2013) | Дистриб’ютор - “Інтер-фільм” | ознайомитись |\n13.03.2014 - Повітряний маршал / Non-Stop (2014) | Дистриб’ютор - “Аврора-фільм” |\n10.04.2014 - 3 дні на вбивство / 3 Days to Kill (2014) | Дистриб’ютор - “Аврора-фільм” |\n10.04.2014 - Шалений патруль / Ride Along (2014) | Мейджор – Universal Pictures | Дистриб’ютор - “B&amp;H” |\n08.05.2014 - 13-й район: Цегляні маєтки / Brick Mansions (2014) | Дистриб’ютор - “Галеон кіно” |\n03.07.2014 - Почати знову / Begin Again (2014) | Дистриб’ютор - “Ukrainian Film Distribution” |\n17.07.2014 - Юність / Boyhood (2014) | Мейджор – Universal Pictures | Дистриб’ютор - “B&amp;H” |\n28.08.2014 - Посвячений / The Giver (2014) | Дистриб’ютор - “Аврора-фільм” |\n04.09.2014 - Париж: Місто мертвих / As Above, So Below (2014) | Мейджор – Universal Pictures | Дистриб’ютор - “B&amp;H” | ознайомитись |\n11.09.2014 - Сьомий гном / Der 7bte Zwerg (2014) | Дистриб’ютор - “Ukrainian Film Distribution” |\n11.09.2014 - Прянощі та пристрасті / The Hundred-Foot Journey (2014) | Дистриб’ютор - “Інтер-фільм” |\n16.10.2014 - Прогулянка серед могил / A Walk Among the Tombstones (2014) | Мейджор – Universal Pictures | Дистриб’ютор - “B&amp;H” |\n11.09.2014 - Віджа. Смертельна гра / Ouija (2014) | Мейджор – Universal Pictures | Дистриб’ютор - “B&amp;H” | ознайомитись |\n\n------------[/spoiler]\n[spoiler=\"2015-й рік\"]\n....\n\n\"Multi Media Distribution або Мульти Медіа Дистриб’юшн\" до жовтня 2014 була під назвою \"Аврора-фільм\"\n\n....\n\n01.01.2015 - Снігова королева 2: Перезаморозка / Снежная королева 2: Перезаморозка (2015) | Дистриб’ютор - “Мульти Медіа Дистриб’юшн” |\n26.02.2015 - Барбі. Супер принцеса / Barbie in Princess Power (2015) | Мейджор – Universal Pictures | Дистриб’ютор - “B&amp;H” |\n30.04.2015 - Небезпечне занурення / Pressure (2015) | Дистриб’ютор - “TFD” |\n04.05.2015 - Астрал. Частина третя / Insidious: Chapter 3 (2015) | Мейджор – Columbia Pictures | Дистриб’ютор - “B&amp;H” |\n30.05.2015 - Із темряви / Out of the Dark (2015) | Мейджор – Vertical Entertainment | Дистриб’ютор - “Ukrainian Film Distribution” |\n30.07.2015 - Прискорення / Momentum (2015) | Дистриб’ютор - “Мульти Медіа Дистриб’юшн” |\n30.07.2015 - Ватиканські записи / The Vatican Tapes (2015) | Мейджор – Lionsgate | Дистриб’ютор - “Мульти Медіа Дистриб’юшн” |\n13.08.2015 - Хто я? / Who Am I – Kein System ist sicher (2015) | Мейджор – Sony Pictures Releasing | Дистриб’ютор - “Мульти Медіа Дистриб’юшн” |\n27.08.2015 - Упс… Ной відплив! / Ooops! Noah is Gone… (2015) | Мейджор – Entertainment One | Дистриб’ютор - “Ukrainian Film Distribution” |\n27.08.2015 - Атака титанів. Фільм перший. Жорстокий світ / Shingeki no kyojin: Attack on Titan (2015) | Дистриб’ютор - “Ukrainian Film Distribution” |\n\n....\n\n15.01.2015 - Хакер / Blackhat (2015) | Мейджор – Universal Pictures | Дистриб’ютор - “B&amp;H” |\n19.02.2015 - Теорія всього / The Theory of Everything (2015) | Мейджор – Universal Pictures | Дистриб’ютор - “B&amp;H” |\n16.04.2015 - Екс машина / Ex Machina (2015) | Мейджор – Universal Pictures | Дистриб’ютор - “B&amp;H” |\n14.05.2015 - Ідеальний голос 2 / Pitch Perfect 2 (2015) | Мейджор – Universal Pictures | Дистриб’ютор - “B&amp;H” |\n11.06.2015 - Викрадення містера Хайнекена / Kidnapping Mr. Heineken (2015) | Дистриб’ютор - “UFD” |\n03.09.2015 - Втікач / The Runner (2015) | Дистриб’ютор - “Мульти Медіа Дистриб’юшн” |\n15.10.2015 - Багряний пік / Crimson Peak (2015) | Мейджор – Universal Pictures | Дистриб’ютор - “B&amp;H” | ознайомитись |\n12.11.2015 - Зелене пекло / The Green Inferno (2013) | Дистриб’ютор - “Ukrainian Film Distribution” | ознайомитись |\n12.11.2015 - Стів Джобс / Steve Jobs (2015) | Мейджор – Universal Pictures | Дистриб’ютор - “B&amp;H” | ознайомитись |\n19.11.2015 - Секрет у їхніх очах / Secret in Their Eyes (2013) | Дистриб’ютор - “Ukrainian Film Distribution” | ознайомитись |\nСКОРІШ ЗА ВСЕ БУЛО ДУБЛЬОВАНО, ПРОТЕ В ПРОКАТ ТАК І НЕ ВИЙШЛО, ТА ДЕІНДЕ НЕ З\'ЯВИЛОСЬ\n\nСпецоперація “Інтерв\'ю” (The Interview) (2015) | Дистриб’ютор - “B&amp;H” |\n\n------------[/spoiler]\n[spoiler=\"2016-й рік\"]\n\n....\n\n14.01.2016 - Крід / Creed (2015) | Дистриб’ютор - “Кіноманія” |\n04.02.2016 - Затемнення / Regression (2015) | Дистриб’ютор - “Вольга Україна” |\n18.02.2016 - Барбі: Шпигунська історія / Barbie: Spy Squad (2016) | Мейджор – Universal Pictures | Дистриб’ютор - “B&amp;H” |\n11.07.2016 - У чорта на куличках / Quo vado? (2016) | Дистриб’ютор - “Мульти Медіа Дистриб’юшн” |\n25.07.2016 - Будь-якою ціною / Hell or High Water (2016) | Дистриб’ютор - “Мульти Медіа Дистриб’юшн” |\n29.09.2016 - Дуелянт / Дуэлянт (2016) | Мейджор – Sony Pictures | Дистриб’ютор - “B&amp;H”\n06.10.2016 - Крейсер «Індіанаполіс» / USS Indianapolis: Men of Courage (2016) | Дистриб’ютор - “Мульти Медіа Дистриб’юшн” |\n20.10.2016 - Колектор / Коллектор (2016) | Дистриб’ютор - “Мульти Медіа Дистриб’юшн” |\n10.11.2016 - Розлучення з хвостом / Who Gets The Dog? (2016) | Дистриб’ютор - “Мульти Медіа Дистриб’юшн” |\n24.11.2016 - Палає, палає, палає / Burn Burn Burn (2016) | Дистриб’ютор - “Cinemaker Distribution” |\n24.11.2016 - Моє велике грецьке весілля 2 / My Big Fat Greek Wedding 2 (2016) | Дистриб’ютор - “Ukrainian Film Distribution” |\n08.12.2016 - Синдбад. Пірати семи штормів / Синдбад. Пираты семи штормов (2016) | Дистриб’ютор - “Мульти Медіа Дистриб’юшн” |\n15.12.2016 - Провина / Misconduct (2016) | Дистриб’ютор - “Ukrainian Film Distribution” |\n....\n01.01.2016 - Іван Царевич та Сірий Вовк 3 / Иван Царевич и Серый Волк 3 (2016) | Дистриб’ютор - “Галеон Кіно” | ознайомитись |\n07.01.2016 - Сестри / Sisters (2015) | Мейджор – Universal Pictures | Дистриб’ютор - “B&amp;H” | ознайомитись |\n21.01.2016 - Дівчина з Данії / The Danish Girl (2015) | Мейджор – Focus Features | Дистриб’ютор - “B&amp;H” | ознайомитись |\nСКОРІШ ЗА ВСЕ БУЛО ДУБЛЬОВАНО, ПРОТЕ В ПРОКАТ ТАК І НЕ ВИЙШЛО, ТА ДЕІНДЕ НЕ З\'ЯВИЛОСЬ\nАве, Цезар! (Hail, Caesar!) (2016) | Мейджор – Universal Pictures | Дистриб’ютор - “B&amp;H” | офіційний український трейлер | [/spoiler]'),
(14, 'Вітання.\nКолись вмирав зі сміху від тої творчості цього прекрасного чоловіка.\nТепер в неті лише 2 гуморески йогоє і то Про Гриця Совківа обрізана дуже...\n\nХтось шось знає чи може поділитися???\nБуду дуже вдячний!!!\n\nТрохи інфи:\nСтася і Дзюньо — союз психіатра і депутата\nЛюдмила ПУЛЯЄВА Фото Володимира ДУБАСА\n18 квітня Львівська обласна філармонія зібрала два аншлагові концерти: 15-річчя свого сценічного «шлюбу» святкували пані Стася і пан Дзюньо з львівського театру “Не журись!”\nСтася і Дзюньо — союз психіатра і депутата\n\nЯк і годиться, привітати ювілярів прийшли і їхні друзі та колеги по сцені: народний артист України Роман Вітошинський, заслужена артистка України Наталія Романюк, соліст Вашингтонської опери Стефан П’ятничко, співак Валерій Степовий, гурт Олега Кульчицького, батяр-бенд “Галичина” і художній керівник театру “Не журись!” Віктор Морозов.\n\nСоюз Стасі і Дзюня почався з вистави театру “Не журись!” “Картотека пана Базя”. Пан Базьо займався тим, що сватав самотніх людей.\n\nХто ж ховається за цими сценічними масками, особливість яких полягає у незмінності і стабільності образів впродовж усіх 15-ти років? Хай розкажуть самі.\n\nПан Дзюньо (Богдан Рибка): “Я молюся двом богам – Мельпомені і Гіппократу. Працюю в Обласній клінічній психіатричній лікарні лікарем-психіатром. Мистецтво іде паралельно. Ми недержавний театр, хоча я і є членом Спілки театральних діячів України.\n\nСаме знання психології людей підштовхнуло мене до створення образу пана Дзюня. Стася і Дзюньо - з нашого середовища, хоча і є трохи гротесковими, акцінтуйованими. Акцінтуйована особистість - у психології не патологія, а такий собі пограничний стан. За 15 років ми уже так зжилися зі своїми масками, що я відгукуюсь на “пана Дзюня”.\n\nПані Стася (заслужений діяч мистецтв України Остап Федоришин): “У житті я буваю похмурим і розважливим. Але думаю собі: якщо всі такими будуть, то не варто жити. І тоді намагаюся жартами розвеселити ще більш похмурих за мене людей. А взагалі, я багато чим займаюся. Працюю над антологією українського анекдоту, віддаю час обласній раді як депутат від Жидачівського району, буваю двічі на тиждень у своєму окрузі і намагаюся допомогти нужденним, чиї права утискають можновладці. Люди у селі дуже делікатні, а чиновники знахабнілі… Також люблю працювати на дачі. У моїх парниках першими з’являються редька, часник, свіжа цибулька. На дачі мені легко працюється і творчо. Туди часто приїжджають Дзюньо і Віктор Морозов, обговорюємо плани на перспективу.\n\nУ Віктора Морозова я запитала про особливість цього дуету і відмінність його від інших естрадних пар.\n\n- Перш за все вони відрізняються тим, що обігрують суто наші, галицькі, події, - відповів пан Віктор, - і коментують їх на галицькому діалекті. Цим специфічним діалектом на сцені більше ніхто так не володіє. Вони знайшли свій неповторний образ. Їхня константа залишається незмінною від часу їх народження у виставі “Картотека пана Базя”. Їм вдалося створити колоритні образи львівського пузатенького міщука – своєрідного Санчо Панси – і Дон Кіхота, який є чи то жінкою, чи то трансвеститом. Це настільки гармонійна пара, що окремо їх уявити тепер уже дуже важко.'),
(15, 'Гуртомівці щукаю такі програми бажано з рідним інтерфейсом!!\nФотошоп (Adobe Photoshop CS4),\nДримвівер (Adobe Dreamweaver CS4),\nФлеш (Adobe Flash CS4 Professional),\nСвіш (SwishMax 2.0),\nАфтер Ефектс (Adobe After Effects CS4),\nПрем’єр (Adobe Premier CS4 Pro).\nХто може викласти їх??..Вуду вдячний!!'),
(16, '[align=center][url=http://img.hurtom.com/image/LUT][img]http://img.hurtom.com/i/2017/07/video-games-pacman_icon-icons.com_48378.png[/img][/url]\n[/align]\n1.\nCrazy Machines 1\nCrazy Machines 2\nCrazy Machines 3\n\n2.\nThe Sims 2 - Collection13in1\n\n3.\nBilliard Deluxe\nPerfectPool\n\n4.\nCrashday\n\n5.\nEl Matador [PCDVD][English]\n\n6.\nFarcry\nFar Cry Illusion of War\nFarCry - Дьявольский остров\nFarCry_Commando\n\n7.\nHITMAN_Blood_Money\n\n8.\nLand Rover vs Ford\n\n9.\nNeed For Speed 3\nNFS Underground\nThe Need For Speed Underground 2\nNFS_MW\nNFS Carbon\nNeed For Speed Pro Street\n\n10.\nQuake 3 Arena\n\n11.\nXpand Rally Xtreme\n\n12.\nАнтологія JUICED\n\n13.\nBus Driver\n\n14.\nCOMMANCH 4\n\n15.\nRACE 07 - Чемпіонат WTCC\n\n16.\nMicro Machines 4\n\n17.\nHalf.Life.2.Episode.One\nHalf.Life.2.Episode.Two-Unleashed\n\n18.\nBattlefield 2\n\n19.\nAlarm_Crash_Time(Arcade2007)\n\n20.\nWorms 4 Mayhem\nWorms portable\n\n21.\nCounterStrike 1.6 [інтернет+боти+моделі зброї і персонажі зі SOURCE]\nCounterStrike: Русский Спецназ\nCounterStrike Source\nCounterStrike: FusionPack\n\n22.\n3DSexVilla_v2.034.001_Cracked (якщо Konfucius дозволить Wide grin  Wide grin  Wide grin )\n\n23.\n25 To Life\n\n24.\nMafia Modern Mod\n\n25.\nGTA San Andreas (original)\n\n26.\nTrue Crime\n\nЦе ще не повний список. Можу викласти кожну гру з цього списку.\nP.S.: якщо під номером вказано кілька ігор, то це тільки для впорядкування, викладаю кожну гру окремо. Wide grin'),
(17, 'Гуртом як проект підтримки всього українського розвивається зусиллями тисяч ентузіастів, які поступово наповнюють його усім, що надибали українського в Інтернетрях.\n\nРазом з тим, [u]абсолютна більшість українського контенту все ще залишається поза нашим проектом. [/u]\nЗнаходить, приміром, людина рідкісну українську книгу / музичний альбом / ще щось на якомусь із файлообмінників, торрент-трекерів і т.д. Однак чи то в неї інтернет помегабайтний, чи немає аккаунта/довго чекати для завантаження.\n\n[color=green]Впевнений, що чимало користувачів Гуртом мають в активі золоті аккаунти на рапідшеа / депозит / інші, високу швидкість + безлімітний інтернет і могли б пачками вантажити знайдений таким чином український контент на Гуртом.\n\nТака програма діє здебільшого на обмінниках, хостингах сайтів (не буду називати яких).\nЯкось подумав, чи не можна було б таке застосувати і для нашого, для багатьох вже рідного Hurtom?Happy [/color]\n\nДля цього і створена дана тема.\n[b]\nОрганізіція процесу перезаливання відбувається за наступною схемою: [/b]\n\n1. будь-хто із небайдужих до українського знаходить десь під час перегляду найрізноманітніших ресурсів якийсь український контент (фільм, книгу, програму і т.д.), якого немає на Гуртом (для перевірки використовується Пошук)\n\nпісля віднайдення гуртівець копіює посилання, переходить у цю тему і створює невелике повідомлення, що обов\'язково має включати наступні складові:\n- назва знайденого (фільму, книги, програми - тип знайденого теж доцільно зазначити у дужках)\n- розмір знайденого\n- під спойлером (і тільки так) - саме посилання.\n[color=green]\nприклад:\n(диск) Київ. Історична енциклопедія. З найдавніших часів до 1917 р. (UKR/RUS/x86)\n442.07 MB[/color]\n2. будь-хто із небайдужих (що має хвильку вільного часу та достатні кодиції інтернету для завантаження + привілейовані аккаунти) бере посилання із теми, завантажує контент і розміщує його на Гуртом.\n\nметодика роботи буде постійно вдосконалюватися.\n[b]\nНаразі відбувається перезаливання: [/b]\n\nKonfucius - Бібліотека \"Літера\" (понад 4 тисячі книг у різноманітних форматах)\ncizarion - Бібліотека \"Читанка\" (1400 книг і журналів для дітей у djvu форматі)'),
(18, 'Шановні панове зі Львова! Мені хотілося б відсканувати статтю М. Возняка з журналу \"Шлях виховання й навчання\" (число 1 за 1936 рік, с. 16-27). Чи має хтось змогу допомогти мені? Крім ЛННБУ цієї статті, напевно, вже ніде немає. Відшукати інші примірники цього часопису мені не вдалося'),
(19, 'Дана інструкція написана для людей, які не можуть самотужки розібратися як же потрібно користуватися торрентами і задають питання, молять модераторів та користувачів, щоб їм допомогли завантажити фільм, книжку, музику, бо їм дуже требаHappy . Інструкція писалася для програми µTorrent, яка працює в операційних системах windows, mac та linux (через wine). Програм існує багато, хоча за великим рахунком послідовність дії не буде сильно відрізнятися від розписаних тут, якщо є бажання і час можете зробити щось подібне і для інших програм. Скріншоти, які використані тут для ілюстрації зроблені на Вісті x64 SP1.\n\n1. Для початку Вам потрібно завантажуємо і встановлюємо µTorrent. Завантажити інсталяційний файл та українізатор (Для встановлення українізатора копіюємо файл utorrent.exe.lang.txt в папку куди встановили програму)\n\n2. При першому запуску програми з\'явиться вікно майстра швидкості. Тут відповідно до швидкості вашого інтернету (якщо точніше швидкості віддачі) вибираємо з варіантів. Тут же проводимо тест на відкритість порту, який буде використовуватися. (Для тесту відкритості порту відкриється ваш браузер)\n[spoiler=\"Вікно майстра швидкості µTorrent\"]\n[img]https://toloka.to/files/fotky-files/15352_f74ob.png[/img][/spoiler]\n[spoiler=\"Перевірка відкритості порту µTorrent\"][img]https://toloka.to/files/fotky-files/15351_o3bbn.png[/img][/spoiler]\nТакож зверніть увагу на значки індикатори мережі по середині знизу.\n[spoiler=\"Значки-індикатори мережі в µTorrent\"] [img]https://toloka.to/files/fotky-files/3729_wfe9g.png[/img] - Індикатор стає зеленим при появі першого ж вхідного з\'єднання. Це означає, що ваш порт точно доступний.\n [img]https://toloka.to/files/fotky-files/3727_4akup.png[/img]- Відразу після старту µTorrent показує внизу жовтий індикатор, що означає, що вхідних з\'єднань поки що немає. Якщо ваш клієнт з\'єднаний з невеликою кількістю пірів, то індикатор може залишатися жовтим довго.\n[img]https://toloka.to/files/fotky-files/3728_fqmqv.png[/img] - Червоний гурток з\'являється, коли клієнт остаточно вирішує, що ваш порт недоступний - у нього вже давно є безліч вихідних з\'єднань, але до цього часу ні одного вхідного.\n [img]https://toloka.to/files/fotky-files/3728_fqmqv.png[/img] - Якщо червоний індикатор з\'являється відразу при старті клієнта, і при підведенні до нього курсору з\'являється напис «Помилка порту. Потрібно змінити порт, як правило, це означає, що порт вже зайнятий іншою програмою - наприклад, у вас вже запущений інший торрент клієнт, у якого в настройках вказано той же номер порту.[/spoiler]\nЯкщо порт відкритий переходимо далі, якщо ж ні читаємо тут. В деяких випадках закритий порт не є перешкодою для завантаження, але він обмежить швидкість і можуть виникнути проблеми з завантаженням. (Про це дивись в пункті 1 цієї інструкції)\n\n3. Тепер знаходимо щось на трекері з того що хочеться завантажити і шукаємо знизу шапки релізу посилання на торрент-файл і завантажуємо його. Для прикладу почнемо завантажувати ось цей реліз Хоробре серце / Braveheart (1995) DVDRip Ukr/Eng. Якщо Вам сподобався реліз тиснемо також кнопку Дякую, релізерам буде приємно. Тут також можна проставити оцінку роздачі і переглянути список файлів які будуть завантажуватися.\n[spoiler=\"Завантаження торрент файлу з нашого трекеру\"][img]https://toloka.to/files/fotky-files/15354_3vsja.png[/img][/spoiler]\n4. Відкриваємо завантажений нами торрент-файл в µTorrent.\n[spoiler=\"Відкриття торрент файлу в µTorrent\"][img]https://toloka.to/files/fotky-files/15375_bmkoo.png[/img]\nАбо просто два рази клацаємо на торрент-файлі який вже був завантажений у випадку якщо файли *.torrent запрограмовані на відкриття в µTorrent[/spoiler]\n5. Далі потрібно у вікні вибирати куди завантажувати файли (1) та які саме файли, якщо в роздачі їх декілька і всі не потрібні (2). Ставимо галочку запустити торрент і тиснемо кнопку добре\n[spoiler=\"Вікно додавання завантаження в µTorrent\"][img]https://toloka.to/files/fotky-files/15374_fjipt.png[/img][/spoiler]\nНадіюсь написанні та перекладені мною інструкції допоможуть Вам і ми отримуємо декількох Робін-Гудів для нашої торрент-толоки. Зауважу це лише базові налаштування, які необхідні для завантаження але більшості їх достатньо.\n\nСлід зауважити, що вся система працює на користувачах, які підтримують роздачі після завантаження, тому не полишайте роздачі одразу після завантаження, це допоможе іншим завантажити і ви отримаєте рейтинг.\nРейтинг - це співвідношення між завантаженим і розданим\n[spoiler=\"Всіх з Новим роком!\"][img]https://toloka.to/files/fotky-files/3730_mgcuf.png[/img]\nЦе не фотожаба це моя статистика десь вночі 1 січня 2009 рокуHappy[/spoiler]'),
(20, '[b]Необхідні інструменти [/b]\nMeGUI\nAvisynth\nAvsPmod\nK-Lite Codec Pack Mega\nFFmpeg\n\n[b]\nСтворення скрипту Avisynth [/b]\n1. Відкрийте ремукс за допомогою AvsPmod\n2. Знайдіть світлий кадр і обріжте чорні смуги через Video - Crop Editor\n\n3. Вирахуйте розмір:\nНаприклад, після обрізання вийшло 1920x1040\n1920 поділити на 1040 = 1,846153846153846\n1280 (бажана ширина) поділити на 1,846153846153846 = 693,3333333333334\n4. Беріть найближче число, яке ділиться на 4, в даному випадку це 692\n5. Після Crop додайте:\nLanczos4Resize(1280,692)\n\nВ результаті вийде:\n[quote]Цитата:\nDirectShowSource(\"00010.m2ts\")\nCrop(0, 20, -0, -20)\nLanczos4Resize(1280,692)[/quote]\n\nЩоб згладити banding, раджу ще в кінці додати:\n[quote]Цитата:\nGradFun3(thr=0.4, smode=2)[/quote]\n\nЩоб прибрати шум, в першу чергу на старих фільмах, додайте після Lanczos4Resize:\n\nСлабкий шум\n[quote]Цитата:\nRemoveGrain(mode=2)[/quote]\n\nСередній шум\n[quote]Цитата:\nFluxSmoothST(7,7)[/quote]\n\n[b]Ріпання відео[/b]\n1. Відкрийте .avs у MeGUI\n2. Виберіть x264: *scratchpad* у Encoder settings\n3. Виберіть File format: MKV\n4. Відкрийте Config\n5. Поставте галочку на Show Advanced Settings\n6. Виберіть Const. Quality\n7. Встановіть Quality на 19 для нових фільмів і 21 для старих або зернистих (чим нижче значення, тим вища якість, не раджу переходити межі 18-22, з досвіду можу сказати, що 19 - більш, ніж достатньо)\n\n[quote]Цитата:\nPreset - Slower\nTuning - Film\nAVC Profile - High Profile\nAVC Level - Level 4.1\nFrame-Type - Number of B-frames - 3 (для сумісності із пристроями як Xbox 360; при використанні режиму Const. Quality значення не впливає на якість - якби воно було вищим, це би дозволило досягнути дещо меншого розміру файлу)\nRate Control - VBV Buffer Size - 31250; VBV Maximum Bitrate - 31250 (замість стандартних 78125 та 62500 для сумісності; їх більш, ніж достатньо для 720p і цілком достатньо для 1080p)\nAnalysis - M.E. Range - 32, M.E. Algorithm - 10, No Fast P-Skip[/quote]\n\nЗамість того, щоб параметри вибирати вручну, ви також можете завантажити мій профіль (називається x264: Film). File - Import Presets\n\n8. Натисніть Queue\n\n[b]Ріпання аудіо[/b]\n1. Завантажте найновіший FFmpeg-static\n2. Відкрийте командний рядок через Пуск - Виконати - cmd (Windows 7) або Win+R - cmd (Windows 8+)\n3. Перетягніть ffmpeg.exe у командний рядок\n4. Допишіть \" -i \" та однаковим способом перетягніть у вікно ремукс, і натисніть Enter\n\nУ вас мала вийти така команда:\n[quote]Цитата:\n\"C:\\Program Files\\ffmpeg\\ffmpeg.exe\" -i C:\\Files\\Movie\\STREAM\\00010.m2ts[/quote]\n\n5. FFmpeg покаже інформацію про файл. Нас цікавить id оригінальної доріжки аудіо\n6. Стрілкою вверх поверніться до попередньої команди, і доповніть її:\nmap - це id доріжки\nc:a ac3 - формат\nb:a 448k - бітрейт\n\n[quote]Цитата:\n\"C:\\Program Files\\ffmpeg\\ffmpeg.exe\" -i C:\\Files\\Movie\\STREAM\\00010.m2ts -map 0:1 -c:a ac3 -b:a 448k \"C:\\Files\\Movie\\eng.ac3\"[/quote]\n\nЧому не ec3to? Він використовує Aften, дуже застарілий енкодер ac3. Порівняння:\n\nAC3-448 Aften\nAC3-448 Sonic Foundry (Dolby Encoder 6.2.2)\nAC3-448 Sony Studio (Dolby Consumer Encoder)\nAC3-448 Sony Pro (Dolby Encoder 7.0)\nAC3-448 FFmpeg\nDTS-HD Оригінал\n\nДля AAC замість AC3:\n\n[quote]Цитата:\n\"C:\\Program Files\\ffmpeg\\ffmpeg.exe\" -i C:\\Files\\Movie\\STREAM\\00010.m2ts -map 0:1 -c:a libfdk_aac -b:a 224k -cutoff 18000 \"C:\\Files\\Movie\\eng.aac\"[/quote]\n\nДля 5.1 -&gt; 2.0\n\n[quote]Цитата:\n\"C:\\Program Files\\ffmpeg\\ffmpeg.exe\" -i C:\\Files\\Movie\\STREAM\\00010.m2ts -map 0:1 -c:a libfdk_aac -b:a 160k -cutoff 18000 -ac 2 \"C:\\Files\\Movie\\eng.aac\"[/quote]\n\nЧому libfdk_aac? Порівняння:\n\nAAC-224 libfdk_aac\nAAC-224 native\nPCM-1536 оригінал\n\nПри кодуванні напряму із .dts, ffmpeg може видати \"unknown error\". Тоді треба додати \"-f dts\":\n\n[quote]Цитата:\n\"C:\\Program Files\\ffmpeg\\ffmpeg.exe\" -f dts -i C:\\Files\\Movie\\eng.dts -c:a libfdk_aac -b:a 160k -cutoff 18000 -ac 2 \"C:\\Files\\Movie\\eng.aac\"[/quote]\n\nІз DTS-HD витягнути DTS 1509 (core):\n\n[quote]Цитата:\n\"C:\\Program Files\\ffmpeg\\ffmpeg.exe\" -f dts -i C:\\Files\\Movie\\eng.dts -bsf:a dca_core -c:a copy \"C:\\Files\\Movie\\eng_core.dts\"[/quote]\n\nДодати затримку 1.5 секунди:\n[quote]Цитата:\n\"C:\\Program Files\\ffmpeg\\ffmpeg.exe\" -f lavfi -i anullsrc=channel_layout=5.1:sample_rate=48000 -t 1.5 -b:a 448k \"C:\\Files\\Movie\\silence-1.5.ac3\"\n\"C:\\Program Files\\ffmpeg\\ffmpeg.exe\" -i concat:\"C:\\Files\\Movie\\silence-1.5.ac3|C:\\Files\\Movie\\ukr.ac3\" -qscale 0 -codec copy \"C:\\Files\\Movie\\ukr-delayed.ac3\"[/quote]\n\n[b]Муксування[/b]\n1. Відкрийте mkvmerge GUI через C:\\Program Files (x86)\\MeGUI\\tools\\mkvmerge\\mmg.exe\n2. Додайте файли\n3. Переконайтеся, що вони у правильній послідовності\n4. Виберіть \'none\' для всіх доріжок у Extra options - Compression\n5. Виберіть мову доріжки у General track options - Language\n6. Виберіть \'no\' у General track options - Default track flag для всіх доріжок, крім відео і української\n7. Вкажіть назву фільму у Global - File/segment title\n8. Натисніть Start muxing\n\nКожен крок у інструкції важливий, будьте уважні.'),
(21, '[align=center][size=22][color=red][b]ЧАП для новачків з субтитрування [/b][/color][/size]\n[img]https://img.hurtom.com/i/2016/01/TheReward_001_2625.th.png[/img]\n[size=16][color=red][i]…або як не наступати на ті самі граблі.[/i] [/color] [/size] :ab: [/align]\n\nЩо ж, не знаю чого мене вважає так чимало люду гарним знавцем, але з власного досвіду щось, та й спробую порадити.\nЗгодом якось лепсько й текст теми оформиться, й інформація впорядкується.\n\n[size=22][align=center]Отож, гіпотетично уявімо, що починаємо «з нуля».\nЗ якими негараздами та труднощами зіткнемося та що нам найбільш необхідне?[/align][/size]\n\n[b]1[/b] Бажання\n[b]2[/b] Наполегливість\n[b]3 [/b]Визначення своїх цілей\n[b]4 [/b]Усвідомлення своїх можливостей\n[b]5[/b] Пошук спільнодумців\n[b]6[/b] Пошук інструментів досягнення мети\n[b]7[/b] Тестова жертва\n[b]8[/b] …мабуть не забувати хоча б про пункти 1-4\nЙ от зараз ми маємо якийсь список незрозумілої мотивації. Спробуймо пояснити більш розгорнуто.\n\n[color=green][b]1[/b] [/color]Причини можуть бути різними, можуть й однаковими, але в людини виникло бажання створити щось корисне, гарне й значне. Без нього — нікуди, й важливо щоб воно нікуди не зникало з появою труднощів.\n[color=green][b]\n2[/b] [/color]Субтитрування почасти може бути важкуватим, в залежності від обраної картини — навіть нудним. Коли зникає бажання потрібно продовжувати йти вперед. Але є й гарний бік — це непогано вчить друкувати (наприклад, можна закріпити сліпу навичку друку, замість того, щоб просиджувати в тренажерах). Інший плюс — ми розглядаємо історію як книгу, тому почасти знаємо її майже досконало до останніх натяків й читання значень «між рядків». Тому варто обирати цікавий собі матеріал, бо і взнаєте щось нове, і людям користь. Але з нецікавим може бути важкувато, і якщо обирати зовсім нецікаві собі фільми, то ніяких бажання й наполегливості не вистачить.\n\n[color=green][b]3 [/b][/color]Ну, з цим доволі просто. Просто пошукайте цікавих собі кандидатів, створіть список бажаного й цікавого, якийсь …не те що розклад, просто змоделюйте наперед виділений час й те, коли зможете завершити. (і помножте цей час десь на 1,5 бо людина завжди оптимістична в прогнозах =) )\nОдним словом, хоч мінімально організуйтеся.\n\n[color=green][b]4 [/b][/color]Важливий пункт. Подумаємо, які мови знаємо, чи можемо самостійно й нашвидку перекладати. Навіть якщо ні — за бажання можна знайти спільника-перекладача й займатися оформленням (про це трохи згодом), або ж самому обкластися словниками. Тут все залежить від бажаня.\nНе варто робити помилки й брати щось надто довге й складне. Спробуйте спочатку кілька короткометражок. Чи чогось, де не дуже багато розмов і написів. Також важливо розуміти, чому варто приділити більш уваги, а що можна й пропустити.\nДивіться роботи інших, думайте як їм вдалося досягти такого результату.\n\n[color=green][b]5[/b][/color] Додав цей пункт, бо хоча й роблю майже завжди все сам, але для однієї людини це часто може бути важкувато.\nЗнайдіть спільнодумців, з тими самими жанровими інтересами, якось розподіліться, будьте в активній взаємодії (не зникайте невідомо куди не попередивши інших).\nХтось має бути перекладачем і непогано набирати основне тіло тексту, в когось може бути гарне володіння українською для вичитки, у когось просто художнє чуття, хтось може працювати з пошуком іншомовних субтитрів, відео, аудіо, збіркою, конвертацією, релізами й взагалі — розповсюдженням. Це значно полегшує життя субтитрувальника, хоча й початковий друк з простеньким перекладом «абияк» все одно складатиме з третину необхідних зусиль.\n\n[color=green][b]6 [/b][/color]Тут в нас важлива навичка пошуку. Пошуку відеозаписів, аудіо, субтирів в різних місцях.\nПо програмам. Що ж, погляну що в мене є й використовується:\n\n- словники (треба буде згодом додати посилання на електронні)\n- для перекидання файлів: торрент-клієнт, дропбокс, гуглдиск, ба навіть http://expirebox.com/ можна скористатися\n- перевірка граматики, мені вистачає звичайного F7 ворду з текстом в .srt, позначеним як українська перед перевіркою. Багато чого не вистачає, але елементарний хибодрук знайти легко й виправити паралельно в редакторі субтитрів, знайшовши за часом.\n- перевірка змін, beyond compare встановлена в total commander, актуально можна побачити зміни в тексті, особливо коли працює кілька людей\n- програма для роботи з субтитрами aegisub, зберігати в .ass для кращого вигляду й функціоналу. .srt більш сумісний.\n- k-lite codeck pack + media player classic (кодеки та плеєр, встановлювати максимально все)\n- daemon tools lite (якщо треба для образів дисків)\n- fast stone capture (чи ще щось для скріншотів)\n- MediaInfo (дуже необхідна, інформація про медіафайли)\n- mkvmerge GUI + MKVToolNix GUI (теж дуже необхідна, робота з .mkv контейнером, куди збирається відео, аудіо, субтитри, шрифти, навіть логотип та розділи)\n- VOB2MPG v3 (лише якщо треба нарізати багатосерійки з DVD)\n- XviD4PSP 5 https://toloka.to/t70370 (конвертер)\n\n[color=green][b]7 [/b][/color]Знову ж, почніть з короткометражки, десь після 3-4 можна й до повнорозмірного 1,5-годинного фільму переходити.\n\nЗгодом як щось субтитруватиму, спробую поетапно описати та наочно зробити якісь світлини. (хоча б куди тиснути та навіщо) Wink (1)\n\n[spoiler=\"Приклади перекладів\"][img]https://img.hurtom.com/i/2016/02/TimeTrapShortFilm_001_649.th.png[/img][img]https://img.hurtom.com/i/2016/01/Girl_and_Robot2008.HDTVRip.720p_001_774.th.png[/img][img]https://img.hurtom.com/i/2016/02/TimeTrapShortFilm_001_1604.th.png[/img][img]https://img.hurtom.com/i/2016/02/TIEFighter-shortfilm_001_70.th.png[/img]\n[/spoiler]'),
(22, 'Хтів записати з АМС серіали, вони недавно канал українізували. Але біда в тому, що телевізор до якого підключено HDD форматує його під свій формат, і після запису я не можу продивитися його на комп\'ютері, він не бачить диск, щоб побачив треба форматувати його наново.\nНа англійському прописував, знайшов що можна якось запустити через емулятор Linux HDD без форматування, але файли будуть все одно зашифровані. Хтось знає що можна зробити?');
INSERT INTO `bb_posts_text` (`post_id`, `post_text`) VALUES
(23, '[size=22][b][color=green][align=center]Створення DTS доріжки до фільму у форматі 5.1[/align][/color][/b][/size]\n\nНапевно у кожного колись виникало бажання, переглядаючи фільм - отримати від нього весь той максимум відчуттів, тобто не лише шикарну картинку але і те, що так бракує у фільмах з українським перекладом - саме так, це якісна аудіодоріжка з великим бітрейтом.\nТому в цій темі я пропоную розглянути наступне, а саме - як своїми зусиллями можна створити якісну аудіодоріжку до фільму.\nОтже, найчастішим випадком є таке:\n- скачав фільм в мега крутій якості, а от український переклад підвів - бітрейт не задовіляняє ваші моральні погляди на фільм - і ви не хочете травмувати ваші вушні перепонки цим неякісним звучанням, що виходить із ваших колонок, робим так:\nСкачали фільм, у якому є укр доріжка ( або окремо скачали її саму ), припустим її бітрейт 448 Кбит/с ( аас 5.1 або 2.0 ) і є оригінальна доріжка DTS-HD MA, 6 ch, 4018 Кбит/с ... ( або інша - більш якісна доріжка ) Вам потрібно витягнути центральний канал з укр доріжки і вставити його замість центрального каналу у DTS-HD MA, 6 ch, 4018 Кбит/с - таким чином ви отримаєте доріжку з великим бітрейтом і укр перекладом...\n\nТепер все по порядку...\n\n[b]1.[/b] Щоб витягнути аудіодоріжку ви можете скористатись цими програмами:\nдля avi - VirtualDubMod\nдля mkv - MKV Demux Tool ( MKV Extract Gui )\nдля TS, M2TS - TS Muxer GUI\n\n[b]2.[/b] Наступним кроком буде розкладання доріжок на канали , у цьому нам допоможе TranzcodeGUI\n\n[b]2.1[/b] Із укр доріжки 5.1 нам потрібно витягнути тільки центральний канал (якщо доріжка, наприклад, 2.0 то витягуємо любий канал - на практиці вони ідентичні, але уже через програму Sound Forge Pro, як витягнути через транзкод 2.0 не знаю ).\n((( У мене з цим була проблема - додаю інфу - Sound Forge Pro - якщо 44 100 Кh і 23.976 а треба перевести у 48 000 - 23.976 .....відкриваю файл з 44 100 ... створюю новий файл у вигляді 44 100 а от зберігаю в 48 000 ........ якщо при 44 100 нема моно 24 біт зберігаю у 16 біт ... потім відкриваю уже створену 48 000 - 23.976 - 16 біт ...... створюю новий файл у вигляді 48 000 + уже 24 біта ....перекидую 16 бітну дорогу у новий файл з 24 бітами і зберігаю ... у шаблоні автоматично виставлено 24 тому моно там в переліку не буде !!! )))))\nВідкриваємо в програмі вхідну аудіодоріжку, потім вказуємо місце де її зберегти уже в розкладеному на канали вигляді ( обовязково зазначати вкінці назви ВИХІДНОЇ доріжки \".wav\" - замість dts, aac і тд )\nВ програмі потрібно ОБОВЯЗКОВО виставити ту розрядність ( бітність ) і дискретизацію, що і у доріжки з більшим бітрейтом ( тобто та доріжка в яку і буде переміщено центральний канал ), згладжування - ставимо позначку \"залишити\".\n\n[b]2.2[/b] Відкриваємо DTS-HD MA ( ту кращу доріжку ) в програмі, потім вказуємо місце де її зберегти уже в розкладеному на канали вигляді ( обовязково зазначати вкінці назви ВИХІДНОЇ доріжки \".wav\" - замість dts, aac і тд ), для економії часу можна зняти галочку з центрального каналу - він і так не буде нам потрібний Wink (1) , висавляєм ту розрядність ( бітність ) і дискретизацію що і є в цій доріжці ( не рекомендується виставляти малу бітність - 24, 32 найбільш оптимальні варіанти, але при виході матимуть дуже великий обєм ), згладжування - ставим позначку \"залишити\"\n\n[b]3.[/b] Тепер потрібно обєднати всі канали в один аудіо файл, в цьому нам допоможе DTS-HD Master Audio Suite Encoder:\n\n- 1 Вибираємо вихідний формат:\nBlu-ray Disc (.dtshd) - формат для Blu-ray\nDVD(.cpt) - формат для DVD ( файл із .cpt - можна перейменувати в .dts - і все буде ок )\n- 2 Вибираємо потік\n- 3 Вибираємо кількість каналів ( 5.1 буде норм )\n- 4 Вибираємо дискритизацю ( 48 000 буде норм )\n- 5 Перетягуємо канали ( які здобуті програмою TranzcodeGUI )\nЦентральний укр канал - перетягуєм в центральний відділ\nВсі інші канали із dts-hd ma крім центрального перетягуєм по призначенню у відділи каналів\n( Бітність і дискритизація у СВІХ каналів має бути ОБОВЯЗКОВО ОДНАКОВА !!!! )\n- 6 Виставляємо нормалізацію ( -31 буде норм .... тобто без ніяких змін )\n- 7 Виставляємо бітрейт ( чим більший тим краще, звичайно відштовхуючись від оригіналу Wink (1)\n- 8 Вибираємо місце збереження доріжки\n- 9 Вказуєм назву доріжки\n- 10 Клісаєм Encode\nВітаю - тепер у Вас є готова доріжка з крутим звуком ( ні, Ви не володар світу - спускаємось з небес і пробуємо прикріпити доріжку до фільму Wide grin\n\n[b]4. 1.[/b] Щоб прикріпити ( добавити ) аудіодоріжку ви можете скористатись цими програмами:\n--для avi - VirtualDub ( тут дуже просто - даєм назву аудіодоріжці таку ж саму як і у фільма - крім останніх букв після крапочки Wink (1) . Дивимось фільм через MPC - клікаєм правою кнопкою по центру плеєра міняємо аудіодоріжку - у відділі аудіо на нашу НОВУ\n--для mkv - MKVtoolnix ( MKV merge gue )( в програму додаєм фільм - додаєм готову доріжку - клікаєм мультиплекс (Start muxing).\n--для TS, M2TS - TS Muxer GUI ( в програму додаєм фільм - додаєм готову доріжку - вибираємо або TS Muxing, або M2TSMuxing ( дивлячись який у вас файл ) - клікаєм Start muxing.\nЦе все. Всім приємного перегляду.\n\nТема присвячується 60-ти гіговому фільму \"Темний Лицар повертається / The Dark Knight Rises (2012) {2-Disc Edition} Blu-ray CEE\", \"Батьки / Parenthood (1989) BD Remux\"\nі фільму \"50 перших поцілунків / 50 First Dates 2004 BDRip 1080p\"﻿\n[spoiler=\"Скріни\"][url=http://img.hurtom.com/image/LUz][img]http://img.hurtom.com/i/2017/07/dts-hd_master_audio_suite_encoder_149.md.png[/img][/url]\n[url=http://img.hurtom.com/image/LUE][img]http://img.hurtom.com/i/2017/07/tranzcodegui_626.md.png[/img][/url][/spoiler]'),
(24, 'Проводиться набір у команду Гуртом.\n\nЄ набір у 5 різних груп. Кожна група відповідає за свою власну роботу.\n\n[b]Перша група [/b](Г1 - так зазначати у повідомленні долучення до групи)\n[b]Синхронізація аудіо доріжок з відео[/b] (сирих аудіо доріжок)\n1) Чи синхронізували Ви колись аудіо доріжки з відео?\n2) Якими програмами Ви синхронізували?\n3) Скільки часу Ви можете працювати над синхронізацією на добу?\n4) Яку кількість \"сирих\" аудіо доріжок Ви готові взяти на опрацювання на місяць?\n5) Чому Ви хочете займатись саме синхронізацією доріжок?\n\n[b]Друга група (Г2) [/b]\n[b]Субтитрування фільмів, серіалів, мультсеріалів, аніме, документального кіно та іншого. [/b]\n1) Якими мовами Ви володієте?\n2) Який з напрямків субтитрування Ви хочете обрати?\n3) Скільки часу Ви можете працювати над перекладом субтитрів на добу?\n\n[b]Третя група (Г3)\nЗапис з ТБ звукових доріжок до фільмів, серіалів, мультсеріалів, аніме, документального кіно та іншого. [/b]\n1) З яких каналів Ви маєте змогу записувати?\n2) Яка якість запису?\n3) Що саме Ви б хотіли записувати? (фільми, серіали, мультсеріали, аніме, документальне кіно та інше)\n4) У який час Ви маєте змогу записувати напротязі доби?\n\n[b]Четверта група (Г4)\nОзвучування фільмів, серіалів, мультсеріалів, аніме, документального кіно та іншого. [/b]\n1) Ви мали справу з озвучуванням чогось, яку саме? (описати все, що вважаєте за потрібне)\n2) Що бажаєте озвучувати?\n3) Яку кількість часу Ви можете виділити для озвучування на добу?\n* нажаль, зараз немає активної діяльності по озвученню від проекту \"Відео Гуртом\", активно озвучують лише партнерські студії, звертайтесь до них в приват: Студія Hurtom, НеЗупиняйПродакшн, Струґачка, FanVoxUA (вибачаюсь, якщо когось пропустив з неактивних тепер проектів, прим. igor911).\n\n[b]П\'ята група (Г5)\nПідтримка роздач та поширення по інтернету [/b]\n1) Скільки вільного місця на жорсткому диску Ви можете запропонувати для підтримки релізів?\n2) Яка Ваша швидкість віддачі контенту, чи відкритий порт для вхідних з\'єднань і скільки часу на добу Ви можете виділити для підтримки роздачі релізів?\n3) Якщо бажаєте займатись поширенням релізів в інтернеті, де саме Ви хочете поширювати контент і чому?\n4) Які саме релізи (фільми, серіали і т.д.) для Вас мають більше значення і Ви на цих релізах стоятимете на роздачі?\n5) Якщо Ви не бажаєте стояти на роздачі постійно, скільки вільного місця Ви можете дати на своєму комп\'ютері для зберігання релізів, та якщо хтось захоче скачати його, встати на роздачу?\n\nНу от і все! Якщо Вас це зацікавило пишіть у коментарях, але по шаблону. Якщо виникли інші питання, прошу писати мені у приват, ми знайдемо рішення!'),
(25, '[align=center][size=24][color=Green][b]\nПідтримка та поширення[/b][/color] [/size][/align]\n[align=center][b][color=Red][size=16][url=https://toloka.to/t72494][Приєднуйся][/url][/size][/color] [/b] :)[/align][align=center][img]http://img.hurtom.com/i/2016/10/pidtrumka_ta_poshupennia_video_hurtom_3.png[/img][/align]\n\n[align=center][size=20][color=Red][b]На даний момент необхідна Ваша допомога\nв поширенні контенту із розділу [url=https://toloka.to/f96-3420?sort=5][u]HD українською[/u][/url][/b][/color][/size]\n[spoiler=\"Що робити?\"][size=12] [b]1)[/b] Зайти у розділ [url=https://toloka.to/f96-3420?sort=5][u]Фільми в HD[/u][/url].\n[b]2)[/b] Ставити на завантаження релізи, що роздаються 1-м сідом.[/size]\n[/spoiler]\n[spoiler=\"Ви маєте навички монтажу або синхронізації фільмів/серіалів в 4К?\"] [size=12]Тоді Ви попали за адресою! :)\nНам якраз потрібен користувач, що зможе створювати та викладати релізи в форматі ультрависокої роздільної здатності 4K(UHD).\nВідпишіть в цій темі або завітайте до [url=https://toloka.to/t81020][u]Фільми та серіали в 4К Ultra HD Video українською[/u][/url] та перегляньте уже існуючі напрацювання :)[/size]\n[/spoiler]\n[spoiler=\"Є пару вільних терабайт на HDD?\"] [size=12]Тоді Вам сюди!)\nЗавантажуйте опубліковані [url=https://toloka.to/t81020][u]фільми/серіали в 4К/HD[/u][/url] та діліться україномовним контентом зі всіма українцями! :)[/size]\n[/spoiler]\n[/align]\n\n[b]Що таке команда \"Підтримка та поширення\"?[/b]\n\nЦе група активістів, головною метою якої є поширення україномовного відеоконтенту в мережі Інтернет.\nКоманда активістів структурно відноситься до реліз-групи [url=https://toloka.to/t72494][img]https://toloka.to/img/%D0%9F%D1%80%D0%BE%D0%B5%D0%BA%D1%82_%D0%92%D1%96%D0%B4%D0%B5%D0%BE_%D0%93%D1%83%D1%80%D1%82%D0%BE%D0%BC.gif[/img][/url].\n\n[b]Напрямки роботи[/b][list][*][u]Поширення[/u]\n[list][*]Релізер Hurtom - публікація та оформлення україномовного контенту відсутнього на Толоці\n[/list]\n[*][u]Підтримка[/u]\n[list][*][url=http://senfil.net/index.php?newsid=329]Сід [/url]- роздача завантаженого контенту, надання смуги швидкого завантаження файлів[/list][/list][b][color=Red]Набір до команди[/color][/b]\n\n[spoiler=\"Поширення (релізери)\"][b]Схема роботи[/b]\n\n[align=center][img]http://img.hurtom.com/i/2016/10/shema_pidtrumka_i_poshurennia_video_hurtom.png[/img][/align]\n\n[b]Як приєднатися?[/b]\n\nНаписати в темі заявку для вступу у вигляді:\n[b]1) Цільовий сайт для публікацій:[/b] [i][color=Green]Гуртом[/color][/i]\n[b]2) Релізів на Гуртом:[/b] [i][color=Green]25[/color][/i]\n[b]3) Стаж на Гуртом:[/b]  [i][color=Green]3 роки[/color][/i]\n[b]4) Досвід роботи:[/b]  [i][color=Green]Так[/color][/i]\n[spoiler=\"Готовий BB код\"][code][b]1) Цільовий сайт для публікацій:[/b] [i][color=Green]Гуртом[/color][/i]\n[b]2) Релізів на Гуртом:[/b] [i][color=Green]25[/color][/i]\n[b]3) Стаж на Гуртом:[/b]  [i][color=Green]3 роки[/color][/i]\n[b]4) Досвід роботи:[/b]  [i][color=Green]Так[/color][/i][/code]\n[/spoiler]\n\n[b] [/b]\n[b]Порядок роботи[/b]\n\n1. Ви робите замовлення за шаблоном нижче\n2. Ми завантажуємо\n3. Відписуємо в темі або в шапці\n4. Ви переглядаєте україномовний контент із улюбленого сайту :)\n\n[b]Як замовити завантаження?[/b]\n\nНаписати в темі повідомлення у вигляді:\n[b]Куди завантажити:[/b] [i][color=Green]FEX.NET[/color][/i]\n[b]Назва українською:[/b] [i][color=Green]Хрещений батько / The GodFather (1972) DVDRip Ukr/Eng | Sub Eng [/color][/i]\n[b]Звідки:[/b] [url=https://toloka.to/t2090]https://toloka.to/t2090[/url][spoiler=\"Готовий BB код\"] [code][b]Куди завантажити:[/b] [i][color=Green]EX.UA[/color][/i]\n[b]Назва українською:[/b] [i][color=Green]Хрещений батько / The GodFather (1972) DVDRip Ukr/Eng | Sub Eng [/color][/i]\n[b]Звідки:[/b] [url=https://toloka.to/t2090]https://toloka.to/t2090[/url] [/code]\n[/spoiler]\n[/spoiler]\n\n[spoiler=\"Підтримка (сіди)\"][b]Умови вступу[/b]\n\n1) Стаж на Толоці не менше [color=Green]3 місяців[/color]\n2) Кількість відданого не менше [color=Green]70 ГБ[/color]\n3) Рейтинг [color=Green]1.5[/color] і вище\n\n[b]Як приєднатися?[/b]\n\nНаписати в темі заявку для вступу у вигляді:\n\n[b]1) Швидкість віддачі(upload):[/b] [i][color=Green]20 Мбіт[/color][/i] ([url=http://speedtest.lviv.ua/]виміряти швидкість[/url])\n[b]2) Об\'єм пам\'яті під роздачі:[/b] [i][color=Green]100 ГБ[/color][/i]\n[b]3) Час роздачі:[/b]  [i][color=Green]24/7 [/color][/i]\n[b]4) Тип контенту:[/b]  [i][color=Green]фільми, література, музика[/color][/i]\n[spoiler=\"Готовий BB код\"][code][b]1) Швидкість віддачі(upload):[/b] [i][color=Green]20 Мбіт[/color][/i]\n[b]2) Об\'єм пам\'яті під роздачі:[/b] [i][color=Green]100 ГБ[/color][/i]\n[b]3) Час роздачі:[/b]  [i][color=Green]24/7 [/color][/i]\n[b]4) Тип контенту:[/b]  [i][color=Green]фільми, література, музика[/color][/i][/code]\n[/spoiler]\n[/spoiler]\n[b] [/b]\n[b]Навіщо тема?[/b]\n\nТема створена для:\n[list][*]Набору молодих активістів для командної роботи\n[*]Координації, організації роботи учасників команди\n[*]Обговорення, взаємодії та співпраці\n[*]Спільної роботи над обраними замовленнями\n[*]Моніторингу роботи команди Підтримка та поширення\n[*]Відображення стану речей щодо роботи команди [img]https://toloka.to/images/ranks/hurtom-support.png[/img]\n[/list] [b]Спільні/схожі теми[/b]\n[list][*][url=https://toloka.to/t14616]Допомога у поширенні української озвучки на інших сайтах[/url]\n[*][url=https://toloka.to/t6789]Замовлення україномовних фільмів від Проекту Відео Гуртом[/url]\n[/list] [b]Офіційний донат[/b]\n[list][*][url=http://www.hurtom.com/portal/33753/series-dubbing-10]Озвучення серіалів - Студія Гуртом[/url]\n[*][url=http://www.hurtom.com/portal/donate]Озвучення фільмів[/url]\n[/list] [b]Інше[/b]\n[list][*][url=https://toloka.to/t77863]Де подивитися фільми/серіали українською онлайн?[/url]\n[*][url=https://toloka.to/t77458]Як дивитися фільми на Гуртом онлайн на пристроях Андроїд?[/url]\n[*][url=https://toloka.to/t76883]Як дивитися фільми та серіали онлайн із Гуртом через Ace Stream?[/url]\n[*][url=https://toloka.to/t81012]Як дивитися фільми та серіали онлайн на яблокоподібних пристроях? (Iphone, Ipad, IOS, Apple)?[/url]\n[/list]'),
(26, '[align=center][size=24][color=Green][b]Команда \"Запис з ТБ\"[/b][/color][/size][/align]\n\n[align=center][b][color=Red][size=16][Приєднуйся][/size][/color] [/b] :)[/align]\n\n[align=center][img]http://img.hurtom.com/i/2016/07/komanda_zapuc_z_tb_hurtom_2.png[/img][/align]\n\n[b]Що таке команда \"Запис з ТБ\"?[/b]\n\nЦе група активістів, головною метою якої є запис україномовного медіаконтенту, що доступний на телебаченні та його поширення в мережі Інтернет.\nКоманда користувачів структурно відноситься до реліз-групи [url=https://toloka.to/t70619]Video Hurtom[/url].\n\n[b]Учасники[/b]\n\n[url=https://toloka.to/u100080]4erkov[/url], [url=https://toloka.to/u36872]akon111[/url], [url=https://toloka.to/u34221]andic[/url], [url=https://toloka.to/u67874]AngryBirdsUA[/url] [url=https://toloka.to/u239315]bambulla[/url], [url=https://toloka.to/u8881]dadabar[/url], [url=https://toloka.to/u90132]DareDevil96[/url], [url=https://toloka.to/u18404]Disturbed[/url], [url=https://toloka.to/u105398]Dvd-master[/url], [url=https://toloka.to/u440]dvorsky[/url], [url=https://toloka.to/u129468]foshter[/url], [url=https://toloka.to/u83276]gig_Panas[/url], [url=https://toloka.to/u62733]Gremlin_groj[/url], [url=https://toloka.to/u141807]Hanway[/url], [url=https://toloka.to/u142973]ilu[/url],  [url=https://toloka.to/u63292]legos25[/url], [url=https://toloka.to/u129733]Malamute[/url], [url=https://toloka.to/u165719]masha_k[/url], [url=https://toloka.to/u4848]Merdiff[/url], [url=https://toloka.to/u132980]Neytreenor[/url], [url=https://toloka.to/u31481]nick_89[/url], [url=https://toloka.to/u108936]OlegCena[/url], [url=https://toloka.to/u5022]olgaya[/url], [url=https://toloka.to/u2697]POMEO[/url], [url=https://toloka.to/u1665]salvateur[/url], [url=https://toloka.to/u26074]Sando7[/url], [url=https://toloka.to/u101159]SsashI[/url], [url=https://toloka.to/u239143]STONTS[/url], [url=https://toloka.to/u3974]SweetN[/url], [url=https://toloka.to/u1161]Tanat13[/url],  [url=https://toloka.to/u117424]Technomate[/url], [url=https://toloka.to/u51261]Yelovbasted[/url], [url=https://toloka.to/u8323]Кіт Баюн[/url]\n\n[b]Напрямки роботи[/b]\n\nЗавдання та обов\'язки групи поділяються на:\n[list][*][u]Моніторинг телебачення[/u] - пошук контенту, що відсутній на Гуртом на ТБ\n[*][u]Запис контенту[/u] - запис відеопотоку телевізора та його вивантаження в мережу\n[*][u]Створення релізу[/u] - обробка записаного відео, аудіоматеріалу та його публікація на Толоці\n[*][u]Пошук активістів[/u] - поширення інформації про команду Запис з ТБ на інших ресурсах та залучення нових активістів\n[/list][b]Порядок роботи[/b]\n\n1. Запис відео + аудіопотоку чи аудіодоріжки\n2. Публікація \"сирців\" на файлообміннику ([url=https://toloka.to/t77980]MEGA.NZ[/url])\n3. Додавання аудіодоріжок до бази даних [url=http://wiki.hurtom.com/][b]wiki.hurtom.com[/b][/url] ([url=https://toloka.to/t42839]детальніше[/url])\n4. Публікація посилання в цій темі на сирці\n5. Обробка сирців\n6. Оформлення релізу на Гуртом / [url=https://toloka.to/t77980]MEGA.NZ[/url]\n\n[b]Навіщо тема?[/b]\n\nТема створена для:\n[list][*]Координації, організації роботи учасників команди\n[*]Обговорення, взаємодії та співпраці\n[*]Спільної роботи над обраними замовленнями\n[*]Уникнення повторного запису\n[*]Відображення стану речей щодо роботи лише команди [img]https://toloka.to/images/ranks/hurtom-tv.png[/img][Hurtom]\n[/list][b]Інструкції по роботі[/b]\n\n[spoiler=\"Як приєднатися?\"]Для того щоб вступити до команди \"Запис з ТБ\" подайте заяву в темі [url=https://toloka.to/t72494][b]NEW2016! Набір у команду Гуртом![/b][/url]\n[/spoiler]\n[spoiler=Як моніторити ТБ?][b]1.[/b] Ви переглядаєте програму, знаходите там щось цікаве (фільм, мультфільм, серіал чи ще щось).\n[b]2. [/b]Заходите [url=https://toloka.to/tracker.php][b]сюди[/b][/url] і шукаєте це (шукати треба за оригінальною назвою). Якщо не знаходите переходите до п. 3... (Те ж саме ви робите, якщо можлива нова озвучка. Якщо ж Ви знаходите на Гуртом вже готовий реліз з озвучкою від каналу на якому Ви знайшли щось цікаве (фільм, мультфільм, серіал чи ще щось), то Ви просто переходите до пошуку чогось іншого).\n[b]3.[/b] Шукаєте це [url=http://wiki.hurtom.com/][b]тут[/b][/url] за тим же принципом, що і в попередньому пункті, якщо не знаходите - переходите до наступного.\n[b]4.[/b] Оформлення замовлення на запис. Робите це в [url=https://toloka.to/t6081][b]цій темі[/b][/url], обов\'язково згідно шаблону наведеного там. На цьому Ваша робота завершується, далі справа за звукозаписувачами.\n\n[u]Автор:[/u] [url=https://toloka.to/u136837]patriot2305[/url]\n[/spoiler]\n\n[spoiler=\"Як замовити запис з ТБ?\"]Замовити запис фільму, серіалу або телепрограми можна [url=https://toloka.to/t6081]ТУТ[/url] за шаблоном ([color=Red]обов\'язково![/color])\n[spoiler=\"Шаблон\"][quote][b]Назва українською:[/b] [i][color=Green]Назва стрічки українською мовою[/color][/i]\n[b]Назва мовою оригіналу і рік:[/b] [i][color=Green]Назва стрічки мовою оригіналу і рік[/color][/i]\n[b]IMDb:[/b] посилання на сторінку IMDb\n[spoiler=\"Телетрансляція (якщо була чи буде):\"][b]Телеканал № 1:[/b] [i][color=Green]назва телеканалу[/color][/i]\n[b]Дата та час ([i]включаючи повтори[/i]):[/b] [i][color=Green]дата та час трансляції, для зручності орієнтації в записі[/color][/i]\n\n[b]Телеканал № 2 ([i]якщо є[/i]):[/b] [i][color=Green]назва телеканалу[/color][/i]\n[b]Дата та час ([i]включаючи повтори[/i]):[/b] [i][color=Green]дата та час трансляції, для зручності орієнтації в записі[/color][/spoiler]\n[/quote]\n[code][b]Назва українською:[/b] [i][color=Green]Назва стрічки українською мовою[/color][/i]\n[b]Назва мовою оригіналу і рік:[/b] [i][color=Green]Назва стрічки мовою оригіналу і рік[/color][/i]\n[b]IMDb:[/b] посилання на сторінку IMDb\n[spoiler=\"Телетрансляція (якщо була чи буде):\"][b]Телеканал № 1:[/b] [i][color=Green]назва телеканалу[/color][/i]\n[b]Дата та час ([i]включаючи повтори[/i]):[/b] [i][color=Green]дата та час трансляції, для зручності орієнтації в записі[/color][/i]\n\n[b]Телеканал № 2 ([i]якщо є[/i]):[/b] [i][color=Green]назва телеканалу[/color][/i]\n[b]Дата та час ([i]включаючи повтори[/i]):[/b] [i][color=Green]дата та час трансляції, для зручності орієнтації в записі[/color][/spoiler]\n[/code]\n[/spoiler]\n[/spoiler]\n[b] [/b]\n[b]Спільні/схожі теми[/b]\n[list][*] [url=https://toloka.to/t74610]Команда поширення контенту [UA][/url]\n[*] [url=https://toloka.to/t6081]Замовлення запису з ТБ[/url]\n[*] [url=https://toloka.to/t70619]Набір у проект \"Відео Гуртом\"[/url]\n[*] [url=https://toloka.to/t36840]Запис відео з онлайн ТБ[/url]\n[*] [url=https://toloka.to/t72494]NEW2016! Набір у команду Гуртом![/url]\n[*] [url=https://toloka.to/t42277]Запис ТБ[/url]\n[*] [url=https://toloka.to/t31494][Запис з ТБ] Новорічні і різдвяні фільми і мультфільми 2012[/url]\n[*] [url=https://toloka.to/t19872]Щотижневий моніторинг ТБ: хф/звукові доріжки, які відсутні на Hurtom/ВІК[/url]\n[/list]');

-- --------------------------------------------------------

--
-- Структура таблиці `bb_privmsgs`
--

CREATE TABLE `bb_privmsgs` (
  `privmsgs_id` mediumint(8) UNSIGNED NOT NULL,
  `privmsgs_type` tinyint(4) NOT NULL DEFAULT 0,
  `privmsgs_subject` varchar(255) NOT NULL DEFAULT '0',
  `privmsgs_from_userid` mediumint(8) NOT NULL DEFAULT 0,
  `privmsgs_to_userid` mediumint(8) NOT NULL DEFAULT 0,
  `privmsgs_date` int(11) NOT NULL DEFAULT 0,
  `privmsgs_ip` varchar(42) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `bb_privmsgs_text`
--

CREATE TABLE `bb_privmsgs_text` (
  `privmsgs_text_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `privmsgs_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `bb_quota_limits`
--

CREATE TABLE `bb_quota_limits` (
  `quota_limit_id` mediumint(8) UNSIGNED NOT NULL,
  `quota_desc` varchar(20) NOT NULL DEFAULT '',
  `quota_limit` bigint(20) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `bb_quota_limits`
--

INSERT INTO `bb_quota_limits` (`quota_limit_id`, `quota_desc`, `quota_limit`) VALUES
(1, 'Low', 262144),
(2, 'Medium', 10485760),
(3, 'High', 15728640);

-- --------------------------------------------------------

--
-- Структура таблиці `bb_ranks`
--

CREATE TABLE `bb_ranks` (
  `rank_id` smallint(5) UNSIGNED NOT NULL,
  `rank_title` varchar(50) NOT NULL DEFAULT '',
  `rank_min` mediumint(8) NOT NULL DEFAULT 0,
  `rank_special` tinyint(1) NOT NULL DEFAULT 1,
  `rank_image` varchar(255) NOT NULL DEFAULT '',
  `rank_style` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `bb_ranks`
--

INSERT INTO `bb_ranks` (`rank_id`, `rank_title`, `rank_min`, `rank_special`, `rank_image`, `rank_style`) VALUES
(1, 'Адміністратор', -1, 1, 'styles/images/ranks/admin.png', 'colorAdmin');

-- --------------------------------------------------------

--
-- Структура таблиці `bb_search_rebuild`
--

CREATE TABLE `bb_search_rebuild` (
  `rebuild_session_id` mediumint(8) UNSIGNED NOT NULL,
  `start_post_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `end_post_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `start_time` int(11) NOT NULL DEFAULT 0,
  `end_time` int(11) NOT NULL DEFAULT 0,
  `last_cycle_time` int(11) NOT NULL DEFAULT 0,
  `session_time` int(11) NOT NULL DEFAULT 0,
  `session_posts` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `session_cycles` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `search_size` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `rebuild_session_status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `bb_search_results`
--

CREATE TABLE `bb_search_results` (
  `session_id` char(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_type` tinyint(4) NOT NULL DEFAULT 0,
  `search_id` varchar(12) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_time` int(11) NOT NULL DEFAULT 0,
  `search_settings` text NOT NULL,
  `search_array` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `bb_sessions`
--

CREATE TABLE `bb_sessions` (
  `session_id` char(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `session_user_id` mediumint(8) NOT NULL DEFAULT 0,
  `session_start` int(11) NOT NULL DEFAULT 0,
  `session_time` int(11) NOT NULL DEFAULT 0,
  `session_ip` char(42) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0',
  `session_logged_in` tinyint(1) NOT NULL DEFAULT 0,
  `session_admin` tinyint(2) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `bb_smilies`
--

CREATE TABLE `bb_smilies` (
  `smilies_id` smallint(5) UNSIGNED NOT NULL,
  `code` varchar(50) NOT NULL DEFAULT '',
  `smile_url` varchar(100) NOT NULL DEFAULT '',
  `emoticon` varchar(75) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `bb_smilies`
--

INSERT INTO `bb_smilies` (`smilies_id`, `code`, `smile_url`, `emoticon`) VALUES
(1, ':aa:', 'aa.gif', 'aa'),
(2, ':ab:', 'ab.gif', 'ab'),
(3, ':ac:', 'ac.gif', 'ac'),
(4, ':ae:', 'ae.gif', 'ae'),
(5, ':af:', 'af.gif', 'af'),
(6, ':ag:', 'ag.gif', 'ag'),
(7, ':ah:', 'ah.gif', 'ah'),
(8, ':ai:', 'ai.gif', 'ai'),
(9, ':aj:', 'aj.gif', 'aj'),
(10, ':ak:', 'ak.gif', 'ak'),
(11, ':al:', 'al.gif', 'al'),
(12, ':am:', 'am.gif', 'am'),
(13, ':an:', 'an.gif', 'an'),
(14, ':ao:', 'ao.gif', 'ao'),
(15, ':ap:', 'ap.gif', 'ap'),
(16, ':aq:', 'aq.gif', 'aq'),
(17, ':ar:', 'ar.gif', 'ar'),
(18, ':as:', 'as.gif', 'as'),
(19, ':at:', 'at.gif', 'at'),
(20, ':au:', 'au.gif', 'au'),
(21, ':av:', 'av.gif', 'av'),
(22, ':aw:', 'aw.gif', 'aw'),
(23, ':ax:', 'ax.gif', 'ax'),
(24, ':ay:', 'ay.gif', 'ay'),
(25, ':az:', 'az.gif', 'az'),
(26, ':ba:', 'ba.gif', 'ba'),
(27, ':bb:', 'bb.gif', 'bb'),
(28, ':bc:', 'bc.gif', 'bc'),
(29, ':bd:', 'bd.gif', 'bd'),
(30, ':be:', 'be.gif', 'be'),
(31, ':bf:', 'bf.gif', 'bf'),
(32, ':bg:', 'bg.gif', 'bg'),
(33, ':bh:', 'bh.gif', 'bh'),
(34, ':bi:', 'bi.gif', 'bi'),
(35, ':bj:', 'bj.gif', 'bj'),
(36, ':bk:', 'bk.gif', 'bk'),
(37, ':bl:', 'bl.gif', 'bl'),
(38, ':bm:', 'bm.gif', 'bm'),
(39, ':bn:', 'bn.gif', 'bn'),
(40, ':bo:', 'bo.gif', 'bo'),
(41, ':bp:', 'bp.gif', 'bp'),
(42, ':bq:', 'bq.gif', 'bq'),
(43, ':br:', 'br.gif', 'br'),
(44, ':bs:', 'bs.gif', 'bs'),
(45, ':bt:', 'bt.gif', 'bt'),
(46, ':bu:', 'bu.gif', 'bu'),
(47, ':bv:', 'bv.gif', 'bv'),
(48, ':bw:', 'bw.gif', 'bw'),
(49, ':bx:', 'bx.gif', 'bx'),
(50, ':by:', 'by.gif', 'by'),
(51, ':bz:', 'bz.gif', 'bz'),
(52, ':ca:', 'ca.gif', 'ca'),
(53, ':cb:', 'cb.gif', 'cb'),
(54, ':cc:', 'cc.gif', 'cc'),
(55, ':сd:', 'сd.gif', 'сd');

-- --------------------------------------------------------

--
-- Структура таблиці `bb_topic_tpl`
--

CREATE TABLE `bb_topic_tpl` (
  `tpl_id` smallint(6) NOT NULL,
  `tpl_name` varchar(60) NOT NULL DEFAULT '',
  `tpl_src_form` text NOT NULL,
  `tpl_src_title` text NOT NULL,
  `tpl_src_msg` text NOT NULL,
  `tpl_comment` text NOT NULL,
  `tpl_rules_post_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tpl_last_edit_tm` int(11) NOT NULL DEFAULT 0,
  `tpl_last_edit_by` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `bb_topics`
--

CREATE TABLE `bb_topics` (
  `topic_id` mediumint(8) UNSIGNED NOT NULL,
  `forum_id` smallint(8) UNSIGNED NOT NULL DEFAULT 0,
  `topic_title` varchar(250) NOT NULL DEFAULT '',
  `topic_poster` mediumint(8) NOT NULL DEFAULT 0,
  `topic_time` int(11) NOT NULL DEFAULT 0,
  `topic_views` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `topic_replies` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `topic_status` tinyint(3) NOT NULL DEFAULT 0,
  `topic_vote` tinyint(1) NOT NULL DEFAULT 0,
  `topic_type` tinyint(3) NOT NULL DEFAULT 0,
  `topic_first_post_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `topic_last_post_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `topic_moved_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `topic_attachment` tinyint(1) NOT NULL DEFAULT 0,
  `topic_dl_type` tinyint(1) NOT NULL DEFAULT 0,
  `topic_last_post_time` int(11) NOT NULL DEFAULT 0,
  `topic_show_first_post` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `bb_topics`
--

INSERT INTO `bb_topics` (`topic_id`, `forum_id`, `topic_title`, `topic_poster`, `topic_time`, `topic_views`, `topic_replies`, `topic_status`, `topic_vote`, `topic_type`, `topic_first_post_id`, `topic_last_post_id`, `topic_moved_id`, `topic_attachment`, `topic_dl_type`, `topic_last_post_time`, `topic_show_first_post`) VALUES
(1, 1, 'Бонуси за роздачу власних та непопулярних торрентів', 2, 0, 20, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0),
(2, 1, 'Модернізація толоки (тема оновлюється)', 2, 1497868665, 11, 0, 0, 0, 0, 3, 3, 0, 0, 0, 1497868665, 1),
(3, 3, 'Правила розділу &quot;Анонси релізів&quot;', 2, 1499088533, 2, 1, 0, 0, 2, 4, 5, 0, 0, 0, 1499088554, 0),
(4, 3, 'Красиво піти / Going in Style (2017) WEB-DL 720p Ukr/Eng | Sub Eng', 2, 1499089675, 3, 1, 0, 0, 0, 6, 7, 0, 0, 0, 1499089689, 0),
(5, 2, 'Навіщо потрібен рейтинг на торрент-трекері? (пояснення для новачків)', 2, 1499090454, 3, 0, 0, 0, 1, 8, 8, 0, 0, 0, 1499090454, 0),
(6, 32, 'Хочеш кіно українською? Замовляй! Чотирнадцятий тур! Голосування за документальні фільми', 2, 1499153976, 6, 0, 0, 1, 0, 9, 9, 0, 0, 0, 1499153976, 0),
(7, 4, 'Недобросовісні переклади книжок з російської та інших мов', 2, 1499156274, 0, 0, 0, 0, 0, 10, 10, 0, 0, 0, 1499156274, 0),
(8, 5, 'Футболки з символікою Гуртом', 2, 1499156519, 2, 0, 0, 0, 0, 11, 11, 0, 0, 0, 1499156519, 0),
(9, 6, 'Створити мануал для &quot;чайників&quot;', 2, 1499156727, 1, 0, 0, 0, 0, 12, 12, 0, 0, 0, 1499156727, 0),
(10, 7, '[Розшукуються] Втрачені дубляжі, на DVD, VHS та інших носіях', 2, 1499157438, 4, 0, 0, 0, 0, 13, 13, 0, 0, 0, 1499157438, 0),
(11, 8, 'Шукаю гуморески пана Дзюня з Не Журись!', 2, 1499346326, 1, 0, 0, 0, 0, 14, 14, 0, 0, 0, 1499346326, 0),
(12, 9, 'Допоможіть знайти такі програми..', 2, 1499346368, 1, 0, 0, 0, 0, 15, 15, 0, 0, 0, 1499346368, 0),
(13, 10, 'Пропоную ігри', 2, 1499346556, 1, 0, 0, 0, 0, 16, 16, 0, 0, 0, 1499346556, 0),
(14, 11, 'Перезаливання україномовного контенту з різних ресурсів', 2, 1499346679, 1, 0, 0, 0, 0, 17, 17, 0, 0, 0, 1499346679, 0),
(15, 12, 'Шукаю статтю', 2, 1499346743, 0, 0, 0, 0, 0, 18, 18, 0, 0, 0, 1499346743, 0),
(16, 13, 'FAQ по µTorrent', 2, 1499347326, 1, 0, 0, 0, 0, 19, 19, 0, 0, 0, 1499347326, 0),
(17, 14, 'Створення релізів h264 + mkv', 2, 1499347552, 2, 0, 0, 0, 0, 20, 20, 0, 0, 0, 1499347552, 0),
(18, 15, 'ЧАП для новачків з субтитрування', 2, 1499348155, 1, 0, 0, 0, 0, 21, 21, 0, 0, 0, 1499348155, 0),
(19, 16, 'Запис з Андроід ТВ. Проблеми з переном з HDD', 2, 1499348219, 0, 0, 0, 0, 0, 22, 22, 0, 0, 0, 1499348219, 0),
(20, 17, 'Створення DTS доріжки до фільму у форматі 5.1', 2, 1499348604, 1, 0, 0, 0, 0, 23, 23, 0, 0, 0, 1499348604, 0),
(21, 18, 'НОВИНКА_2018! Набір у команду Гуртом!', 2, 1499348831, 1, 0, 0, 0, 0, 24, 24, 0, 0, 0, 1499348831, 0),
(22, 19, 'Команда Підтримка та поширення', 2, 1499349716, 1, 0, 0, 0, 0, 25, 25, 0, 0, 0, 1499349716, 0),
(23, 20, 'Команда &quot;Запис з ТБ&quot;', 2, 1499349889, 2, 0, 0, 0, 0, 26, 26, 0, 0, 0, 1499349889, 0);

-- --------------------------------------------------------

--
-- Структура таблиці `bb_topics_watch`
--

CREATE TABLE `bb_topics_watch` (
  `topic_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` mediumint(8) NOT NULL DEFAULT 0,
  `notify_status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `bb_topics_watch`
--

INSERT INTO `bb_topics_watch` (`topic_id`, `user_id`, `notify_status`) VALUES
(1, 2, 1),
(2, 2, 1),
(3, 2, 1),
(4, 2, 1),
(5, 2, 1),
(6, 2, 1),
(7, 2, 1),
(8, 2, 1),
(9, 2, 1),
(10, 2, 1),
(11, 2, 1),
(12, 2, 1),
(13, 2, 1),
(14, 2, 1),
(15, 2, 1),
(16, 2, 1),
(17, 2, 1),
(18, 2, 1),
(19, 2, 1),
(20, 2, 1),
(21, 2, 1),
(22, 2, 1),
(23, 2, 1);

-- --------------------------------------------------------

--
-- Структура таблиці `bb_user_group`
--

CREATE TABLE `bb_user_group` (
  `group_id` mediumint(8) NOT NULL DEFAULT 0,
  `user_id` mediumint(8) NOT NULL DEFAULT 0,
  `user_pending` tinyint(1) NOT NULL DEFAULT 0,
  `user_time` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `bb_users`
--

CREATE TABLE `bb_users` (
  `user_id` mediumint(8) NOT NULL,
  `user_active` tinyint(1) NOT NULL DEFAULT 1,
  `username` varchar(25) NOT NULL DEFAULT '',
  `user_password` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_session_time` int(11) NOT NULL DEFAULT 0,
  `user_lastvisit` int(11) NOT NULL DEFAULT 0,
  `user_last_ip` char(42) NOT NULL DEFAULT '0',
  `user_regdate` int(11) NOT NULL DEFAULT 0,
  `user_reg_ip` char(42) NOT NULL DEFAULT '0',
  `user_level` tinyint(4) NOT NULL DEFAULT 0,
  `user_posts` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `user_timezone` decimal(5,2) NOT NULL DEFAULT 0.00,
  `user_lang` varchar(255) NOT NULL DEFAULT 'uk',
  `user_new_privmsg` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `user_unread_privmsg` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `user_last_privmsg` int(11) NOT NULL DEFAULT 0,
  `user_opt` int(11) NOT NULL DEFAULT 0,
  `user_rank` int(11) NOT NULL DEFAULT 0,
  `avatar_ext_id` tinyint(4) NOT NULL DEFAULT 0,
  `user_gender` tinyint(1) NOT NULL DEFAULT 0,
  `user_birthday` date NOT NULL DEFAULT '0000-00-00',
  `user_email` varchar(255) NOT NULL DEFAULT '',
  `user_skype` varchar(32) NOT NULL DEFAULT '',
  `user_twitter` varchar(15) NOT NULL DEFAULT '',
  `user_icq` varchar(15) NOT NULL DEFAULT '',
  `user_website` varchar(100) NOT NULL DEFAULT '',
  `user_from` varchar(100) NOT NULL DEFAULT '',
  `user_sig` text NOT NULL,
  `user_occ` varchar(100) NOT NULL DEFAULT '',
  `user_interests` varchar(255) NOT NULL DEFAULT '',
  `user_actkey` varchar(32) NOT NULL DEFAULT '',
  `user_newpasswd` varchar(32) NOT NULL DEFAULT '',
  `autologin_id` varchar(12) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_newest_pm_id` mediumint(8) NOT NULL DEFAULT 0,
  `user_points` float(16,2) NOT NULL DEFAULT 0.00,
  `tpl_name` varchar(255) NOT NULL DEFAULT 'default'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `bb_users`
--

INSERT INTO `bb_users` (`user_id`, `user_active`, `username`, `user_password`, `user_session_time`, `user_lastvisit`, `user_last_ip`, `user_regdate`, `user_reg_ip`, `user_level`, `user_posts`, `user_timezone`, `user_lang`, `user_new_privmsg`, `user_unread_privmsg`, `user_last_privmsg`, `user_opt`, `user_rank`, `avatar_ext_id`, `user_gender`, `user_birthday`, `user_email`, `user_skype`, `user_twitter`, `user_icq`, `user_website`, `user_from`, `user_sig`, `user_occ`, `user_interests`, `user_actkey`, `user_newpasswd`, `autologin_id`, `user_newest_pm_id`, `user_points`, `tpl_name`) VALUES
(-746, 0, 'bot', 'd41d8cd98f00b204e9800998ecf8427e', 0, 0, '0', 0, '0', 0, 0, 0.00, '', 0, 0, 0, 144, 0, 0, 0, '0000-00-00', 'bot@torrentpier.me', '', '', '', '', '', '', '', '', '', '', '', 0, 0.00, 'default'),
(-1, 0, 'Guest', 'd41d8cd98f00b204e9800998ecf8427e', 0, 0, '0', 0, '0', 0, 0, 0.00, '', 0, 0, 0, 0, 0, 0, 0, '0000-00-00', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0.00, 'default'),
(2, 1, 'admin', 'c3284d0f94606de1fd2af172aba15bf3', 1500254447, 1500104513, '2886860801', 0, '0', 1, 25, 3.00, '', 0, 0, 1499086198, 304, 1, 0, 0, '0000-00-00', 'admin@torrentpier.me', '', '', '', '', '', '', '', '', '', '', 'vHxP0quS2Yfu', 0, 0.00, 'default'),
(3, 1, 'BOHD@N', '216a7d506c7ba400586661406d343eda', 1497868779, 1497868779, '2886860801', 1497868751, '2886860801', 0, 0, 3.00, 'uk', 0, 0, 0, 33376, 0, 0, 0, '0000-00-00', 'bohdan009@gmail.com', '', '', '', '', '', '', '', '', '', '', 'yyy0CKX8NlVM', 0, 0.00, 'default');

-- --------------------------------------------------------

--
-- Структура таблиці `bb_words`
--

CREATE TABLE `bb_words` (
  `word_id` mediumint(8) UNSIGNED NOT NULL,
  `word` char(100) NOT NULL DEFAULT '',
  `replacement` char(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `buf_last_seeder`
--

CREATE TABLE `buf_last_seeder` (
  `topic_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `seeder_last_seen` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `buf_topic_view`
--

CREATE TABLE `buf_topic_view` (
  `topic_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `topic_views` mediumint(8) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Індекси збережених таблиць
--

--
-- Індекси таблиці `bb_attach_quota`
--
ALTER TABLE `bb_attach_quota`
  ADD KEY `quota_type` (`quota_type`);

--
-- Індекси таблиці `bb_attachments`
--
ALTER TABLE `bb_attachments`
  ADD PRIMARY KEY (`attach_id`,`post_id`);

--
-- Індекси таблиці `bb_attachments_config`
--
ALTER TABLE `bb_attachments_config`
  ADD PRIMARY KEY (`config_name`);

--
-- Індекси таблиці `bb_attachments_desc`
--
ALTER TABLE `bb_attachments_desc`
  ADD PRIMARY KEY (`attach_id`),
  ADD KEY `filetime` (`filetime`),
  ADD KEY `filesize` (`filesize`),
  ADD KEY `physical_filename` (`physical_filename`(10));

--
-- Індекси таблиці `bb_auth_access`
--
ALTER TABLE `bb_auth_access`
  ADD PRIMARY KEY (`group_id`,`forum_id`),
  ADD KEY `forum_id` (`forum_id`);

--
-- Індекси таблиці `bb_auth_access_snap`
--
ALTER TABLE `bb_auth_access_snap`
  ADD PRIMARY KEY (`user_id`,`forum_id`);

--
-- Індекси таблиці `bb_banlist`
--
ALTER TABLE `bb_banlist`
  ADD PRIMARY KEY (`ban_id`),
  ADD KEY `ban_ip_user_id` (`ban_ip`,`ban_userid`);

--
-- Індекси таблиці `bb_bt_dlstatus`
--
ALTER TABLE `bb_bt_dlstatus`
  ADD PRIMARY KEY (`user_id`,`topic_id`),
  ADD KEY `topic_id` (`topic_id`);

--
-- Індекси таблиці `bb_bt_dlstatus_snap`
--
ALTER TABLE `bb_bt_dlstatus_snap`
  ADD KEY `topic_id` (`topic_id`);

--
-- Індекси таблиці `bb_bt_last_torstat`
--
ALTER TABLE `bb_bt_last_torstat`
  ADD PRIMARY KEY (`topic_id`,`user_id`) USING BTREE;

--
-- Індекси таблиці `bb_bt_last_userstat`
--
ALTER TABLE `bb_bt_last_userstat`
  ADD PRIMARY KEY (`user_id`);

--
-- Індекси таблиці `bb_bt_tor_dl_stat`
--
ALTER TABLE `bb_bt_tor_dl_stat`
  ADD PRIMARY KEY (`topic_id`,`user_id`);

--
-- Індекси таблиці `bb_bt_torhelp`
--
ALTER TABLE `bb_bt_torhelp`
  ADD PRIMARY KEY (`user_id`);

--
-- Індекси таблиці `bb_bt_torrents`
--
ALTER TABLE `bb_bt_torrents`
  ADD PRIMARY KEY (`info_hash`),
  ADD UNIQUE KEY `post_id` (`post_id`),
  ADD UNIQUE KEY `topic_id` (`topic_id`),
  ADD UNIQUE KEY `attach_id` (`attach_id`),
  ADD KEY `reg_time` (`reg_time`),
  ADD KEY `forum_id` (`forum_id`),
  ADD KEY `poster_id` (`poster_id`);

--
-- Індекси таблиці `bb_bt_torstat`
--
ALTER TABLE `bb_bt_torstat`
  ADD PRIMARY KEY (`topic_id`,`user_id`);

--
-- Індекси таблиці `bb_bt_tracker`
--
ALTER TABLE `bb_bt_tracker`
  ADD PRIMARY KEY (`peer_hash`),
  ADD KEY `topic_id` (`topic_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Індекси таблиці `bb_bt_tracker_snap`
--
ALTER TABLE `bb_bt_tracker_snap`
  ADD PRIMARY KEY (`topic_id`);

--
-- Індекси таблиці `bb_bt_user_settings`
--
ALTER TABLE `bb_bt_user_settings`
  ADD PRIMARY KEY (`user_id`);

--
-- Індекси таблиці `bb_bt_users`
--
ALTER TABLE `bb_bt_users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `auth_key` (`auth_key`);

--
-- Індекси таблиці `bb_categories`
--
ALTER TABLE `bb_categories`
  ADD PRIMARY KEY (`cat_id`),
  ADD KEY `cat_order` (`cat_order`);

--
-- Індекси таблиці `bb_config`
--
ALTER TABLE `bb_config`
  ADD PRIMARY KEY (`config_name`);

--
-- Індекси таблиці `bb_cron`
--
ALTER TABLE `bb_cron`
  ADD PRIMARY KEY (`cron_id`),
  ADD UNIQUE KEY `title` (`cron_title`),
  ADD UNIQUE KEY `script` (`cron_script`);

--
-- Індекси таблиці `bb_disallow`
--
ALTER TABLE `bb_disallow`
  ADD PRIMARY KEY (`disallow_id`);

--
-- Індекси таблиці `bb_extension_groups`
--
ALTER TABLE `bb_extension_groups`
  ADD PRIMARY KEY (`group_id`);

--
-- Індекси таблиці `bb_extensions`
--
ALTER TABLE `bb_extensions`
  ADD PRIMARY KEY (`ext_id`);

--
-- Індекси таблиці `bb_forums`
--
ALTER TABLE `bb_forums`
  ADD PRIMARY KEY (`forum_id`),
  ADD KEY `forums_order` (`forum_order`),
  ADD KEY `cat_id` (`cat_id`),
  ADD KEY `forum_last_post_id` (`forum_last_post_id`),
  ADD KEY `forum_parent` (`forum_parent`);

--
-- Індекси таблиці `bb_groups`
--
ALTER TABLE `bb_groups`
  ADD PRIMARY KEY (`group_id`),
  ADD KEY `group_single_user` (`group_single_user`);

--
-- Індекси таблиці `bb_log`
--
ALTER TABLE `bb_log`
  ADD KEY `log_time` (`log_time`);
ALTER TABLE `bb_log` ADD FULLTEXT KEY `log_topic_title` (`log_topic_title`);

--
-- Індекси таблиці `bb_poll_users`
--
ALTER TABLE `bb_poll_users`
  ADD PRIMARY KEY (`topic_id`,`user_id`);

--
-- Індекси таблиці `bb_poll_votes`
--
ALTER TABLE `bb_poll_votes`
  ADD PRIMARY KEY (`topic_id`,`vote_id`);

--
-- Індекси таблиці `bb_posts`
--
ALTER TABLE `bb_posts`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `topic_id` (`topic_id`),
  ADD KEY `poster_id` (`poster_id`),
  ADD KEY `post_time` (`post_time`),
  ADD KEY `forum_id_post_time` (`forum_id`,`post_time`);

--
-- Індекси таблиці `bb_posts_html`
--
ALTER TABLE `bb_posts_html`
  ADD PRIMARY KEY (`post_id`);

--
-- Індекси таблиці `bb_posts_search`
--
ALTER TABLE `bb_posts_search`
  ADD PRIMARY KEY (`post_id`);
ALTER TABLE `bb_posts_search` ADD FULLTEXT KEY `search_words` (`search_words`);

--
-- Індекси таблиці `bb_posts_text`
--
ALTER TABLE `bb_posts_text`
  ADD PRIMARY KEY (`post_id`);

--
-- Індекси таблиці `bb_privmsgs`
--
ALTER TABLE `bb_privmsgs`
  ADD PRIMARY KEY (`privmsgs_id`),
  ADD KEY `privmsgs_from_userid` (`privmsgs_from_userid`),
  ADD KEY `privmsgs_to_userid` (`privmsgs_to_userid`);

--
-- Індекси таблиці `bb_privmsgs_text`
--
ALTER TABLE `bb_privmsgs_text`
  ADD PRIMARY KEY (`privmsgs_text_id`);

--
-- Індекси таблиці `bb_quota_limits`
--
ALTER TABLE `bb_quota_limits`
  ADD PRIMARY KEY (`quota_limit_id`);

--
-- Індекси таблиці `bb_ranks`
--
ALTER TABLE `bb_ranks`
  ADD PRIMARY KEY (`rank_id`);

--
-- Індекси таблиці `bb_search_rebuild`
--
ALTER TABLE `bb_search_rebuild`
  ADD PRIMARY KEY (`rebuild_session_id`);

--
-- Індекси таблиці `bb_search_results`
--
ALTER TABLE `bb_search_results`
  ADD PRIMARY KEY (`session_id`,`search_type`);

--
-- Індекси таблиці `bb_sessions`
--
ALTER TABLE `bb_sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Індекси таблиці `bb_smilies`
--
ALTER TABLE `bb_smilies`
  ADD PRIMARY KEY (`smilies_id`);

--
-- Індекси таблиці `bb_topic_tpl`
--
ALTER TABLE `bb_topic_tpl`
  ADD PRIMARY KEY (`tpl_id`),
  ADD UNIQUE KEY `tpl_name` (`tpl_name`);

--
-- Індекси таблиці `bb_topics`
--
ALTER TABLE `bb_topics`
  ADD PRIMARY KEY (`topic_id`),
  ADD KEY `forum_id` (`forum_id`),
  ADD KEY `topic_last_post_id` (`topic_last_post_id`),
  ADD KEY `topic_last_post_time` (`topic_last_post_time`);
ALTER TABLE `bb_topics` ADD FULLTEXT KEY `topic_title` (`topic_title`);

--
-- Індекси таблиці `bb_topics_watch`
--
ALTER TABLE `bb_topics_watch`
  ADD KEY `topic_id` (`topic_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `notify_status` (`notify_status`);

--
-- Індекси таблиці `bb_user_group`
--
ALTER TABLE `bb_user_group`
  ADD PRIMARY KEY (`group_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Індекси таблиці `bb_users`
--
ALTER TABLE `bb_users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `username` (`username`(10)),
  ADD KEY `user_email` (`user_email`(10)),
  ADD KEY `user_level` (`user_level`);

--
-- Індекси таблиці `bb_words`
--
ALTER TABLE `bb_words`
  ADD PRIMARY KEY (`word_id`);

--
-- Індекси таблиці `buf_last_seeder`
--
ALTER TABLE `buf_last_seeder`
  ADD PRIMARY KEY (`topic_id`);

--
-- Індекси таблиці `buf_topic_view`
--
ALTER TABLE `buf_topic_view`
  ADD PRIMARY KEY (`topic_id`);

--
-- AUTO_INCREMENT для збережених таблиць
--

--
-- AUTO_INCREMENT для таблиці `bb_attachments_desc`
--
ALTER TABLE `bb_attachments_desc`
  MODIFY `attach_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблиці `bb_banlist`
--
ALTER TABLE `bb_banlist`
  MODIFY `ban_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблиці `bb_categories`
--
ALTER TABLE `bb_categories`
  MODIFY `cat_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT для таблиці `bb_cron`
--
ALTER TABLE `bb_cron`
  MODIFY `cron_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT для таблиці `bb_disallow`
--
ALTER TABLE `bb_disallow`
  MODIFY `disallow_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблиці `bb_extension_groups`
--
ALTER TABLE `bb_extension_groups`
  MODIFY `group_id` mediumint(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблиці `bb_extensions`
--
ALTER TABLE `bb_extensions`
  MODIFY `ext_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT для таблиці `bb_forums`
--
ALTER TABLE `bb_forums`
  MODIFY `forum_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=180;
--
-- AUTO_INCREMENT для таблиці `bb_groups`
--
ALTER TABLE `bb_groups`
  MODIFY `group_id` mediumint(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблиці `bb_posts`
--
ALTER TABLE `bb_posts`
  MODIFY `post_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT для таблиці `bb_privmsgs`
--
ALTER TABLE `bb_privmsgs`
  MODIFY `privmsgs_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблиці `bb_quota_limits`
--
ALTER TABLE `bb_quota_limits`
  MODIFY `quota_limit_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблиці `bb_ranks`
--
ALTER TABLE `bb_ranks`
  MODIFY `rank_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблиці `bb_search_rebuild`
--
ALTER TABLE `bb_search_rebuild`
  MODIFY `rebuild_session_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблиці `bb_smilies`
--
ALTER TABLE `bb_smilies`
  MODIFY `smilies_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;
--
-- AUTO_INCREMENT для таблиці `bb_topic_tpl`
--
ALTER TABLE `bb_topic_tpl`
  MODIFY `tpl_id` smallint(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблиці `bb_topics`
--
ALTER TABLE `bb_topics`
  MODIFY `topic_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT для таблиці `bb_users`
--
ALTER TABLE `bb_users`
  MODIFY `user_id` mediumint(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблиці `bb_words`
--
ALTER TABLE `bb_words`
  MODIFY `word_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
