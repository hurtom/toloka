<?php

namespace TorrentPier\Toloka\Entities;

use Doctrine\ORM\Mapping as ORM;

/**
 * BbTopics
 *
 * @ORM\Table(name="bb_topics", indexes={@ORM\Index(name="forum_id", columns={"forum_id"}), @ORM\Index(name="topic_last_post_id", columns={"topic_last_post_id"}), @ORM\Index(name="topic_last_post_time", columns={"topic_last_post_time"}), @ORM\Index(name="topic_title", columns={"topic_title"})})
 * @ORM\Entity
 */
class BbTopics
{
    /**
     * @var integer
     *
     * @ORM\Column(name="topic_id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $topicId;

    /**
     * @var integer
     *
     * @ORM\Column(name="forum_id", type="smallint", nullable=false)
     */
    private $forumId = '0';

    /**
     * @var string
     *
     * @ORM\Column(name="topic_title", type="string", length=250, nullable=false)
     */
    private $topicTitle = '';

    /**
     * @var integer
     *
     * @ORM\Column(name="topic_poster", type="integer", nullable=false)
     */
    private $topicPoster = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="topic_time", type="integer", nullable=false)
     */
    private $topicTime = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="topic_views", type="integer", nullable=false)
     */
    private $topicViews = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="topic_replies", type="integer", nullable=false)
     */
    private $topicReplies = '0';

    /**
     * @var boolean
     *
     * @ORM\Column(name="topic_status", type="boolean", nullable=false)
     */
    private $topicStatus = '0';

    /**
     * @var boolean
     *
     * @ORM\Column(name="topic_vote", type="boolean", nullable=false)
     */
    private $topicVote = '0';

    /**
     * @var boolean
     *
     * @ORM\Column(name="topic_type", type="boolean", nullable=false)
     */
    private $topicType = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="topic_first_post_id", type="integer", nullable=false)
     */
    private $topicFirstPostId = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="topic_last_post_id", type="integer", nullable=false)
     */
    private $topicLastPostId = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="topic_moved_id", type="integer", nullable=false)
     */
    private $topicMovedId = '0';

    /**
     * @var boolean
     *
     * @ORM\Column(name="topic_attachment", type="boolean", nullable=false)
     */
    private $topicAttachment = '0';

    /**
     * @var boolean
     *
     * @ORM\Column(name="topic_dl_type", type="boolean", nullable=false)
     */
    private $topicDlType = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="topic_last_post_time", type="integer", nullable=false)
     */
    private $topicLastPostTime = '0';

    /**
     * @var boolean
     *
     * @ORM\Column(name="topic_show_first_post", type="boolean", nullable=false)
     */
    private $topicShowFirstPost = '0';



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
     * @return BbTopics
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
     * Set topicTitle
     *
     * @param string $topicTitle
     *
     * @return BbTopics
     */
    public function setTopicTitle($topicTitle)
    {
        $this->topicTitle = $topicTitle;

        return $this;
    }

    /**
     * Get topicTitle
     *
     * @return string
     */
    public function getTopicTitle()
    {
        return $this->topicTitle;
    }

    /**
     * Set topicPoster
     *
     * @param integer $topicPoster
     *
     * @return BbTopics
     */
    public function setTopicPoster($topicPoster)
    {
        $this->topicPoster = $topicPoster;

        return $this;
    }

    /**
     * Get topicPoster
     *
     * @return integer
     */
    public function getTopicPoster()
    {
        return $this->topicPoster;
    }

    /**
     * Set topicTime
     *
     * @param integer $topicTime
     *
     * @return BbTopics
     */
    public function setTopicTime($topicTime)
    {
        $this->topicTime = $topicTime;

        return $this;
    }

    /**
     * Get topicTime
     *
     * @return integer
     */
    public function getTopicTime()
    {
        return $this->topicTime;
    }

    /**
     * Set topicViews
     *
     * @param integer $topicViews
     *
     * @return BbTopics
     */
    public function setTopicViews($topicViews)
    {
        $this->topicViews = $topicViews;

        return $this;
    }

    /**
     * Get topicViews
     *
     * @return integer
     */
    public function getTopicViews()
    {
        return $this->topicViews;
    }

    /**
     * Set topicReplies
     *
     * @param integer $topicReplies
     *
     * @return BbTopics
     */
    public function setTopicReplies($topicReplies)
    {
        $this->topicReplies = $topicReplies;

        return $this;
    }

    /**
     * Get topicReplies
     *
     * @return integer
     */
    public function getTopicReplies()
    {
        return $this->topicReplies;
    }

    /**
     * Set topicStatus
     *
     * @param boolean $topicStatus
     *
     * @return BbTopics
     */
    public function setTopicStatus($topicStatus)
    {
        $this->topicStatus = $topicStatus;

        return $this;
    }

    /**
     * Get topicStatus
     *
     * @return boolean
     */
    public function getTopicStatus()
    {
        return $this->topicStatus;
    }

    /**
     * Set topicVote
     *
     * @param boolean $topicVote
     *
     * @return BbTopics
     */
    public function setTopicVote($topicVote)
    {
        $this->topicVote = $topicVote;

        return $this;
    }

    /**
     * Get topicVote
     *
     * @return boolean
     */
    public function getTopicVote()
    {
        return $this->topicVote;
    }

    /**
     * Set topicType
     *
     * @param boolean $topicType
     *
     * @return BbTopics
     */
    public function setTopicType($topicType)
    {
        $this->topicType = $topicType;

        return $this;
    }

    /**
     * Get topicType
     *
     * @return boolean
     */
    public function getTopicType()
    {
        return $this->topicType;
    }

    /**
     * Set topicFirstPostId
     *
     * @param integer $topicFirstPostId
     *
     * @return BbTopics
     */
    public function setTopicFirstPostId($topicFirstPostId)
    {
        $this->topicFirstPostId = $topicFirstPostId;

        return $this;
    }

    /**
     * Get topicFirstPostId
     *
     * @return integer
     */
    public function getTopicFirstPostId()
    {
        return $this->topicFirstPostId;
    }

    /**
     * Set topicLastPostId
     *
     * @param integer $topicLastPostId
     *
     * @return BbTopics
     */
    public function setTopicLastPostId($topicLastPostId)
    {
        $this->topicLastPostId = $topicLastPostId;

        return $this;
    }

    /**
     * Get topicLastPostId
     *
     * @return integer
     */
    public function getTopicLastPostId()
    {
        return $this->topicLastPostId;
    }

    /**
     * Set topicMovedId
     *
     * @param integer $topicMovedId
     *
     * @return BbTopics
     */
    public function setTopicMovedId($topicMovedId)
    {
        $this->topicMovedId = $topicMovedId;

        return $this;
    }

    /**
     * Get topicMovedId
     *
     * @return integer
     */
    public function getTopicMovedId()
    {
        return $this->topicMovedId;
    }

    /**
     * Set topicAttachment
     *
     * @param boolean $topicAttachment
     *
     * @return BbTopics
     */
    public function setTopicAttachment($topicAttachment)
    {
        $this->topicAttachment = $topicAttachment;

        return $this;
    }

    /**
     * Get topicAttachment
     *
     * @return boolean
     */
    public function getTopicAttachment()
    {
        return $this->topicAttachment;
    }

    /**
     * Set topicDlType
     *
     * @param boolean $topicDlType
     *
     * @return BbTopics
     */
    public function setTopicDlType($topicDlType)
    {
        $this->topicDlType = $topicDlType;

        return $this;
    }

    /**
     * Get topicDlType
     *
     * @return boolean
     */
    public function getTopicDlType()
    {
        return $this->topicDlType;
    }

    /**
     * Set topicLastPostTime
     *
     * @param integer $topicLastPostTime
     *
     * @return BbTopics
     */
    public function setTopicLastPostTime($topicLastPostTime)
    {
        $this->topicLastPostTime = $topicLastPostTime;

        return $this;
    }

    /**
     * Get topicLastPostTime
     *
     * @return integer
     */
    public function getTopicLastPostTime()
    {
        return $this->topicLastPostTime;
    }

    /**
     * Set topicShowFirstPost
     *
     * @param boolean $topicShowFirstPost
     *
     * @return BbTopics
     */
    public function setTopicShowFirstPost($topicShowFirstPost)
    {
        $this->topicShowFirstPost = $topicShowFirstPost;

        return $this;
    }

    /**
     * Get topicShowFirstPost
     *
     * @return boolean
     */
    public function getTopicShowFirstPost()
    {
        return $this->topicShowFirstPost;
    }
}
