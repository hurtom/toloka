<?php

namespace TorrentPier\Toloka\Entities;

use Doctrine\ORM\Mapping as ORM;

/**
 * BbCron
 *
 * @ORM\Table(name="bb_cron", uniqueConstraints={@ORM\UniqueConstraint(name="title", columns={"cron_title"}), @ORM\UniqueConstraint(name="script", columns={"cron_script"})})
 * @ORM\Entity
 */
class BbCron
{
    /**
     * @var integer
     *
     * @ORM\Column(name="cron_id", type="smallint", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $cronId;

    /**
     * @var boolean
     *
     * @ORM\Column(name="cron_active", type="boolean", nullable=false)
     */
    private $cronActive = '1';

    /**
     * @var string
     *
     * @ORM\Column(name="cron_title", type="string", length=120, nullable=false)
     */
    private $cronTitle = '';

    /**
     * @var string
     *
     * @ORM\Column(name="cron_script", type="string", length=120, nullable=false)
     */
    private $cronScript = '';

    /**
     * @var enumcronschedule
     *
     * @ORM\Column(name="schedule", type="enumcronschedule", nullable=false)
     */
    private $schedule = 'daily';

    /**
     * @var enumcronrunday
     *
     * @ORM\Column(name="run_day", type="enumcronrunday", nullable=true)
     */
    private $runDay;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="run_time", type="time", nullable=true)
     */
    private $runTime = '04:00:00';

    /**
     * @var boolean
     *
     * @ORM\Column(name="run_order", type="boolean", nullable=false)
     */
    private $runOrder = '0';

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="last_run", type="datetime", nullable=false)
     */
    private $lastRun = '0000-00-00 00:00:00';

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="next_run", type="datetime", nullable=false)
     */
    private $nextRun = '0000-00-00 00:00:00';

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="run_interval", type="time", nullable=true)
     */
    private $runInterval = '00:00:00';

    /**
     * @var boolean
     *
     * @ORM\Column(name="log_enabled", type="boolean", nullable=false)
     */
    private $logEnabled = '0';

    /**
     * @var string
     *
     * @ORM\Column(name="log_file", type="string", length=120, nullable=false)
     */
    private $logFile = '';

    /**
     * @var boolean
     *
     * @ORM\Column(name="log_sql_queries", type="boolean", nullable=false)
     */
    private $logSqlQueries = '0';

    /**
     * @var boolean
     *
     * @ORM\Column(name="disable_board", type="boolean", nullable=false)
     */
    private $disableBoard = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="run_counter", type="bigint", nullable=false)
     */
    private $runCounter = '0';



    /**
     * Get cronId
     *
     * @return integer
     */
    public function getCronId()
    {
        return $this->cronId;
    }

    /**
     * Set cronActive
     *
     * @param boolean $cronActive
     *
     * @return BbCron
     */
    public function setCronActive($cronActive)
    {
        $this->cronActive = $cronActive;

        return $this;
    }

    /**
     * Get cronActive
     *
     * @return boolean
     */
    public function getCronActive()
    {
        return $this->cronActive;
    }

    /**
     * Set cronTitle
     *
     * @param string $cronTitle
     *
     * @return BbCron
     */
    public function setCronTitle($cronTitle)
    {
        $this->cronTitle = $cronTitle;

        return $this;
    }

    /**
     * Get cronTitle
     *
     * @return string
     */
    public function getCronTitle()
    {
        return $this->cronTitle;
    }

    /**
     * Set cronScript
     *
     * @param string $cronScript
     *
     * @return BbCron
     */
    public function setCronScript($cronScript)
    {
        $this->cronScript = $cronScript;

        return $this;
    }

    /**
     * Get cronScript
     *
     * @return string
     */
    public function getCronScript()
    {
        return $this->cronScript;
    }

    /**
     * Set schedule
     *
     * @param enumcronschedule $schedule
     *
     * @return BbCron
     */
    public function setSchedule($schedule)
    {
        $this->schedule = $schedule;

        return $this;
    }

    /**
     * Get schedule
     *
     * @return enumcronschedule
     */
    public function getSchedule()
    {
        return $this->schedule;
    }

    /**
     * Set runDay
     *
     * @param enumcronschedule $runDay
     *
     * @return BbCron
     */
    public function setRunDay($runDay)
    {
        $this->runDay = $runDay;

        return $this;
    }

    /**
     * Get runDay
     *
     * @return enumcronschedule
     */
    public function getRunDay()
    {
        return $this->runDay;
    }

    /**
     * Set runTime
     *
     * @param \DateTime $runTime
     *
     * @return BbCron
     */
    public function setRunTime($runTime)
    {
        $this->runTime = $runTime;

        return $this;
    }

    /**
     * Get runTime
     *
     * @return \DateTime
     */
    public function getRunTime()
    {
        return $this->runTime;
    }

    /**
     * Set runOrder
     *
     * @param boolean $runOrder
     *
     * @return BbCron
     */
    public function setRunOrder($runOrder)
    {
        $this->runOrder = $runOrder;

        return $this;
    }

    /**
     * Get runOrder
     *
     * @return boolean
     */
    public function getRunOrder()
    {
        return $this->runOrder;
    }

    /**
     * Set lastRun
     *
     * @param \DateTime $lastRun
     *
     * @return BbCron
     */
    public function setLastRun($lastRun)
    {
        $this->lastRun = $lastRun;

        return $this;
    }

    /**
     * Get lastRun
     *
     * @return \DateTime
     */
    public function getLastRun()
    {
        return $this->lastRun;
    }

    /**
     * Set nextRun
     *
     * @param \DateTime $nextRun
     *
     * @return BbCron
     */
    public function setNextRun($nextRun)
    {
        $this->nextRun = $nextRun;

        return $this;
    }

    /**
     * Get nextRun
     *
     * @return \DateTime
     */
    public function getNextRun()
    {
        return $this->nextRun;
    }

    /**
     * Set runInterval
     *
     * @param \DateTime $runInterval
     *
     * @return BbCron
     */
    public function setRunInterval($runInterval)
    {
        $this->runInterval = $runInterval;

        return $this;
    }

    /**
     * Get runInterval
     *
     * @return \DateTime
     */
    public function getRunInterval()
    {
        return $this->runInterval;
    }

    /**
     * Set logEnabled
     *
     * @param boolean $logEnabled
     *
     * @return BbCron
     */
    public function setLogEnabled($logEnabled)
    {
        $this->logEnabled = $logEnabled;

        return $this;
    }

    /**
     * Get logEnabled
     *
     * @return boolean
     */
    public function getLogEnabled()
    {
        return $this->logEnabled;
    }

    /**
     * Set logFile
     *
     * @param string $logFile
     *
     * @return BbCron
     */
    public function setLogFile($logFile)
    {
        $this->logFile = $logFile;

        return $this;
    }

    /**
     * Get logFile
     *
     * @return string
     */
    public function getLogFile()
    {
        return $this->logFile;
    }

    /**
     * Set logSqlQueries
     *
     * @param boolean $logSqlQueries
     *
     * @return BbCron
     */
    public function setLogSqlQueries($logSqlQueries)
    {
        $this->logSqlQueries = $logSqlQueries;

        return $this;
    }

    /**
     * Get logSqlQueries
     *
     * @return boolean
     */
    public function getLogSqlQueries()
    {
        return $this->logSqlQueries;
    }

    /**
     * Set disableBoard
     *
     * @param boolean $disableBoard
     *
     * @return BbCron
     */
    public function setDisableBoard($disableBoard)
    {
        $this->disableBoard = $disableBoard;

        return $this;
    }

    /**
     * Get disableBoard
     *
     * @return boolean
     */
    public function getDisableBoard()
    {
        return $this->disableBoard;
    }

    /**
     * Set runCounter
     *
     * @param integer $runCounter
     *
     * @return BbCron
     */
    public function setRunCounter($runCounter)
    {
        $this->runCounter = $runCounter;

        return $this;
    }

    /**
     * Get runCounter
     *
     * @return integer
     */
    public function getRunCounter()
    {
        return $this->runCounter;
    }
}
