<?php

namespace Database\Entities;

/**
 * BbGroups
 */
class BbGroups
{
    /**
     * @var integer
     */
    private $groupId;

    /**
     * @var integer
     */
    private $avatarExtId = '0';

    /**
     * @var integer
     */
    private $groupTime = '0';

    /**
     * @var integer
     */
    private $modTime = '0';

    /**
     * @var boolean
     */
    private $groupType = '1';

    /**
     * @var boolean
     */
    private $releaseGroup = '0';

    /**
     * @var string
     */
    private $groupName = '';

    /**
     * @var string
     */
    private $groupDescription;

    /**
     * @var string
     */
    private $groupSignature;

    /**
     * @var integer
     */
    private $groupModerator = '0';

    /**
     * @var boolean
     */
    private $groupSingleUser = '1';


}

