<?php

namespace Database\Entities;

/**
 * BbBtTorrentsDel
 */
class BbBtTorrentsDel
{
    /**
     * @var integer
     */
    private $torrentId = '0';

    /**
     * @var binary
     */
    private $infoHash = '' . "\0" . '' . "\0" . '' . "\0" . '' . "\0" . '' . "\0" . '' . "\0" . '' . "\0" . '' . "\0" . '' . "\0" . '' . "\0" . '' . "\0" . '' . "\0" . '' . "\0" . '' . "\0" . '' . "\0" . '' . "\0" . '' . "\0" . '' . "\0" . '' . "\0" . '' . "\0" . '';

    /**
     * @var boolean
     */
    private $isDel = '1';

    /**
     * @var boolean
     */
    private $dlPercent = '100';


}
