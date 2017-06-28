<?php
if (!defined('IN_AJAX')) {
    die(basename(__FILE__));
}

global $userdata, $lang;

$user = $userdata['user_id'];
$attach_id = (int)$this->request['attach_id'];
$mode = (string)$this->request['mode'];
$sql = DB()->fetch_row("SELECT thanked_count, thanked FROM " . BB_ATTACHMENTS_DESC . " WHERE attach_id = $attach_id LIMIT 1");
/*
if (!$sql) {
    $this->ajax_die($lang['FAILED']);
}
*/

?>
<?php
switch ($mode) {
	case 'thanks':
		$amount = $sql['thanked_count'] + 1;
		$json_list = json_decode($sql['thanked']);
		foreach($json_list->data as $data) {
			if($data->id == $user) {
				die;
			}
		}
		$json = json_decode($sql['thanked'], true);
		array_push($json['data'], array('id' => $userdata['user_id'], 'name' => $userdata['username']));
		$json = json_encode(str_replace('"', '\"', $json));
		//{"data":[]}
		DB()->query("UPDATE " . BB_ATTACHMENTS_DESC . " SET thanked_count = $amount, thanked = '$json' WHERE attach_id = $attach_id");
		$type = 1;
		$this->response['status'] = $amount;
		break;
	case 'list':
		$json_list = json_decode($sql['thanked']);
		$array_list = array();
		foreach($json_list->data as $mydata){
			$array_list[] = '<a href="u'.$mydata->id.'" target="_blank">'.$mydata->name.'</a>, ';
		}
		$type = 2;
		$this->response['status'] = $array_list;
		break;
}
unset($json_list);
$this->response['type'] = $type;
?>
