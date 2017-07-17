<?php

namespace TorrentPier\Toloka\Entities;

use Doctrine\ORM\Mapping as ORM;

/**
 * BbLog
 *
 * @ORM\Table(name="bb_log", indexes={@ORM\Index(name="log_time", columns={"log_time"}), @ORM\Index(name="log_topic_title", columns={"log_topic_title"})})
 * @ORM\Entity
 */
class BbLog
{
    /**
     * @var integer
     *
     * @ORM\Column(name="log_type_id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="NONE")
     */
    private $logTypeId = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="log_user_id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="NONE")
     */
    private $logUserId = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="log_forum_id", type="smallint", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="NONE")
     */
    private $logForumId = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="log_topic_id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="NONE")
     */
    private $logTopicId = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="log_time", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="NONE")
     */
    private $logTime = '0';

    /**
     * @var string
     *
     * @ORM\Column(name="log_user_ip", type="string", length=42, nullable=false)
     */
    private $logUserIp = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="log_forum_id_new", type="smallint", nullable=false)
     */
    private $logForumIdNew = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="log_topic_id_new", type="integer", nullable=false)
     */
    private $logTopicIdNew = '0';

    /**
     * @var string
     *
     * @ORM\Column(name="log_topic_title", type="string", length=250, nullable=false)
     */
    private $logTopicTitle = '';

    /**
     * @var string
     *
     * @ORM\Column(name="log_topic_title_new", type="string", length=250, nullable=false)
     */
    private $logTopicTitleNew = '';

    /**
     * @var string
     *
     * @ORM\Column(name="log_msg", type="text", length=65535, nullable=false)
     */
    private $logMsg;



    /**
     * Set logTypeId
     *
     * @param integer $logTypeId
     *
     * @return BbLog
     */
    public function setLogTypeId($logTypeId)
    {
        $this->logTypeId = $logTypeId;

        return $this;
    }

    /**
     * Get logTypeId
     *
     * @return integer
     */
    public function getLogTypeId()
    {
        return $this->logTypeId;
    }

    /**
     * Set logUserId
     *
     * @param integer $logUserId
     *
     * @return BbLog
     */
    public function setLogUserId($logUserId)
    {
        $this->logUserId = $logUserId;

        return $this;
    }

    /**
     * Get logUserId
     *
     * @return integer
     */
    public function getLogUserId()
    {
        return $this->logUserId;
    }

    /**
     * Set logForumId
     *
     * @param integer $logForumId
     *
     * @return BbLog
     */
    public function setLogForumId($logForumId)
    {
        $this->logForumId = $logForumId;

        return $this;
    }

    /**
     * Get logForumId
     *
     * @return integer
     */
    public function getLogForumId()
    {
        return $this->logForumId;
    }

    /**
     * Set logTopicId
     *
     * @param integer $logTopicId
     *
     * @return BbLog
     */
    public function setLogTopicId($logTopicId)
    {
        $this->logTopicId = $logTopicId;

        return $this;
    }

    /**
     * Get logTopicId
     *
     * @return integer
     */
    public function getLogTopicId()
    {
        return $this->logTopicId;
    }

    /**
     * Set logTime
     *
     * @param integer $logTime
     *
     * @return BbLog
     */
    public function setLogTime($logTime)
    {
        $this->logTime = $logTime;

        return $this;
    }

    /**
     * Get logTime
     *
     * @return integer
     */
    public function getLogTime()
    {
        return $this->logTime;
    }

    /**
     * Set logUserIp
     *
     * @param string $logUserIp
     *
     * @return BbLog
     */
    public function setLogUserIp($logUserIp)
    {
        $this->logUserIp = $logUserIp;

        return $this;
    }

    /**
     * Get logUserIp
     *
     * @return string
     */
    public function getLogUserIp()
    {
        return $this->logUserIp;
    }

    /**
     * Set logForumIdNew
     *
     * @param integer $logForumIdNew
     *
     * @return BbLog
     */
    public function setLogForumIdNew($logForumIdNew)
    {
        $this->logForumIdNew = $logForumIdNew;

        return $this;
    }

    /**
     * Get logForumIdNew
     *
     * @return integer
     */
    public function getLogForumIdNew()
    {
        return $this->logForumIdNew;
    }

    /**
     * Set logTopicIdNew
     *
     * @param integer $logTopicIdNew
     *
     * @return BbLog
     */
    public function setLogTopicIdNew($logTopicIdNew)
    {
        $this->logTopicIdNew = $logTopicIdNew;

        return $this;
    }

    /**
     * Get logTopicIdNew
     *
     * @return integer
     */
    public function getLogTopicIdNew()
    {
        return $this->logTopicIdNew;
    }

    /**
     * Set logTopicTitle
     *
     * @param string $logTopicTitle
     *
     * @return BbLog
     */
    public function setLogTopicTitle($logTopicTitle)
    {
        $this->logTopicTitle = $logTopicTitle;

        return $this;
    }

    /**
     * Get logTopicTitle
     *
     * @return string
     */
    public function getLogTopicTitle()
    {
        return $this->logTopicTitle;
    }

    /**
     * Set logTopicTitleNew
     *
     * @param string $logTopicTitleNew
     *
     * @return BbLog
     */
    public function setLogTopicTitleNew($logTopicTitleNew)
    {
        $this->logTopicTitleNew = $logTopicTitleNew;

        return $this;
    }

    /**
     * Get logTopicTitleNew
     *
     * @return string
     */
    public function getLogTopicTitleNew()
    {
        return $this->logTopicTitleNew;
    }

    /**
     * Set logMsg
     *
     * @param string $logMsg
     *
     * @return BbLog
     */
    public function setLogMsg($logMsg)
    {
        $this->logMsg = $logMsg;

        return $this;
    }

    /**
     * Get logMsg
     *
     * @return string
     */
    public function getLogMsg()
    {
        return $this->logMsg;
    }
}
