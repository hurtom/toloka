<?php

namespace TorrentPier\Toloka\Entities;

use Doctrine\ORM\Mapping as ORM;

/**
 * BbAuthAccessSnap
 *
 * @ORM\Table(name="bb_auth_access_snap",options={"charset":"utf8mb4", "collate":"utf8mb4_unicode_ci"})
 * @ORM\Entity
 */
class BbAuthAccessSnap
{
    /**
     * @var integer
     *
     * @ORM\Column(name="user_id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="NONE")
     */
    private $userId = '0';

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
     * Set userId
     *
     * @param integer $userId
     *
     * @return BbAuthAccessSnap
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
     * Set forumId
     *
     * @param integer $forumId
     *
     * @return BbAuthAccessSnap
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
     * @return BbAuthAccessSnap
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
