<?php

namespace TorrentPier\Toloka\Entities;

use Doctrine\ORM\Mapping as ORM;

/**
 * BbQuotaLimits
 *
 * @ORM\Table(name="bb_quota_limits")
 * @ORM\Entity
 */
class BbQuotaLimits
{
    /**
     * @var integer
     *
     * @ORM\Column(name="quota_limit_id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $quotaLimitId;

    /**
     * @var string
     *
     * @ORM\Column(name="quota_desc", type="string", length=20, nullable=false)
     */
    private $quotaDesc = '';

    /**
     * @var integer
     *
     * @ORM\Column(name="quota_limit", type="bigint", nullable=false)
     */
    private $quotaLimit = '0';



    /**
     * Get quotaLimitId
     *
     * @return integer
     */
    public function getQuotaLimitId()
    {
        return $this->quotaLimitId;
    }

    /**
     * Set quotaDesc
     *
     * @param string $quotaDesc
     *
     * @return BbQuotaLimits
     */
    public function setQuotaDesc($quotaDesc)
    {
        $this->quotaDesc = $quotaDesc;

        return $this;
    }

    /**
     * Get quotaDesc
     *
     * @return string
     */
    public function getQuotaDesc()
    {
        return $this->quotaDesc;
    }

    /**
     * Set quotaLimit
     *
     * @param integer $quotaLimit
     *
     * @return BbQuotaLimits
     */
    public function setQuotaLimit($quotaLimit)
    {
        $this->quotaLimit = $quotaLimit;

        return $this;
    }

    /**
     * Get quotaLimit
     *
     * @return integer
     */
    public function getQuotaLimit()
    {
        return $this->quotaLimit;
    }
}
