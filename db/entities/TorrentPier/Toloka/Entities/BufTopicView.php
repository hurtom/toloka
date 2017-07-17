<?php

namespace TorrentPier\Toloka\Entities;

use Doctrine\ORM\Mapping as ORM;

/**
 * BufTopicView
 *
 * @ORM\Table(name="buf_topic_view")
 * @ORM\Entity
 */
class BufTopicView
{
    /**
     * @var integer
     *
     * @ORM\Column(name="topic_id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $topicId = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="topic_views", type="integer", nullable=false)
     */
    private $topicViews = '0';



    /**
     * Get topicId
     *
     * @return integer
     */
    public function getTopicId()
    {
        return $this->topicId;
    }

    /**
     * Set topicViews
     *
     * @param integer $topicViews
     *
     * @return BufTopicView
     */
    public function setTopicViews($topicViews)
    {
        $this->topicViews = $topicViews;

        return $this;
    }

    /**
     * Get topicViews
     *
     * @return integer
     */
    public function getTopicViews()
    {
        return $this->topicViews;
    }
}
