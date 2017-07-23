<?php

namespace Database\Entities;

/**
 * BbBtTracker
 */
class BbBtTracker
{
    /**
     * @var string
     */
    private $peerHash = '';

    /**
     * @var integer
     */
    private $topicId = '0';

    /**
     * @var string
     */
    private $peerId = '0';

    /**
     * @var integer
     */
    private $userId = '0';

    /**
     * @var string
     */
    private $ip = '0';

    /**
     * @var string
     */
    private $ipv6;

    /**
     * @var integer
     */
    private $port = '0';

    /**
     * @var string
     */
    private $client = 'Unknown';

    /**
     * @var boolean
     */
    private $seeder = '0';

    /**
     * @var boolean
     */
    private $releaser = '0';

    /**
     * @var boolean
     */
    private $torType = '0';

    /**
     * @var integer
     */
    private $uploaded = '0';

    /**
     * @var integer
     */
    private $downloaded = '0';

    /**
     * @var integer
     */
    private $remain = '0';

    /**
     * @var integer
     */
    private $speedUp = '0';

    /**
     * @var integer
     */
    private $speedDown = '0';

    /**
     * @var integer
     */
    private $upAdd = '0';

    /**
     * @var integer
     */
    private $downAdd = '0';

    /**
     * @var integer
     */
    private $updateTime = '0';

    /**
     * @var integer
     */
    private $completePercent = '0';

    /**
     * @var integer
     */
    private $complete = '0';


}

