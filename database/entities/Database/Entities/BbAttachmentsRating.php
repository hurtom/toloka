<?php

namespace Database\Entities;

/**
 * BbAttachmentsRating
 */
class BbAttachmentsRating
{
    /**
     * @var integer
     */
    private $attachId;

    /**
     * @var integer
     */
    private $userId;

    /**
     * @var boolean
     */
    private $thanked = false;

    /**
     * @var integer
     */
    private $rating = 0;


}
