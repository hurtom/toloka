<?php

namespace TorrentPier\Toloka\Entities;

use Doctrine\ORM\Mapping as ORM;

/**
 * BbSearchResults
 *
 * @ORM\Table(name="bb_search_results")
 * @ORM\Entity
 */
class BbSearchResults
{
    /**
     * @var string
     *
     * @ORM\Column(name="session_id", type="string", length=20, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="NONE")
     */
    private $sessionId = '';

    /**
     * @var boolean
     *
     * @ORM\Column(name="search_type", type="boolean", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="NONE")
     */
    private $searchType = '0';

    /**
     * @var string
     *
     * @ORM\Column(name="search_id", type="string", length=12, nullable=false)
     */
    private $searchId = '';

    /**
     * @var integer
     *
     * @ORM\Column(name="search_time", type="integer", nullable=false)
     */
    private $searchTime = '0';

    /**
     * @var string
     *
     * @ORM\Column(name="search_settings", type="text", length=65535, nullable=false)
     */
    private $searchSettings;

    /**
     * @var string
     *
     * @ORM\Column(name="search_array", type="text", length=65535, nullable=false)
     */
    private $searchArray;



    /**
     * Set sessionId
     *
     * @param string $sessionId
     *
     * @return BbSearchResults
     */
    public function setSessionId($sessionId)
    {
        $this->sessionId = $sessionId;

        return $this;
    }

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
     * Set searchType
     *
     * @param boolean $searchType
     *
     * @return BbSearchResults
     */
    public function setSearchType($searchType)
    {
        $this->searchType = $searchType;

        return $this;
    }

    /**
     * Get searchType
     *
     * @return boolean
     */
    public function getSearchType()
    {
        return $this->searchType;
    }

    /**
     * Set searchId
     *
     * @param string $searchId
     *
     * @return BbSearchResults
     */
    public function setSearchId($searchId)
    {
        $this->searchId = $searchId;

        return $this;
    }

    /**
     * Get searchId
     *
     * @return string
     */
    public function getSearchId()
    {
        return $this->searchId;
    }

    /**
     * Set searchTime
     *
     * @param integer $searchTime
     *
     * @return BbSearchResults
     */
    public function setSearchTime($searchTime)
    {
        $this->searchTime = $searchTime;

        return $this;
    }

    /**
     * Get searchTime
     *
     * @return integer
     */
    public function getSearchTime()
    {
        return $this->searchTime;
    }

    /**
     * Set searchSettings
     *
     * @param string $searchSettings
     *
     * @return BbSearchResults
     */
    public function setSearchSettings($searchSettings)
    {
        $this->searchSettings = $searchSettings;

        return $this;
    }

    /**
     * Get searchSettings
     *
     * @return string
     */
    public function getSearchSettings()
    {
        return $this->searchSettings;
    }

    /**
     * Set searchArray
     *
     * @param string $searchArray
     *
     * @return BbSearchResults
     */
    public function setSearchArray($searchArray)
    {
        $this->searchArray = $searchArray;

        return $this;
    }

    /**
     * Get searchArray
     *
     * @return string
     */
    public function getSearchArray()
    {
        return $this->searchArray;
    }
}
