<?php

namespace Database\Entities;

/**
 * BbSearchRebuild
 */
class BbSearchRebuild
{
    /**
     * @var integer
     */
    private $rebuildSessionId;

    /**
     * @var integer
     */
    private $startPostId = '0';

    /**
     * @var integer
     */
    private $endPostId = '0';

    /**
     * @var integer
     */
    private $startTime = '0';

    /**
     * @var integer
     */
    private $endTime = '0';

    /**
     * @var integer
     */
    private $lastCycleTime = '0';

    /**
     * @var integer
     */
    private $sessionTime = '0';

    /**
     * @var integer
     */
    private $sessionPosts = '0';

    /**
     * @var integer
     */
    private $sessionCycles = '0';

    /**
     * @var integer
     */
    private $searchSize = '0';

    /**
     * @var boolean
     */
    private $rebuildSessionStatus = '0';


}
