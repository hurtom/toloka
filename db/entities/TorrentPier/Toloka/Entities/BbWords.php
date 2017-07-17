<?php

namespace TorrentPier\Toloka\Entities;

use Doctrine\ORM\Mapping as ORM;

/**
 * BbWords
 *
 * @ORM\Table(name="bb_words")
 * @ORM\Entity
 */
class BbWords
{
    /**
     * @var integer
     *
     * @ORM\Column(name="word_id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $wordId;

    /**
     * @var string
     *
     * @ORM\Column(name="word", type="string", length=100, nullable=false)
     */
    private $word = '';

    /**
     * @var string
     *
     * @ORM\Column(name="replacement", type="string", length=100, nullable=false)
     */
    private $replacement = '';



    /**
     * Get wordId
     *
     * @return integer
     */
    public function getWordId()
    {
        return $this->wordId;
    }

    /**
     * Set word
     *
     * @param string $word
     *
     * @return BbWords
     */
    public function setWord($word)
    {
        $this->word = $word;

        return $this;
    }

    /**
     * Get word
     *
     * @return string
     */
    public function getWord()
    {
        return $this->word;
    }

    /**
     * Set replacement
     *
     * @param string $replacement
     *
     * @return BbWords
     */
    public function setReplacement($replacement)
    {
        $this->replacement = $replacement;

        return $this;
    }

    /**
     * Get replacement
     *
     * @return string
     */
    public function getReplacement()
    {
        return $this->replacement;
    }
}
