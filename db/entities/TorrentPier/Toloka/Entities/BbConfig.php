<?php

namespace TorrentPier\Toloka\Entities;

use Doctrine\ORM\Mapping as ORM;

/**
 * BbConfig
 *
 * @ORM\Table(name="bb_config")
 * @ORM\Entity
 */
class BbConfig
{
    /**
     * @var string
     *
     * @ORM\Column(name="config_name", type="string", length=255, nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $configName = '';

    /**
     * @var string
     *
     * @ORM\Column(name="config_value", type="text", length=65535, nullable=false)
     */
    private $configValue;



    /**
     * Get configName
     *
     * @return string
     */
    public function getConfigName()
    {
        return $this->configName;
    }

    /**
     * Set configValue
     *
     * @param string $configValue
     *
     * @return BbConfig
     */
    public function setConfigValue($configValue)
    {
        $this->configValue = $configValue;

        return $this;
    }

    /**
     * Get configValue
     *
     * @return string
     */
    public function getConfigValue()
    {
        return $this->configValue;
    }
}
