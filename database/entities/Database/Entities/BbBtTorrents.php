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
     * Torrent check status:
     *   0 - not checked;
     *   1 - processing;
     *   2 - checked;
     *   3 - incomplete;
     *   4 - invalid;
     *   5 - duplicate.
     *
     * @var integer value in [0-5] regex range
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


    public function validate()
    {
        if (!is_int($this->torStatus)) {
            throw new \TypeError();
        }

        if (!($this->torStatus >= 0 && $this->torStatus <= 5)) {
            throw new \AssertionError('Value should be >= 0 and <= 5');
        }
    }
}
