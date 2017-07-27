<?php

namespace Database\Entities;

/**
 * BbVoteVoters
 */
class BbVoteVoters
{
    /**
     * @var integer
     */
    private $voteId = '0';

    /**
     * @var integer
     */
    private $voteUserId = '0';

    /**
     * @var string
     */
    private $voteUserIp = '';

    /**
     * @var string
     */
    private $voteUserResult;

    /**
     * @var string
     */
    private $voteXForwardedFor;

    /**
     * @var integer
     */
    private $voteTimestamp;


}
