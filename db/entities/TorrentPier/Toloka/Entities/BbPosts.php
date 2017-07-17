<?php

namespace TorrentPier\Toloka\Entities;

use Doctrine\ORM\Mapping as ORM;

/**
 * BbPosts
 *
 * @ORM\Table(name="bb_posts", indexes={@ORM\Index(name="topic_id", columns={"topic_id"}), @ORM\Index(name="poster_id", columns={"poster_id"}), @ORM\Index(name="post_time", columns={"post_time"}), @ORM\Index(name="forum_id_post_time", columns={"forum_id", "post_time"})})
 * @ORM\Entity
 */
class BbPosts
{
    /**
     * @var integer
     *
     * @ORM\Column(name="post_id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $postId;

    /**
     * @var integer
     *
     * @ORM\Column(name="topic_id", type="integer", nullable=false)
     */
    private $topicId = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="forum_id", type="smallint", nullable=false)
     */
    private $forumId = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="poster_id", type="integer", nullable=false)
     */
    private $posterId = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="post_time", type="integer", nullable=false)
     */
    private $postTime = '0';

    /**
     * @var string
     *
     * @ORM\Column(name="poster_ip", type="string", length=42, nullable=false)
     */
    private $posterIp = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="poster_rg_id", type="integer", nullable=false)
     */
    private $posterRgId = '0';

    /**
     * @var boolean
     *
     * @ORM\Column(name="attach_rg_sig", type="boolean", nullable=false)
     */
    private $attachRgSig = '0';

    /**
     * @var string
     *
     * @ORM\Column(name="post_username", type="string", length=25, nullable=false)
     */
    private $postUsername = '';

    /**
     * @var integer
     *
     * @ORM\Column(name="post_edit_time", type="integer", nullable=false)
     */
    private $postEditTime = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="post_edit_count", type="smallint", nullable=false)
     */
    private $postEditCount = '0';

    /**
     * @var boolean
     *
     * @ORM\Column(name="post_attachment", type="boolean", nullable=false)
     */
    private $postAttachment = '0';

    /**
     * @var boolean
     *
     * @ORM\Column(name="user_post", type="boolean", nullable=false)
     */
    private $userPost = '1';

    /**
     * @var string
     *
     * @ORM\Column(name="mc_comment", type="text", length=65535, nullable=true)
     */
    private $mcComment;

    /**
     * @var boolean
     *
     * @ORM\Column(name="mc_type", type="boolean", nullable=false)
     */
    private $mcType = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="mc_user_id", type="integer", nullable=false)
     */
    private $mcUserId = '0';



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
     * Set topicId
     *
     * @param integer $topicId
     *
     * @return BbPosts
     */
    public function setTopicId($topicId)
    {
        $this->topicId = $topicId;

        return $this;
    }

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
     * Set forumId
     *
     * @param integer $forumId
     *
     * @return BbPosts
     */
    public function setForumId($forumId)
    {
        $this->forumId = $forumId;

        return $this;
    }

    /**
     * Get forumId
     *
     * @return integer
     */
    public function getForumId()
    {
        return $this->forumId;
    }

    /**
     * Set posterId
     *
     * @param integer $posterId
     *
     * @return BbPosts
     */
    public function setPosterId($posterId)
    {
        $this->posterId = $posterId;

        return $this;
    }

    /**
     * Get posterId
     *
     * @return integer
     */
    public function getPosterId()
    {
        return $this->posterId;
    }

    /**
     * Set postTime
     *
     * @param integer $postTime
     *
     * @return BbPosts
     */
    public function setPostTime($postTime)
    {
        $this->postTime = $postTime;

        return $this;
    }

    /**
     * Get postTime
     *
     * @return integer
     */
    public function getPostTime()
    {
        return $this->postTime;
    }

    /**
     * Set posterIp
     *
     * @param string $posterIp
     *
     * @return BbPosts
     */
    public function setPosterIp($posterIp)
    {
        $this->posterIp = $posterIp;

        return $this;
    }

    /**
     * Get posterIp
     *
     * @return string
     */
    public function getPosterIp()
    {
        return $this->posterIp;
    }

    /**
     * Set posterRgId
     *
     * @param integer $posterRgId
     *
     * @return BbPosts
     */
    public function setPosterRgId($posterRgId)
    {
        $this->posterRgId = $posterRgId;

        return $this;
    }

    /**
     * Get posterRgId
     *
     * @return integer
     */
    public function getPosterRgId()
    {
        return $this->posterRgId;
    }

    /**
     * Set attachRgSig
     *
     * @param boolean $attachRgSig
     *
     * @return BbPosts
     */
    public function setAttachRgSig($attachRgSig)
    {
        $this->attachRgSig = $attachRgSig;

        return $this;
    }

    /**
     * Get attachRgSig
     *
     * @return boolean
     */
    public function getAttachRgSig()
    {
        return $this->attachRgSig;
    }

    /**
     * Set postUsername
     *
     * @param string $postUsername
     *
     * @return BbPosts
     */
    public function setPostUsername($postUsername)
    {
        $this->postUsername = $postUsername;

        return $this;
    }

    /**
     * Get postUsername
     *
     * @return string
     */
    public function getPostUsername()
    {
        return $this->postUsername;
    }

    /**
     * Set postEditTime
     *
     * @param integer $postEditTime
     *
     * @return BbPosts
     */
    public function setPostEditTime($postEditTime)
    {
        $this->postEditTime = $postEditTime;

        return $this;
    }

    /**
     * Get postEditTime
     *
     * @return integer
     */
    public function getPostEditTime()
    {
        return $this->postEditTime;
    }

    /**
     * Set postEditCount
     *
     * @param integer $postEditCount
     *
     * @return BbPosts
     */
    public function setPostEditCount($postEditCount)
    {
        $this->postEditCount = $postEditCount;

        return $this;
    }

    /**
     * Get postEditCount
     *
     * @return integer
     */
    public function getPostEditCount()
    {
        return $this->postEditCount;
    }

    /**
     * Set postAttachment
     *
     * @param boolean $postAttachment
     *
     * @return BbPosts
     */
    public function setPostAttachment($postAttachment)
    {
        $this->postAttachment = $postAttachment;

        return $this;
    }

    /**
     * Get postAttachment
     *
     * @return boolean
     */
    public function getPostAttachment()
    {
        return $this->postAttachment;
    }

    /**
     * Set userPost
     *
     * @param boolean $userPost
     *
     * @return BbPosts
     */
    public function setUserPost($userPost)
    {
        $this->userPost = $userPost;

        return $this;
    }

    /**
     * Get userPost
     *
     * @return boolean
     */
    public function getUserPost()
    {
        return $this->userPost;
    }

    /**
     * Set mcComment
     *
     * @param string $mcComment
     *
     * @return BbPosts
     */
    public function setMcComment($mcComment)
    {
        $this->mcComment = $mcComment;

        return $this;
    }

    /**
     * Get mcComment
     *
     * @return string
     */
    public function getMcComment()
    {
        return $this->mcComment;
    }

    /**
     * Set mcType
     *
     * @param boolean $mcType
     *
     * @return BbPosts
     */
    public function setMcType($mcType)
    {
        $this->mcType = $mcType;

        return $this;
    }

    /**
     * Get mcType
     *
     * @return boolean
     */
    public function getMcType()
    {
        return $this->mcType;
    }

    /**
     * Set mcUserId
     *
     * @param integer $mcUserId
     *
     * @return BbPosts
     */
    public function setMcUserId($mcUserId)
    {
        $this->mcUserId = $mcUserId;

        return $this;
    }

    /**
     * Get mcUserId
     *
     * @return integer
     */
    public function getMcUserId()
    {
        return $this->mcUserId;
    }
}
