<?php

namespace Database\Entities;

/**
 * BbRanks
 */
class BbRanks
{
    /**
     * @var integer
     */
    private $rankId;

    /**
     * @var string
     */
    private $rankTitle = '';

    /**
     * @var string
     */
    private $rankImage = '';

    /**
     * @var string
     */
    private $rankStyle = '';


    /**
     * @var integer
     */
    private $rankMin = '0';

    /**
     * @var boolean
     */
    private $rankSpecial = '1';

    /**
     * @var integer
     */
    private $rankGroup;


}
