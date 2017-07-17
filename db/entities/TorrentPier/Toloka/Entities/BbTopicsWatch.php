<?php

namespace TorrentPier\Toloka\Entities;

use Doctrine\ORM\Mapping as ORM;

/**
 * BbTopicsWatch
 *
 * @ORM\Table(name="bb_topics_watch", indexes={@ORM\Index(name="topic_id", columns={"topic_id"}), @ORM\Index(name="user_id", columns={"user_id"}), @ORM\Index(name="notify_status", columns={"notify_status"})})
 * @ORM\Entity
 */
class BbTopicsWatch
{
    /**
     * @var integer
     *
     * @ORM\Column(name="user_id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="NONE")
     */
    private $userId = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="topic_id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="NONE")
     */
    private $topicId = '0';

    /**
     * @var boolean
     *
     * @ORM\Column(name="notify_status", type="boolean", nullable=false)
     */
    private $notifyStatus = '0';



    /**
     * Set userId
     *
     * @param integer $userId
     *
     * @return BbTopicsWatch
     */
    public function setUserId($userId)
    {
        $this->userId = $userId;

        return $this;
    }

    /**
     * Get userId
     *
     * @return integer
     */
    public function getUserId()
    {
        return $this->userId;
    }

    /**
     * Set topicId
     *
     * @param integer $topicId
     *
     * @return BbTopicsWatch
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
     * Set notifyStatus
     *
     * @param boolean $notifyStatus
     *
     * @return BbTopicsWatch
     */
    public function setNotifyStatus($notifyStatus)
    {
        $this->notifyStatus = $notifyStatus;

        return $this;
    }

    /**
     * Get notifyStatus
     *
     * @return boolean
     */
    public function getNotifyStatus()
    {
        return $this->notifyStatus;
    }
}
