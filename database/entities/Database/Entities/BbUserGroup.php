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
    private $groupId;

    /**
     * @var integer
     */
    private $userId;

    /**
     * @var boolean
     */
    private $userPending = false;

    /**
     * @var integer
     */
    private $userTime = 0;

    /**
     * @var integer
     */
    private $groupModerator = 0;


}
