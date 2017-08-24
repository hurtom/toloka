<?php

namespace Database\Entities;

/**
 * BbTopics
 */
class BbTopics
{
    /**
     * @var integer
     */
    private $topicId;

    /**
     * @var integer
     */
    private $forumId = 0;

    /**
     * @var string
     */
    private $topicTitle = '';

    /**
     * @var integer
     */
    private $topicPoster = 0;

    /**
     * @var integer
     */
    private $topicTime = 0;

    /**
     * @var integer
     */
    private $topicViews = 0;

    /**
     * @var integer
     */
    private $topicReplies = 0;

    /**
     * @var boolean
     */
    private $topicStatus = '0';

    /**
     * @var boolean
     */
    private $topicVote = '0';

    /**
     * @var integer
     */
    private $topicType = '0';

    /**
     * @var integer
     */
    private $topicFirstPostId = 0;

    /**
     * @var integer
     */
    private $topicLastPostId = 0;

    /**
     * @var integer
     */
    private $topicMovedId = 0;

    /**
     * @var boolean
     */
    private $topicAttachment = '0';

    /**
     * @var integer
     */
    private $topicDlType = 0;

    /**
     * @var integer
     */
    private $topicLastPostTime = 0;

    /**
     * @var integer
     */
    private $topicShowFirstPost = 0;


}
