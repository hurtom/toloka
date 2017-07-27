<?php

namespace Database\Entities;

/**
 * BbVoteDesc
 */
class BbVoteDesc
{
    /**
     * @var integer
     */
    private $voteId;

    /**
     * @var integer
     */
    private $topicId = '0';

    /**
     * @var string
     */
    private $voteText;

    /**
     * @var integer
     */
    private $voteStart = '0';

    /**
     * @var integer
     */
    private $voteLength = '0';

    /**
     * @var integer
     */
    private $voteMax = '1';

    /**
     * @var integer
     */
    private $voteVoted = '0';

    /**
     * @var boolean
     */
    private $voteHide = '0';

    /**
     * @var boolean
     */
    private $voteTothide = '0';


}
