<?php

namespace TorrentPier\Toloka\Entities;

use Doctrine\ORM\Mapping as ORM;

/**
 * BbPollUsers
 *
 * @ORM\Table(name="bb_poll_users")
 * @ORM\Entity
 */
class BbPollUsers
{
    /**
     * @var integer
     *
     * @ORM\Column(name="topic_id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="NONE")
     */
    private $topicId;

    /**
     * @var integer
     *
     * @ORM\Column(name="user_id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="NONE")
     */
    private $userId;

    /**
     * @var string
     *
     * @ORM\Column(name="vote_ip", type="string", length=42, nullable=false)
     */
    private $voteIp = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="vote_dt", type="integer", nullable=false)
     */
    private $voteDt = '0';



    /**
     * Set topicId
     *
     * @param integer $topicId
     *
     * @return BbPollUsers
     */
    public function setTopicId($topicId)
    {
        $this->topicId = $topicId;

        return $this;
    }

    /**
     * Get topicId
     *
     * @return integer
     */
    public function getTopicId()
    {
        return $this->topicId;
    }

    /**
     * Set userId
     *
     * @param integer $userId
     *
     * @return BbPollUsers
     */
    public function setUserId($userId)
    {
        $this->userId = $userId;

        return $this;
    }

    /**
     * Get userId
     *
     * @return integer
     */
    public function getUserId()
    {
        return $this->userId;
    }

    /**
     * Set voteIp
     *
     * @param string $voteIp
     *
     * @return BbPollUsers
     */
    public function setVoteIp($voteIp)
    {
        $this->voteIp = $voteIp;

        return $this;
    }

    /**
     * Get voteIp
     *
     * @return string
     */
    public function getVoteIp()
    {
        return $this->voteIp;
    }

    /**
     * Set voteDt
     *
     * @param integer $voteDt
     *
     * @return BbPollUsers
     */
    public function setVoteDt($voteDt)
    {
        $this->voteDt = $voteDt;

        return $this;
    }

    /**
     * Get voteDt
     *
     * @return integer
     */
    public function getVoteDt()
    {
        return $this->voteDt;
    }
}
