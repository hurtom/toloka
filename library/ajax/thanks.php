<?php
if (!defined('IN_AJAX')) {
    die(basename(__FILE__));
}

global $userdata;

$user_id = (int)$userdata['user_id'];
$attach_id = (int)$this->request['attach_id'];
$mode = (string)$this->request['mode'];

switch ($mode) {
    case 'thanks':
        $row = DB()->fetch_row("SELECT user_id FROM " . BB_ATTACHMENTS_RATING . " WHERE attach_id = $attach_id AND user_id = $user_id");

        if (!isset($row['user_id'])) {
            DB()->query("UPDATE " . BB_ATTACHMENTS_DESC . " SET thanks = thanks + 1 WHERE attach_id = $attach_id");
            DB()->sql_query("INSERT INTO " . BB_ATTACHMENTS_RATING . " (attach_id, user_id, thanked) VALUES ($attach_id, $user_id, 1) ON DUPLICATE KEY UPDATE thanked = 1");
        }
        break;

    case 'list':
        $sql = "SELECT u.user_id, u.username
            FROM " . BB_ATTACHMENTS_RATING . " a
            JOIN " . BB_USERS . " u ON a.user_id = u.user_id
            WHERE attach_id = $attach_id
            AND thanked = 1";
        $sql_thanked = DB()->fetch_rowset($sql);

        foreach($sql_thanked as $row) {
            $list[] = "<a href=\"u".$row['user_id']."\">".$row['username']."</a>, ";
        }
        $this->response['status'] = rtrim(implode('', $list), ', ');
        break;
}
$this->response['mode'] = $mode;

?>
