<?php

namespace TorrentPier\Toloka\Entities;

use Doctrine\ORM\Mapping as ORM;

/**
 * BbBtLastUserstat
 *
 * @ORM\Table(name="bb_bt_last_userstat",options={"charset":"utf8mb4", "collate":"utf8mb4_unicode_ci"})
 * @ORM\Entity
 */
class BbBtLastUserstat
{
    /**
     * @var integer
     *
     * @ORM\Column(name="user_id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $userId = '0';

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
     * Get userId
     *
     * @return integer
     */
    public function getUserId()
    {
        return $this->userId;
    }

    /**
     * Set upAdd
     *
     * @param integer $upAdd
     *
     * @return BbBtLastUserstat
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
     * @return BbBtLastUserstat
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
     * @return BbBtLastUserstat
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
     * @return BbBtLastUserstat
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
     * @return BbBtLastUserstat
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
     * @return BbBtLastUserstat
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
