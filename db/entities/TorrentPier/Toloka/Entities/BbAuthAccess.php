<?php

namespace TorrentPier\Toloka\Entities;

use Doctrine\ORM\Mapping as ORM;

/**
 * BbAuthAccess
 *
 * @ORM\Table(name="bb_auth_access", indexes={@ORM\Index(name="forum_id", columns={"forum_id"})},options={"charset":"utf8mb4", "collate":"utf8mb4_unicode_ci"})
 * @ORM\Entity
 */
class BbAuthAccess
{
    /**
     * @var integer
     *
     * @ORM\Column(name="group_id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="NONE")
     */
    private $groupId = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="forum_id", type="smallint", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="NONE")
     */
    private $forumId = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="forum_perm", type="integer", nullable=false)
     */
    private $forumPerm = '0';



    /**
     * Set groupId
     *
     * @param integer $groupId
     *
     * @return BbAuthAccess
     */
    public function setGroupId($groupId)
    {
        $this->groupId = $groupId;

        return $this;
    }

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
     * Set forumId
     *
     * @param integer $forumId
     *
     * @return BbAuthAccess
     */
    public function setForumId($forumId)
    {
        $this->forumId = $forumId;

        return $this;
    }

    /**
     * Get forumId
     *
     * @return integer
     */
    public function getForumId()
    {
        return $this->forumId;
    }

    /**
     * Set forumPerm
     *
     * @param integer $forumPerm
     *
     * @return BbAuthAccess
     */
    public function setForumPerm($forumPerm)
    {
        $this->forumPerm = $forumPerm;

        return $this;
    }

    /**
     * Get forumPerm
     *
     * @return integer
     */
    public function getForumPerm()
    {
        return $this->forumPerm;
    }
}
