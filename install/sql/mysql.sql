SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toloka`
--

-- --------------------------------------------------------

--
-- Table structure for table `bb_attachments`
--

CREATE TABLE `bb_attachments` (
  `attach_id` mediumint(8) UNSIGNED NOT NULL,
  `post_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `user_id_1` mediumint(8) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bb_attachments_config`
--

CREATE TABLE `bb_attachments_config` (
  `config_name` varchar(255) NOT NULL DEFAULT '',
  `config_value` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bb_attachments_config`
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
-- Table structure for table `bb_attachments_desc`
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
-- Table structure for table `bb_attach_quota`
--

CREATE TABLE `bb_attach_quota` (
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `group_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `quota_type` smallint(2) NOT NULL DEFAULT 0,
  `quota_limit_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bb_auth_access`
--

CREATE TABLE `bb_auth_access` (
  `group_id` mediumint(8) NOT NULL DEFAULT 0,
  `forum_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `forum_perm` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bb_auth_access_snap`
--

CREATE TABLE `bb_auth_access_snap` (
  `user_id` mediumint(9) NOT NULL DEFAULT 0,
  `forum_id` smallint(6) NOT NULL DEFAULT 0,
  `forum_perm` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bb_banlist`
--

CREATE TABLE `bb_banlist` (
  `ban_id` mediumint(8) UNSIGNED NOT NULL,
  `ban_userid` mediumint(8) NOT NULL DEFAULT 0,
  `ban_ip` varchar(42) NOT NULL DEFAULT '0',
  `ban_email` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bb_bt_dlstatus`
--

CREATE TABLE `bb_bt_dlstatus` (
  `user_id` mediumint(9) NOT NULL DEFAULT 0,
  `topic_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `user_status` tinyint(1) NOT NULL DEFAULT 0,
  `last_modified_dlstatus` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bb_bt_dlstatus_snap`
--

CREATE TABLE `bb_bt_dlstatus_snap` (
  `topic_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `dl_status` tinyint(4) NOT NULL DEFAULT 0,
  `users_count` smallint(5) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bb_bt_last_torstat`
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
-- Table structure for table `bb_bt_last_userstat`
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
-- Table structure for table `bb_bt_torhelp`
--

CREATE TABLE `bb_bt_torhelp` (
  `user_id` mediumint(9) NOT NULL DEFAULT 0,
  `topic_id_csv` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bb_bt_torrents`
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
-- Table structure for table `bb_bt_torstat`
--

CREATE TABLE `bb_bt_torstat` (
  `topic_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` mediumint(9) NOT NULL DEFAULT 0,
  `last_modified_torstat` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `completed` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bb_bt_tor_dl_stat`
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
-- Table structure for table `bb_bt_tracker`
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
-- Table structure for table `bb_bt_tracker_snap`
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
-- Table structure for table `bb_bt_users`
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
-- Table structure for table `bb_bt_user_settings`
--

CREATE TABLE `bb_bt_user_settings` (
  `user_id` mediumint(9) NOT NULL DEFAULT 0,
  `tor_search_set` text NOT NULL,
  `last_modified` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bb_categories`
--

CREATE TABLE `bb_categories` (
  `cat_id` smallint(5) UNSIGNED NOT NULL,
  `cat_title` varchar(100) NOT NULL DEFAULT '',
  `cat_order` smallint(5) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bb_categories`
--

INSERT INTO `bb_categories` (`cat_id`, `cat_title`, `cat_order`) VALUES
(1, 'Відео', 10);

-- --------------------------------------------------------

--
-- Table structure for table `bb_config`
--

CREATE TABLE `bb_config` (
  `config_name` varchar(255) NOT NULL DEFAULT '',
  `config_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bb_config`
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
('cron_last_check', '0'),
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
('sitemap_time', '0'),
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
-- Table structure for table `bb_cron`
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
-- Dumping data for table `bb_cron`
--

INSERT INTO `bb_cron` (`cron_id`, `cron_active`, `cron_title`, `cron_script`, `schedule`, `run_day`, `run_time`, `run_order`, `last_run`, `next_run`, `run_interval`, `log_enabled`, `log_file`, `log_sql_queries`, `disable_board`, `run_counter`) VALUES
(1, 1, 'Attach maintenance', 'attach_maintenance.php', 'daily', '', '05:00:00', 40, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '00:00:00', 1, '', 0, 1, 0),
(2, 1, 'Board maintenance', 'board_maintenance.php', 'daily', '', '05:00:00', 40, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '00:00:00', 1, '', 0, 1, 0),
(3, 1, 'Prune forums', 'prune_forums.php', 'daily', '', '05:00:00', 50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '00:00:00', 1, '', 0, 1, 0),
(4, 1, 'Prune topic moved stubs', 'prune_topic_moved.php', 'daily', '', '05:00:00', 60, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '00:00:00', 1, '', 0, 1, 0),
(5, 1, 'Logs cleanup', 'clean_log.php', 'daily', '', '05:00:00', 70, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '00:00:00', 1, '', 0, 1, 0),
(6, 1, 'Tracker maintenance', 'tr_maintenance.php', 'daily', '', '05:00:00', 90, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '00:00:00', 1, '', 0, 1, 0),
(7, 1, 'Clean dlstat', 'clean_dlstat.php', 'daily', '', '05:00:00', 100, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '00:00:00', 1, '', 0, 1, 0),
(8, 1, 'Prune inactive users', 'prune_inactive_users.php', 'daily', '', '05:00:00', 110, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '00:00:00', 1, '', 0, 1, 0),
(9, 1, 'Sessions cleanup', 'sessions_cleanup.php', 'interval', '', '00:00:00', 255, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '00:03:00', 0, '', 0, 0, 0),
(10, 1, 'DS update cat_forums', 'ds_update_cat_forums.php', 'interval', '', '00:00:00', 255, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '00:05:00', 0, '', 0, 0, 0),
(11, 1, 'DS update stats', 'ds_update_stats.php', 'interval', '', '00:00:00', 255, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '00:10:00', 0, '', 0, 0, 0),
(12, 1, 'Flash topic view', 'flash_topic_view.php', 'interval', '', '00:00:00', 255, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '00:10:00', 0, '', 0, 0, 0),
(13, 1, 'Clean search results', 'clean_search_results.php', 'interval', '', '00:00:00', 255, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '00:10:00', 0, '', 0, 0, 0),
(14, 1, 'Tracker cleanup and dlstat', 'tr_cleanup_and_dlstat.php', 'interval', '', '00:00:00', 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '00:15:00', 0, '', 0, 0, 0),
(15, 1, 'Accrual seedbonus', 'tr_seed_bonus.php', 'interval', '', '00:00:00', 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '00:15:00', 0, '', 0, 0, 0),
(16, 1, 'Make tracker snapshot', 'tr_make_snapshot.php', 'interval', '', '00:00:00', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '00:10:00', 0, '', 0, 0, 0),
(17, 1, 'Seeder last seen', 'tr_update_seeder_last_seen.php', 'interval', '', '00:00:00', 255, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '01:00:00', 0, '', 0, 0, 0),
(18, 1, 'Tracker dl-complete count', 'tr_complete_count.php', 'interval', '', '00:00:00', 255, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '06:00:00', 0, '', 0, 0, 0),
(19, 1, 'Cache garbage collector', 'cache_gc.php', 'interval', '', '00:00:00', 255, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '00:05:00', 0, '', 0, 0, 0),
(20, 1, 'Sitemap update', 'sitemap.php', 'daily', '', '06:00:00', 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '00:00:00', 0, '', 0, 0, 0),
(21, 1, 'Update forums atom', 'update_forums_atom.php', 'interval', '', '00:00:00', 255, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '00:15:00', 0, '', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `bb_disallow`
--

CREATE TABLE `bb_disallow` (
  `disallow_id` mediumint(8) UNSIGNED NOT NULL,
  `disallow_username` varchar(25) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bb_extensions`
--

CREATE TABLE `bb_extensions` (
  `ext_id` mediumint(8) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `extension` varchar(100) NOT NULL DEFAULT '',
  `comment` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bb_extensions`
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
-- Table structure for table `bb_extension_groups`
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
-- Dumping data for table `bb_extension_groups`
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
-- Table structure for table `bb_forums`
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
-- Dumping data for table `bb_forums`
--

INSERT INTO `bb_forums` (`forum_id`, `cat_id`, `forum_name`, `forum_desc`, `forum_status`, `forum_order`, `forum_posts`, `forum_topics`, `forum_last_post_id`, `forum_tpl_id`, `prune_days`, `auth_view`, `auth_read`, `auth_post`, `auth_reply`, `auth_edit`, `auth_delete`, `auth_sticky`, `auth_announce`, `auth_vote`, `auth_pollcreate`, `auth_attachments`, `auth_download`, `allow_reg_tracker`, `allow_porno_topic`, `self_moderated`, `forum_parent`, `show_on_index`, `forum_display_sort`, `forum_display_order`) VALUES
(1, 1, 'Фільми', '', 0, 10, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 1, 0, 1, 0, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `bb_groups`
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
-- Table structure for table `bb_log`
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
-- Table structure for table `bb_poll_users`
--

CREATE TABLE `bb_poll_users` (
  `topic_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `vote_ip` varchar(42) NOT NULL DEFAULT '0',
  `vote_dt` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bb_poll_votes`
--

CREATE TABLE `bb_poll_votes` (
  `topic_id` int(10) UNSIGNED NOT NULL,
  `vote_id` tinyint(4) UNSIGNED NOT NULL,
  `vote_text` varchar(255) NOT NULL,
  `vote_result` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bb_posts`
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
-- Dumping data for table `bb_posts`
--

INSERT INTO `bb_posts` (`post_id`, `topic_id`, `forum_id`, `poster_id`, `post_time`, `poster_ip`, `poster_rg_id`, `attach_rg_sig`, `post_username`, `post_edit_time`, `post_edit_count`, `post_attachment`, `user_post`, `mc_comment`, `mc_type`, `mc_user_id`) VALUES
(1, 1, 1, 2, 0, '0', 0, 0, '', 0, 0, 0, 1, '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `bb_posts_html`
--

CREATE TABLE `bb_posts_html` (
  `post_id` mediumint(9) NOT NULL DEFAULT 0,
  `post_html_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `post_html` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bb_posts_html`
--

INSERT INTO `bb_posts_html` (`post_id`, `post_html_time`, `post_html`) VALUES
(1, '0000-00-00 00:00:00', 'Перше повідомлення');

-- --------------------------------------------------------

--
-- Table structure for table `bb_posts_search`
--

CREATE TABLE `bb_posts_search` (
  `post_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `search_words` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bb_posts_search`
--

INSERT INTO `bb_posts_search` (`post_id`, `search_words`) VALUES
(1, 'тестова\nтема\nперше\nповідомлення');

-- --------------------------------------------------------

--
-- Table structure for table `bb_posts_text`
--

CREATE TABLE `bb_posts_text` (
  `post_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `post_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bb_posts_text`
--

INSERT INTO `bb_posts_text` (`post_id`, `post_text`) VALUES
(1, 'Перше повідомлення');

-- --------------------------------------------------------

--
-- Table structure for table `bb_privmsgs`
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
-- Table structure for table `bb_privmsgs_text`
--

CREATE TABLE `bb_privmsgs_text` (
  `privmsgs_text_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `privmsgs_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bb_quota_limits`
--

CREATE TABLE `bb_quota_limits` (
  `quota_limit_id` mediumint(8) UNSIGNED NOT NULL,
  `quota_desc` varchar(20) NOT NULL DEFAULT '',
  `quota_limit` bigint(20) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bb_quota_limits`
--

INSERT INTO `bb_quota_limits` (`quota_limit_id`, `quota_desc`, `quota_limit`) VALUES
(1, 'Low', 262144),
(2, 'Medium', 10485760),
(3, 'High', 15728640);

-- --------------------------------------------------------

--
-- Table structure for table `bb_ranks`
--

CREATE TABLE `bb_ranks` (
  `rank_id` smallint(5) UNSIGNED NOT NULL,
  `rank_title` varchar(50) NOT NULL DEFAULT '',
  `rank_image` varchar(255) NOT NULL DEFAULT '',
  `rank_style` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bb_ranks`
--

INSERT INTO `bb_ranks` (`rank_id`, `rank_title`, `rank_image`, `rank_style`) VALUES
(1, 'Адміністратор', 'styles/images/ranks/admin.png', 'colorAdmin');

-- --------------------------------------------------------

--
-- Table structure for table `bb_search_rebuild`
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
-- Table structure for table `bb_search_results`
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
-- Table structure for table `bb_sessions`
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
-- Table structure for table `bb_smilies`
--

CREATE TABLE `bb_smilies` (
  `smilies_id` smallint(5) UNSIGNED NOT NULL,
  `code` varchar(50) NOT NULL DEFAULT '',
  `smile_url` varchar(100) NOT NULL DEFAULT '',
  `emoticon` varchar(75) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bb_smilies`
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
-- Table structure for table `bb_topics`
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
-- Dumping data for table `bb_topics`
--

INSERT INTO `bb_topics` (`topic_id`, `forum_id`, `topic_title`, `topic_poster`, `topic_time`, `topic_views`, `topic_replies`, `topic_status`, `topic_vote`, `topic_type`, `topic_first_post_id`, `topic_last_post_id`, `topic_moved_id`, `topic_attachment`, `topic_dl_type`, `topic_last_post_time`, `topic_show_first_post`) VALUES
(1, 1, 'Тестова тема', 2, 0, 14, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `bb_topics_watch`
--

CREATE TABLE `bb_topics_watch` (
  `topic_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` mediumint(8) NOT NULL DEFAULT 0,
  `notify_status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bb_topics_watch`
--

INSERT INTO `bb_topics_watch` (`topic_id`, `user_id`, `notify_status`) VALUES
(1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `bb_topic_tpl`
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
-- Table structure for table `bb_users`
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
-- Dumping data for table `bb_users`
--

INSERT INTO `bb_users` (`user_id`, `user_active`, `username`, `user_password`, `user_session_time`, `user_lastvisit`, `user_last_ip`, `user_regdate`, `user_reg_ip`, `user_level`, `user_posts`, `user_timezone`, `user_lang`, `user_new_privmsg`, `user_unread_privmsg`, `user_last_privmsg`, `user_opt`, `user_rank`, `avatar_ext_id`, `user_gender`, `user_birthday`, `user_email`, `user_skype`, `user_twitter`, `user_icq`, `user_website`, `user_from`, `user_sig`, `user_occ`, `user_interests`, `user_actkey`, `user_newpasswd`, `autologin_id`, `user_newest_pm_id`, `user_points`, `tpl_name`) VALUES
(-746, 0, 'bot', 'd41d8cd98f00b204e9800998ecf8427e', 0, 0, '0', 0, '0', 0, 0, 0.00, '', 0, 0, 0, 144, 0, 0, 0, '0000-00-00', 'bot@torrentpier.me', '', '', '', '', '', '', '', '', '', '', '', 0, 0.00, 'default'),
(-1, 0, 'Guest', 'd41d8cd98f00b204e9800998ecf8427e', 0, 0, '0', 0, '0', 0, 0, 0.00, '', 0, 0, 0, 0, 0, 0, 0, '0000-00-00', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0.00, 'default'),
(2, 1, 'admin', 'c3284d0f94606de1fd2af172aba15bf3', 0, 0, 'c0a86301', 0, '0', 1, 1, 2.00, '', 0, 0, 0, 304, 1, 0, 0, '0000-00-00', 'admin@torrentpier.me', '', '', '', '', '', '', '', '', '', '', 'XCbkm1SmP1GB', 0, 0.00, 'default'),
(NULL, 0, 'User01', '$2a$12$QHSgl5BDymtAVqNucI2wJ.enbT3P.F/rTnMKvXAo2t10WWn70in8O', 0, 0, '0', 0, '0', 0, 0, 0.00, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0.00, 'default'),
(NULL, 0, 'User02', '$2a$12$CqzRldiX1daywy0/Jra2sew1RqGTVx741yBGZoJB0oEMYnnt649EG', 0, 0, '0', 0, '0', 0, 0, 0.00, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0.00, 'default'),
(NULL, 0, 'User03', '$2a$12$.w7g8HqsVRBZGpt59ftYGO7QQPlM7YF8PM5lbTAUjC6MjyqHcoMn.', 0, 0, '0', 0, '0', 0, 0, 0.00, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0.00, 'default'),
(NULL, 0, 'User04', '$2a$12$x778X33Y2yizpWkObJ6bH.EYbA1Xlwn6ZdorecCW7vtu3WIwiyCOa', 0, 0, '0', 0, '0', 0, 0, 0.00, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0.00, 'default'),
(NULL, 0, 'User05', '$2a$12$ZcZ9Usi9YqnlcnmK7QKfzOjkuG6LGEOENa.mLT6xcnDgKpaPPhhbu', 0, 0, '0', 0, '0', 0, 0, 0.00, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0.00, 'default'),
(NULL, 0, 'User06', '$2a$12$8GEi2RmB/nUxKZi06iXOduT5Jtfz1PxVf/cEvS6jKcKvf.lFSVe4e', 0, 0, '0', 0, '0', 0, 0, 0.00, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0.00, 'default'),
(NULL, 0, 'User07', '$2a$12$WX5w2zXz/yV8I8MGI4I.gOz0AKF5Y28zb6OjrU6K9MVGHgX2.Vk7u', 0, 0, '0', 0, '0', 0, 0, 0.00, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0.00, 'default'),
(NULL, 0, 'User08', '$2a$12$rQ/C0XGIgwy49K/N9WObb.jBGoelhZz.6czojklb64LTfD.qA9Efe', 0, 0, '0', 0, '0', 0, 0, 0.00, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0.00, 'default'),
(NULL, 0, 'User09', '$2a$12$8.Qsqmzek/yqEcyKr9DwNO91YopFjn0NA0E4QZJwkSmmU/vek1KYS', 0, 0, '0', 0, '0', 0, 0, 0.00, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0.00, 'default'),
(NULL, 0, 'User10', '$2a$12$3/.CA3rVEj9UGTOg52pP1uctz5XQpzBX4STqhvA6oShtyuAqeAPnK', 0, 0, '0', 0, '0', 0, 0, 0.00, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0.00, 'default'),
(NULL, 0, 'User11', '$2a$12$iV4e5r5Pwg4RVW5vV6vb4.eJS7e8mQe.Fx8xBFzB52iSDLUnKSTee', 0, 0, '0', 0, '0', 0, 0, 0.00, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0.00, 'default');

-- --------------------------------------------------------

--
-- Table structure for table `bb_user_group`
--

CREATE TABLE `bb_user_group` (
  `group_id` mediumint(8) NOT NULL DEFAULT 0,
  `user_id` mediumint(8) NOT NULL DEFAULT 0,
  `user_pending` tinyint(1) NOT NULL DEFAULT 0,
  `user_time` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bb_words`
--

CREATE TABLE `bb_words` (
  `word_id` mediumint(8) UNSIGNED NOT NULL,
  `word` char(100) NOT NULL DEFAULT '',
  `replacement` char(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `buf_last_seeder`
--

CREATE TABLE `buf_last_seeder` (
  `topic_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `seeder_last_seen` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `buf_topic_view`
--

CREATE TABLE `buf_topic_view` (
  `topic_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `topic_views` mediumint(8) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `buf_topic_view`
--

INSERT INTO `buf_topic_view` (`topic_id`, `topic_views`) VALUES
(1, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bb_attachments`
--
ALTER TABLE `bb_attachments`
  ADD PRIMARY KEY (`attach_id`,`post_id`);

--
-- Indexes for table `bb_attachments_config`
--
ALTER TABLE `bb_attachments_config`
  ADD PRIMARY KEY (`config_name`);

--
-- Indexes for table `bb_attachments_desc`
--
ALTER TABLE `bb_attachments_desc`
  ADD PRIMARY KEY (`attach_id`),
  ADD KEY `filetime` (`filetime`),
  ADD KEY `filesize` (`filesize`),
  ADD KEY `physical_filename` (`physical_filename`(10));

--
-- Indexes for table `bb_attach_quota`
--
ALTER TABLE `bb_attach_quota`
  ADD KEY `quota_type` (`quota_type`);

--
-- Indexes for table `bb_auth_access`
--
ALTER TABLE `bb_auth_access`
  ADD PRIMARY KEY (`group_id`,`forum_id`),
  ADD KEY `forum_id` (`forum_id`);

--
-- Indexes for table `bb_auth_access_snap`
--
ALTER TABLE `bb_auth_access_snap`
  ADD PRIMARY KEY (`user_id`,`forum_id`);

--
-- Indexes for table `bb_banlist`
--
ALTER TABLE `bb_banlist`
  ADD PRIMARY KEY (`ban_id`),
  ADD KEY `ban_ip_user_id` (`ban_ip`,`ban_userid`);

--
-- Indexes for table `bb_bt_dlstatus`
--
ALTER TABLE `bb_bt_dlstatus`
  ADD PRIMARY KEY (`user_id`,`topic_id`),
  ADD KEY `topic_id` (`topic_id`);

--
-- Indexes for table `bb_bt_dlstatus_snap`
--
ALTER TABLE `bb_bt_dlstatus_snap`
  ADD KEY `topic_id` (`topic_id`);

--
-- Indexes for table `bb_bt_last_torstat`
--
ALTER TABLE `bb_bt_last_torstat`
  ADD PRIMARY KEY (`topic_id`,`user_id`) USING BTREE;

--
-- Indexes for table `bb_bt_last_userstat`
--
ALTER TABLE `bb_bt_last_userstat`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `bb_bt_torhelp`
--
ALTER TABLE `bb_bt_torhelp`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `bb_bt_torrents`
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
-- Indexes for table `bb_bt_torstat`
--
ALTER TABLE `bb_bt_torstat`
  ADD PRIMARY KEY (`topic_id`,`user_id`);

--
-- Indexes for table `bb_bt_tor_dl_stat`
--
ALTER TABLE `bb_bt_tor_dl_stat`
  ADD PRIMARY KEY (`topic_id`,`user_id`);

--
-- Indexes for table `bb_bt_tracker`
--
ALTER TABLE `bb_bt_tracker`
  ADD PRIMARY KEY (`peer_hash`),
  ADD KEY `topic_id` (`topic_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `bb_bt_tracker_snap`
--
ALTER TABLE `bb_bt_tracker_snap`
  ADD PRIMARY KEY (`topic_id`);

--
-- Indexes for table `bb_bt_users`
--
ALTER TABLE `bb_bt_users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `auth_key` (`auth_key`);

--
-- Indexes for table `bb_bt_user_settings`
--
ALTER TABLE `bb_bt_user_settings`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `bb_categories`
--
ALTER TABLE `bb_categories`
  ADD PRIMARY KEY (`cat_id`),
  ADD KEY `cat_order` (`cat_order`);

--
-- Indexes for table `bb_config`
--
ALTER TABLE `bb_config`
  ADD PRIMARY KEY (`config_name`);

--
-- Indexes for table `bb_cron`
--
ALTER TABLE `bb_cron`
  ADD PRIMARY KEY (`cron_id`),
  ADD UNIQUE KEY `title` (`cron_title`),
  ADD UNIQUE KEY `script` (`cron_script`);

--
-- Indexes for table `bb_disallow`
--
ALTER TABLE `bb_disallow`
  ADD PRIMARY KEY (`disallow_id`);

--
-- Indexes for table `bb_extensions`
--
ALTER TABLE `bb_extensions`
  ADD PRIMARY KEY (`ext_id`);

--
-- Indexes for table `bb_extension_groups`
--
ALTER TABLE `bb_extension_groups`
  ADD PRIMARY KEY (`group_id`);

--
-- Indexes for table `bb_forums`
--
ALTER TABLE `bb_forums`
  ADD PRIMARY KEY (`forum_id`),
  ADD KEY `forums_order` (`forum_order`),
  ADD KEY `cat_id` (`cat_id`),
  ADD KEY `forum_last_post_id` (`forum_last_post_id`),
  ADD KEY `forum_parent` (`forum_parent`);

--
-- Indexes for table `bb_groups`
--
ALTER TABLE `bb_groups`
  ADD PRIMARY KEY (`group_id`),
  ADD KEY `group_single_user` (`group_single_user`);

--
-- Indexes for table `bb_log`
--
ALTER TABLE `bb_log`
  ADD KEY `log_time` (`log_time`);
ALTER TABLE `bb_log` ADD FULLTEXT KEY `log_topic_title` (`log_topic_title`);

--
-- Indexes for table `bb_poll_users`
--
ALTER TABLE `bb_poll_users`
  ADD PRIMARY KEY (`topic_id`,`user_id`);

--
-- Indexes for table `bb_poll_votes`
--
ALTER TABLE `bb_poll_votes`
  ADD PRIMARY KEY (`topic_id`,`vote_id`);

--
-- Indexes for table `bb_posts`
--
ALTER TABLE `bb_posts`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `topic_id` (`topic_id`),
  ADD KEY `poster_id` (`poster_id`),
  ADD KEY `post_time` (`post_time`),
  ADD KEY `forum_id_post_time` (`forum_id`,`post_time`);

--
-- Indexes for table `bb_posts_html`
--
ALTER TABLE `bb_posts_html`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `bb_posts_search`
--
ALTER TABLE `bb_posts_search`
  ADD PRIMARY KEY (`post_id`);
ALTER TABLE `bb_posts_search` ADD FULLTEXT KEY `search_words` (`search_words`);

--
-- Indexes for table `bb_posts_text`
--
ALTER TABLE `bb_posts_text`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `bb_privmsgs`
--
ALTER TABLE `bb_privmsgs`
  ADD PRIMARY KEY (`privmsgs_id`),
  ADD KEY `privmsgs_from_userid` (`privmsgs_from_userid`),
  ADD KEY `privmsgs_to_userid` (`privmsgs_to_userid`);

--
-- Indexes for table `bb_privmsgs_text`
--
ALTER TABLE `bb_privmsgs_text`
  ADD PRIMARY KEY (`privmsgs_text_id`);

--
-- Indexes for table `bb_quota_limits`
--
ALTER TABLE `bb_quota_limits`
  ADD PRIMARY KEY (`quota_limit_id`);

--
-- Indexes for table `bb_ranks`
--
ALTER TABLE `bb_ranks`
  ADD PRIMARY KEY (`rank_id`);

--
-- Indexes for table `bb_search_rebuild`
--
ALTER TABLE `bb_search_rebuild`
  ADD PRIMARY KEY (`rebuild_session_id`);

--
-- Indexes for table `bb_search_results`
--
ALTER TABLE `bb_search_results`
  ADD PRIMARY KEY (`session_id`,`search_type`);

--
-- Indexes for table `bb_sessions`
--
ALTER TABLE `bb_sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Indexes for table `bb_smilies`
--
ALTER TABLE `bb_smilies`
  ADD PRIMARY KEY (`smilies_id`);

--
-- Indexes for table `bb_topics`
--
ALTER TABLE `bb_topics`
  ADD PRIMARY KEY (`topic_id`),
  ADD KEY `forum_id` (`forum_id`),
  ADD KEY `topic_last_post_id` (`topic_last_post_id`),
  ADD KEY `topic_last_post_time` (`topic_last_post_time`);
ALTER TABLE `bb_topics` ADD FULLTEXT KEY `topic_title` (`topic_title`);

--
-- Indexes for table `bb_topics_watch`
--
ALTER TABLE `bb_topics_watch`
  ADD KEY `topic_id` (`topic_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `notify_status` (`notify_status`);

--
-- Indexes for table `bb_topic_tpl`
--
ALTER TABLE `bb_topic_tpl`
  ADD PRIMARY KEY (`tpl_id`),
  ADD UNIQUE KEY `tpl_name` (`tpl_name`);

--
-- Indexes for table `bb_users`
--
ALTER TABLE `bb_users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `username` (`username`(10)),
  ADD KEY `user_email` (`user_email`(10)),
  ADD KEY `user_level` (`user_level`);

--
-- Indexes for table `bb_user_group`
--
ALTER TABLE `bb_user_group`
  ADD PRIMARY KEY (`group_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `bb_words`
--
ALTER TABLE `bb_words`
  ADD PRIMARY KEY (`word_id`);

--
-- Indexes for table `buf_last_seeder`
--
ALTER TABLE `buf_last_seeder`
  ADD PRIMARY KEY (`topic_id`);

--
-- Indexes for table `buf_topic_view`
--
ALTER TABLE `buf_topic_view`
  ADD PRIMARY KEY (`topic_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bb_attachments_desc`
--
ALTER TABLE `bb_attachments_desc`
  MODIFY `attach_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bb_banlist`
--
ALTER TABLE `bb_banlist`
  MODIFY `ban_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bb_categories`
--
ALTER TABLE `bb_categories`
  MODIFY `cat_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `bb_cron`
--
ALTER TABLE `bb_cron`
  MODIFY `cron_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `bb_disallow`
--
ALTER TABLE `bb_disallow`
  MODIFY `disallow_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bb_extensions`
--
ALTER TABLE `bb_extensions`
  MODIFY `ext_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `bb_extension_groups`
--
ALTER TABLE `bb_extension_groups`
  MODIFY `group_id` mediumint(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `bb_forums`
--
ALTER TABLE `bb_forums`
  MODIFY `forum_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `bb_groups`
--
ALTER TABLE `bb_groups`
  MODIFY `group_id` mediumint(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bb_posts`
--
ALTER TABLE `bb_posts`
  MODIFY `post_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `bb_privmsgs`
--
ALTER TABLE `bb_privmsgs`
  MODIFY `privmsgs_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bb_quota_limits`
--
ALTER TABLE `bb_quota_limits`
  MODIFY `quota_limit_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `bb_ranks`
--
ALTER TABLE `bb_ranks`
  MODIFY `rank_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `bb_search_rebuild`
--
ALTER TABLE `bb_search_rebuild`
  MODIFY `rebuild_session_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bb_smilies`
--
ALTER TABLE `bb_smilies`
  MODIFY `smilies_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;
--
-- AUTO_INCREMENT for table `bb_topics`
--
ALTER TABLE `bb_topics`
  MODIFY `topic_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `bb_topic_tpl`
--
ALTER TABLE `bb_topic_tpl`
  MODIFY `tpl_id` smallint(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bb_users`
--
ALTER TABLE `bb_users`
  MODIFY `user_id` mediumint(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `bb_words`
--
ALTER TABLE `bb_words`
  MODIFY `word_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
