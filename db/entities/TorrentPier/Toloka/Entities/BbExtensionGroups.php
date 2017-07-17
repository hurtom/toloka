<?php

namespace TorrentPier\Toloka\Entities;

use Doctrine\ORM\Mapping as ORM;

/**
 * BbExtensionGroups
 *
 * @ORM\Table(name="bb_extension_groups")
 * @ORM\Entity
 */
class BbExtensionGroups
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
     * @var string
     *
     * @ORM\Column(name="group_name", type="string", length=20, nullable=false)
     */
    private $groupName = '';

    /**
     * @var boolean
     *
     * @ORM\Column(name="cat_id", type="boolean", nullable=false)
     */
    private $catId = '0';

    /**
     * @var boolean
     *
     * @ORM\Column(name="allow_group", type="boolean", nullable=false)
     */
    private $allowGroup = '0';

    /**
     * @var boolean
     *
     * @ORM\Column(name="download_mode", type="boolean", nullable=false)
     */
    private $downloadMode = '1';

    /**
     * @var string
     *
     * @ORM\Column(name="upload_icon", type="string", length=100, nullable=false)
     */
    private $uploadIcon = '';

    /**
     * @var integer
     *
     * @ORM\Column(name="max_filesize", type="integer", nullable=false)
     */
    private $maxFilesize = '0';

    /**
     * @var string
     *
     * @ORM\Column(name="forum_permissions", type="text", length=65535, nullable=false)
     */
    private $forumPermissions;



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
     * Set groupName
     *
     * @param string $groupName
     *
     * @return BbExtensionGroups
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
     * Set catId
     *
     * @param boolean $catId
     *
     * @return BbExtensionGroups
     */
    public function setCatId($catId)
    {
        $this->catId = $catId;

        return $this;
    }

    /**
     * Get catId
     *
     * @return boolean
     */
    public function getCatId()
    {
        return $this->catId;
    }

    /**
     * Set allowGroup
     *
     * @param boolean $allowGroup
     *
     * @return BbExtensionGroups
     */
    public function setAllowGroup($allowGroup)
    {
        $this->allowGroup = $allowGroup;

        return $this;
    }

    /**
     * Get allowGroup
     *
     * @return boolean
     */
    public function getAllowGroup()
    {
        return $this->allowGroup;
    }

    /**
     * Set downloadMode
     *
     * @param boolean $downloadMode
     *
     * @return BbExtensionGroups
     */
    public function setDownloadMode($downloadMode)
    {
        $this->downloadMode = $downloadMode;

        return $this;
    }

    /**
     * Get downloadMode
     *
     * @return boolean
     */
    public function getDownloadMode()
    {
        return $this->downloadMode;
    }

    /**
     * Set uploadIcon
     *
     * @param string $uploadIcon
     *
     * @return BbExtensionGroups
     */
    public function setUploadIcon($uploadIcon)
    {
        $this->uploadIcon = $uploadIcon;

        return $this;
    }

    /**
     * Get uploadIcon
     *
     * @return string
     */
    public function getUploadIcon()
    {
        return $this->uploadIcon;
    }

    /**
     * Set maxFilesize
     *
     * @param integer $maxFilesize
     *
     * @return BbExtensionGroups
     */
    public function setMaxFilesize($maxFilesize)
    {
        $this->maxFilesize = $maxFilesize;

        return $this;
    }

    /**
     * Get maxFilesize
     *
     * @return integer
     */
    public function getMaxFilesize()
    {
        return $this->maxFilesize;
    }

    /**
     * Set forumPermissions
     *
     * @param string $forumPermissions
     *
     * @return BbExtensionGroups
     */
    public function setForumPermissions($forumPermissions)
    {
        $this->forumPermissions = $forumPermissions;

        return $this;
    }

    /**
     * Get forumPermissions
     *
     * @return string
     */
    public function getForumPermissions()
    {
        return $this->forumPermissions;
    }
}
