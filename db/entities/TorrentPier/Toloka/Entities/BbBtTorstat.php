<?php

namespace TorrentPier\Toloka\Entities;

use Doctrine\ORM\Mapping as ORM;

/**
 * BbBtTorstat
 *
 * @ORM\Table(name="bb_bt_torstat",options={"charset":"utf8mb4", "collate":"utf8mb4_unicode_ci"})
 * @ORM\Entity
 */
class BbBtTorstat
{
    /**
     * @var integer
     *
     * @ORM\Column(name="topic_id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="NONE")
     */
    private $topicId = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="user_id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="NONE")
     */
    private $userId = '0';

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="last_modified_torstat", type="datetime", nullable=false)
     */
    private $lastModifiedTorstat = 'CURRENT_TIMESTAMP';

    /**
     * @var boolean
     *
     * @ORM\Column(name="completed", type="boolean", nullable=false)
     */
    private $completed = '0';



    /**
     * Set topicId
     *
     * @param integer $topicId
     *
     * @return BbBtTorstat
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
     * Set userId
     *
     * @param integer $userId
     *
     * @return BbBtTorstat
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
     * Set lastModifiedTorstat
     *
     * @param \DateTime $lastModifiedTorstat
     *
     * @return BbBtTorstat
     */
    public function setLastModifiedTorstat($lastModifiedTorstat)
    {
        $this->lastModifiedTorstat = $lastModifiedTorstat;

        return $this;
    }

    /**
     * Get lastModifiedTorstat
     *
     * @return \DateTime
     */
    public function getLastModifiedTorstat()
    {
        return $this->lastModifiedTorstat;
    }

    /**
     * Set completed
     *
     * @param boolean $completed
     *
     * @return BbBtTorstat
     */
    public function setCompleted($completed)
    {
        $this->completed = $completed;

        return $this;
    }

    /**
     * Get completed
     *
     * @return boolean
     */
    public function getCompleted()
    {
        return $this->completed;
    }
}
