<?php

namespace TorrentPier\Toloka\Entities;

use Doctrine\ORM\Mapping as ORM;

/**
 * BbRanks
 *
 * @ORM\Table(name="bb_ranks")
 * @ORM\Entity
 */
class BbRanks
{
    /**
     * @var integer
     *
     * @ORM\Column(name="rank_id", type="smallint", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $rankId;

    /**
     * @var string
     *
     * @ORM\Column(name="rank_title", type="string", length=50, nullable=false)
     */
    private $rankTitle = '';

    /**
     * @var string
     *
     * @ORM\Column(name="rank_image", type="string", length=255, nullable=false)
     */
    private $rankImage = '';

    /**
     * @var string
     *
     * @ORM\Column(name="rank_style", type="string", length=255, nullable=false)
     */
    private $rankStyle = '';



    /**
     * Get rankId
     *
     * @return integer
     */
    public function getRankId()
    {
        return $this->rankId;
    }

    /**
     * Set rankTitle
     *
     * @param string $rankTitle
     *
     * @return BbRanks
     */
    public function setRankTitle($rankTitle)
    {
        $this->rankTitle = $rankTitle;

        return $this;
    }

    /**
     * Get rankTitle
     *
     * @return string
     */
    public function getRankTitle()
    {
        return $this->rankTitle;
    }

    /**
     * Set rankImage
     *
     * @param string $rankImage
     *
     * @return BbRanks
     */
    public function setRankImage($rankImage)
    {
        $this->rankImage = $rankImage;

        return $this;
    }

    /**
     * Get rankImage
     *
     * @return string
     */
    public function getRankImage()
    {
        return $this->rankImage;
    }

    /**
     * Set rankStyle
     *
     * @param string $rankStyle
     *
     * @return BbRanks
     */
    public function setRankStyle($rankStyle)
    {
        $this->rankStyle = $rankStyle;

        return $this;
    }

    /**
     * Get rankStyle
     *
     * @return string
     */
    public function getRankStyle()
    {
        return $this->rankStyle;
    }
}
