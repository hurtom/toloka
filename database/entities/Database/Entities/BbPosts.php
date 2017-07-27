<?php

namespace Database\Entities;

/**
 * BbPosts
 */
class BbPosts
{
    /**
     * @var integer
     */
    private $postId;

    /**
     * @var integer
     */
    private $topicId = '0';

    /**
     * @var integer
     */
    private $forumId = '0';

    /**
     * @var integer
     */
    private $posterId = '0';

    /**
     * @var integer
     */
    private $postTime = '0';

    /**
     * @var string
     */
    private $posterIp = '0';

    /**
     * @var integer
     */
    private $posterRgId = '0';

    /**
     * @var boolean
     */
    private $attachRgSig = '0';

    /**
     * @var string
     */
    private $postUsername = '';

    /**
     * @var integer
     */
    private $postEditTime = '0';

    /**
     * @var integer
     */
    private $postEditCount = '0';

    /**
     * @var boolean
     */
    private $postAttachment = '0';

    /**
     * @var boolean
     */
    private $userPost = '1';

    /**
     * @var string
     */
    private $mcComment;

    /**
     * @var boolean
     */
    private $mcType = '0';

    /**
     * @var integer
     */
    private $mcUserId = '0';


    /**
     * @var integer
     */
    private $postCreated = '0';


}
