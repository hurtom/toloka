<?php

namespace Database\Entities;

/**
 * BbAds
 */
class BbAds
{
    /**
     * @var integer
     */
    private $adId;

    /**
     * @var string
     */
    private $adBlockIds = '';

    /**
     * @var \DateTime
     */
    private $adStartTime = '0000-00-00 00:00:00';

    /**
     * @var integer
     */
    private $adActiveDays = '0';

    /**
     * @var boolean
     */
    private $adStatus = '1';

    /**
     * @var string
     */
    private $adDesc = '';

    /**
     * @var string
     */
    private $adHtml;


}
