<?php

namespace TorrentPier\Toloka\Entities;

use Doctrine\ORM\Mapping as ORM;

/**
 * BbSmilies
 *
 * @ORM\Table(name="bb_smilies")
 * @ORM\Entity
 */
class BbSmilies
{
    /**
     * @var integer
     *
     * @ORM\Column(name="smilies_id", type="smallint", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $smiliesId;

    /**
     * @var string
     *
     * @ORM\Column(name="code", type="string", length=50, nullable=false)
     */
    private $code = '';

    /**
     * @var string
     *
     * @ORM\Column(name="smile_url", type="string", length=100, nullable=false)
     */
    private $smileUrl = '';

    /**
     * @var string
     *
     * @ORM\Column(name="emoticon", type="string", length=75, nullable=false)
     */
    private $emoticon = '';



    /**
     * Get smiliesId
     *
     * @return integer
     */
    public function getSmiliesId()
    {
        return $this->smiliesId;
    }

    /**
     * Set code
     *
     * @param string $code
     *
     * @return BbSmilies
     */
    public function setCode($code)
    {
        $this->code = $code;

        return $this;
    }

    /**
     * Get code
     *
     * @return string
     */
    public function getCode()
    {
        return $this->code;
    }

    /**
     * Set smileUrl
     *
     * @param string $smileUrl
     *
     * @return BbSmilies
     */
    public function setSmileUrl($smileUrl)
    {
        $this->smileUrl = $smileUrl;

        return $this;
    }

    /**
     * Get smileUrl
     *
     * @return string
     */
    public function getSmileUrl()
    {
        return $this->smileUrl;
    }

    /**
     * Set emoticon
     *
     * @param string $emoticon
     *
     * @return BbSmilies
     */
    public function setEmoticon($emoticon)
    {
        $this->emoticon = $emoticon;

        return $this;
    }

    /**
     * Get emoticon
     *
     * @return string
     */
    public function getEmoticon()
    {
        return $this->emoticon;
    }
}
