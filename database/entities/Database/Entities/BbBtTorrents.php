<?php

namespace Database\Entities;

/**
 * BbBtTorrents
 */
class BbBtTorrents
{
    /**
     * @var binary
     */
    private $infoHash = '';

    /**
     * @var integer
     */
    private $postId = 0;

    /**
     * @var integer
     */
    private $posterId = 0;

    /**
     * @var integer
     */
    private $topicId = 0;

    /**
     * @var integer
     */
    private $forumId = 0;

    /**
     * @var integer
     */
    private $attachId = 0;

    /**
     * @var integer
     */
    private $size = 0;

    /**
     * @var integer
     */
    private $regTime = 0;

    /**
     * @var integer
     */
    private $callSeedTime = 0;

    /**
     * @var integer
     */
    private $completeCount = 0;

    /**
     * @var integer
     */
    private $seederLastSeen = 0;

    /**
     * @var integer
     */
    private $torStatus = 0;

    /**
     * @var integer
     */
    private $checkedUserId = 0;

    /**
     * @var integer
     */
    private $checkedTime = 0;

    /**
     * @var integer
     */
    private $torType = 0;

    /**
     * @var integer
     */
    private $speedUp = 0;

    /**
     * @var integer
     */
    private $speedDown = 0;


    /**
     * @var integer
     */
    private $topicCheckOrigFid = 0;

    /**
     * @var integer
     */
    private $topicCheckDupTid = 0;


}
