<?php

namespace Database\Entities;

/**
 * BbSessions
 */
class BbSessions
{
    /**
     * @var string
     */
    private $sessionId = '';

    /**
     * @var integer
     */
    private $sessionUserId = '0';

    /**
     * @var integer
     */
    private $sessionStart = '0';

    /**
     * @var integer
     */
    private $sessionTime = '0';

    /**
     * @var string
     */
    private $sessionIp = '0';

    /**
     * @var boolean
     */
    private $sessionLoggedIn = '0';

    /**
     * @var boolean
     */
    private $sessionAdmin = '0';


}

