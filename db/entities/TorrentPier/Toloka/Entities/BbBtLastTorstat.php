<?php

namespace TorrentPier\Toloka\Entities;

use Doctrine\ORM\Mapping as ORM;

/**
 * BbBtLastTorstat
 *
 * @ORM\Table(name="bb_bt_last_torstat",options={"charset":"utf8mb4", "collate":"utf8mb4_unicode_ci"})
 * @ORM\Entity
 */
class BbBtLastTorstat
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
     * @var boolean
     *
     * @ORM\Column(name="dl_status", type="boolean", nullable=false)
     */
    private $dlStatus = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="up_add", type="bigint", nullable=false)
     */
    private $upAdd = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="down_add", type="bigint", nullable=false)
     */
    private $downAdd = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="release_add", type="bigint", nullable=false)
     */
    private $releaseAdd = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="bonus_add", type="bigint", nullable=false)
     */
    private $bonusAdd = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="speed_up", type="bigint", nullable=false)
     */
    private $speedUp = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="speed_down", type="bigint", nullable=false)
     */
    private $speedDown = '0';



    /**
     * Set topicId
     *
     * @param integer $topicId
     *
     * @return BbBtLastTorstat
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
     * @return BbBtLastTorstat
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
     * Set dlStatus
     *
     * @param boolean $dlStatus
     *
     * @return BbBtLastTorstat
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
     * Set upAdd
     *
     * @param integer $upAdd
     *
     * @return BbBtLastTorstat
     */
    public function setUpAdd($upAdd)
    {
        $this->upAdd = $upAdd;

        return $this;
    }

    /**
     * Get upAdd
     *
     * @return integer
     */
    public function getUpAdd()
    {
        return $this->upAdd;
    }

    /**
     * Set downAdd
     *
     * @param integer $downAdd
     *
     * @return BbBtLastTorstat
     */
    public function setDownAdd($downAdd)
    {
        $this->downAdd = $downAdd;

        return $this;
    }

    /**
     * Get downAdd
     *
     * @return integer
     */
    public function getDownAdd()
    {
        return $this->downAdd;
    }

    /**
     * Set releaseAdd
     *
     * @param integer $releaseAdd
     *
     * @return BbBtLastTorstat
     */
    public function setReleaseAdd($releaseAdd)
    {
        $this->releaseAdd = $releaseAdd;

        return $this;
    }

    /**
     * Get releaseAdd
     *
     * @return integer
     */
    public function getReleaseAdd()
    {
        return $this->releaseAdd;
    }

    /**
     * Set bonusAdd
     *
     * @param integer $bonusAdd
     *
     * @return BbBtLastTorstat
     */
    public function setBonusAdd($bonusAdd)
    {
        $this->bonusAdd = $bonusAdd;

        return $this;
    }

    /**
     * Get bonusAdd
     *
     * @return integer
     */
    public function getBonusAdd()
    {
        return $this->bonusAdd;
    }

    /**
     * Set speedUp
     *
     * @param integer $speedUp
     *
     * @return BbBtLastTorstat
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
     * @return BbBtLastTorstat
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
