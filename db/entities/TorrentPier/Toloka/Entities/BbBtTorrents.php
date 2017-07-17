<?php

namespace TorrentPier\Toloka\Entities;

use Doctrine\ORM\Mapping as ORM;

/**
 * BbBtTorrents
 *
 * @ORM\Table(name="bb_bt_torrents", uniqueConstraints={@ORM\UniqueConstraint(name="post_id", columns={"post_id"}), @ORM\UniqueConstraint(name="topic_id", columns={"topic_id"}), @ORM\UniqueConstraint(name="attach_id", columns={"attach_id"})}, indexes={@ORM\Index(name="reg_time", columns={"reg_time"}), @ORM\Index(name="forum_id", columns={"forum_id"}), @ORM\Index(name="poster_id", columns={"poster_id"})},options={"charset":"utf8mb4", "collate":"utf8mb4_unicode_ci"})
 * @ORM\Entity
 */
class BbBtTorrents
{
    /**
     * @var binary
     *
     * @ORM\Column(name="info_hash", type="binary", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $infoHash = '';

    /**
     * @var integer
     *
     * @ORM\Column(name="post_id", type="integer", nullable=false)
     */
    private $postId = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="poster_id", type="integer", nullable=false)
     */
    private $posterId = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="topic_id", type="integer", nullable=false)
     */
    private $topicId = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="forum_id", type="smallint", nullable=false)
     */
    private $forumId = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="attach_id", type="integer", nullable=false)
     */
    private $attachId = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="size", type="bigint", nullable=false)
     */
    private $size = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="reg_time", type="integer", nullable=false)
     */
    private $regTime = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="call_seed_time", type="integer", nullable=false)
     */
    private $callSeedTime = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="complete_count", type="integer", nullable=false)
     */
    private $completeCount = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="seeder_last_seen", type="integer", nullable=false)
     */
    private $seederLastSeen = '0';

    /**
     * @var boolean
     *
     * @ORM\Column(name="tor_status", type="boolean", nullable=false)
     */
    private $torStatus = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="checked_user_id", type="integer", nullable=false)
     */
    private $checkedUserId = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="checked_time", type="integer", nullable=false)
     */
    private $checkedTime = '0';

    /**
     * @var boolean
     *
     * @ORM\Column(name="tor_type", type="boolean", nullable=false)
     */
    private $torType = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="speed_up", type="integer", nullable=false)
     */
    private $speedUp = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="speed_down", type="integer", nullable=false)
     */
    private $speedDown = '0';



    /**
     * Get infoHash
     *
     * @return binary
     */
    public function getInfoHash()
    {
        return $this->infoHash;
    }

    /**
     * Set postId
     *
     * @param integer $postId
     *
     * @return BbBtTorrents
     */
    public function setPostId($postId)
    {
        $this->postId = $postId;

        return $this;
    }

    /**
     * Get postId
     *
     * @return integer
     */
    public function getPostId()
    {
        return $this->postId;
    }

    /**
     * Set posterId
     *
     * @param integer $posterId
     *
     * @return BbBtTorrents
     */
    public function setPosterId($posterId)
    {
        $this->posterId = $posterId;

        return $this;
    }

    /**
     * Get posterId
     *
     * @return integer
     */
    public function getPosterId()
    {
        return $this->posterId;
    }

    /**
     * Set topicId
     *
     * @param integer $topicId
     *
     * @return BbBtTorrents
     */
    public function setTopicId($topicId)
    {
        $this->topicId = $topicId;

        return $this;
    }

    /**
     * Get topicId
     *
     * @return integer
     */
    public function getTopicId()
    {
        return $this->topicId;
    }

    /**
     * Set forumId
     *
     * @param integer $forumId
     *
     * @return BbBtTorrents
     */
    public function setForumId($forumId)
    {
        $this->forumId = $forumId;

        return $this;
    }

    /**
     * Get forumId
     *
     * @return integer
     */
    public function getForumId()
    {
        return $this->forumId;
    }

    /**
     * Set attachId
     *
     * @param integer $attachId
     *
     * @return BbBtTorrents
     */
    public function setAttachId($attachId)
    {
        $this->attachId = $attachId;

        return $this;
    }

    /**
     * Get attachId
     *
     * @return integer
     */
    public function getAttachId()
    {
        return $this->attachId;
    }

    /**
     * Set size
     *
     * @param integer $size
     *
     * @return BbBtTorrents
     */
    public function setSize($size)
    {
        $this->size = $size;

        return $this;
    }

    /**
     * Get size
     *
     * @return integer
     */
    public function getSize()
    {
        return $this->size;
    }

    /**
     * Set regTime
     *
     * @param integer $regTime
     *
     * @return BbBtTorrents
     */
    public function setRegTime($regTime)
    {
        $this->regTime = $regTime;

        return $this;
    }

    /**
     * Get regTime
     *
     * @return integer
     */
    public function getRegTime()
    {
        return $this->regTime;
    }

    /**
     * Set callSeedTime
     *
     * @param integer $callSeedTime
     *
     * @return BbBtTorrents
     */
    public function setCallSeedTime($callSeedTime)
    {
        $this->callSeedTime = $callSeedTime;

        return $this;
    }

    /**
     * Get callSeedTime
     *
     * @return integer
     */
    public function getCallSeedTime()
    {
        return $this->callSeedTime;
    }

    /**
     * Set completeCount
     *
     * @param integer $completeCount
     *
     * @return BbBtTorrents
     */
    public function setCompleteCount($completeCount)
    {
        $this->completeCount = $completeCount;

        return $this;
    }

    /**
     * Get completeCount
     *
     * @return integer
     */
    public function getCompleteCount()
    {
        return $this->completeCount;
    }

    /**
     * Set seederLastSeen
     *
     * @param integer $seederLastSeen
     *
     * @return BbBtTorrents
     */
    public function setSeederLastSeen($seederLastSeen)
    {
        $this->seederLastSeen = $seederLastSeen;

        return $this;
    }

    /**
     * Get seederLastSeen
     *
     * @return integer
     */
    public function getSeederLastSeen()
    {
        return $this->seederLastSeen;
    }

    /**
     * Set torStatus
     *
     * @param boolean $torStatus
     *
     * @return BbBtTorrents
     */
    public function setTorStatus($torStatus)
    {
        $this->torStatus = $torStatus;

        return $this;
    }

    /**
     * Get torStatus
     *
     * @return boolean
     */
    public function getTorStatus()
    {
        return $this->torStatus;
    }

    /**
     * Set checkedUserId
     *
     * @param integer $checkedUserId
     *
     * @return BbBtTorrents
     */
    public function setCheckedUserId($checkedUserId)
    {
        $this->checkedUserId = $checkedUserId;

        return $this;
    }

    /**
     * Get checkedUserId
     *
     * @return integer
     */
    public function getCheckedUserId()
    {
        return $this->checkedUserId;
    }

    /**
     * Set checkedTime
     *
     * @param integer $checkedTime
     *
     * @return BbBtTorrents
     */
    public function setCheckedTime($checkedTime)
    {
        $this->checkedTime = $checkedTime;

        return $this;
    }

    /**
     * Get checkedTime
     *
     * @return integer
     */
    public function getCheckedTime()
    {
        return $this->checkedTime;
    }

    /**
     * Set torType
     *
     * @param boolean $torType
     *
     * @return BbBtTorrents
     */
    public function setTorType($torType)
    {
        $this->torType = $torType;

        return $this;
    }

    /**
     * Get torType
     *
     * @return boolean
     */
    public function getTorType()
    {
        return $this->torType;
    }

    /**
     * Set speedUp
     *
     * @param integer $speedUp
     *
     * @return BbBtTorrents
     */
    public function setSpeedUp($speedUp)
    {
        $this->speedUp = $speedUp;

        return $this;
    }

    /**
     * Get speedUp
     *
     * @return integer
     */
    public function getSpeedUp()
    {
        return $this->speedUp;
    }

    /**
     * Set speedDown
     *
     * @param integer $speedDown
     *
     * @return BbBtTorrents
     */
    public function setSpeedDown($speedDown)
    {
        $this->speedDown = $speedDown;

        return $this;
    }

    /**
     * Get speedDown
     *
     * @return integer
     */
    public function getSpeedDown()
    {
        return $this->speedDown;
    }
}
