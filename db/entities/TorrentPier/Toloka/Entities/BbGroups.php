<?php

namespace TorrentPier\Toloka\Entities;

use Doctrine\ORM\Mapping as ORM;

/**
 * BbGroups
 *
 * @ORM\Table(name="bb_groups", indexes={@ORM\Index(name="group_single_user", columns={"group_single_user"})})
 * @ORM\Entity
 */
class BbGroups
{
    /**
     * @var integer
     *
     * @ORM\Column(name="group_id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $groupId;

    /**
     * @var integer
     *
     * @ORM\Column(name="avatar_ext_id", type="integer", nullable=false)
     */
    private $avatarExtId = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="group_time", type="integer", nullable=false)
     */
    private $groupTime = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="mod_time", type="integer", nullable=false)
     */
    private $modTime = '0';

    /**
     * @var boolean
     *
     * @ORM\Column(name="group_type", type="boolean", nullable=false)
     */
    private $groupType = '1';

    /**
     * @var boolean
     *
     * @ORM\Column(name="release_group", type="boolean", nullable=false)
     */
    private $releaseGroup = '0';

    /**
     * @var string
     *
     * @ORM\Column(name="group_name", type="string", length=40, nullable=false)
     */
    private $groupName = '';

    /**
     * @var string
     *
     * @ORM\Column(name="group_description", type="text", length=65535, nullable=false)
     */
    private $groupDescription;

    /**
     * @var string
     *
     * @ORM\Column(name="group_signature", type="text", length=65535, nullable=false)
     */
    private $groupSignature;

    /**
     * @var integer
     *
     * @ORM\Column(name="group_moderator", type="integer", nullable=false)
     */
    private $groupModerator = '0';

    /**
     * @var boolean
     *
     * @ORM\Column(name="group_single_user", type="boolean", nullable=false)
     */
    private $groupSingleUser = '1';



    /**
     * Get groupId
     *
     * @return integer
     */
    public function getGroupId()
    {
        return $this->groupId;
    }

    /**
     * Set avatarExtId
     *
     * @param integer $avatarExtId
     *
     * @return BbGroups
     */
    public function setAvatarExtId($avatarExtId)
    {
        $this->avatarExtId = $avatarExtId;

        return $this;
    }

    /**
     * Get avatarExtId
     *
     * @return integer
     */
    public function getAvatarExtId()
    {
        return $this->avatarExtId;
    }

    /**
     * Set groupTime
     *
     * @param integer $groupTime
     *
     * @return BbGroups
     */
    public function setGroupTime($groupTime)
    {
        $this->groupTime = $groupTime;

        return $this;
    }

    /**
     * Get groupTime
     *
     * @return integer
     */
    public function getGroupTime()
    {
        return $this->groupTime;
    }

    /**
     * Set modTime
     *
     * @param integer $modTime
     *
     * @return BbGroups
     */
    public function setModTime($modTime)
    {
        $this->modTime = $modTime;

        return $this;
    }

    /**
     * Get modTime
     *
     * @return integer
     */
    public function getModTime()
    {
        return $this->modTime;
    }

    /**
     * Set groupType
     *
     * @param boolean $groupType
     *
     * @return BbGroups
     */
    public function setGroupType($groupType)
    {
        $this->groupType = $groupType;

        return $this;
    }

    /**
     * Get groupType
     *
     * @return boolean
     */
    public function getGroupType()
    {
        return $this->groupType;
    }

    /**
     * Set releaseGroup
     *
     * @param boolean $releaseGroup
     *
     * @return BbGroups
     */
    public function setReleaseGroup($releaseGroup)
    {
        $this->releaseGroup = $releaseGroup;

        return $this;
    }

    /**
     * Get releaseGroup
     *
     * @return boolean
     */
    public function getReleaseGroup()
    {
        return $this->releaseGroup;
    }

    /**
     * Set groupName
     *
     * @param string $groupName
     *
     * @return BbGroups
     */
    public function setGroupName($groupName)
    {
        $this->groupName = $groupName;

        return $this;
    }

    /**
     * Get groupName
     *
     * @return string
     */
    public function getGroupName()
    {
        return $this->groupName;
    }

    /**
     * Set groupDescription
     *
     * @param string $groupDescription
     *
     * @return BbGroups
     */
    public function setGroupDescription($groupDescription)
    {
        $this->groupDescription = $groupDescription;

        return $this;
    }

    /**
     * Get groupDescription
     *
     * @return string
     */
    public function getGroupDescription()
    {
        return $this->groupDescription;
    }

    /**
     * Set groupSignature
     *
     * @param string $groupSignature
     *
     * @return BbGroups
     */
    public function setGroupSignature($groupSignature)
    {
        $this->groupSignature = $groupSignature;

        return $this;
    }

    /**
     * Get groupSignature
     *
     * @return string
     */
    public function getGroupSignature()
    {
        return $this->groupSignature;
    }

    /**
     * Set groupModerator
     *
     * @param integer $groupModerator
     *
     * @return BbGroups
     */
    public function setGroupModerator($groupModerator)
    {
        $this->groupModerator = $groupModerator;

        return $this;
    }

    /**
     * Get groupModerator
     *
     * @return integer
     */
    public function getGroupModerator()
    {
        return $this->groupModerator;
    }

    /**
     * Set groupSingleUser
     *
     * @param boolean $groupSingleUser
     *
     * @return BbGroups
     */
    public function setGroupSingleUser($groupSingleUser)
    {
        $this->groupSingleUser = $groupSingleUser;

        return $this;
    }

    /**
     * Get groupSingleUser
     *
     * @return boolean
     */
    public function getGroupSingleUser()
    {
        return $this->groupSingleUser;
    }
}
