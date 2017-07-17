<?php

namespace TorrentPier\Toloka\Entities;

use Doctrine\ORM\Mapping as ORM;

/**
 * BbSessions
 *
 * @ORM\Table(name="bb_sessions")
 * @ORM\Entity
 */
class BbSessions
{
    /**
     * @var string
     *
     * @ORM\Column(name="session_id", type="string", length=20, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $sessionId = '';

    /**
     * @var integer
     *
     * @ORM\Column(name="session_user_id", type="integer", nullable=false)
     */
    private $sessionUserId = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="session_start", type="integer", nullable=false)
     */
    private $sessionStart = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="session_time", type="integer", nullable=false)
     */
    private $sessionTime = '0';

    /**
     * @var string
     *
     * @ORM\Column(name="session_ip", type="string", length=42, nullable=false)
     */
    private $sessionIp = '0';

    /**
     * @var boolean
     *
     * @ORM\Column(name="session_logged_in", type="boolean", nullable=false)
     */
    private $sessionLoggedIn = '0';

    /**
     * @var boolean
     *
     * @ORM\Column(name="session_admin", type="boolean", nullable=false)
     */
    private $sessionAdmin = '0';



    /**
     * Get sessionId
     *
     * @return string
     */
    public function getSessionId()
    {
        return $this->sessionId;
    }

    /**
     * Set sessionUserId
     *
     * @param integer $sessionUserId
     *
     * @return BbSessions
     */
    public function setSessionUserId($sessionUserId)
    {
        $this->sessionUserId = $sessionUserId;

        return $this;
    }

    /**
     * Get sessionUserId
     *
     * @return integer
     */
    public function getSessionUserId()
    {
        return $this->sessionUserId;
    }

    /**
     * Set sessionStart
     *
     * @param integer $sessionStart
     *
     * @return BbSessions
     */
    public function setSessionStart($sessionStart)
    {
        $this->sessionStart = $sessionStart;

        return $this;
    }

    /**
     * Get sessionStart
     *
     * @return integer
     */
    public function getSessionStart()
    {
        return $this->sessionStart;
    }

    /**
     * Set sessionTime
     *
     * @param integer $sessionTime
     *
     * @return BbSessions
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
     * Set sessionIp
     *
     * @param string $sessionIp
     *
     * @return BbSessions
     */
    public function setSessionIp($sessionIp)
    {
        $this->sessionIp = $sessionIp;

        return $this;
    }

    /**
     * Get sessionIp
     *
     * @return string
     */
    public function getSessionIp()
    {
        return $this->sessionIp;
    }

    /**
     * Set sessionLoggedIn
     *
     * @param boolean $sessionLoggedIn
     *
     * @return BbSessions
     */
    public function setSessionLoggedIn($sessionLoggedIn)
    {
        $this->sessionLoggedIn = $sessionLoggedIn;

        return $this;
    }

    /**
     * Get sessionLoggedIn
     *
     * @return boolean
     */
    public function getSessionLoggedIn()
    {
        return $this->sessionLoggedIn;
    }

    /**
     * Set sessionAdmin
     *
     * @param boolean $sessionAdmin
     *
     * @return BbSessions
     */
    public function setSessionAdmin($sessionAdmin)
    {
        $this->sessionAdmin = $sessionAdmin;

        return $this;
    }

    /**
     * Get sessionAdmin
     *
     * @return boolean
     */
    public function getSessionAdmin()
    {
        return $this->sessionAdmin;
    }
}
