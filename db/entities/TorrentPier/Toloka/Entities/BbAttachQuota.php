<?php

namespace TorrentPier\Toloka\Entities;

use Doctrine\ORM\Mapping as ORM;

/**
 * BbAttachQuota
 *
 * @ORM\Table(name="bb_attach_quota", indexes={@ORM\Index(name="quota_type", columns={"quota_type"})},options={"charset":"utf8mb4", "collate":"utf8mb4_unicode_ci"})
 * @ORM\Entity
 */
class BbAttachQuota
{
    /**
     * @var integer
     *
     * @ORM\Column(name="quota_limit_id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $quotaLimitId = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="user_id", type="integer", nullable=false)
     */
    private $userId = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="group_id", type="integer", nullable=false)
     */
    private $groupId = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="quota_type", type="smallint", nullable=false)
     */
    private $quotaType = '0';



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
     * Set userId
     *
     * @param integer $userId
     *
     * @return BbAttachQuota
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
     * Set groupId
     *
     * @param integer $groupId
     *
     * @return BbAttachQuota
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
     * Set quotaType
     *
     * @param integer $quotaType
     *
     * @return BbAttachQuota
     */
    public function setQuotaType($quotaType)
    {
        $this->quotaType = $quotaType;

        return $this;
    }

    /**
     * Get quotaType
     *
     * @return integer
     */
    public function getQuotaType()
    {
        return $this->quotaType;
    }
}
