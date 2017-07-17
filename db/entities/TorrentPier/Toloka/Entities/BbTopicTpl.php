<?php

namespace TorrentPier\Toloka\Entities;

use Doctrine\ORM\Mapping as ORM;

/**
 * BbTopicTpl
 *
 * @ORM\Table(name="bb_topic_tpl", uniqueConstraints={@ORM\UniqueConstraint(name="tpl_name", columns={"tpl_name"})})
 * @ORM\Entity
 */
class BbTopicTpl
{
    /**
     * @var integer
     *
     * @ORM\Column(name="tpl_id", type="smallint", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $tplId;

    /**
     * @var string
     *
     * @ORM\Column(name="tpl_name", type="string", length=60, nullable=false)
     */
    private $tplName = '';

    /**
     * @var string
     *
     * @ORM\Column(name="tpl_src_form", type="text", length=65535, nullable=false)
     */
    private $tplSrcForm;

    /**
     * @var string
     *
     * @ORM\Column(name="tpl_src_title", type="text", length=65535, nullable=false)
     */
    private $tplSrcTitle;

    /**
     * @var string
     *
     * @ORM\Column(name="tpl_src_msg", type="text", length=65535, nullable=false)
     */
    private $tplSrcMsg;

    /**
     * @var string
     *
     * @ORM\Column(name="tpl_comment", type="text", length=65535, nullable=false)
     */
    private $tplComment;

    /**
     * @var integer
     *
     * @ORM\Column(name="tpl_rules_post_id", type="integer", nullable=false)
     */
    private $tplRulesPostId = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="tpl_last_edit_tm", type="integer", nullable=false)
     */
    private $tplLastEditTm = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="tpl_last_edit_by", type="integer", nullable=false)
     */
    private $tplLastEditBy = '0';



    /**
     * Get tplId
     *
     * @return integer
     */
    public function getTplId()
    {
        return $this->tplId;
    }

    /**
     * Set tplName
     *
     * @param string $tplName
     *
     * @return BbTopicTpl
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

    /**
     * Set tplSrcForm
     *
     * @param string $tplSrcForm
     *
     * @return BbTopicTpl
     */
    public function setTplSrcForm($tplSrcForm)
    {
        $this->tplSrcForm = $tplSrcForm;

        return $this;
    }

    /**
     * Get tplSrcForm
     *
     * @return string
     */
    public function getTplSrcForm()
    {
        return $this->tplSrcForm;
    }

    /**
     * Set tplSrcTitle
     *
     * @param string $tplSrcTitle
     *
     * @return BbTopicTpl
     */
    public function setTplSrcTitle($tplSrcTitle)
    {
        $this->tplSrcTitle = $tplSrcTitle;

        return $this;
    }

    /**
     * Get tplSrcTitle
     *
     * @return string
     */
    public function getTplSrcTitle()
    {
        return $this->tplSrcTitle;
    }

    /**
     * Set tplSrcMsg
     *
     * @param string $tplSrcMsg
     *
     * @return BbTopicTpl
     */
    public function setTplSrcMsg($tplSrcMsg)
    {
        $this->tplSrcMsg = $tplSrcMsg;

        return $this;
    }

    /**
     * Get tplSrcMsg
     *
     * @return string
     */
    public function getTplSrcMsg()
    {
        return $this->tplSrcMsg;
    }

    /**
     * Set tplComment
     *
     * @param string $tplComment
     *
     * @return BbTopicTpl
     */
    public function setTplComment($tplComment)
    {
        $this->tplComment = $tplComment;

        return $this;
    }

    /**
     * Get tplComment
     *
     * @return string
     */
    public function getTplComment()
    {
        return $this->tplComment;
    }

    /**
     * Set tplRulesPostId
     *
     * @param integer $tplRulesPostId
     *
     * @return BbTopicTpl
     */
    public function setTplRulesPostId($tplRulesPostId)
    {
        $this->tplRulesPostId = $tplRulesPostId;

        return $this;
    }

    /**
     * Get tplRulesPostId
     *
     * @return integer
     */
    public function getTplRulesPostId()
    {
        return $this->tplRulesPostId;
    }

    /**
     * Set tplLastEditTm
     *
     * @param integer $tplLastEditTm
     *
     * @return BbTopicTpl
     */
    public function setTplLastEditTm($tplLastEditTm)
    {
        $this->tplLastEditTm = $tplLastEditTm;

        return $this;
    }

    /**
     * Get tplLastEditTm
     *
     * @return integer
     */
    public function getTplLastEditTm()
    {
        return $this->tplLastEditTm;
    }

    /**
     * Set tplLastEditBy
     *
     * @param integer $tplLastEditBy
     *
     * @return BbTopicTpl
     */
    public function setTplLastEditBy($tplLastEditBy)
    {
        $this->tplLastEditBy = $tplLastEditBy;

        return $this;
    }

    /**
     * Get tplLastEditBy
     *
     * @return integer
     */
    public function getTplLastEditBy()
    {
        return $this->tplLastEditBy;
    }
}
