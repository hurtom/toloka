<?php

namespace TorrentPier\Toloka\Entities;

use Doctrine\ORM\Mapping as ORM;

/**
 * BbBtDlstatus
 *
 * @ORM\Table(name="bb_bt_dlstatus", indexes={@ORM\Index(name="topic_id", columns={"topic_id"})},options={"charset":"utf8mb4", "collate":"utf8mb4_unicode_ci"})
 * @ORM\Entity
 */
class BbBtDlstatus
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
     * @ORM\Column(name="user_status", type="boolean", nullable=false)
     */
    private $userStatus = '0';

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="last_modified_dlstatus", type="datetime", nullable=false)
     */
    private $lastModifiedDlstatus = 'CURRENT_TIMESTAMP';



    /**
     * Set userId
     *
     * @param integer $userId
     *
     * @return BbBtDlstatus
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
     * @return BbBtDlstatus
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
     * Set userStatus
     *
     * @param boolean $userStatus
     *
     * @return BbBtDlstatus
     */
    public function setUserStatus($userStatus)
    {
        $this->userStatus = $userStatus;

        return $this;
    }

    /**
     * Get userStatus
     *
     * @return boolean
     */
    public function getUserStatus()
    {
        return $this->userStatus;
    }

    /**
     * Set lastModifiedDlstatus
     *
     * @param \DateTime $lastModifiedDlstatus
     *
     * @return BbBtDlstatus
     */
    public function setLastModifiedDlstatus($lastModifiedDlstatus)
    {
        $this->lastModifiedDlstatus = $lastModifiedDlstatus;

        return $this;
    }

    /**
     * Get lastModifiedDlstatus
     *
     * @return \DateTime
     */
    public function getLastModifiedDlstatus()
    {
        return $this->lastModifiedDlstatus;
    }
}
