<?php

namespace TorrentPier\Toloka\Entities;

use Doctrine\ORM\Mapping as ORM;

/**
 * BbUsers
 *
 * @ORM\Table(name="bb_users", indexes={@ORM\Index(name="username", columns={"username"}), @ORM\Index(name="user_email", columns={"user_email"}), @ORM\Index(name="user_level", columns={"user_level"})})
 * @ORM\Entity
 */
class BbUsers
{
    /**
     * @var integer
     *
     * @ORM\Column(name="user_id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $userId;

    /**
     * @var boolean
     *
     * @ORM\Column(name="user_active", type="boolean", nullable=false)
     */
    private $userActive = '1';

    /**
     * @var string
     *
     * @ORM\Column(name="username", type="string", length=25, nullable=false)
     */
    private $username = '';

    /**
     * @var string
     *
     * @ORM\Column(name="user_password", type="string", length=32, nullable=false)
     */
    private $userPassword = '';

    /**
     * @var integer
     *
     * @ORM\Column(name="user_session_time", type="integer", nullable=false)
     */
    private $userSessionTime = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="user_lastvisit", type="integer", nullable=false)
     */
    private $userLastvisit = '0';

    /**
     * @var string
     *
     * @ORM\Column(name="user_last_ip", type="string", length=42, nullable=false)
     */
    private $userLastIp = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="user_regdate", type="integer", nullable=false)
     */
    private $userRegdate = '0';

    /**
     * @var string
     *
     * @ORM\Column(name="user_reg_ip", type="string", length=42, nullable=false)
     */
    private $userRegIp = '0';

    /**
     * @var boolean
     *
     * @ORM\Column(name="user_level", type="boolean", nullable=false)
     */
    private $userLevel = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="user_posts", type="integer", nullable=false)
     */
    private $userPosts = '0';

    /**
     * @var string
     *
     * @ORM\Column(name="user_timezone", type="decimal", precision=5, scale=2, nullable=false)
     */
    private $userTimezone = '0.00';

    /**
     * @var string
     *
     * @ORM\Column(name="user_lang", type="string", length=255, nullable=false)
     */
    private $userLang = 'uk';

    /**
     * @var integer
     *
     * @ORM\Column(name="user_new_privmsg", type="smallint", nullable=false)
     */
    private $userNewPrivmsg = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="user_unread_privmsg", type="smallint", nullable=false)
     */
    private $userUnreadPrivmsg = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="user_last_privmsg", type="integer", nullable=false)
     */
    private $userLastPrivmsg = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="user_opt", type="integer", nullable=false)
     */
    private $userOpt = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="user_rank", type="integer", nullable=false)
     */
    private $userRank = '0';

    /**
     * @var boolean
     *
     * @ORM\Column(name="avatar_ext_id", type="boolean", nullable=false)
     */
    private $avatarExtId = '0';

    /**
     * @var boolean
     *
     * @ORM\Column(name="user_gender", type="boolean", nullable=false)
     */
    private $userGender = '0';

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="user_birthday", type="date", nullable=false)
     */
    private $userBirthday = '0000-00-00';

    /**
     * @var string
     *
     * @ORM\Column(name="user_email", type="string", length=255, nullable=false)
     */
    private $userEmail = '';

    /**
     * @var string
     *
     * @ORM\Column(name="user_skype", type="string", length=32, nullable=false)
     */
    private $userSkype = '';

    /**
     * @var string
     *
     * @ORM\Column(name="user_twitter", type="string", length=15, nullable=false)
     */
    private $userTwitter = '';

    /**
     * @var string
     *
     * @ORM\Column(name="user_icq", type="string", length=15, nullable=false)
     */
    private $userIcq = '';

    /**
     * @var string
     *
     * @ORM\Column(name="user_website", type="string", length=100, nullable=false)
     */
    private $userWebsite = '';

    /**
     * @var string
     *
     * @ORM\Column(name="user_from", type="string", length=100, nullable=false)
     */
    private $userFrom = '';

    /**
     * @var string
     *
     * @ORM\Column(name="user_sig", type="text", length=65535, nullable=false)
     */
    private $userSig;

    /**
     * @var string
     *
     * @ORM\Column(name="user_occ", type="string", length=100, nullable=false)
     */
    private $userOcc = '';

    /**
     * @var string
     *
     * @ORM\Column(name="user_interests", type="string", length=255, nullable=false)
     */
    private $userInterests = '';

    /**
     * @var string
     *
     * @ORM\Column(name="user_actkey", type="string", length=32, nullable=false)
     */
    private $userActkey = '';

    /**
     * @var string
     *
     * @ORM\Column(name="user_newpasswd", type="string", length=32, nullable=false)
     */
    private $userNewpasswd = '';

    /**
     * @var string
     *
     * @ORM\Column(name="autologin_id", type="string", length=12, nullable=false)
     */
    private $autologinId = '';

    /**
     * @var integer
     *
     * @ORM\Column(name="user_newest_pm_id", type="integer", nullable=false)
     */
    private $userNewestPmId = '0';

    /**
     * @var float
     *
     * @ORM\Column(name="user_points", type="float", precision=16, scale=2, nullable=false)
     */
    private $userPoints = '0.00';

    /**
     * @var string
     *
     * @ORM\Column(name="tpl_name", type="string", length=255, nullable=false)
     */
    private $tplName = 'default';



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
     * Set userActive
     *
     * @param boolean $userActive
     *
     * @return BbUsers
     */
    public function setUserActive($userActive)
    {
        $this->userActive = $userActive;

        return $this;
    }

    /**
     * Get userActive
     *
     * @return boolean
     */
    public function getUserActive()
    {
        return $this->userActive;
    }

    /**
     * Set username
     *
     * @param string $username
     *
     * @return BbUsers
     */
    public function setUsername($username)
    {
        $this->username = $username;

        return $this;
    }

    /**
     * Get username
     *
     * @return string
     */
    public function getUsername()
    {
        return $this->username;
    }

    /**
     * Set userPassword
     *
     * @param string $userPassword
     *
     * @return BbUsers
     */
    public function setUserPassword($userPassword)
    {
        $this->userPassword = $userPassword;

        return $this;
    }

    /**
     * Get userPassword
     *
     * @return string
     */
    public function getUserPassword()
    {
        return $this->userPassword;
    }

    /**
     * Set userSessionTime
     *
     * @param integer $userSessionTime
     *
     * @return BbUsers
     */
    public function setUserSessionTime($userSessionTime)
    {
        $this->userSessionTime = $userSessionTime;

        return $this;
    }

    /**
     * Get userSessionTime
     *
     * @return integer
     */
    public function getUserSessionTime()
    {
        return $this->userSessionTime;
    }

    /**
     * Set userLastvisit
     *
     * @param integer $userLastvisit
     *
     * @return BbUsers
     */
    public function setUserLastvisit($userLastvisit)
    {
        $this->userLastvisit = $userLastvisit;

        return $this;
    }

    /**
     * Get userLastvisit
     *
     * @return integer
     */
    public function getUserLastvisit()
    {
        return $this->userLastvisit;
    }

    /**
     * Set userLastIp
     *
     * @param string $userLastIp
     *
     * @return BbUsers
     */
    public function setUserLastIp($userLastIp)
    {
        $this->userLastIp = $userLastIp;

        return $this;
    }

    /**
     * Get userLastIp
     *
     * @return string
     */
    public function getUserLastIp()
    {
        return $this->userLastIp;
    }

    /**
     * Set userRegdate
     *
     * @param integer $userRegdate
     *
     * @return BbUsers
     */
    public function setUserRegdate($userRegdate)
    {
        $this->userRegdate = $userRegdate;

        return $this;
    }

    /**
     * Get userRegdate
     *
     * @return integer
     */
    public function getUserRegdate()
    {
        return $this->userRegdate;
    }

    /**
     * Set userRegIp
     *
     * @param string $userRegIp
     *
     * @return BbUsers
     */
    public function setUserRegIp($userRegIp)
    {
        $this->userRegIp = $userRegIp;

        return $this;
    }

    /**
     * Get userRegIp
     *
     * @return string
     */
    public function getUserRegIp()
    {
        return $this->userRegIp;
    }

    /**
     * Set userLevel
     *
     * @param boolean $userLevel
     *
     * @return BbUsers
     */
    public function setUserLevel($userLevel)
    {
        $this->userLevel = $userLevel;

        return $this;
    }

    /**
     * Get userLevel
     *
     * @return boolean
     */
    public function getUserLevel()
    {
        return $this->userLevel;
    }

    /**
     * Set userPosts
     *
     * @param integer $userPosts
     *
     * @return BbUsers
     */
    public function setUserPosts($userPosts)
    {
        $this->userPosts = $userPosts;

        return $this;
    }

    /**
     * Get userPosts
     *
     * @return integer
     */
    public function getUserPosts()
    {
        return $this->userPosts;
    }

    /**
     * Set userTimezone
     *
     * @param string $userTimezone
     *
     * @return BbUsers
     */
    public function setUserTimezone($userTimezone)
    {
        $this->userTimezone = $userTimezone;

        return $this;
    }

    /**
     * Get userTimezone
     *
     * @return string
     */
    public function getUserTimezone()
    {
        return $this->userTimezone;
    }

    /**
     * Set userLang
     *
     * @param string $userLang
     *
     * @return BbUsers
     */
    public function setUserLang($userLang)
    {
        $this->userLang = $userLang;

        return $this;
    }

    /**
     * Get userLang
     *
     * @return string
     */
    public function getUserLang()
    {
        return $this->userLang;
    }

    /**
     * Set userNewPrivmsg
     *
     * @param integer $userNewPrivmsg
     *
     * @return BbUsers
     */
    public function setUserNewPrivmsg($userNewPrivmsg)
    {
        $this->userNewPrivmsg = $userNewPrivmsg;

        return $this;
    }

    /**
     * Get userNewPrivmsg
     *
     * @return integer
     */
    public function getUserNewPrivmsg()
    {
        return $this->userNewPrivmsg;
    }

    /**
     * Set userUnreadPrivmsg
     *
     * @param integer $userUnreadPrivmsg
     *
     * @return BbUsers
     */
    public function setUserUnreadPrivmsg($userUnreadPrivmsg)
    {
        $this->userUnreadPrivmsg = $userUnreadPrivmsg;

        return $this;
    }

    /**
     * Get userUnreadPrivmsg
     *
     * @return integer
     */
    public function getUserUnreadPrivmsg()
    {
        return $this->userUnreadPrivmsg;
    }

    /**
     * Set userLastPrivmsg
     *
     * @param integer $userLastPrivmsg
     *
     * @return BbUsers
     */
    public function setUserLastPrivmsg($userLastPrivmsg)
    {
        $this->userLastPrivmsg = $userLastPrivmsg;

        return $this;
    }

    /**
     * Get userLastPrivmsg
     *
     * @return integer
     */
    public function getUserLastPrivmsg()
    {
        return $this->userLastPrivmsg;
    }

    /**
     * Set userOpt
     *
     * @param integer $userOpt
     *
     * @return BbUsers
     */
    public function setUserOpt($userOpt)
    {
        $this->userOpt = $userOpt;

        return $this;
    }

    /**
     * Get userOpt
     *
     * @return integer
     */
    public function getUserOpt()
    {
        return $this->userOpt;
    }

    /**
     * Set userRank
     *
     * @param integer $userRank
     *
     * @return BbUsers
     */
    public function setUserRank($userRank)
    {
        $this->userRank = $userRank;

        return $this;
    }

    /**
     * Get userRank
     *
     * @return integer
     */
    public function getUserRank()
    {
        return $this->userRank;
    }

    /**
     * Set avatarExtId
     *
     * @param boolean $avatarExtId
     *
     * @return BbUsers
     */
    public function setAvatarExtId($avatarExtId)
    {
        $this->avatarExtId = $avatarExtId;

        return $this;
    }

    /**
     * Get avatarExtId
     *
     * @return boolean
     */
    public function getAvatarExtId()
    {
        return $this->avatarExtId;
    }

    /**
     * Set userGender
     *
     * @param boolean $userGender
     *
     * @return BbUsers
     */
    public function setUserGender($userGender)
    {
        $this->userGender = $userGender;

        return $this;
    }

    /**
     * Get userGender
     *
     * @return boolean
     */
    public function getUserGender()
    {
        return $this->userGender;
    }

    /**
     * Set userBirthday
     *
     * @param \DateTime $userBirthday
     *
     * @return BbUsers
     */
    public function setUserBirthday($userBirthday)
    {
        $this->userBirthday = $userBirthday;

        return $this;
    }

    /**
     * Get userBirthday
     *
     * @return \DateTime
     */
    public function getUserBirthday()
    {
        return $this->userBirthday;
    }

    /**
     * Set userEmail
     *
     * @param string $userEmail
     *
     * @return BbUsers
     */
    public function setUserEmail($userEmail)
    {
        $this->userEmail = $userEmail;

        return $this;
    }

    /**
     * Get userEmail
     *
     * @return string
     */
    public function getUserEmail()
    {
        return $this->userEmail;
    }

    /**
     * Set userSkype
     *
     * @param string $userSkype
     *
     * @return BbUsers
     */
    public function setUserSkype($userSkype)
    {
        $this->userSkype = $userSkype;

        return $this;
    }

    /**
     * Get userSkype
     *
     * @return string
     */
    public function getUserSkype()
    {
        return $this->userSkype;
    }

    /**
     * Set userTwitter
     *
     * @param string $userTwitter
     *
     * @return BbUsers
     */
    public function setUserTwitter($userTwitter)
    {
        $this->userTwitter = $userTwitter;

        return $this;
    }

    /**
     * Get userTwitter
     *
     * @return string
     */
    public function getUserTwitter()
    {
        return $this->userTwitter;
    }

    /**
     * Set userIcq
     *
     * @param string $userIcq
     *
     * @return BbUsers
     */
    public function setUserIcq($userIcq)
    {
        $this->userIcq = $userIcq;

        return $this;
    }

    /**
     * Get userIcq
     *
     * @return string
     */
    public function getUserIcq()
    {
        return $this->userIcq;
    }

    /**
     * Set userWebsite
     *
     * @param string $userWebsite
     *
     * @return BbUsers
     */
    public function setUserWebsite($userWebsite)
    {
        $this->userWebsite = $userWebsite;

        return $this;
    }

    /**
     * Get userWebsite
     *
     * @return string
     */
    public function getUserWebsite()
    {
        return $this->userWebsite;
    }

    /**
     * Set userFrom
     *
     * @param string $userFrom
     *
     * @return BbUsers
     */
    public function setUserFrom($userFrom)
    {
        $this->userFrom = $userFrom;

        return $this;
    }

    /**
     * Get userFrom
     *
     * @return string
     */
    public function getUserFrom()
    {
        return $this->userFrom;
    }

    /**
     * Set userSig
     *
     * @param string $userSig
     *
     * @return BbUsers
     */
    public function setUserSig($userSig)
    {
        $this->userSig = $userSig;

        return $this;
    }

    /**
     * Get userSig
     *
     * @return string
     */
    public function getUserSig()
    {
        return $this->userSig;
    }

    /**
     * Set userOcc
     *
     * @param string $userOcc
     *
     * @return BbUsers
     */
    public function setUserOcc($userOcc)
    {
        $this->userOcc = $userOcc;

        return $this;
    }

    /**
     * Get userOcc
     *
     * @return string
     */
    public function getUserOcc()
    {
        return $this->userOcc;
    }

    /**
     * Set userInterests
     *
     * @param string $userInterests
     *
     * @return BbUsers
     */
    public function setUserInterests($userInterests)
    {
        $this->userInterests = $userInterests;

        return $this;
    }

    /**
     * Get userInterests
     *
     * @return string
     */
    public function getUserInterests()
    {
        return $this->userInterests;
    }

    /**
     * Set userActkey
     *
     * @param string $userActkey
     *
     * @return BbUsers
     */
    public function setUserActkey($userActkey)
    {
        $this->userActkey = $userActkey;

        return $this;
    }

    /**
     * Get userActkey
     *
     * @return string
     */
    public function getUserActkey()
    {
        return $this->userActkey;
    }

    /**
     * Set userNewpasswd
     *
     * @param string $userNewpasswd
     *
     * @return BbUsers
     */
    public function setUserNewpasswd($userNewpasswd)
    {
        $this->userNewpasswd = $userNewpasswd;

        return $this;
    }

    /**
     * Get userNewpasswd
     *
     * @return string
     */
    public function getUserNewpasswd()
    {
        return $this->userNewpasswd;
    }

    /**
     * Set autologinId
     *
     * @param string $autologinId
     *
     * @return BbUsers
     */
    public function setAutologinId($autologinId)
    {
        $this->autologinId = $autologinId;

        return $this;
    }

    /**
     * Get autologinId
     *
     * @return string
     */
    public function getAutologinId()
    {
        return $this->autologinId;
    }

    /**
     * Set userNewestPmId
     *
     * @param integer $userNewestPmId
     *
     * @return BbUsers
     */
    public function setUserNewestPmId($userNewestPmId)
    {
        $this->userNewestPmId = $userNewestPmId;

        return $this;
    }

    /**
     * Get userNewestPmId
     *
     * @return integer
     */
    public function getUserNewestPmId()
    {
        return $this->userNewestPmId;
    }

    /**
     * Set userPoints
     *
     * @param float $userPoints
     *
     * @return BbUsers
     */
    public function setUserPoints($userPoints)
    {
        $this->userPoints = $userPoints;

        return $this;
    }

    /**
     * Get userPoints
     *
     * @return float
     */
    public function getUserPoints()
    {
        return $this->userPoints;
    }

    /**
     * Set tplName
     *
     * @param string $tplName
     *
     * @return BbUsers
     */
    public function setTplName($tplName)
    {
        $this->tplName = $tplName;

        return $this;
    }

    /**
     * Get tplName
     *
     * @return string
     */
    public function getTplName()
    {
        return $this->tplName;
    }
}
