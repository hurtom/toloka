<?php

namespace TorrentPier\Toloka\Entities;

use Doctrine\ORM\Mapping as ORM;

/**
 * BbUserGroup
 *
 * @ORM\Table(name="bb_user_group", indexes={@ORM\Index(name="user_id", columns={"user_id"})})
 * @ORM\Entity
 */
class BbUserGroup
{
    /**
     * @var integer
     *
     * @ORM\Column(name="group_id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="NONE")
     */
    private $groupId = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="user_id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="NONE")
     */
    private $userId = '0';

    /**
     * @var boolean
     *
     * @ORM\Column(name="user_pending", type="boolean", nullable=false)
     */
    private $userPending = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="user_time", type="integer", nullable=false)
     */
    private $userTime = '0';



    /**
     * Set groupId
     *
     * @param integer $groupId
     *
     * @return BbUserGroup
     */
    public function setGroupId($groupId)
    {
        $this->groupId = $groupId;

        return $this;
    }

    /**
     * Get groupId
     *
     * @return integer
     */
    public function getGroupId()
    {
        return $this->groupId;
    }

    /**
     * Set userId
     *
     * @param integer $userId
     *
     * @return BbUserGroup
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
     * Set userPending
     *
     * @param boolean $userPending
     *
     * @return BbUserGroup
     */
    public function setUserPending($userPending)
    {
        $this->userPending = $userPending;

        return $this;
    }

    /**
     * Get userPending
     *
     * @return boolean
     */
    public function getUserPending()
    {
        return $this->userPending;
    }

    /**
     * Set userTime
     *
     * @param integer $userTime
     *
     * @return BbUserGroup
     */
    public function setUserTime($userTime)
    {
        $this->userTime = $userTime;

        return $this;
    }

    /**
     * Get userTime
     *
     * @return integer
     */
    public function getUserTime()
    {
        return $this->userTime;
    }
}
