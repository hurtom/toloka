<?php
/**
 * Created by PhpStorm.
 * User: Sensetivity
 * Date: 30.05.2017
 * Time: 0:04
 */

$viewTopicPattern = '/^' . str_replace('/', '\/', '/t(\d+)') . '$/';
$viewTopicPatternPagination = '/^' . str_replace('/', '\/', '/t(\d+)-(\d+)') . '$/';
$viewForumPattern = '/^' . str_replace('/', '\/', '/f(\d+)') . '$/';
$viewForumPatternPagination = '/^' . str_replace('/', '\/', '/f(\d+)-(\d+)') . '$/';
$pagePattern = '/^' . str_replace('/', '\/', '/p(\d+)') . '$/';
$userPattern = '/^' . str_replace('/', '\/', '/u(\d+)') . '$/';
$uri = $_SERVER['REQUEST_URI'];

// viewforum.php?f=1 /f1
if (preg_match($viewForumPattern, $uri, $params)) {
    array_shift($params);
    $_REQUEST['f'] = reset($params);
    $_GET['f'] = reset($params);
    require __DIR__ . '/viewforum.php';
    exit;
}
// viewforum.php?f=1&start=30 /f1-30
if (preg_match($viewForumPatternPagination, $uri, $params)) {
    array_shift($params);
    $_REQUEST['f'] = reset($params);
    $_REQUEST['start'] = next($params);
    $_GET['f'] = reset($params);
    $_GET['start'] = next($params);
    require __DIR__ . '/viewforum.php';
    exit;
}
// viewtopic.php?t=1 /t1
if (preg_match($viewTopicPattern, $uri, $params)) {
    array_shift($params);
    $_REQUEST['t'] = reset($params);
    $_GET['t'] = reset($params);
    require __DIR__ . '/viewtopic.php';
    exit;
}
// viewtopic.php?t=1&start=3 / t1-3
if (preg_match($viewTopicPatternPagination, $uri, $params)) {
    array_shift($params);
    $_REQUEST['t'] = reset($params);
    $_REQUEST['start'] = next($params);
    $_GET['t'] = reset($params);
    $_GET['start'] = next($params);
    require __DIR__ . '/viewtopic.php';
    exit;
}

// viewtopic.php?p=1 p1
if (preg_match($pagePattern, $uri, $params)) {
    array_shift($params);
    $_REQUEST['p'] = reset($params);
    $_GET['p'] = reset($params);
    require __DIR__ . '/viewtopic.php';
    exit;
}
// profile.php?mode=viewprofile&u=2 /u2
if (preg_match($userPattern, $uri, $params)) {
    array_shift($params);
    $_REQUEST['mode'] = 'viewprofile';
    $_REQUEST['u'] = reset($params);
    $_GET['mode'] = 'viewprofile';
    $_GET['u'] = reset($params);
    require __DIR__ . '/profile.php';
    exit;
}
