<?php

namespace Database\Entities;

/**
 * BbTopicTpl
 */
class BbTopicTpl
{
    /**
     * @var integer
     */
    private $tplId;

    /**
     * @var string
     */
    private $tplName = '';

    /**
     * @var string
     */
    private $tplSrcForm;

    /**
     * @var string
     */
    private $tplSrcTitle;

    /**
     * @var string
     */
    private $tplSrcMsg;

    /**
     * @var string
     */
    private $tplComment;

    /**
     * @var integer
     */
    private $tplRulesPostId = '0';

    /**
     * @var integer
     */
    private $tplLastEditTm = '0';

    /**
     * @var integer
     */
    private $tplLastEditBy = '0';


}

