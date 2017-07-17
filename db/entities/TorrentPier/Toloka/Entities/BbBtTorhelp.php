<?php

namespace TorrentPier\Toloka\Entities;

use Doctrine\ORM\Mapping as ORM;

/**
 * BbBtTorhelp
 *
 * @ORM\Table(name="bb_bt_torhelp",options={"charset":"utf8mb4", "collate":"utf8mb4_unicode_ci"})
 * @ORM\Entity
 */
class BbBtTorhelp
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
     * @ORM\Column(name="topic_id_csv", type="text", length=65535, nullable=false)
     */
    private $topicIdCsv;



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
     * Set topicIdCsv
     *
     * @param string $topicIdCsv
     *
     * @return BbBtTorhelp
     */
    public function setTopicIdCsv($topicIdCsv)
    {
        $this->topicIdCsv = $topicIdCsv;

        return $this;
    }

    /**
     * Get topicIdCsv
     *
     * @return string
     */
    public function getTopicIdCsv()
    {
        return $this->topicIdCsv;
    }
}
