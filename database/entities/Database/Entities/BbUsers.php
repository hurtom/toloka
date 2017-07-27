<?php

namespace Database\Entities;

/**
 * BbUsers
 */
class BbUsers
{
    /**
     * @var integer
     */
    private $userId;

    /**
     * @var boolean
     */
    private $userActive = '1';

    /**
     * @var string
     */
    private $username = '';

    /**
     * @var string
     */
    private $userPassword = '';

    /**
     * @var integer
     */
    private $userSessionTime = '0';

    /**
     * @var integer
     */
    private $userLastvisit = '0';

    /**
     * @var string
     */
    private $userLastIp = '0';

    /**
     * @var integer
     */
    private $userRegdate = '0';

    /**
     * @var string
     */
    private $userRegIp = '0';

    /**
     * @var boolean
     */
    private $userLevel = '0';

    /**
     * @var integer
     */
    private $userPosts = '0';

    /**
     * @var string
     */
    private $userTimezone = '0.00';

    /**
     * @var string
     */
    private $userLang = 'uk';

    /**
     * @var integer
     */
    private $userNewPrivmsg = '0';

    /**
     * @var integer
     */
    private $userUnreadPrivmsg = '0';

    /**
     * @var integer
     */
    private $userLastPrivmsg = '0';

    /**
     * @var integer
     */
    private $userOpt = '0';

    /**
     * @var integer
     */
    private $userRank = '0';

    /**
     * @var boolean
     */
    private $avatarExtId = '0';

    /**
     * @var boolean
     */
    private $userGender = '0';

    /**
     * @var \DateTime
     */
    private $userBirthday = '0000-00-00';

    /**
     * @var string
     */
    private $userEmail = '';

    /**
     * @var string
     */
    private $userSkype = '';

    /**
     * @var string
     */
    private $userTwitter = '';

    /**
     * @var string
     */
    private $userIcq = '';

    /**
     * @var string
     */
    private $userWebsite = '';

    /**
     * @var string
     */
    private $userFrom = '';

    /**
     * @var string
     */
    private $userSig;

    /**
     * @var string
     */
    private $userOcc = '';

    /**
     * @var string
     */
    private $userInterests = '';

    /**
     * @var string
     */
    private $userActkey = '';

    /**
     * @var string
     */
    private $userNewpasswd = '';

    /**
     * @var string
     */
    private $autologinId = '';

    /**
     * @var integer
     */
    private $userNewestPmId = '0';

    /**
     * @var float
     */
    private $userPoints = '0.00';

    /**
     * @var string
     */
    private $tplName = 'default';


    /**
     * @var string
     */
    private $userPassword2 = '';

    /**
     * @var integer
     */
    private $userTimer;

    /**
     * @var integer
     */
    private $userLoginTries = '0';

    /**
     * @var integer
     */
    private $userLastLoginTry = '0';

    /**
     * @var boolean
     */
    private $userViewemail;

    /**
     * @var boolean
     */
    private $userAttachsig;

    /**
     * @var boolean
     */
    private $userAllowViewonline = '1';

    /**
     * @var boolean
     */
    private $userNotify = '1';

    /**
     * @var boolean
     */
    private $userNotifyPm = '0';

    /**
     * @var boolean
     */
    private $userPopupPm = '0';

    /**
     * @var string
     */
    private $userAvatar;

    /**
     * @var boolean
     */
    private $userAvatarType = '0';

    /**
     * @var string
     */
    private $userSigBbcodeUid;

    /**
     * @var boolean
     */
    private $userAllowPasskey = '1';

    /**
     * @var string
     */
    private $userFromFlag;

    /**
     * @var boolean
     */
    private $userAllowdefaultavatar = '1';

    /**
     * @var boolean
     */
    private $userWarnings = '0';

    /**
     * @var boolean
     */
    private $userBanned = '0';

    /**
     * @var string
     */
    private $btTorBrowseSet;

    /**
     * @var string
     */
    private $userUnreadTopics;

    /**
     * @var boolean
     */
    private $userHideBtStats = '0';

    /**
     * @var boolean
     */
    private $userHideBtHistory = '1';

    /**
     * @var boolean
     */
    private $userHideBtActivity = '0';

    /**
     * @var boolean
     */
    private $userHideBtTopics = '0';

    /**
     * @var boolean
     */
    private $userBtSsl = '0';


}
