<?php

namespace TorrentPier\Toloka\Entities;

use Doctrine\ORM\Mapping as ORM;

/**
 * BbBtTracker
 *
 * @ORM\Table(name="bb_bt_tracker", indexes={@ORM\Index(name="topic_id", columns={"topic_id"}),@ORM\Index(name="user_id", columns={"user_id"})},options={"charset":"utf8mb4", "collate":"utf8mb4_unicode_ci"})
 * @ORM\Entity
 */
class BbBtTracker
{
    /**
     * @var string
     *
     * @ORM\Column(name="peer_hash", type="string", length=32, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $peerHash = '';

    /**
     * @var integer
     *
     * @ORM\Column(name="topic_id", type="integer", nullable=false)
     */
    private $topicId = '0';

    /**
     * @var string
     *
     * @ORM\Column(name="peer_id", type="string", length=20, nullable=false)
     */
    private $peerId = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="user_id", type="integer", nullable=false)
     */
    private $userId = '0';

    /**
     * @var string
     *
     * @ORM\Column(name="ip", type="string", length=42, nullable=false)
     */
    private $ip = '0';

    /**
     * @var string
     *
     * @ORM\Column(name="ipv6", type="string", length=32, nullable=true)
     */
    private $ipv6;

    /**
     * @var integer
     *
     * @ORM\Column(name="port", type="smallint", nullable=false)
     */
    private $port = '0';

    /**
     * @var string
     *
     * @ORM\Column(name="client", type="string", length=51, nullable=false)
     */
    private $client = 'Unknown';

    /**
     * @var boolean
     *
     * @ORM\Column(name="seeder", type="boolean", nullable=false)
     */
    private $seeder = '0';

    /**
     * @var boolean
     *
     * @ORM\Column(name="releaser", type="boolean", nullable=false)
     */
    private $releaser = '0';

    /**
     * @var boolean
     *
     * @ORM\Column(name="tor_type", type="boolean", nullable=false)
     */
    private $torType = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="uploaded", type="bigint", nullable=false)
     */
    private $uploaded = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="downloaded", type="bigint", nullable=false)
     */
    private $downloaded = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="remain", type="bigint", nullable=false)
     */
    private $remain = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="speed_up", type="integer", nullable=false)
     */
    private $speedUp = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="speed_down", type="integer", nullable=false)
     */
    private $speedDown = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="up_add", type="bigint", nullable=false)
     */
    private $upAdd = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="down_add", type="bigint", nullable=false)
     */
    private $downAdd = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="update_time", type="integer", nullable=false)
     */
    private $updateTime = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="complete_percent", type="bigint", nullable=false)
     */
    private $completePercent = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="complete", type="integer", nullable=false)
     */
    private $complete = '0';



    /**
     * Get peerHash
     *
     * @return string
     */
    public function getPeerHash()
    {
        return $this->peerHash;
    }

    /**
     * Set topicId
     *
     * @param integer $topicId
     *
     * @return BbBtTracker
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
     * Set peerId
     *
     * @param string $peerId
     *
     * @return BbBtTracker
     */
    public function setPeerId($peerId)
    {
        $this->peerId = $peerId;

        return $this;
    }

    /**
     * Get peerId
     *
     * @return string
     */
    public function getPeerId()
    {
        return $this->peerId;
    }

    /**
     * Set userId
     *
     * @param integer $userId
     *
     * @return BbBtTracker
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
     * Set ip
     *
     * @param string $ip
     *
     * @return BbBtTracker
     */
    public function setIp($ip)
    {
        $this->ip = $ip;

        return $this;
    }

    /**
     * Get ip
     *
     * @return string
     */
    public function getIp()
    {
        return $this->ip;
    }

    /**
     * Set ipv6
     *
     * @param string $ipv6
     *
     * @return BbBtTracker
     */
    public function setIpv6($ipv6)
    {
        $this->ipv6 = $ipv6;

        return $this;
    }

    /**
     * Get ipv6
     *
     * @return string
     */
    public function getIpv6()
    {
        return $this->ipv6;
    }

    /**
     * Set port
     *
     * @param integer $port
     *
     * @return BbBtTracker
     */
    public function setPort($port)
    {
        $this->port = $port;

        return $this;
    }

    /**
     * Get port
     *
     * @return integer
     */
    public function getPort()
    {
        return $this->port;
    }

    /**
     * Set client
     *
     * @param string $client
     *
     * @return BbBtTracker
     */
    public function setClient($client)
    {
        $this->client = $client;

        return $this;
    }

    /**
     * Get client
     *
     * @return string
     */
    public function getClient()
    {
        return $this->client;
    }

    /**
     * Set seeder
     *
     * @param boolean $seeder
     *
     * @return BbBtTracker
     */
    public function setSeeder($seeder)
    {
        $this->seeder = $seeder;

        return $this;
    }

    /**
     * Get seeder
     *
     * @return boolean
     */
    public function getSeeder()
    {
        return $this->seeder;
    }

    /**
     * Set releaser
     *
     * @param boolean $releaser
     *
     * @return BbBtTracker
     */
    public function setReleaser($releaser)
    {
        $this->releaser = $releaser;

        return $this;
    }

    /**
     * Get releaser
     *
     * @return boolean
     */
    public function getReleaser()
    {
        return $this->releaser;
    }

    /**
     * Set torType
     *
     * @param boolean $torType
     *
     * @return BbBtTracker
     */
    public function setTorType($torType)
    {
        $this->torType = $torType;

        return $this;
    }

    /**
     * Get torType
     *
     * @return boolean
     */
    public function getTorType()
    {
        return $this->torType;
    }

    /**
     * Set uploaded
     *
     * @param integer $uploaded
     *
     * @return BbBtTracker
     */
    public function setUploaded($uploaded)
    {
        $this->uploaded = $uploaded;

        return $this;
    }

    /**
     * Get uploaded
     *
     * @return integer
     */
    public function getUploaded()
    {
        return $this->uploaded;
    }

    /**
     * Set downloaded
     *
     * @param integer $downloaded
     *
     * @return BbBtTracker
     */
    public function setDownloaded($downloaded)
    {
        $this->downloaded = $downloaded;

        return $this;
    }

    /**
     * Get downloaded
     *
     * @return integer
     */
    public function getDownloaded()
    {
        return $this->downloaded;
    }

    /**
     * Set remain
     *
     * @param integer $remain
     *
     * @return BbBtTracker
     */
    public function setRemain($remain)
    {
        $this->remain = $remain;

        return $this;
    }

    /**
     * Get remain
     *
     * @return integer
     */
    public function getRemain()
    {
        return $this->remain;
    }

    /**
     * Set speedUp
     *
     * @param integer $speedUp
     *
     * @return BbBtTracker
     */
    public function setSpeedUp($speedUp)
    {
        $this->speedUp = $speedUp;

        return $this;
    }

    /**
     * Get speedUp
     *
     * @return integer
     */
    public function getSpeedUp()
    {
        return $this->speedUp;
    }

    /**
     * Set speedDown
     *
     * @param integer $speedDown
     *
     * @return BbBtTracker
     */
    public function setSpeedDown($speedDown)
    {
        $this->speedDown = $speedDown;

        return $this;
    }

    /**
     * Get speedDown
     *
     * @return integer
     */
    public function getSpeedDown()
    {
        return $this->speedDown;
    }

    /**
     * Set upAdd
     *
     * @param integer $upAdd
     *
     * @return BbBtTracker
     */
    public function setUpAdd($upAdd)
    {
        $this->upAdd = $upAdd;

        return $this;
    }

    /**
     * Get upAdd
     *
     * @return integer
     */
    public function getUpAdd()
    {
        return $this->upAdd;
    }

    /**
     * Set downAdd
     *
     * @param integer $downAdd
     *
     * @return BbBtTracker
     */
    public function setDownAdd($downAdd)
    {
        $this->downAdd = $downAdd;

        return $this;
    }

    /**
     * Get downAdd
     *
     * @return integer
     */
    public function getDownAdd()
    {
        return $this->downAdd;
    }

    /**
     * Set updateTime
     *
     * @param integer $updateTime
     *
     * @return BbBtTracker
     */
    public function setUpdateTime($updateTime)
    {
        $this->updateTime = $updateTime;

        return $this;
    }

    /**
     * Get updateTime
     *
     * @return integer
     */
    public function getUpdateTime()
    {
        return $this->updateTime;
    }

    /**
     * Set completePercent
     *
     * @param integer $completePercent
     *
     * @return BbBtTracker
     */
    public function setCompletePercent($completePercent)
    {
        $this->completePercent = $completePercent;

        return $this;
    }

    /**
     * Get completePercent
     *
     * @return integer
     */
    public function getCompletePercent()
    {
        return $this->completePercent;
    }

    /**
     * Set complete
     *
     * @param integer $complete
     *
     * @return BbBtTracker
     */
    public function setComplete($complete)
    {
        $this->complete = $complete;

        return $this;
    }

    /**
     * Get complete
     *
     * @return integer
     */
    public function getComplete()
    {
        return $this->complete;
    }
}
