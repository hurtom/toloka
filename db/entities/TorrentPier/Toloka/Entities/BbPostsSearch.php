<?php

namespace TorrentPier\Toloka\Entities;

use Doctrine\ORM\Mapping as ORM;

/**
 * BbPostsSearch
 *
 * @ORM\Table(name="bb_posts_search", indexes={@ORM\Index(name="search_words", columns={"search_words"})})
 * @ORM\Entity
 */
class BbPostsSearch
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
     * @ORM\Column(name="search_words", type="text", length=65535, nullable=false)
     */
    private $searchWords;



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
     * Set searchWords
     *
     * @param string $searchWords
     *
     * @return BbPostsSearch
     */
    public function setSearchWords($searchWords)
    {
        $this->searchWords = $searchWords;

        return $this;
    }

    /**
     * Get searchWords
     *
     * @return string
     */
    public function getSearchWords()
    {
        return $this->searchWords;
    }
}
