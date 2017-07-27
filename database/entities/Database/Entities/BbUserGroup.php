<?php

namespace Database\Entities;

/**
 * BbUserGroup
 */
class BbUserGroup
{
    /**
     * @var integer
     */
    private $groupId = '0';

    /**
     * @var integer
     */
    private $userId = '0';

    /**
     * @var boolean
     */
    private $userPending = '0';

    /**
     * @var integer
     */
    private $userTime = '0';


    /**
     * @var boolean
     */
    private $groupModerator;


}
