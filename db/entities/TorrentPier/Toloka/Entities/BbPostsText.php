<?php

namespace TorrentPier\Toloka\Entities;

use Doctrine\ORM\Mapping as ORM;

/**
 * BbPostsText
 *
 * @ORM\Table(name="bb_posts_text")
 * @ORM\Entity
 */
class BbPostsText
{
    /**
     * @var integer
     *
     * @ORM\Column(name="post_id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $postId = '0';

    /**
     * @var string
     *
     * @ORM\Column(name="post_text", type="text", length=65535, nullable=false)
     */
    private $postText;



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
     * Set postText
     *
     * @param string $postText
     *
     * @return BbPostsText
     */
    public function setPostText($postText)
    {
        $this->postText = $postText;

        return $this;
    }

    /**
     * Get postText
     *
     * @return string
     */
    public function getPostText()
    {
        return $this->postText;
    }
}
