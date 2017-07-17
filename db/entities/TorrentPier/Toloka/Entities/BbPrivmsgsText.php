<?php

namespace TorrentPier\Toloka\Entities;

use Doctrine\ORM\Mapping as ORM;

/**
 * BbPrivmsgsText
 *
 * @ORM\Table(name="bb_privmsgs_text")
 * @ORM\Entity
 */
class BbPrivmsgsText
{
    /**
     * @var integer
     *
     * @ORM\Column(name="privmsgs_text_id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $privmsgsTextId = '0';

    /**
     * @var string
     *
     * @ORM\Column(name="privmsgs_text", type="text", length=65535, nullable=false)
     */
    private $privmsgsText;



    /**
     * Get privmsgsTextId
     *
     * @return integer
     */
    public function getPrivmsgsTextId()
    {
        return $this->privmsgsTextId;
    }

    /**
     * Set privmsgsText
     *
     * @param string $privmsgsText
     *
     * @return BbPrivmsgsText
     */
    public function setPrivmsgsText($privmsgsText)
    {
        $this->privmsgsText = $privmsgsText;

        return $this;
    }

    /**
     * Get privmsgsText
     *
     * @return string
     */
    public function getPrivmsgsText()
    {
        return $this->privmsgsText;
    }
}
