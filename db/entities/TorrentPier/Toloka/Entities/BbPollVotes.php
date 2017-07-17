<?php

namespace TorrentPier\Toloka\Entities;

use Doctrine\ORM\Mapping as ORM;

/**
 * BbPollVotes
 *
 * @ORM\Table(name="bb_poll_votes")
 * @ORM\Entity
 */
class BbPollVotes
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
     * @var boolean
     *
     * @ORM\Column(name="vote_id", type="boolean", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="NONE")
     */
    private $voteId;

    /**
     * @var string
     *
     * @ORM\Column(name="vote_text", type="string", length=255, nullable=false)
     */
    private $voteText;

    /**
     * @var integer
     *
     * @ORM\Column(name="vote_result", type="integer", nullable=false)
     */
    private $voteResult;



    /**
     * Set topicId
     *
     * @param integer $topicId
     *
     * @return BbPollVotes
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
     * Set voteId
     *
     * @param boolean $voteId
     *
     * @return BbPollVotes
     */
    public function setVoteId($voteId)
    {
        $this->voteId = $voteId;

        return $this;
    }

    /**
     * Get voteId
     *
     * @return boolean
     */
    public function getVoteId()
    {
        return $this->voteId;
    }

    /**
     * Set voteText
     *
     * @param string $voteText
     *
     * @return BbPollVotes
     */
    public function setVoteText($voteText)
    {
        $this->voteText = $voteText;

        return $this;
    }

    /**
     * Get voteText
     *
     * @return string
     */
    public function getVoteText()
    {
        return $this->voteText;
    }

    /**
     * Set voteResult
     *
     * @param integer $voteResult
     *
     * @return BbPollVotes
     */
    public function setVoteResult($voteResult)
    {
        $this->voteResult = $voteResult;

        return $this;
    }

    /**
     * Get voteResult
     *
     * @return integer
     */
    public function getVoteResult()
    {
        return $this->voteResult;
    }
}
