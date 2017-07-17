<?php

namespace TorrentPier\Toloka\Entities;

use Doctrine\ORM\Mapping as ORM;

/**
 * BbAttachmentsConfig
 *
 * @ORM\Table(name="bb_attachments_config",options={"charset":"utf8mb4", "collate":"utf8mb4_unicode_ci"})
 * @ORM\Entity
 */
class BbAttachmentsConfig
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
     * @ORM\Column(name="config_value", type="string", length=255, nullable=false)
     */
    private $configValue = '';



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
     * @return BbAttachmentsConfig
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
