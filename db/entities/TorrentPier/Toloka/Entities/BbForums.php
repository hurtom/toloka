<?php

namespace TorrentPier\Toloka\Entities;

use Doctrine\ORM\Mapping as ORM;

/**
 * BbForums
 *
 * @ORM\Table(name="bb_forums", indexes={@ORM\Index(name="forums_order", columns={"forum_order"}), @ORM\Index(name="cat_id", columns={"cat_id"}), @ORM\Index(name="forum_last_post_id", columns={"forum_last_post_id"}), @ORM\Index(name="forum_parent", columns={"forum_parent"})})
 * @ORM\Entity
 */
class BbForums
{
    /**
     * @var integer
     *
     * @ORM\Column(name="forum_id", type="smallint", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $forumId;

    /**
     * @var integer
     *
     * @ORM\Column(name="cat_id", type="smallint", nullable=false)
     */
    private $catId = '0';

    /**
     * @var string
     *
     * @ORM\Column(name="forum_name", type="string", length=150, nullable=false)
     */
    private $forumName = '';

    /**
     * @var string
     *
     * @ORM\Column(name="forum_desc", type="text", length=65535, nullable=false)
     */
    private $forumDesc;

    /**
     * @var boolean
     *
     * @ORM\Column(name="forum_status", type="boolean", nullable=false)
     */
    private $forumStatus = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="forum_order", type="smallint", nullable=false)
     */
    private $forumOrder = '1';

    /**
     * @var integer
     *
     * @ORM\Column(name="forum_posts", type="integer", nullable=false)
     */
    private $forumPosts = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="forum_topics", type="integer", nullable=false)
     */
    private $forumTopics = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="forum_last_post_id", type="integer", nullable=false)
     */
    private $forumLastPostId = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="forum_tpl_id", type="smallint", nullable=false)
     */
    private $forumTplId = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="prune_days", type="smallint", nullable=false)
     */
    private $pruneDays = '0';

    /**
     * @var boolean
     *
     * @ORM\Column(name="auth_view", type="boolean", nullable=false)
     */
    private $authView = '0';

    /**
     * @var boolean
     *
     * @ORM\Column(name="auth_read", type="boolean", nullable=false)
     */
    private $authRead = '0';

    /**
     * @var boolean
     *
     * @ORM\Column(name="auth_post", type="boolean", nullable=false)
     */
    private $authPost = '0';

    /**
     * @var boolean
     *
     * @ORM\Column(name="auth_reply", type="boolean", nullable=false)
     */
    private $authReply = '0';

    /**
     * @var boolean
     *
     * @ORM\Column(name="auth_edit", type="boolean", nullable=false)
     */
    private $authEdit = '0';

    /**
     * @var boolean
     *
     * @ORM\Column(name="auth_delete", type="boolean", nullable=false)
     */
    private $authDelete = '0';

    /**
     * @var boolean
     *
     * @ORM\Column(name="auth_sticky", type="boolean", nullable=false)
     */
    private $authSticky = '0';

    /**
     * @var boolean
     *
     * @ORM\Column(name="auth_announce", type="boolean", nullable=false)
     */
    private $authAnnounce = '0';

    /**
     * @var boolean
     *
     * @ORM\Column(name="auth_vote", type="boolean", nullable=false)
     */
    private $authVote = '0';

    /**
     * @var boolean
     *
     * @ORM\Column(name="auth_pollcreate", type="boolean", nullable=false)
     */
    private $authPollcreate = '0';

    /**
     * @var boolean
     *
     * @ORM\Column(name="auth_attachments", type="boolean", nullable=false)
     */
    private $authAttachments = '0';

    /**
     * @var boolean
     *
     * @ORM\Column(name="auth_download", type="boolean", nullable=false)
     */
    private $authDownload = '0';

    /**
     * @var boolean
     *
     * @ORM\Column(name="allow_reg_tracker", type="boolean", nullable=false)
     */
    private $allowRegTracker = '0';

    /**
     * @var boolean
     *
     * @ORM\Column(name="allow_porno_topic", type="boolean", nullable=false)
     */
    private $allowPornoTopic = '0';

    /**
     * @var boolean
     *
     * @ORM\Column(name="self_moderated", type="boolean", nullable=false)
     */
    private $selfModerated = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="forum_parent", type="smallint", nullable=false)
     */
    private $forumParent = '0';

    /**
     * @var boolean
     *
     * @ORM\Column(name="show_on_index", type="boolean", nullable=false)
     */
    private $showOnIndex = '1';

    /**
     * @var boolean
     *
     * @ORM\Column(name="forum_display_sort", type="boolean", nullable=false)
     */
    private $forumDisplaySort = '0';

    /**
     * @var boolean
     *
     * @ORM\Column(name="forum_display_order", type="boolean", nullable=false)
     */
    private $forumDisplayOrder = '0';



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
     * Set catId
     *
     * @param integer $catId
     *
     * @return BbForums
     */
    public function setCatId($catId)
    {
        $this->catId = $catId;

        return $this;
    }

    /**
     * Get catId
     *
     * @return integer
     */
    public function getCatId()
    {
        return $this->catId;
    }

    /**
     * Set forumName
     *
     * @param string $forumName
     *
     * @return BbForums
     */
    public function setForumName($forumName)
    {
        $this->forumName = $forumName;

        return $this;
    }

    /**
     * Get forumName
     *
     * @return string
     */
    public function getForumName()
    {
        return $this->forumName;
    }

    /**
     * Set forumDesc
     *
     * @param string $forumDesc
     *
     * @return BbForums
     */
    public function setForumDesc($forumDesc)
    {
        $this->forumDesc = $forumDesc;

        return $this;
    }

    /**
     * Get forumDesc
     *
     * @return string
     */
    public function getForumDesc()
    {
        return $this->forumDesc;
    }

    /**
     * Set forumStatus
     *
     * @param boolean $forumStatus
     *
     * @return BbForums
     */
    public function setForumStatus($forumStatus)
    {
        $this->forumStatus = $forumStatus;

        return $this;
    }

    /**
     * Get forumStatus
     *
     * @return boolean
     */
    public function getForumStatus()
    {
        return $this->forumStatus;
    }

    /**
     * Set forumOrder
     *
     * @param integer $forumOrder
     *
     * @return BbForums
     */
    public function setForumOrder($forumOrder)
    {
        $this->forumOrder = $forumOrder;

        return $this;
    }

    /**
     * Get forumOrder
     *
     * @return integer
     */
    public function getForumOrder()
    {
        return $this->forumOrder;
    }

    /**
     * Set forumPosts
     *
     * @param integer $forumPosts
     *
     * @return BbForums
     */
    public function setForumPosts($forumPosts)
    {
        $this->forumPosts = $forumPosts;

        return $this;
    }

    /**
     * Get forumPosts
     *
     * @return integer
     */
    public function getForumPosts()
    {
        return $this->forumPosts;
    }

    /**
     * Set forumTopics
     *
     * @param integer $forumTopics
     *
     * @return BbForums
     */
    public function setForumTopics($forumTopics)
    {
        $this->forumTopics = $forumTopics;

        return $this;
    }

    /**
     * Get forumTopics
     *
     * @return integer
     */
    public function getForumTopics()
    {
        return $this->forumTopics;
    }

    /**
     * Set forumLastPostId
     *
     * @param integer $forumLastPostId
     *
     * @return BbForums
     */
    public function setForumLastPostId($forumLastPostId)
    {
        $this->forumLastPostId = $forumLastPostId;

        return $this;
    }

    /**
     * Get forumLastPostId
     *
     * @return integer
     */
    public function getForumLastPostId()
    {
        return $this->forumLastPostId;
    }

    /**
     * Set forumTplId
     *
     * @param integer $forumTplId
     *
     * @return BbForums
     */
    public function setForumTplId($forumTplId)
    {
        $this->forumTplId = $forumTplId;

        return $this;
    }

    /**
     * Get forumTplId
     *
     * @return integer
     */
    public function getForumTplId()
    {
        return $this->forumTplId;
    }

    /**
     * Set pruneDays
     *
     * @param integer $pruneDays
     *
     * @return BbForums
     */
    public function setPruneDays($pruneDays)
    {
        $this->pruneDays = $pruneDays;

        return $this;
    }

    /**
     * Get pruneDays
     *
     * @return integer
     */
    public function getPruneDays()
    {
        return $this->pruneDays;
    }

    /**
     * Set authView
     *
     * @param boolean $authView
     *
     * @return BbForums
     */
    public function setAuthView($authView)
    {
        $this->authView = $authView;

        return $this;
    }

    /**
     * Get authView
     *
     * @return boolean
     */
    public function getAuthView()
    {
        return $this->authView;
    }

    /**
     * Set authRead
     *
     * @param boolean $authRead
     *
     * @return BbForums
     */
    public function setAuthRead($authRead)
    {
        $this->authRead = $authRead;

        return $this;
    }

    /**
     * Get authRead
     *
     * @return boolean
     */
    public function getAuthRead()
    {
        return $this->authRead;
    }

    /**
     * Set authPost
     *
     * @param boolean $authPost
     *
     * @return BbForums
     */
    public function setAuthPost($authPost)
    {
        $this->authPost = $authPost;

        return $this;
    }

    /**
     * Get authPost
     *
     * @return boolean
     */
    public function getAuthPost()
    {
        return $this->authPost;
    }

    /**
     * Set authReply
     *
     * @param boolean $authReply
     *
     * @return BbForums
     */
    public function setAuthReply($authReply)
    {
        $this->authReply = $authReply;

        return $this;
    }

    /**
     * Get authReply
     *
     * @return boolean
     */
    public function getAuthReply()
    {
        return $this->authReply;
    }

    /**
     * Set authEdit
     *
     * @param boolean $authEdit
     *
     * @return BbForums
     */
    public function setAuthEdit($authEdit)
    {
        $this->authEdit = $authEdit;

        return $this;
    }

    /**
     * Get authEdit
     *
     * @return boolean
     */
    public function getAuthEdit()
    {
        return $this->authEdit;
    }

    /**
     * Set authDelete
     *
     * @param boolean $authDelete
     *
     * @return BbForums
     */
    public function setAuthDelete($authDelete)
    {
        $this->authDelete = $authDelete;

        return $this;
    }

    /**
     * Get authDelete
     *
     * @return boolean
     */
    public function getAuthDelete()
    {
        return $this->authDelete;
    }

    /**
     * Set authSticky
     *
     * @param boolean $authSticky
     *
     * @return BbForums
     */
    public function setAuthSticky($authSticky)
    {
        $this->authSticky = $authSticky;

        return $this;
    }

    /**
     * Get authSticky
     *
     * @return boolean
     */
    public function getAuthSticky()
    {
        return $this->authSticky;
    }

    /**
     * Set authAnnounce
     *
     * @param boolean $authAnnounce
     *
     * @return BbForums
     */
    public function setAuthAnnounce($authAnnounce)
    {
        $this->authAnnounce = $authAnnounce;

        return $this;
    }

    /**
     * Get authAnnounce
     *
     * @return boolean
     */
    public function getAuthAnnounce()
    {
        return $this->authAnnounce;
    }

    /**
     * Set authVote
     *
     * @param boolean $authVote
     *
     * @return BbForums
     */
    public function setAuthVote($authVote)
    {
        $this->authVote = $authVote;

        return $this;
    }

    /**
     * Get authVote
     *
     * @return boolean
     */
    public function getAuthVote()
    {
        return $this->authVote;
    }

    /**
     * Set authPollcreate
     *
     * @param boolean $authPollcreate
     *
     * @return BbForums
     */
    public function setAuthPollcreate($authPollcreate)
    {
        $this->authPollcreate = $authPollcreate;

        return $this;
    }

    /**
     * Get authPollcreate
     *
     * @return boolean
     */
    public function getAuthPollcreate()
    {
        return $this->authPollcreate;
    }

    /**
     * Set authAttachments
     *
     * @param boolean $authAttachments
     *
     * @return BbForums
     */
    public function setAuthAttachments($authAttachments)
    {
        $this->authAttachments = $authAttachments;

        return $this;
    }

    /**
     * Get authAttachments
     *
     * @return boolean
     */
    public function getAuthAttachments()
    {
        return $this->authAttachments;
    }

    /**
     * Set authDownload
     *
     * @param boolean $authDownload
     *
     * @return BbForums
     */
    public function setAuthDownload($authDownload)
    {
        $this->authDownload = $authDownload;

        return $this;
    }

    /**
     * Get authDownload
     *
     * @return boolean
     */
    public function getAuthDownload()
    {
        return $this->authDownload;
    }

    /**
     * Set allowRegTracker
     *
     * @param boolean $allowRegTracker
     *
     * @return BbForums
     */
    public function setAllowRegTracker($allowRegTracker)
    {
        $this->allowRegTracker = $allowRegTracker;

        return $this;
    }

    /**
     * Get allowRegTracker
     *
     * @return boolean
     */
    public function getAllowRegTracker()
    {
        return $this->allowRegTracker;
    }

    /**
     * Set allowPornoTopic
     *
     * @param boolean $allowPornoTopic
     *
     * @return BbForums
     */
    public function setAllowPornoTopic($allowPornoTopic)
    {
        $this->allowPornoTopic = $allowPornoTopic;

        return $this;
    }

    /**
     * Get allowPornoTopic
     *
     * @return boolean
     */
    public function getAllowPornoTopic()
    {
        return $this->allowPornoTopic;
    }

    /**
     * Set selfModerated
     *
     * @param boolean $selfModerated
     *
     * @return BbForums
     */
    public function setSelfModerated($selfModerated)
    {
        $this->selfModerated = $selfModerated;

        return $this;
    }

    /**
     * Get selfModerated
     *
     * @return boolean
     */
    public function getSelfModerated()
    {
        return $this->selfModerated;
    }

    /**
     * Set forumParent
     *
     * @param integer $forumParent
     *
     * @return BbForums
     */
    public function setForumParent($forumParent)
    {
        $this->forumParent = $forumParent;

        return $this;
    }

    /**
     * Get forumParent
     *
     * @return integer
     */
    public function getForumParent()
    {
        return $this->forumParent;
    }

    /**
     * Set showOnIndex
     *
     * @param boolean $showOnIndex
     *
     * @return BbForums
     */
    public function setShowOnIndex($showOnIndex)
    {
        $this->showOnIndex = $showOnIndex;

        return $this;
    }

    /**
     * Get showOnIndex
     *
     * @return boolean
     */
    public function getShowOnIndex()
    {
        return $this->showOnIndex;
    }

    /**
     * Set forumDisplaySort
     *
     * @param boolean $forumDisplaySort
     *
     * @return BbForums
     */
    public function setForumDisplaySort($forumDisplaySort)
    {
        $this->forumDisplaySort = $forumDisplaySort;

        return $this;
    }

    /**
     * Get forumDisplaySort
     *
     * @return boolean
     */
    public function getForumDisplaySort()
    {
        return $this->forumDisplaySort;
    }

    /**
     * Set forumDisplayOrder
     *
     * @param boolean $forumDisplayOrder
     *
     * @return BbForums
     */
    public function setForumDisplayOrder($forumDisplayOrder)
    {
        $this->forumDisplayOrder = $forumDisplayOrder;

        return $this;
    }

    /**
     * Get forumDisplayOrder
     *
     * @return boolean
     */
    public function getForumDisplayOrder()
    {
        return $this->forumDisplayOrder;
    }
}
