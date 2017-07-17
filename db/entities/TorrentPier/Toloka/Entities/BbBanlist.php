<?php

namespace TorrentPier\Toloka\Entities;

use Doctrine\ORM\Mapping as ORM;

/**
 * BbBanlist
 *
 * @ORM\Table(name="bb_banlist", indexes={@ORM\Index(name="ban_ip_user_id", columns={"ban_ip", "ban_userid"})},options={"charset":"utf8mb4", "collate":"utf8mb4_unicode_ci"})
 * @ORM\Entity
 */
class BbBanlist
{
    /**
     * @var integer
     *
     * @ORM\Column(name="ban_id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $banId;

    /**
     * @var integer
     *
     * @ORM\Column(name="ban_userid", type="integer", nullable=false)
     */
    private $banUserid = '0';

    /**
     * @var string
     *
     * @ORM\Column(name="ban_ip", type="string", length=42, nullable=false)
     */
    private $banIp = '0';

    /**
     * @var string
     *
     * @ORM\Column(name="ban_email", type="string", length=255, nullable=false)
     */
    private $banEmail = '';



    /**
     * Get banId
     *
     * @return integer
     */
    public function getBanId()
    {
        return $this->banId;
    }

    /**
     * Set banUserid
     *
     * @param integer $banUserid
     *
     * @return BbBanlist
     */
    public function setBanUserid($banUserid)
    {
        $this->banUserid = $banUserid;

        return $this;
    }

    /**
     * Get banUserid
     *
     * @return integer
     */
    public function getBanUserid()
    {
        return $this->banUserid;
    }

    /**
     * Set banIp
     *
     * @param string $banIp
     *
     * @return BbBanlist
     */
    public function setBanIp($banIp)
    {
        $this->banIp = $banIp;

        return $this;
    }

    /**
     * Get banIp
     *
     * @return string
     */
    public function getBanIp()
    {
        return $this->banIp;
    }

    /**
     * Set banEmail
     *
     * @param string $banEmail
     *
     * @return BbBanlist
     */
    public function setBanEmail($banEmail)
    {
        $this->banEmail = $banEmail;

        return $this;
    }

    /**
     * Get banEmail
     *
     * @return string
     */
    public function getBanEmail()
    {
        return $this->banEmail;
    }
}
