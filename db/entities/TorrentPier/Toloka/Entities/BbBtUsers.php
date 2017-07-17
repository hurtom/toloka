<?php

namespace TorrentPier\Toloka\Entities;

use Doctrine\ORM\Mapping as ORM;

/**
 * BbBtUsers
 *
 * @ORM\Table(name="bb_bt_users", uniqueConstraints={@ORM\UniqueConstraint(name="auth_key", columns={"auth_key"})})
 * @ORM\Entity
 */
class BbBtUsers
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
     * @var string
     *
     * @ORM\Column(name="auth_key", type="string", length=10, nullable=false)
     */
    private $authKey = '';

    /**
     * @var integer
     *
     * @ORM\Column(name="u_up_total", type="bigint", nullable=false)
     */
    private $uUpTotal = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="u_down_total", type="bigint", nullable=false)
     */
    private $uDownTotal = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="u_up_release", type="bigint", nullable=false)
     */
    private $uUpRelease = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="u_up_bonus", type="bigint", nullable=false)
     */
    private $uUpBonus = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="up_today", type="bigint", nullable=false)
     */
    private $upToday = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="down_today", type="bigint", nullable=false)
     */
    private $downToday = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="up_release_today", type="bigint", nullable=false)
     */
    private $upReleaseToday = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="up_bonus_today", type="bigint", nullable=false)
     */
    private $upBonusToday = '0';

    /**
     * @var float
     *
     * @ORM\Column(name="points_today", type="float", precision=16, scale=2, nullable=false)
     */
    private $pointsToday = '0.00';

    /**
     * @var integer
     *
     * @ORM\Column(name="up_yesterday", type="bigint", nullable=false)
     */
    private $upYesterday = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="down_yesterday", type="bigint", nullable=false)
     */
    private $downYesterday = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="up_release_yesterday", type="bigint", nullable=false)
     */
    private $upReleaseYesterday = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="up_bonus_yesterday", type="bigint", nullable=false)
     */
    private $upBonusYesterday = '0';

    /**
     * @var float
     *
     * @ORM\Column(name="points_yesterday", type="float", precision=16, scale=2, nullable=false)
     */
    private $pointsYesterday = '0.00';



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
     * Set authKey
     *
     * @param string $authKey
     *
     * @return BbBtUsers
     */
    public function setAuthKey($authKey)
    {
        $this->authKey = $authKey;

        return $this;
    }

    /**
     * Get authKey
     *
     * @return string
     */
    public function getAuthKey()
    {
        return $this->authKey;
    }

    /**
     * Set uUpTotal
     *
     * @param integer $uUpTotal
     *
     * @return BbBtUsers
     */
    public function setUUpTotal($uUpTotal)
    {
        $this->uUpTotal = $uUpTotal;

        return $this;
    }

    /**
     * Get uUpTotal
     *
     * @return integer
     */
    public function getUUpTotal()
    {
        return $this->uUpTotal;
    }

    /**
     * Set uDownTotal
     *
     * @param integer $uDownTotal
     *
     * @return BbBtUsers
     */
    public function setUDownTotal($uDownTotal)
    {
        $this->uDownTotal = $uDownTotal;

        return $this;
    }

    /**
     * Get uDownTotal
     *
     * @return integer
     */
    public function getUDownTotal()
    {
        return $this->uDownTotal;
    }

    /**
     * Set uUpRelease
     *
     * @param integer $uUpRelease
     *
     * @return BbBtUsers
     */
    public function setUUpRelease($uUpRelease)
    {
        $this->uUpRelease = $uUpRelease;

        return $this;
    }

    /**
     * Get uUpRelease
     *
     * @return integer
     */
    public function getUUpRelease()
    {
        return $this->uUpRelease;
    }

    /**
     * Set uUpBonus
     *
     * @param integer $uUpBonus
     *
     * @return BbBtUsers
     */
    public function setUUpBonus($uUpBonus)
    {
        $this->uUpBonus = $uUpBonus;

        return $this;
    }

    /**
     * Get uUpBonus
     *
     * @return integer
     */
    public function getUUpBonus()
    {
        return $this->uUpBonus;
    }

    /**
     * Set upToday
     *
     * @param integer $upToday
     *
     * @return BbBtUsers
     */
    public function setUpToday($upToday)
    {
        $this->upToday = $upToday;

        return $this;
    }

    /**
     * Get upToday
     *
     * @return integer
     */
    public function getUpToday()
    {
        return $this->upToday;
    }

    /**
     * Set downToday
     *
     * @param integer $downToday
     *
     * @return BbBtUsers
     */
    public function setDownToday($downToday)
    {
        $this->downToday = $downToday;

        return $this;
    }

    /**
     * Get downToday
     *
     * @return integer
     */
    public function getDownToday()
    {
        return $this->downToday;
    }

    /**
     * Set upReleaseToday
     *
     * @param integer $upReleaseToday
     *
     * @return BbBtUsers
     */
    public function setUpReleaseToday($upReleaseToday)
    {
        $this->upReleaseToday = $upReleaseToday;

        return $this;
    }

    /**
     * Get upReleaseToday
     *
     * @return integer
     */
    public function getUpReleaseToday()
    {
        return $this->upReleaseToday;
    }

    /**
     * Set upBonusToday
     *
     * @param integer $upBonusToday
     *
     * @return BbBtUsers
     */
    public function setUpBonusToday($upBonusToday)
    {
        $this->upBonusToday = $upBonusToday;

        return $this;
    }

    /**
     * Get upBonusToday
     *
     * @return integer
     */
    public function getUpBonusToday()
    {
        return $this->upBonusToday;
    }

    /**
     * Set pointsToday
     *
     * @param float $pointsToday
     *
     * @return BbBtUsers
     */
    public function setPointsToday($pointsToday)
    {
        $this->pointsToday = $pointsToday;

        return $this;
    }

    /**
     * Get pointsToday
     *
     * @return float
     */
    public function getPointsToday()
    {
        return $this->pointsToday;
    }

    /**
     * Set upYesterday
     *
     * @param integer $upYesterday
     *
     * @return BbBtUsers
     */
    public function setUpYesterday($upYesterday)
    {
        $this->upYesterday = $upYesterday;

        return $this;
    }

    /**
     * Get upYesterday
     *
     * @return integer
     */
    public function getUpYesterday()
    {
        return $this->upYesterday;
    }

    /**
     * Set downYesterday
     *
     * @param integer $downYesterday
     *
     * @return BbBtUsers
     */
    public function setDownYesterday($downYesterday)
    {
        $this->downYesterday = $downYesterday;

        return $this;
    }

    /**
     * Get downYesterday
     *
     * @return integer
     */
    public function getDownYesterday()
    {
        return $this->downYesterday;
    }

    /**
     * Set upReleaseYesterday
     *
     * @param integer $upReleaseYesterday
     *
     * @return BbBtUsers
     */
    public function setUpReleaseYesterday($upReleaseYesterday)
    {
        $this->upReleaseYesterday = $upReleaseYesterday;

        return $this;
    }

    /**
     * Get upReleaseYesterday
     *
     * @return integer
     */
    public function getUpReleaseYesterday()
    {
        return $this->upReleaseYesterday;
    }

    /**
     * Set upBonusYesterday
     *
     * @param integer $upBonusYesterday
     *
     * @return BbBtUsers
     */
    public function setUpBonusYesterday($upBonusYesterday)
    {
        $this->upBonusYesterday = $upBonusYesterday;

        return $this;
    }

    /**
     * Get upBonusYesterday
     *
     * @return integer
     */
    public function getUpBonusYesterday()
    {
        return $this->upBonusYesterday;
    }

    /**
     * Set pointsYesterday
     *
     * @param float $pointsYesterday
     *
     * @return BbBtUsers
     */
    public function setPointsYesterday($pointsYesterday)
    {
        $this->pointsYesterday = $pointsYesterday;

        return $this;
    }

    /**
     * Get pointsYesterday
     *
     * @return float
     */
    public function getPointsYesterday()
    {
        return $this->pointsYesterday;
    }
}
