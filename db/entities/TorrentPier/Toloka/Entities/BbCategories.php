<?php

namespace TorrentPier\Toloka\Entities;

use Doctrine\ORM\Mapping as ORM;

/**
 * BbCategories
 *
 * @ORM\Table(name="bb_categories", indexes={@ORM\Index(name="cat_order", columns={"cat_order"})})
 * @ORM\Entity
 */
class BbCategories
{
    /**
     * @var integer
     *
     * @ORM\Column(name="cat_id", type="smallint", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $catId;

    /**
     * @var string
     *
     * @ORM\Column(name="cat_title", type="string", length=100, nullable=false)
     */
    private $catTitle = '';

    /**
     * @var integer
     *
     * @ORM\Column(name="cat_order", type="smallint", nullable=false)
     */
    private $catOrder = '0';



    /**
     * Get catId
     *
     * @return integer
     */
    public function getCatId()
    {
        return $this->catId;
    }

    /**
     * Set catTitle
     *
     * @param string $catTitle
     *
     * @return BbCategories
     */
    public function setCatTitle($catTitle)
    {
        $this->catTitle = $catTitle;

        return $this;
    }

    /**
     * Get catTitle
     *
     * @return string
     */
    public function getCatTitle()
    {
        return $this->catTitle;
    }

    /**
     * Set catOrder
     *
     * @param integer $catOrder
     *
     * @return BbCategories
     */
    public function setCatOrder($catOrder)
    {
        $this->catOrder = $catOrder;

        return $this;
    }

    /**
     * Get catOrder
     *
     * @return integer
     */
    public function getCatOrder()
    {
        return $this->catOrder;
    }
}
