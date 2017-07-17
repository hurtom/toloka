<?php

namespace TorrentPier\Toloka\Entities;

use Doctrine\ORM\Mapping as ORM;

/**
 * BbPostsHtml
 *
 * @ORM\Table(name="bb_posts_html")
 * @ORM\Entity
 */
class BbPostsHtml
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
     * @var \DateTime
     *
     * @ORM\Column(name="post_html_time", type="datetime", nullable=false)
     */
    private $postHtmlTime = 'CURRENT_TIMESTAMP';

    /**
     * @var string
     *
     * @ORM\Column(name="post_html", type="text", length=16777215, nullable=false)
     */
    private $postHtml;



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
     * Set postHtmlTime
     *
     * @param \DateTime $postHtmlTime
     *
     * @return BbPostsHtml
     */
    public function setPostHtmlTime($postHtmlTime)
    {
        $this->postHtmlTime = $postHtmlTime;

        return $this;
    }

    /**
     * Get postHtmlTime
     *
     * @return \DateTime
     */
    public function getPostHtmlTime()
    {
        return $this->postHtmlTime;
    }

    /**
     * Set postHtml
     *
     * @param string $postHtml
     *
     * @return BbPostsHtml
     */
    public function setPostHtml($postHtml)
    {
        $this->postHtml = $postHtml;

        return $this;
    }

    /**
     * Get postHtml
     *
     * @return string
     */
    public function getPostHtml()
    {
        return $this->postHtml;
    }
}
