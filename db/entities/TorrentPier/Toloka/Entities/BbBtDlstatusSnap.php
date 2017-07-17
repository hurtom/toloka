<?php

namespace TorrentPier\Toloka\Entities;

use Doctrine\ORM\Mapping as ORM;

/**
 * BbBtDlstatusSnap
 *
 * @ORM\Table(name="bb_bt_dlstatus_snap",options={"charset":"utf8mb4", "collate":"utf8mb4_unicode_ci"})
 * @ORM\Entity
 */
class BbBtDlstatusSnap
{
    /**
     * @var integer
     *
     * @ORM\Column(name="topic_id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $topicId = '0';

    /**
     * @var boolean
     *
     * @ORM\Column(name="dl_status", type="boolean", nullable=false)
     */
    private $dlStatus = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="users_count", type="smallint", nullable=false)
     */
    private $usersCount = '0';



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
     * Set dlStatus
     *
     * @param boolean $dlStatus
     *
     * @return BbBtDlstatusSnap
     */
    public function setDlStatus($dlStatus)
    {
        $this->dlStatus = $dlStatus;

        return $this;
    }

    /**
     * Get dlStatus
     *
     * @return boolean
     */
    public function getDlStatus()
    {
        return $this->dlStatus;
    }

    /**
     * Set usersCount
     *
     * @param integer $usersCount
     *
     * @return BbBtDlstatusSnap
     */
    public function setUsersCount($usersCount)
    {
        $this->usersCount = $usersCount;

        return $this;
    }

    /**
     * Get usersCount
     *
     * @return integer
     */
    public function getUsersCount()
    {
        return $this->usersCount;
    }
}
