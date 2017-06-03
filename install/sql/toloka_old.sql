--
-- Table structure for table `bb_attach_quota`
--

DROP TABLE IF EXISTS `bb_attach_quota`;
CREATE TABLE `bb_attach_quota` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `group_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `quota_type` smallint(2) NOT NULL DEFAULT '0',
  `quota_limit_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  KEY `quota_type` (`quota_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `bb_attachments` ***
--

DROP TABLE IF EXISTS `bb_attachments`;
CREATE TABLE `bb_attachments` (
  `attach_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `post_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `privmsgs_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id_1` mediumint(8) NOT NULL DEFAULT '0',
  `user_id_2` mediumint(8) NOT NULL DEFAULT '0',
  KEY `attach_id_post_id` (`attach_id`,`post_id`),
  KEY `attach_id_privmsgs_id` (`attach_id`,`privmsgs_id`),
  KEY `post_id` (`post_id`),
  KEY `privmsgs_id` (`privmsgs_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `bb_attachments_config`
--

DROP TABLE IF EXISTS `bb_attachments_config`;
CREATE TABLE `bb_attachments_config` (
  `config_name` varchar(255) NOT NULL DEFAULT '',
  `config_value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`config_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `bb_attachments_desc` ***
--

DROP TABLE IF EXISTS `bb_attachments_desc`;
CREATE TABLE `bb_attachments_desc` (
  `attach_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `physical_filename` varchar(255) NOT NULL DEFAULT '',
  `real_filename` varchar(255) DEFAULT NULL,
  `download_count` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `comment` varchar(255) DEFAULT NULL,
  `extension` varchar(100) DEFAULT NULL,
  `mimetype` varchar(100) DEFAULT NULL,
  `filesize` int(20) NOT NULL DEFAULT '0',
  `filetime` int(11) NOT NULL DEFAULT '0',
  `thumbnail` tinyint(1) NOT NULL DEFAULT '0',
  `tracker_status` tinyint(1) NOT NULL DEFAULT '0',
  `thanks` mediumint(8) NOT NULL DEFAULT '0',
  `rating_sum` int(11) NOT NULL DEFAULT '0',
  `rating_count` mediumint(8) NOT NULL DEFAULT '0',
  `force_private` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`attach_id`),
  KEY `filetime` (`filetime`),
  KEY `physical_filename` (`physical_filename`(10)),
  KEY `filesize` (`filesize`)
) ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

--
-- Table structure for table `bb_attachments_rating` ***
--

DROP TABLE IF EXISTS `bb_attachments_rating`;
CREATE TABLE `bb_attachments_rating` (
  `attach_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(9) NOT NULL DEFAULT '0',
  `thanked` tinyint(1) NOT NULL DEFAULT '0',
  `rating` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`attach_id`,`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `bb_auth_access` ***
--

DROP TABLE IF EXISTS `bb_auth_access`;
CREATE TABLE `bb_auth_access` (
  `group_id` mediumint(8) NOT NULL DEFAULT '0',
  `forum_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `auth_view` tinyint(1) NOT NULL DEFAULT '0',
  `auth_read` tinyint(1) NOT NULL DEFAULT '0',
  `auth_post` tinyint(1) NOT NULL DEFAULT '0',
  `auth_reply` tinyint(1) NOT NULL DEFAULT '0',
  `auth_edit` tinyint(1) NOT NULL DEFAULT '0',
  `auth_delete` tinyint(1) NOT NULL DEFAULT '0',
  `auth_sticky` tinyint(1) NOT NULL DEFAULT '0',
  `auth_announce` tinyint(1) NOT NULL DEFAULT '0',
  `auth_vote` tinyint(1) NOT NULL DEFAULT '0',
  `auth_pollcreate` tinyint(1) NOT NULL DEFAULT '0',
  `auth_attachments` tinyint(1) NOT NULL DEFAULT '0',
  `auth_mod` tinyint(1) NOT NULL DEFAULT '0',
  `auth_download` tinyint(1) NOT NULL DEFAULT '0',
  KEY `group_id` (`group_id`),
  KEY `forum_id` (`forum_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `bb_banlist`
--

DROP TABLE IF EXISTS `bb_banlist`;
CREATE TABLE `bb_banlist` (
  `ban_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `ban_userid` mediumint(8) NOT NULL DEFAULT '0',
  `ban_ip` varchar(8) NOT NULL DEFAULT '',
  `ban_email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ban_id`),
  KEY `ban_ip_user_id` (`ban_ip`,`ban_userid`)
) ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

--
-- Table structure for table `bb_bt_config`
--

DROP TABLE IF EXISTS `bb_bt_config`;
CREATE TABLE `bb_bt_config` (
  `config_name` varchar(255) NOT NULL DEFAULT '',
  `config_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`config_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `bb_bt_search_results`
--

DROP TABLE IF EXISTS `bb_bt_search_results`;
CREATE TABLE `bb_bt_search_results` (
  `session_id` varchar(32) NOT NULL DEFAULT '',
  `search_id` int(10) unsigned NOT NULL DEFAULT '0',
  `added` int(11) NOT NULL DEFAULT '0',
  `search_array` text NOT NULL,
  `search_settings` text NOT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `bb_bt_tor_dl_stat` ***
--

DROP TABLE IF EXISTS `bb_bt_tor_dl_stat`;
CREATE TABLE `bb_bt_tor_dl_stat` (
  `torrent_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(9) NOT NULL DEFAULT '0',
  `attach_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `t_up_total` bigint(20) unsigned NOT NULL DEFAULT '0',
  `t_down_total` bigint(20) unsigned NOT NULL DEFAULT '0',
  `t_bonus_total` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`torrent_id`,`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

--
-- Table structure for table `bb_bt_torrents` ***
--

DROP TABLE IF EXISTS `bb_bt_torrents`;
CREATE TABLE `bb_bt_torrents` (
  `torrent_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `info_hash` varbinary(20) NOT NULL,
  `post_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `poster_id` mediumint(9) NOT NULL DEFAULT '0',
  `topic_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `attach_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0',
  `piece_length` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `reg_time` int(11) NOT NULL DEFAULT '0',
  `complete_count` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `seeder_last_seen` int(11) NOT NULL DEFAULT '0',
  `last_seeder_uid` mediumint(9) NOT NULL DEFAULT '0',
  `topic_check_status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `topic_check_uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_check_date` int(11) NOT NULL DEFAULT '0',
  `topic_check_first_fid` mediumint(8) NOT NULL DEFAULT '0',
  `topic_check_duble_tid` mediumint(8) NOT NULL DEFAULT '0',
  `leechers` int(11) NOT NULL DEFAULT '0',
  `seeders` int(11) NOT NULL DEFAULT '0',
  `speed_ul` bigint(20) unsigned NOT NULL DEFAULT '0',
  `speed_dl` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`torrent_id`),
  UNIQUE KEY `post_id` (`post_id`),
  UNIQUE KEY `topic_id` (`topic_id`),
  UNIQUE KEY `attach_id` (`attach_id`),
  UNIQUE KEY `info_hash` (`info_hash`),
  KEY `reg_time` (`reg_time`),
  KEY `poster_id` (`poster_id`),
  KEY `size` (`size`),
  KEY `topic_check_uid` (`topic_check_uid`)
) ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

--
-- Table structure for table `bb_bt_torrents_del`
--

DROP TABLE IF EXISTS `bb_bt_torrents_del`;
CREATE TABLE `bb_bt_torrents_del` (
  `info_hash` binary(20) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `is_del` tinyint(4) NOT NULL DEFAULT '1',
  `dl_percent` tinyint(4) NOT NULL DEFAULT '100',
  `torrent_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`torrent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `bb_bt_tracker`
--

DROP TABLE IF EXISTS `bb_bt_tracker`;
CREATE TABLE `bb_bt_tracker` (
  `torrent_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `peer_id` varchar(35) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `user_id` mediumint(9) NOT NULL DEFAULT '0',
  `ip` char(8) NOT NULL DEFAULT '0',
  `ipv6` varchar(32) DEFAULT NULL,
  `port` smallint(5) unsigned NOT NULL DEFAULT '0',
  `uploaded` bigint(20) unsigned NOT NULL DEFAULT '0',
  `downloaded` bigint(20) unsigned NOT NULL DEFAULT '0',
  `complete_percent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `seeder` tinyint(1) NOT NULL DEFAULT '0',
  `last_stored_up` bigint(20) unsigned NOT NULL DEFAULT '0',
  `last_stored_down` bigint(20) unsigned NOT NULL DEFAULT '0',
  `stat_last_updated` int(11) NOT NULL DEFAULT '0',
  `speed_up` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `speed_down` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `expire_time` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `torrent_peer_id` (`torrent_id`,`peer_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 MAX_ROWS=1000000000 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

--
-- Table structure for table `bb_bt_users` ***
--

DROP TABLE IF EXISTS `bb_bt_users`;
CREATE TABLE `bb_bt_users` (
  `user_id` mediumint(9) NOT NULL DEFAULT '0',
  `auth_key` char(10) NOT NULL DEFAULT '',
  `u_up_total` bigint(20) unsigned NOT NULL DEFAULT '0',
  `u_bonus_total` bigint(20) unsigned NOT NULL DEFAULT '0',
  `u_down_total` bigint(20) unsigned NOT NULL DEFAULT '0',
  `u_bonus_today` bigint(20) NOT NULL DEFAULT '0',
  `u_bonus_hourly` bigint(20) NOT NULL DEFAULT '0',
  `u_down_today` bigint(20) NOT NULL DEFAULT '0',
  `u_up_today` bigint(20) NOT NULL DEFAULT '0',
  `u_bonus_yday` bigint(20) NOT NULL DEFAULT '0',
  `u_down_yday` bigint(20) NOT NULL DEFAULT '0',
  `u_up_yday` bigint(20) NOT NULL DEFAULT '0',
  `max_up_speed` bigint(20) unsigned NOT NULL DEFAULT '0',
  `max_down_speed` bigint(20) unsigned NOT NULL DEFAULT '0',
  `ratio_nulled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `u_up_old` bigint(20) NOT NULL,
  `u_down_old` bigint(20) NOT NULL,
  `u_bonus_old` bigint(20) NOT NULL,
  `max_up_speed_old` bigint(20) NOT NULL,
  `u_releases` mediumint(6) NOT NULL DEFAULT '0',
  `can_leech` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `auth_key` (`auth_key`),
  KEY `user_id_down` (`user_id`,`u_down_total`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 DELAY_KEY_WRITE=1 ROW_FORMAT=FIXED;

--
-- Table structure for table `bb_bt_users_dl_status` ***
--

DROP TABLE IF EXISTS `bb_bt_users_dl_status`;
CREATE TABLE `bb_bt_users_dl_status` (
  `topic_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(9) NOT NULL DEFAULT '0',
  `user_status` tinyint(1) NOT NULL DEFAULT '0',
  `compl_count` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `drop_release` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`topic_id`,`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 DELAY_KEY_WRITE=1 ROW_FORMAT=FIXED;

--
-- Table structure for table `bb_categories` ***
--

DROP TABLE IF EXISTS `bb_categories`;
CREATE TABLE `bb_categories` (
  `cat_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `cat_title` varchar(100) DEFAULT NULL,
  `cat_title_short` varchar(100) DEFAULT NULL,
  `cat_title_hashtag` varchar(100) DEFAULT NULL,
  `cat_url` varchar(100) DEFAULT NULL,
  `cat_desc` varchar(100) DEFAULT NULL,
  `cat_order` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cat_id`),
  KEY `cat_order` (`cat_order`)
) ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

--
-- Table structure for table `bb_config`
--

DROP TABLE IF EXISTS `bb_config`;
CREATE TABLE `bb_config` (
  `config_name` varchar(255) NOT NULL DEFAULT '',
  `config_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`config_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `bb_confirm`
--

DROP TABLE IF EXISTS `bb_confirm`;
CREATE TABLE `bb_confirm` (
  `confirm_id` char(32) NOT NULL DEFAULT '',
  `session_id` char(32) NOT NULL DEFAULT '',
  `code` char(10) NOT NULL,
  PRIMARY KEY (`session_id`,`confirm_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `bb_disallow`
--

DROP TABLE IF EXISTS `bb_disallow`;
CREATE TABLE `bb_disallow` (
  `disallow_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `disallow_username` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`disallow_id`)
) ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

--
-- Table structure for table `bb_dl_st_prevs_list`
--

DROP TABLE IF EXISTS `bb_dl_st_prevs_list`;
CREATE TABLE `bb_dl_st_prevs_list` (
  `prevs_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `prevs_user_pg` mediumint(8) NOT NULL DEFAULT '0',
  `prevs_user_png` mediumint(8) NOT NULL DEFAULT '0',
  `prevs_group_g` mediumint(8) NOT NULL DEFAULT '0',
  `prevs_until` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`prevs_id`),
  KEY `prevs_user_pg_user_png_group_g` (`prevs_user_pg`,`prevs_user_png`,`prevs_group_g`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `bb_easymod`
--

DROP TABLE IF EXISTS `bb_easymod`;
CREATE TABLE `bb_easymod` (
  `mod_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `mod_title` varchar(255) CHARACTER SET cp1251 DEFAULT '',
  `mod_file` varchar(255) CHARACTER SET cp1251 DEFAULT '',
  `mod_version` varchar(15) CHARACTER SET cp1251 DEFAULT '',
  `mod_author_handle` varchar(25) CHARACTER SET cp1251 DEFAULT '',
  `mod_author_email` varchar(100) CHARACTER SET cp1251 DEFAULT '',
  `mod_author_name` varchar(100) CHARACTER SET cp1251 DEFAULT '',
  `mod_author_url` varchar(100) CHARACTER SET cp1251 DEFAULT '',
  `mod_description` text CHARACTER SET cp1251,
  `mod_process_date` int(11) DEFAULT '0',
  `mod_phpBB_version` varchar(15) CHARACTER SET cp1251 DEFAULT '',
  `mod_processed_themes` varchar(200) CHARACTER SET cp1251 DEFAULT '',
  `mod_processed_langs` varchar(200) CHARACTER SET cp1251 DEFAULT '',
  `mod_files_edited` mediumint(8) DEFAULT '0',
  `mod_tables_added` mediumint(8) DEFAULT '0',
  `mod_tables_altered` mediumint(8) DEFAULT '0',
  `mod_rows_inserted` mediumint(8) DEFAULT '0',
  PRIMARY KEY (`mod_id`)
) ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

--
-- Table structure for table `bb_easymod_processed_files`
--

DROP TABLE IF EXISTS `bb_easymod_processed_files`;
CREATE TABLE `bb_easymod_processed_files` (
  `mod_processed_file` varchar(255) CHARACTER SET cp1251 NOT NULL DEFAULT '',
  `mod_id` mediumint(8) NOT NULL DEFAULT '0',
  KEY `mod_processed_file` (`mod_processed_file`),
  KEY `mod_id` (`mod_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `bb_extension_groups`
--

DROP TABLE IF EXISTS `bb_extension_groups`;
CREATE TABLE `bb_extension_groups` (
  `group_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(20) NOT NULL DEFAULT '',
  `cat_id` tinyint(2) NOT NULL DEFAULT '0',
  `allow_group` tinyint(1) NOT NULL DEFAULT '0',
  `download_mode` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `upload_icon` varchar(100) DEFAULT '',
  `max_filesize` int(20) NOT NULL DEFAULT '0',
  `forum_permissions` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

--
-- Table structure for table `bb_extensions`
--

DROP TABLE IF EXISTS `bb_extensions`;
CREATE TABLE `bb_extensions` (
  `ext_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `extension` varchar(100) NOT NULL DEFAULT '',
  `comment` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ext_id`)
) ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

--
-- Table structure for table `bb_flags`
--

DROP TABLE IF EXISTS `bb_flags`;
CREATE TABLE `bb_flags` (
  `flag_id` int(10) NOT NULL AUTO_INCREMENT,
  `flag_name` varchar(25) DEFAULT '',
  `flag_image` varchar(25) DEFAULT '',
  PRIMARY KEY (`flag_id`)
) ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

--
-- Table structure for table `bb_forbidden_extensions`
--

DROP TABLE IF EXISTS `bb_forbidden_extensions`;
CREATE TABLE `bb_forbidden_extensions` (
  `ext_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `extension` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`ext_id`)
) ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

--
-- Table structure for table `bb_forum_prune`
--

DROP TABLE IF EXISTS `bb_forum_prune`;
CREATE TABLE `bb_forum_prune` (
  `prune_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `forum_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `prune_days` smallint(5) unsigned NOT NULL DEFAULT '0',
  `prune_freq` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`prune_id`),
  KEY `forum_id` (`forum_id`)
) ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

--
-- Table structure for table `bb_forums` ***
--

DROP TABLE IF EXISTS `bb_forums`;
CREATE TABLE `bb_forums` (
  `forum_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `cat_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_name` varchar(150) DEFAULT NULL,
  `forum_desc` text,
  `forum_status` tinyint(4) NOT NULL DEFAULT '0',
  `forum_order` mediumint(8) unsigned NOT NULL DEFAULT '1',
  `forum_posts` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_topics` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_last_post_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `prune_next` int(11) DEFAULT NULL,
  `prune_enable` tinyint(1) NOT NULL DEFAULT '0',
  `auth_view` tinyint(2) NOT NULL DEFAULT '0',
  `auth_read` tinyint(2) NOT NULL DEFAULT '0',
  `auth_post` tinyint(2) NOT NULL DEFAULT '0',
  `auth_reply` tinyint(2) NOT NULL DEFAULT '0',
  `auth_edit` tinyint(2) NOT NULL DEFAULT '0',
  `auth_delete` tinyint(2) NOT NULL DEFAULT '0',
  `auth_sticky` tinyint(2) NOT NULL DEFAULT '0',
  `auth_announce` tinyint(2) NOT NULL DEFAULT '0',
  `auth_vote` tinyint(2) NOT NULL DEFAULT '0',
  `auth_pollcreate` tinyint(2) NOT NULL DEFAULT '0',
  `auth_attachments` tinyint(2) NOT NULL DEFAULT '0',
  `auth_download` tinyint(2) NOT NULL DEFAULT '0',
  `allow_reg_tracker` tinyint(1) NOT NULL DEFAULT '0',
  `allow_dl_topic` tinyint(1) NOT NULL DEFAULT '0',
  `dl_type_default` tinyint(1) NOT NULL DEFAULT '0',
  `self_moderated` tinyint(1) NOT NULL DEFAULT '0',
  `last_dl_topics_synch` int(11) NOT NULL DEFAULT '0',
  `show_dl_buttons` tinyint(1) NOT NULL DEFAULT '0',
  `forum_parent` mediumint(9) NOT NULL DEFAULT '0',
  `show_on_index` tinyint(1) NOT NULL DEFAULT '1',
  `forum_display_sort` tinyint(1) NOT NULL DEFAULT '0',
  `forum_display_order` tinyint(1) NOT NULL DEFAULT '0',
  `move_next` int(11) unsigned NOT NULL DEFAULT '0',
  `recycle_move_next` int(11) unsigned NOT NULL DEFAULT '0',
  `move_enable` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`forum_id`),
  KEY `forums_order` (`forum_order`),
  KEY `cat_id` (`cat_id`),
  KEY `forum_last_post_id` (`forum_last_post_id`),
  KEY `forum_parent` (`forum_parent`),
  KEY `auth_view` (`auth_view`),
  KEY `auth_read` (`auth_read`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `bb_groups` ***
--

DROP TABLE IF EXISTS `bb_groups`;
CREATE TABLE `bb_groups` (
  `group_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `group_type` tinyint(4) NOT NULL DEFAULT '1',
  `group_name` varchar(40) DEFAULT NULL,
  `group_description` varchar(255) DEFAULT NULL,
  `group_moderator` mediumint(8) NOT NULL DEFAULT '0',
  `group_single_user` tinyint(1) NOT NULL DEFAULT '1',
  `group_order` mediumint(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`group_id`),
  KEY `group_single_user` (`group_single_user`),
  KEY `group_name` (`group_name`)
) ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

--
-- Table structure for table `bb_posts` ***
--

DROP TABLE IF EXISTS `bb_posts`;
CREATE TABLE `bb_posts` (
  `post_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `topic_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `poster_id` mediumint(8) NOT NULL DEFAULT '0',
  `post_time` int(11) NOT NULL DEFAULT '0',
  `post_created` int(11) NOT NULL DEFAULT '0',
  `poster_ip` varchar(32) NOT NULL DEFAULT '',
  `post_username` varchar(25) DEFAULT NULL,
  `enable_bbcode` tinyint(1) NOT NULL DEFAULT '1',
  `enable_html` tinyint(1) NOT NULL DEFAULT '0',
  `enable_smilies` tinyint(1) NOT NULL DEFAULT '1',
  `enable_sig` tinyint(1) NOT NULL DEFAULT '1',
  `post_edit_time` int(11) DEFAULT NULL,
  `post_edit_count` smallint(5) unsigned NOT NULL DEFAULT '0',
  `post_attachment` tinyint(1) NOT NULL DEFAULT '0',
  `parsed` tinyint(1) NOT NULL DEFAULT '0',
  `dont_cache` tinyint(1) NOT NULL DEFAULT '0',
  `cache_file_md5` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`post_id`),
  KEY `poster_id` (`poster_id`),
  KEY `post_time` (`post_time`),
  KEY `forum_id` (`forum_id`),
  KEY `topic_time` (`topic_id`,`post_time`)
) ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

--
-- Table structure for table `bb_posts_edit` ***
--

DROP TABLE IF EXISTS `bb_posts_edit`;
CREATE TABLE `bb_posts_edit` (
  `post_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) NOT NULL DEFAULT '0',
  `post_edit_count` smallint(5) unsigned NOT NULL DEFAULT '0',
  `post_edit_time` int(11) DEFAULT NULL,
  KEY `post_id` (`post_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `bb_posts_text` ***
--

DROP TABLE IF EXISTS `bb_posts_text`;
CREATE TABLE `bb_posts_text` (
  `post_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `bbcode_uid` varchar(10) NOT NULL DEFAULT '',
  `post_subject` varchar(120) DEFAULT NULL,
  `post_text` mediumtext,
  PRIMARY KEY (`post_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `bb_privmsgs` ***
--

DROP TABLE IF EXISTS `bb_privmsgs`;
CREATE TABLE `bb_privmsgs` (
  `privmsgs_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `privmsgs_type` tinyint(4) NOT NULL DEFAULT '0',
  `privmsgs_subject` varchar(255) DEFAULT NULL,
  `privmsgs_from_userid` mediumint(8) NOT NULL DEFAULT '0',
  `privmsgs_to_userid` mediumint(8) NOT NULL DEFAULT '0',
  `privmsgs_date` int(11) NOT NULL DEFAULT '0',
  `privmsgs_ip` varchar(8) NOT NULL DEFAULT '',
  `privmsgs_enable_bbcode` tinyint(1) NOT NULL DEFAULT '1',
  `privmsgs_enable_html` tinyint(1) NOT NULL DEFAULT '0',
  `privmsgs_enable_smilies` tinyint(1) NOT NULL DEFAULT '1',
  `privmsgs_attach_sig` tinyint(1) NOT NULL DEFAULT '1',
  `privmsgs_attachment` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`privmsgs_id`),
  KEY `privmsgs_from_userid` (`privmsgs_from_userid`),
  KEY `privmsgs_to_userid` (`privmsgs_to_userid`)
) ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

--
-- Table structure for table `bb_privmsgs_text` ***
--

DROP TABLE IF EXISTS `bb_privmsgs_text`;
CREATE TABLE `bb_privmsgs_text` (
  `privmsgs_text_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `privmsgs_bbcode_uid` varchar(10) NOT NULL DEFAULT '0',
  `privmsgs_text` text,
  PRIMARY KEY (`privmsgs_text_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `bb_quota_limits`
--

DROP TABLE IF EXISTS `bb_quota_limits`;
CREATE TABLE `bb_quota_limits` (
  `quota_limit_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `quota_desc` varchar(20) NOT NULL DEFAULT '',
  `quota_limit` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`quota_limit_id`)
) ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

--
-- Table structure for table `bb_ranks` ***
--

DROP TABLE IF EXISTS `bb_ranks`;
CREATE TABLE `bb_ranks` (
  `rank_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `rank_title` varchar(50) DEFAULT NULL,
  `rank_min` mediumint(8) NOT NULL DEFAULT '0',
  `rank_special` tinyint(1) DEFAULT '0',
  `rank_image` varchar(255) DEFAULT NULL,
  `rank_group` mediumint(8) NOT NULL,
  PRIMARY KEY (`rank_id`)
) ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

--
-- Table structure for table `bb_search_results`
--

DROP TABLE IF EXISTS `bb_search_results`;
CREATE TABLE `bb_search_results` (
  `search_id` int(11) unsigned NOT NULL DEFAULT '0',
  `session_id` varchar(32) NOT NULL DEFAULT '',
  `search_array` mediumtext NOT NULL,
  PRIMARY KEY (`search_id`),
  KEY `session_id` (`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `bb_search_wordlist`
--

DROP TABLE IF EXISTS `bb_search_wordlist`;
CREATE TABLE `bb_search_wordlist` (
  `word_text` varchar(50) NOT NULL DEFAULT '',
  `word_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `word_common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`word_text`),
  KEY `word_id` (`word_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `bb_search_wordmatch`
--

DROP TABLE IF EXISTS `bb_search_wordmatch`;
CREATE TABLE `bb_search_wordmatch` (
  `post_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `word_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `title_match` tinyint(1) NOT NULL DEFAULT '0',
  KEY `post_id` (`post_id`),
  KEY `word_id` (`word_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `bb_sessions`
--

DROP TABLE IF EXISTS `bb_sessions`;
CREATE TABLE `bb_sessions` (
  `session_id` char(32) NOT NULL DEFAULT '',
  `session_user_id` mediumint(8) NOT NULL DEFAULT '0',
  `session_start` int(11) NOT NULL DEFAULT '0',
  `session_time` int(11) NOT NULL DEFAULT '0',
  `session_ip` char(32) NOT NULL DEFAULT '0',
  `session_page` int(11) NOT NULL DEFAULT '0',
  `session_logged_in` tinyint(1) NOT NULL DEFAULT '0',
  `session_admin` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`session_id`),
  KEY `session_user_id` (`session_user_id`),
  KEY `session_id_ip_user_id` (`session_id`,`session_ip`,`session_user_id`),
  KEY `session_time` (`session_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Table structure for table `bb_sessions_keys`
--

DROP TABLE IF EXISTS `bb_sessions_keys`;
CREATE TABLE `bb_sessions_keys` (
  `key_id` varchar(32) NOT NULL DEFAULT '0',
  `user_id` mediumint(8) NOT NULL DEFAULT '0',
  `last_ip` varchar(8) NOT NULL DEFAULT '0',
  `last_login` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`key_id`,`user_id`),
  KEY `last_login` (`last_login`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `bb_smilies`
--

DROP TABLE IF EXISTS `bb_smilies`;
CREATE TABLE `bb_smilies` (
  `smilies_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `smile_url` varchar(100) DEFAULT NULL,
  `emoticon` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`smilies_id`)
) ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

--
-- Table structure for table `bb_themes`
--

DROP TABLE IF EXISTS `bb_themes`;
CREATE TABLE `bb_themes` (
  `themes_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `template_name` varchar(30) NOT NULL DEFAULT '',
  `style_name` varchar(30) NOT NULL DEFAULT '',
  `head_stylesheet` varchar(100) DEFAULT NULL,
  `body_background` varchar(100) DEFAULT NULL,
  `body_bgcolor` varchar(6) DEFAULT NULL,
  `body_text` varchar(6) DEFAULT NULL,
  `body_link` varchar(6) DEFAULT NULL,
  `body_vlink` varchar(6) DEFAULT NULL,
  `body_alink` varchar(6) DEFAULT NULL,
  `body_hlink` varchar(6) DEFAULT NULL,
  `tr_color1` varchar(6) DEFAULT NULL,
  `tr_color2` varchar(6) DEFAULT NULL,
  `tr_color3` varchar(6) DEFAULT NULL,
  `tr_class1` varchar(25) DEFAULT NULL,
  `tr_class2` varchar(25) DEFAULT NULL,
  `tr_class3` varchar(25) DEFAULT NULL,
  `th_color1` varchar(6) DEFAULT NULL,
  `th_color2` varchar(6) DEFAULT NULL,
  `th_color3` varchar(6) DEFAULT NULL,
  `th_class1` varchar(25) DEFAULT NULL,
  `th_class2` varchar(25) DEFAULT NULL,
  `th_class3` varchar(25) DEFAULT NULL,
  `td_color1` varchar(6) DEFAULT NULL,
  `td_color2` varchar(6) DEFAULT NULL,
  `td_color3` varchar(6) DEFAULT NULL,
  `td_class1` varchar(25) DEFAULT NULL,
  `td_class2` varchar(25) DEFAULT NULL,
  `td_class3` varchar(25) DEFAULT NULL,
  `fontface1` varchar(50) DEFAULT NULL,
  `fontface2` varchar(50) DEFAULT NULL,
  `fontface3` varchar(50) DEFAULT NULL,
  `fontsize1` tinyint(4) DEFAULT NULL,
  `fontsize2` tinyint(4) DEFAULT NULL,
  `fontsize3` tinyint(4) DEFAULT NULL,
  `fontcolor1` varchar(6) DEFAULT NULL,
  `fontcolor2` varchar(6) DEFAULT NULL,
  `fontcolor3` varchar(6) DEFAULT NULL,
  `span_class1` varchar(25) DEFAULT NULL,
  `span_class2` varchar(25) DEFAULT NULL,
  `span_class3` varchar(25) DEFAULT NULL,
  `img_size_poll` smallint(5) unsigned DEFAULT NULL,
  `img_size_privmsg` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`themes_id`)
) ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

--
-- Table structure for table `bb_themes_name`
--

DROP TABLE IF EXISTS `bb_themes_name`;
CREATE TABLE `bb_themes_name` (
  `themes_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `tr_color1_name` char(50) DEFAULT NULL,
  `tr_color2_name` char(50) DEFAULT NULL,
  `tr_color3_name` char(50) DEFAULT NULL,
  `tr_class1_name` char(50) DEFAULT NULL,
  `tr_class2_name` char(50) DEFAULT NULL,
  `tr_class3_name` char(50) DEFAULT NULL,
  `th_color1_name` char(50) DEFAULT NULL,
  `th_color2_name` char(50) DEFAULT NULL,
  `th_color3_name` char(50) DEFAULT NULL,
  `th_class1_name` char(50) DEFAULT NULL,
  `th_class2_name` char(50) DEFAULT NULL,
  `th_class3_name` char(50) DEFAULT NULL,
  `td_color1_name` char(50) DEFAULT NULL,
  `td_color2_name` char(50) DEFAULT NULL,
  `td_color3_name` char(50) DEFAULT NULL,
  `td_class1_name` char(50) DEFAULT NULL,
  `td_class2_name` char(50) DEFAULT NULL,
  `td_class3_name` char(50) DEFAULT NULL,
  `fontface1_name` char(50) DEFAULT NULL,
  `fontface2_name` char(50) DEFAULT NULL,
  `fontface3_name` char(50) DEFAULT NULL,
  `fontsize1_name` char(50) DEFAULT NULL,
  `fontsize2_name` char(50) DEFAULT NULL,
  `fontsize3_name` char(50) DEFAULT NULL,
  `fontcolor1_name` char(50) DEFAULT NULL,
  `fontcolor2_name` char(50) DEFAULT NULL,
  `fontcolor3_name` char(50) DEFAULT NULL,
  `span_class1_name` char(50) DEFAULT NULL,
  `span_class2_name` char(50) DEFAULT NULL,
  `span_class3_name` char(50) DEFAULT NULL,
  PRIMARY KEY (`themes_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `bb_topics` ***
--

DROP TABLE IF EXISTS `bb_topics`;
CREATE TABLE `bb_topics` (
  `topic_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `forum_id` smallint(8) unsigned NOT NULL DEFAULT '0',
  `topic_title` varchar(255) DEFAULT NULL,
  `topic_poster` mediumint(8) NOT NULL DEFAULT '0',
  `topic_time` int(11) NOT NULL DEFAULT '0',
  `topic_views` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_replies` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_status` tinyint(3) NOT NULL DEFAULT '0',
  `topic_vote` tinyint(1) NOT NULL DEFAULT '0',
  `topic_type` tinyint(3) NOT NULL DEFAULT '0',
  `topic_first_post_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_last_post_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_moved_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_attachment` tinyint(1) NOT NULL DEFAULT '0',
  `topic_dl_type` tinyint(1) NOT NULL DEFAULT '0',
  `topic_dl_status` tinyint(1) NOT NULL DEFAULT '0',
  `topic_type_gold` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `topic_show_first_post` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `call_seed_time` int(11) DEFAULT '0',
  `topic_cache_lock` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`topic_id`),
  UNIQUE KEY `topic_last_post_id` (`topic_last_post_id`) USING BTREE,
  KEY `forum_id` (`forum_id`),
  KEY `topic_type` (`topic_type`),
  KEY `topic_status` (`topic_status`),
  KEY `topic_moved_id` (`topic_moved_id`),
  KEY `topic_poster` (`topic_poster`),
  KEY `topic_cache_lock` (`topic_cache_lock`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

DROP TRIGGER IF EXISTS `bb_topics_au`;
DELIMITER $$
CREATE TRIGGER `bb_topics_au` AFTER UPDATE ON `bb_topics`
 FOR EACH ROW if new.topic_type_gold != old.topic_type_gold then
    insert into bb_bt_torrents_del (torrent_id,info_hash,is_del,dl_percent)
    select torrent_id,info_hash,0
    ,case new.topic_type_gold when 1 then 0 when 2 then 50 when 3 then 75 when 4 then -1 else 100 end
    from bb_bt_torrents t where t.topic_id=new.topic_id
    ON DUPLICATE KEY UPDATE dl_percent=values(dl_percent);
  end if
$$
DELIMITER ;

--
-- Table structure for table `bb_topics_move`
--

DROP TABLE IF EXISTS `bb_topics_move`;
CREATE TABLE `bb_topics_move` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `forum_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `waits_days` smallint(5) unsigned NOT NULL DEFAULT '0',
  `check_freq` smallint(5) unsigned NOT NULL DEFAULT '0',
  `move_fid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `recycle_waits_days` smallint(5) unsigned NOT NULL DEFAULT '0',
  `recycle_check_freq` smallint(5) unsigned NOT NULL DEFAULT '0',
  `recycle_move_fid` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `forum_id` (`forum_id`)
) ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

--
-- Table structure for table `bb_topics_watch` ***
--

DROP TABLE IF EXISTS `bb_topics_watch`;
CREATE TABLE `bb_topics_watch` (
  `topic_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) NOT NULL DEFAULT '0',
  `notify_status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`topic_id`),
  KEY `topic_id` (`topic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `bb_user_group` ***
--

DROP TABLE IF EXISTS `bb_user_group`;
CREATE TABLE `bb_user_group` (
  `group_id` mediumint(8) NOT NULL DEFAULT '0',
  `user_id` mediumint(8) NOT NULL DEFAULT '0',
  `user_pending` tinyint(1) DEFAULT NULL,
  `group_moderator` tinyint(1) NOT NULL,
  KEY `group_id` (`group_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `bb_users` ***
--

DROP TABLE IF EXISTS `bb_users`;
CREATE TABLE `bb_users` (
  `user_id` mediumint(8) NOT NULL DEFAULT '0',
  `user_active` tinyint(1) DEFAULT '1',
  `username` varchar(25) DEFAULT NULL,
  `user_password2` varchar(60) NOT NULL DEFAULT '',
  `user_session_time` int(11) NOT NULL DEFAULT '0',
  `user_timer` int(11) NOT NULL,
  `user_session_page` smallint(5) NOT NULL DEFAULT '0',
  `user_lastvisit` int(11) NOT NULL DEFAULT '0',
  `user_regdate` int(11) NOT NULL DEFAULT '0',
  `user_level` tinyint(4) DEFAULT '0',
  `user_posts` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_timezone` decimal(5,2) NOT NULL DEFAULT '0.00',
  `user_style` tinyint(4) DEFAULT NULL,
  `user_lang` varchar(255) DEFAULT NULL,
  `user_dateformat` varchar(14) NOT NULL DEFAULT 'd M Y H:i',
  `user_new_privmsg` smallint(5) unsigned NOT NULL DEFAULT '0',
  `user_unread_privmsg` smallint(5) unsigned NOT NULL DEFAULT '0',
  `user_last_privmsg` int(11) NOT NULL DEFAULT '0',
  `user_login_tries` smallint(5) NOT NULL DEFAULT '0',
  `user_last_login_try` int(11) NOT NULL DEFAULT '0',
  `user_emailtime` int(11) DEFAULT NULL,
  `user_viewemail` tinyint(1) DEFAULT NULL,
  `user_attachsig` tinyint(1) DEFAULT NULL,
  `user_allowhtml` tinyint(1) DEFAULT '1',
  `user_allowbbcode` tinyint(1) DEFAULT '1',
  `user_allowsmile` tinyint(1) DEFAULT '1',
  `user_allowavatar` tinyint(1) NOT NULL DEFAULT '1',
  `user_allow_pm` tinyint(1) NOT NULL DEFAULT '1',
  `user_allow_viewonline` tinyint(1) NOT NULL DEFAULT '1',
  `user_notify` tinyint(1) NOT NULL DEFAULT '1',
  `user_notify_pm` tinyint(1) NOT NULL DEFAULT '0',
  `user_popup_pm` tinyint(1) NOT NULL DEFAULT '0',
  `user_rank` int(11) DEFAULT '0',
  `user_avatar` varchar(100) DEFAULT NULL,
  `user_avatar_type` tinyint(4) NOT NULL DEFAULT '0',
  `user_email` varchar(255) DEFAULT NULL,
  `user_icq` varchar(15) DEFAULT NULL,
  `user_website` varchar(100) DEFAULT NULL,
  `user_from` varchar(100) DEFAULT NULL,
  `user_sig` text,
  `user_sig_bbcode_uid` varchar(10) DEFAULT NULL,
  `user_aim` varchar(255) DEFAULT NULL,
  `user_yim` varchar(255) DEFAULT NULL,
  `user_msnm` varchar(255) DEFAULT NULL,
  `user_occ` varchar(100) DEFAULT NULL,
  `user_interests` varchar(255) DEFAULT NULL,
  `user_actkey` varchar(32) DEFAULT NULL,
  `user_newpasswd` varchar(60) DEFAULT NULL,
  `user_allow_passkey` tinyint(1) NOT NULL DEFAULT '1',
  `user_from_flag` varchar(25) DEFAULT NULL,
  `user_allowdefaultavatar` tinyint(1) NOT NULL DEFAULT '1',
  `user_skype` varchar(255) DEFAULT NULL,
  `user_warnings` tinyint(1) NOT NULL DEFAULT '0',
  `user_banned` tinyint(1) NOT NULL DEFAULT '0',
  `bt_tor_browse_set` text,
  `user_unread_topics` text,
  `user_hide_bt_stats` tinyint(1) NOT NULL DEFAULT '0',
  `user_hide_bt_history` tinyint(1) NOT NULL DEFAULT '1',
  `user_hide_bt_activity` tinyint(1) NOT NULL DEFAULT '0',
  `user_hide_bt_topics` tinyint(1) NOT NULL DEFAULT '0',
  `user_bt_ssl` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`),
  KEY `user_level` (`user_level`),
  KEY `user_session_time` (`user_session_time`),
  KEY `user_regdate` (`user_regdate`),
  KEY `username` (`username`),
  KEY `user_email` (`user_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `bb_vote_desc` ***
--

DROP TABLE IF EXISTS `bb_vote_desc`;
CREATE TABLE `bb_vote_desc` (
  `vote_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `topic_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `vote_text` text,
  `vote_start` int(11) NOT NULL DEFAULT '0',
  `vote_length` int(11) NOT NULL DEFAULT '0',
  `vote_max` int(3) NOT NULL DEFAULT '1',
  `vote_voted` int(7) NOT NULL DEFAULT '0',
  `vote_hide` tinyint(1) NOT NULL DEFAULT '0',
  `vote_tothide` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`vote_id`),
  KEY `topic_id` (`topic_id`)
) ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

--
-- Table structure for table `bb_vote_results` ***
--

DROP TABLE IF EXISTS `bb_vote_results`;
CREATE TABLE `bb_vote_results` (
  `vote_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `vote_option_id` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `vote_option_text` varchar(255) DEFAULT NULL,
  `vote_result` int(11) NOT NULL DEFAULT '0',
  KEY `vote_option_id` (`vote_option_id`),
  KEY `vote_id` (`vote_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `bb_vote_voters` ***
--

DROP TABLE IF EXISTS `bb_vote_voters`;
CREATE TABLE `bb_vote_voters` (
  `vote_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `vote_user_id` mediumint(8) NOT NULL DEFAULT '0',
  `vote_user_ip` char(32) NOT NULL DEFAULT '',
  `vote_user_result` varchar(50) DEFAULT NULL,
  `vote_x_forwarded_for` varchar(50) DEFAULT NULL,
  `vote_timestamp` int(11) NOT NULL,
  KEY `vote_id` (`vote_id`),
  KEY `vote_user_id` (`vote_user_id`),
  KEY `vote_user_ip` (`vote_user_ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `bb_warnings` ***
--

DROP TABLE IF EXISTS `bb_warnings`;
CREATE TABLE `bb_warnings` (
  `warning_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `warning_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `warning_post_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `warning_user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `warning_poster_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `warning_posted` int(11) NOT NULL DEFAULT '0',
  `warning_expires` int(11) NOT NULL DEFAULT '0',
  `warning_proceed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`warning_id`),
  KEY `warning_user_id` (`warning_user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

--
-- Table structure for table `bb_warnings_text` ***
--

DROP TABLE IF EXISTS `bb_warnings_text`;
CREATE TABLE `bb_warnings_text` (
  `warning_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `bbcode_uid` varchar(10) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `warning_text` text,
  PRIMARY KEY (`warning_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `bb_words`
--

DROP TABLE IF EXISTS `bb_words`;
CREATE TABLE `bb_words` (
  `word_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `word` char(100) DEFAULT NULL,
  `replacement` char(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`word_id`)
) ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
