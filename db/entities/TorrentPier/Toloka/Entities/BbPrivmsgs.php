<?php

namespace TorrentPier\Toloka\Entities;

use Doctrine\ORM\Mapping as ORM;

/**
 * BbPrivmsgs
 *
 * @ORM\Table(name="bb_privmsgs", indexes={@ORM\Index(name="privmsgs_from_userid", columns={"privmsgs_from_userid"}), @ORM\Index(name="privmsgs_to_userid", columns={"privmsgs_to_userid"})})
 * @ORM\Entity
 */
class BbPrivmsgs
{
    /**
     * @var integer
     *
     * @ORM\Column(name="privmsgs_id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $privmsgsId;

    /**
     * @var boolean
     *
     * @ORM\Column(name="privmsgs_type", type="boolean", nullable=false)
     */
    private $privmsgsType = '0';

    /**
     * @var string
     *
     * @ORM\Column(name="privmsgs_subject", type="string", length=255, nullable=false)
     */
    private $privmsgsSubject = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="privmsgs_from_userid", type="integer", nullable=false)
     */
    private $privmsgsFromUserid = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="privmsgs_to_userid", type="integer", nullable=false)
     */
    private $privmsgsToUserid = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="privmsgs_date", type="integer", nullable=false)
     */
    private $privmsgsDate = '0';

    /**
     * @var string
     *
     * @ORM\Column(name="privmsgs_ip", type="string", length=42, nullable=false)
     */
    private $privmsgsIp = '0';



    /**
     * Get privmsgsId
     *
     * @return integer
     */
    public function getPrivmsgsId()
    {
        return $this->privmsgsId;
    }

    /**
     * Set privmsgsType
     *
     * @param boolean $privmsgsType
     *
     * @return BbPrivmsgs
     */
    public function setPrivmsgsType($privmsgsType)
    {
        $this->privmsgsType = $privmsgsType;

        return $this;
    }

    /**
     * Get privmsgsType
     *
     * @return boolean
     */
    public function getPrivmsgsType()
    {
        return $this->privmsgsType;
    }

    /**
     * Set privmsgsSubject
     *
     * @param string $privmsgsSubject
     *
     * @return BbPrivmsgs
     */
    public function setPrivmsgsSubject($privmsgsSubject)
    {
        $this->privmsgsSubject = $privmsgsSubject;

        return $this;
    }

    /**
     * Get privmsgsSubject
     *
     * @return string
     */
    public function getPrivmsgsSubject()
    {
        return $this->privmsgsSubject;
    }

    /**
     * Set privmsgsFromUserid
     *
     * @param integer $privmsgsFromUserid
     *
     * @return BbPrivmsgs
     */
    public function setPrivmsgsFromUserid($privmsgsFromUserid)
    {
        $this->privmsgsFromUserid = $privmsgsFromUserid;

        return $this;
    }

    /**
     * Get privmsgsFromUserid
     *
     * @return integer
     */
    public function getPrivmsgsFromUserid()
    {
        return $this->privmsgsFromUserid;
    }

    /**
     * Set privmsgsToUserid
     *
     * @param integer $privmsgsToUserid
     *
     * @return BbPrivmsgs
     */
    public function setPrivmsgsToUserid($privmsgsToUserid)
    {
        $this->privmsgsToUserid = $privmsgsToUserid;

        return $this;
    }

    /**
     * Get privmsgsToUserid
     *
     * @return integer
     */
    public function getPrivmsgsToUserid()
    {
        return $this->privmsgsToUserid;
    }

    /**
     * Set privmsgsDate
     *
     * @param integer $privmsgsDate
     *
     * @return BbPrivmsgs
     */
    public function setPrivmsgsDate($privmsgsDate)
    {
        $this->privmsgsDate = $privmsgsDate;

        return $this;
    }

    /**
     * Get privmsgsDate
     *
     * @return integer
     */
    public function getPrivmsgsDate()
    {
        return $this->privmsgsDate;
    }

    /**
     * Set privmsgsIp
     *
     * @param string $privmsgsIp
     *
     * @return BbPrivmsgs
     */
    public function setPrivmsgsIp($privmsgsIp)
    {
        $this->privmsgsIp = $privmsgsIp;

        return $this;
    }

    /**
     * Get privmsgsIp
     *
     * @return string
     */
    public function getPrivmsgsIp()
    {
        return $this->privmsgsIp;
    }
}
