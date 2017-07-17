<?php

namespace TorrentPier\Toloka\Entities;

use Doctrine\ORM\Mapping as ORM;

/**
 * BbAttachments
 *
 * @ORM\Table(name="bb_attachments",options={"charset":"utf8mb4", "collate":"utf8mb4_unicode_ci"})
 * @ORM\Entity
 */
class BbAttachments
{
    /**
     * @var integer
     *
     * @ORM\Column(name="attach_id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="NONE")
     */
    private $attachId;

    /**
     * @var integer
     *
     * @ORM\Column(name="post_id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="NONE")
     */
    private $postId = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="user_id_1", type="integer", nullable=false)
     */
    private $userId1 = '0';



    /**
     * Set attachId
     *
     * @param integer $attachId
     *
     * @return BbAttachments
     */
    public function setAttachId($attachId)
    {
        $this->attachId = $attachId;

        return $this;
    }

    /**
     * Get attachId
     *
     * @return integer
     */
    public function getAttachId()
    {
        return $this->attachId;
    }

    /**
     * Set postId
     *
     * @param integer $postId
     *
     * @return BbAttachments
     */
    public function setPostId($postId)
    {
        $this->postId = $postId;

        return $this;
    }

    /**
     * Get postId
     *
     * @return integer
     */
    public function getPostId()
    {
        return $this->postId;
    }

    /**
     * Set userId1
     *
     * @param integer $userId1
     *
     * @return BbAttachments
     */
    public function setUserId1($userId1)
    {
        $this->userId1 = $userId1;

        return $this;
    }

    /**
     * Get userId1
     *
     * @return integer
     */
    public function getUserId1()
    {
        return $this->userId1;
    }
}
