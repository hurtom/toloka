<?php

namespace Database\Entities;

/**
 * BbExtensionGroups
 */
class BbExtensionGroups
{
    /**
     * @var integer
     */
    private $groupId;

    /**
     * @var string
     */
    private $groupName = '';

    /**
     * @var boolean
     */
    private $catId = '0';

    /**
     * @var boolean
     */
    private $allowGroup = '0';

    /**
     * @var boolean
     */
    private $downloadMode = '1';

    /**
     * @var string
     */
    private $uploadIcon = '';

    /**
     * @var integer
     */
    private $maxFilesize = '0';

    /**
     * @var string
     */
    private $forumPermissions;


}
