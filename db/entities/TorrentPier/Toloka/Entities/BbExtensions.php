<?php

namespace TorrentPier\Toloka\Entities;

use Doctrine\ORM\Mapping as ORM;

/**
 * BbExtensions
 *
 * @ORM\Table(name="bb_extensions")
 * @ORM\Entity
 */
class BbExtensions
{
    /**
     * @var integer
     *
     * @ORM\Column(name="ext_id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $extId;

    /**
     * @var integer
     *
     * @ORM\Column(name="group_id", type="integer", nullable=false)
     */
    private $groupId = '0';

    /**
     * @var string
     *
     * @ORM\Column(name="extension", type="string", length=100, nullable=false)
     */
    private $extension = '';

    /**
     * @var string
     *
     * @ORM\Column(name="comment", type="string", length=100, nullable=false)
     */
    private $comment = '';



    /**
     * Get extId
     *
     * @return integer
     */
    public function getExtId()
    {
        return $this->extId;
    }

    /**
     * Set groupId
     *
     * @param integer $groupId
     *
     * @return BbExtensions
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
     * Set extension
     *
     * @param string $extension
     *
     * @return BbExtensions
     */
    public function setExtension($extension)
    {
        $this->extension = $extension;

        return $this;
    }

    /**
     * Get extension
     *
     * @return string
     */
    public function getExtension()
    {
        return $this->extension;
    }

    /**
     * Set comment
     *
     * @param string $comment
     *
     * @return BbExtensions
     */
    public function setComment($comment)
    {
        $this->comment = $comment;

        return $this;
    }

    /**
     * Get comment
     *
     * @return string
     */
    public function getComment()
    {
        return $this->comment;
    }
}
