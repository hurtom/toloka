<?php

namespace TorrentPier\Toloka\Entities;

use Doctrine\ORM\Mapping as ORM;

/**
 * BbSearchRebuild
 *
 * @ORM\Table(name="bb_search_rebuild")
 * @ORM\Entity
 */
class BbSearchRebuild
{
    /**
     * @var integer
     *
     * @ORM\Column(name="rebuild_session_id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $rebuildSessionId;

    /**
     * @var integer
     *
     * @ORM\Column(name="start_post_id", type="integer", nullable=false)
     */
    private $startPostId = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="end_post_id", type="integer", nullable=false)
     */
    private $endPostId = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="start_time", type="integer", nullable=false)
     */
    private $startTime = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="end_time", type="integer", nullable=false)
     */
    private $endTime = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="last_cycle_time", type="integer", nullable=false)
     */
    private $lastCycleTime = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="session_time", type="integer", nullable=false)
     */
    private $sessionTime = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="session_posts", type="integer", nullable=false)
     */
    private $sessionPosts = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="session_cycles", type="integer", nullable=false)
     */
    private $sessionCycles = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="search_size", type="integer", nullable=false)
     */
    private $searchSize = '0';

    /**
     * @var boolean
     *
     * @ORM\Column(name="rebuild_session_status", type="boolean", nullable=false)
     */
    private $rebuildSessionStatus = '0';



    /**
     * Get rebuildSessionId
     *
     * @return integer
     */
    public function getRebuildSessionId()
    {
        return $this->rebuildSessionId;
    }

    /**
     * Set startPostId
     *
     * @param integer $startPostId
     *
     * @return BbSearchRebuild
     */
    public function setStartPostId($startPostId)
    {
        $this->startPostId = $startPostId;

        return $this;
    }

    /**
     * Get startPostId
     *
     * @return integer
     */
    public function getStartPostId()
    {
        return $this->startPostId;
    }

    /**
     * Set endPostId
     *
     * @param integer $endPostId
     *
     * @return BbSearchRebuild
     */
    public function setEndPostId($endPostId)
    {
        $this->endPostId = $endPostId;

        return $this;
    }

    /**
     * Get endPostId
     *
     * @return integer
     */
    public function getEndPostId()
    {
        return $this->endPostId;
    }

    /**
     * Set startTime
     *
     * @param integer $startTime
     *
     * @return BbSearchRebuild
     */
    public function setStartTime($startTime)
    {
        $this->startTime = $startTime;

        return $this;
    }

    /**
     * Get startTime
     *
     * @return integer
     */
    public function getStartTime()
    {
        return $this->startTime;
    }

    /**
     * Set endTime
     *
     * @param integer $endTime
     *
     * @return BbSearchRebuild
     */
    public function setEndTime($endTime)
    {
        $this->endTime = $endTime;

        return $this;
    }

    /**
     * Get endTime
     *
     * @return integer
     */
    public function getEndTime()
    {
        return $this->endTime;
    }

    /**
     * Set lastCycleTime
     *
     * @param integer $lastCycleTime
     *
     * @return BbSearchRebuild
     */
    public function setLastCycleTime($lastCycleTime)
    {
        $this->lastCycleTime = $lastCycleTime;

        return $this;
    }

    /**
     * Get lastCycleTime
     *
     * @return integer
     */
    public function getLastCycleTime()
    {
        return $this->lastCycleTime;
    }

    /**
     * Set sessionTime
     *
     * @param integer $sessionTime
     *
     * @return BbSearchRebuild
     */
    public function setSessionTime($sessionTime)
    {
        $this->sessionTime = $sessionTime;

        return $this;
    }

    /**
     * Get sessionTime
     *
     * @return integer
     */
    public function getSessionTime()
    {
        return $this->sessionTime;
    }

    /**
     * Set sessionPosts
     *
     * @param integer $sessionPosts
     *
     * @return BbSearchRebuild
     */
    public function setSessionPosts($sessionPosts)
    {
        $this->sessionPosts = $sessionPosts;

        return $this;
    }

    /**
     * Get sessionPosts
     *
     * @return integer
     */
    public function getSessionPosts()
    {
        return $this->sessionPosts;
    }

    /**
     * Set sessionCycles
     *
     * @param integer $sessionCycles
     *
     * @return BbSearchRebuild
     */
    public function setSessionCycles($sessionCycles)
    {
        $this->sessionCycles = $sessionCycles;

        return $this;
    }

    /**
     * Get sessionCycles
     *
     * @return integer
     */
    public function getSessionCycles()
    {
        return $this->sessionCycles;
    }

    /**
     * Set searchSize
     *
     * @param integer $searchSize
     *
     * @return BbSearchRebuild
     */
    public function setSearchSize($searchSize)
    {
        $this->searchSize = $searchSize;

        return $this;
    }

    /**
     * Get searchSize
     *
     * @return integer
     */
    public function getSearchSize()
    {
        return $this->searchSize;
    }

    /**
     * Set rebuildSessionStatus
     *
     * @param boolean $rebuildSessionStatus
     *
     * @return BbSearchRebuild
     */
    public function setRebuildSessionStatus($rebuildSessionStatus)
    {
        $this->rebuildSessionStatus = $rebuildSessionStatus;

        return $this;
    }

    /**
     * Get rebuildSessionStatus
     *
     * @return boolean
     */
    public function getRebuildSessionStatus()
    {
        return $this->rebuildSessionStatus;
    }
}
