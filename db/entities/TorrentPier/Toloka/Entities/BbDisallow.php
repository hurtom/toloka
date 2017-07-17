<?php

namespace TorrentPier\Toloka\Entities;

use Doctrine\ORM\Mapping as ORM;

/**
 * BbDisallow
 *
 * @ORM\Table(name="bb_disallow")
 * @ORM\Entity
 */
class BbDisallow
{
    /**
     * @var integer
     *
     * @ORM\Column(name="disallow_id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $disallowId;

    /**
     * @var string
     *
     * @ORM\Column(name="disallow_username", type="string", length=25, nullable=false)
     */
    private $disallowUsername = '';



    /**
     * Get disallowId
     *
     * @return integer
     */
    public function getDisallowId()
    {
        return $this->disallowId;
    }

    /**
     * Set disallowUsername
     *
     * @param string $disallowUsername
     *
     * @return BbDisallow
     */
    public function setDisallowUsername($disallowUsername)
    {
        $this->disallowUsername = $disallowUsername;

        return $this;
    }

    /**
     * Get disallowUsername
     *
     * @return string
     */
    public function getDisallowUsername()
    {
        return $this->disallowUsername;
    }
}
