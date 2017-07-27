<?php

namespace Database\Entities;

/**
 * BbLog
 */
class BbLog
{
    /**
     * @var integer
     */
    private $logTypeId = '0';

    /**
     * @var integer
     */
    private $logUserId = '0';

    /**
     * @var integer
     */
    private $logForumId = '0';

    /**
     * @var integer
     */
    private $logTopicId = '0';

    /**
     * @var integer
     */
    private $logTime = '0';

    /**
     * @var string
     */
    private $logUserIp = '0';

    /**
     * @var integer
     */
    private $logForumIdNew = '0';

    /**
     * @var integer
     */
    private $logTopicIdNew = '0';

    /**
     * @var string
     */
    private $logTopicTitle = '';

    /**
     * @var string
     */
    private $logTopicTitleNew = '';

    /**
     * @var string
     */
    private $logMsg;


    /**
     * @var integer
     */
    private $id;

    /**
     * @var string
     */
    private $logUsername = '';


}
