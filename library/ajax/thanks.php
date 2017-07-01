<?php
if (!defined('IN_AJAX')) {
    die(basename(__FILE__));
}

global $userdata, $lang;

$user_id = $userdata['user_id'];
$attach_id = (int)$this->request['attach_id'];
$mode = (string)$this->request['mode'];


$sql_rating = DB()->fetch_rowset("SELECT user_id, thanked FROM " . BB_ATTACHMENTS_RATING . " WHERE attach_id = $attach_id");

switch ($mode) {
	case 'thanks':
		$sql_desc = DB()->fetch_row("SELECT thanks FROM " . BB_ATTACHMENTS_DESC . " WHERE attach_id = $attach_id LIMIT 1");
		foreach ($sql_rating as $row) {
			if ($row['user_id'] == $user_id) die;
		}
		$amount = $sql_desc['thanks'] + 1;
		DB()->query("UPDATE " . BB_ATTACHMENTS_DESC . " SET thanks = thanks + 1 WHERE attach_id = $attach_id");
		DB()->sql_query("INSERT INTO " . BB_ATTACHMENTS_RATING . " (attach_id, user_id, thanked) VALUES ($attach_id,$user_id,1) ON DUPLICATE KEY UPDATE thanked=1");
		$type = 1;
		$this->response['status'] = $amount;
		break;
	case 'list':
		$list = array();
		foreach($sql_rating as $row) {
			$sql_username = DB()->sql_query("SELECT username FROM " . BB_USERS . " WHERE user_id=" . $row['user_id']);
			while ($colum = DB()->sql_fetchrow($sql_username)) {
				$list[] = "<a href=\"u".$row['user_id']."\" target=\"_blank\">".$colum['username']."</a>, ";
			}
		}
		$type = 2;
		$this->response['status'] = rtrim(implode('', $list), ', ');
		break;
}
$this->response['type'] = $type;
?>
