<?php

namespace TorrentPier\Toloka\Entities;

use Doctrine\ORM\Mapping as ORM;

/**
 * BbBtTrackerSnap
 *
 * @ORM\Table(name="bb_bt_tracker_snap",options={"charset":"utf8mb4", "collate":"utf8mb4_unicode_ci"})
 * @ORM\Entity
 */
class BbBtTrackerSnap
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
     * @var integer
     *
     * @ORM\Column(name="seeders", type="integer", nullable=false)
     */
    private $seeders = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="leechers", type="integer", nullable=false)
     */
    private $leechers = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="speed_up", type="integer", nullable=false)
     */
    private $speedUp = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="speed_down", type="integer", nullable=false)
     */
    private $speedDown = '0';



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
     * Set seeders
     *
     * @param integer $seeders
     *
     * @return BbBtTrackerSnap
     */
    public function setSeeders($seeders)
    {
        $this->seeders = $seeders;

        return $this;
    }

    /**
     * Get seeders
     *
     * @return integer
     */
    public function getSeeders()
    {
        return $this->seeders;
    }

    /**
     * Set leechers
     *
     * @param integer $leechers
     *
     * @return BbBtTrackerSnap
     */
    public function setLeechers($leechers)
    {
        $this->leechers = $leechers;

        return $this;
    }

    /**
     * Get leechers
     *
     * @return integer
     */
    public function getLeechers()
    {
        return $this->leechers;
    }

    /**
     * Set speedUp
     *
     * @param integer $speedUp
     *
     * @return BbBtTrackerSnap
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
     * @return BbBtTrackerSnap
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
