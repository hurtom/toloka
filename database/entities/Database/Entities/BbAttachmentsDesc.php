<?php

namespace Database\Entities;

/**
 * BbAttachmentsDesc
 */
class BbAttachmentsDesc
{
    /**
     * @var integer
     */
    private $attachId;

    /**
     * @var string
     */
    private $physicalFilename = '';

    /**
     * @var string
     */
    private $realFilename = '';

    /**
     * @var integer
     */
    private $downloadCount = 0;

    /**
     * @var string
     */
    private $comment = '';

    /**
     * @var string
     */
    private $extension = '';

    /**
     * @var string
     */
    private $mimetype = '';

    /**
     * @var integer
     */
    private $filesize = 0;

    /**
     * @var integer
     */
    private $filetime = 0;

    /**
     * @var boolean
     */
    private $thumbnail = '0';

    /**
     * @var boolean
     */
    private $trackerStatus = '0';

    /**
     * @var integer
     */
    private $thanksCount = 0;

    /**
     * @var integer
     */
    private $ratingSum = 0;

    /**
     * @var integer
     */
    private $ratingCount = 0;

    /**
     * @var boolean
     */
    private $forcePrivate = false;


}
