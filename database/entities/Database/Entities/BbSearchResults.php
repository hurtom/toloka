<?php

namespace Database\Entities;

/**
 * BbSearchResults
 */
class BbSearchResults
{
    /**
     * @var string
     */
    private $sessionId;

    /**
     * @var integer
     */
    private $searchType = 0;

    /**
     * @var string
     */
    private $searchId = '';

    /**
     * @var integer
     */
    private $searchTime = 0;

    /**
     * @var string
     */
    private $searchSettings;

    /**
     * @var string
     */
    private $searchArray;


}
