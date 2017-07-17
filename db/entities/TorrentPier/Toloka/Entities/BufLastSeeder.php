<?php

namespace TorrentPier\Toloka\Entities;

use Doctrine\ORM\Mapping as ORM;

/**
 * BufLastSeeder
 *
 * @ORM\Table(name="buf_last_seeder")
 * @ORM\Entity
 */
class BufLastSeeder
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
     * @ORM\Column(name="seeder_last_seen", type="integer", nullable=false)
     */
    private $seederLastSeen = '0';



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
     * Set seederLastSeen
     *
     * @param integer $seederLastSeen
     *
     * @return BufLastSeeder
     */
    public function setSeederLastSeen($seederLastSeen)
    {
        $this->seederLastSeen = $seederLastSeen;

        return $this;
    }

    /**
     * Get seederLastSeen
     *
     * @return integer
     */
    public function getSeederLastSeen()
    {
        return $this->seederLastSeen;
    }
}
