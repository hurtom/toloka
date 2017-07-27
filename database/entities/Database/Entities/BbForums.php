<?php

namespace Database\Entities;

/**
 * BbForums
 */
class BbForums
{
    /**
     * @var integer
     */
    private $forumId;

    /**
     * @var integer
     */
    private $catId = '0';

    /**
     * @var string
     */
    private $forumName = '';

    /**
     * @var string
     */
    private $forumDesc;

    /**
     * @var boolean
     */
    private $forumStatus = '0';

    /**
     * @var integer
     */
    private $forumOrder = '1';

    /**
     * @var integer
     */
    private $forumPosts = '0';

    /**
     * @var integer
     */
    private $forumTopics = '0';

    /**
     * @var integer
     */
    private $forumLastPostId = '0';

    /**
     * @var integer
     */
    private $forumTplId = '0';

    /**
     * @var integer
     */
    private $pruneDays = '0';

    /**
     * @var boolean
     */
    private $authView = '0';

    /**
     * @var boolean
     */
    private $authRead = '0';

    /**
     * @var boolean
     */
    private $authPost = '0';

    /**
     * @var boolean
     */
    private $authReply = '0';

    /**
     * @var boolean
     */
    private $authEdit = '0';

    /**
     * @var boolean
     */
    private $authDelete = '0';

    /**
     * @var boolean
     */
    private $authSticky = '0';

    /**
     * @var boolean
     */
    private $authAnnounce = '0';

    /**
     * @var boolean
     */
    private $authVote = '0';

    /**
     * @var boolean
     */
    private $authPollcreate = '0';

    /**
     * @var boolean
     */
    private $authAttachments = '0';

    /**
     * @var boolean
     */
    private $authDownload = '0';

    /**
     * @var boolean
     */
    private $allowRegTracker = '0';

    /**
     * @var boolean
     */
    private $allowPornoTopic = '0';

    /**
     * @var boolean
     */
    private $selfModerated = '0';

    /**
     * @var integer
     */
    private $forumParent = '0';

    /**
     * @var boolean
     */
    private $showOnIndex = '1';

    /**
     * @var boolean
     */
    private $forumDisplaySort = '0';

    /**
     * @var boolean
     */
    private $forumDisplayOrder = '0';


}
