<?php

namespace TorrentPier\Toloka\Entities;

use Doctrine\ORM\Mapping as ORM;

/**
 * BbBtTorDlStat
 *
 * @ORM\Table(name="bb_bt_tor_dl_stat",options={"charset":"utf8mb4", "collate":"utf8mb4_unicode_ci"})
 * @ORM\Entity
 */
class BbBtTorDlStat
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
     * @var integer
     *
     * @ORM\Column(name="attach_id", type="integer", nullable=false)
     */
    private $attachId = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="t_up_total", type="bigint", nullable=false)
     */
    private $tUpTotal = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="t_down_total", type="bigint", nullable=false)
     */
    private $tDownTotal = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="t_bonus_total", type="bigint", nullable=false)
     */
    private $tBonusTotal = '0';



    /**
     * Set topicId
     *
     * @param integer $topicId
     *
     * @return BbBtTorDlStat
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
     * @return BbBtTorDlStat
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
     * Set attachId
     *
     * @param integer $attachId
     *
     * @return BbBtTorDlStat
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
     * Set tUpTotal
     *
     * @param integer $tUpTotal
     *
     * @return BbBtTorDlStat
     */
    public function setTUpTotal($tUpTotal)
    {
        $this->tUpTotal = $tUpTotal;

        return $this;
    }

    /**
     * Get tUpTotal
     *
     * @return integer
     */
    public function getTUpTotal()
    {
        return $this->tUpTotal;
    }

    /**
     * Set tDownTotal
     *
     * @param integer $tDownTotal
     *
     * @return BbBtTorDlStat
     */
    public function setTDownTotal($tDownTotal)
    {
        $this->tDownTotal = $tDownTotal;

        return $this;
    }

    /**
     * Get tDownTotal
     *
     * @return integer
     */
    public function getTDownTotal()
    {
        return $this->tDownTotal;
    }

    /**
     * Set tBonusTotal
     *
     * @param integer $tBonusTotal
     *
     * @return BbBtTorDlStat
     */
    public function setTBonusTotal($tBonusTotal)
    {
        $this->tBonusTotal = $tBonusTotal;

        return $this;
    }

    /**
     * Get tBonusTotal
     *
     * @return integer
     */
    public function getTBonusTotal()
    {
        return $this->tBonusTotal;
    }
}
