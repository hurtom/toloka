<?php

namespace TorrentPier\Toloka\Entities;

use Doctrine\ORM\Mapping as ORM;

/**
 * BbBtUserSettings
 *
 * @ORM\Table(name="bb_bt_user_settings")
 * @ORM\Entity
 */
class BbBtUserSettings
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
     * @ORM\Column(name="tor_search_set", type="text", length=65535, nullable=false)
     */
    private $torSearchSet;

    /**
     * @var integer
     *
     * @ORM\Column(name="last_modified", type="integer", nullable=false)
     */
    private $lastModified = '0';



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
     * Set torSearchSet
     *
     * @param string $torSearchSet
     *
     * @return BbBtUserSettings
     */
    public function setTorSearchSet($torSearchSet)
    {
        $this->torSearchSet = $torSearchSet;

        return $this;
    }

    /**
     * Get torSearchSet
     *
     * @return string
     */
    public function getTorSearchSet()
    {
        return $this->torSearchSet;
    }

    /**
     * Set lastModified
     *
     * @param integer $lastModified
     *
     * @return BbBtUserSettings
     */
    public function setLastModified($lastModified)
    {
        $this->lastModified = $lastModified;

        return $this;
    }

    /**
     * Get lastModified
     *
     * @return integer
     */
    public function getLastModified()
    {
        return $this->lastModified;
    }
}
