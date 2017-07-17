<?php

namespace TorrentPier\Toloka\Entities;

use Doctrine\ORM\Mapping as ORM;

/**
 * BbAttachmentsDesc
 *
 * @ORM\Table(name="bb_attachments_desc", indexes={@ORM\Index(name="filetime", columns={"filetime"}), @ORM\Index(name="filesize", columns={"filesize"}), @ORM\Index(name="physical_filename", columns={"physical_filename"})},options={"charset":"utf8mb4", "collate":"utf8mb4_unicode_ci"})
 * @ORM\Entity
 */
class BbAttachmentsDesc
{
    /**
     * @var integer
     *
     * @ORM\Column(name="attach_id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $attachId;

    /**
     * @var string
     *
     * @ORM\Column(name="physical_filename", type="string", length=255, nullable=false)
     */
    private $physicalFilename = '';

    /**
     * @var string
     *
     * @ORM\Column(name="real_filename", type="string", length=255, nullable=false)
     */
    private $realFilename = '';

    /**
     * @var integer
     *
     * @ORM\Column(name="download_count", type="integer", nullable=false)
     */
    private $downloadCount = '0';

    /**
     * @var string
     *
     * @ORM\Column(name="comment", type="string", length=255, nullable=false)
     */
    private $comment = '';

    /**
     * @var string
     *
     * @ORM\Column(name="extension", type="string", length=100, nullable=false)
     */
    private $extension = '';

    /**
     * @var string
     *
     * @ORM\Column(name="mimetype", type="string", length=100, nullable=false)
     */
    private $mimetype = '';

    /**
     * @var integer
     *
     * @ORM\Column(name="filesize", type="integer", nullable=false)
     */
    private $filesize = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="filetime", type="integer", nullable=false)
     */
    private $filetime = '0';

    /**
     * @var boolean
     *
     * @ORM\Column(name="thumbnail", type="boolean", nullable=false)
     */
    private $thumbnail = '0';

    /**
     * @var boolean
     *
     * @ORM\Column(name="tracker_status", type="boolean", nullable=false)
     */
    private $trackerStatus = '0';



    /**
     * Get attachId
     *
     * @return integer
     */
    public function getAttachId()
    {
        return $this->attachId;
    }

    /**
     * Set physicalFilename
     *
     * @param string $physicalFilename
     *
     * @return BbAttachmentsDesc
     */
    public function setPhysicalFilename($physicalFilename)
    {
        $this->physicalFilename = $physicalFilename;

        return $this;
    }

    /**
     * Get physicalFilename
     *
     * @return string
     */
    public function getPhysicalFilename()
    {
        return $this->physicalFilename;
    }

    /**
     * Set realFilename
     *
     * @param string $realFilename
     *
     * @return BbAttachmentsDesc
     */
    public function setRealFilename($realFilename)
    {
        $this->realFilename = $realFilename;

        return $this;
    }

    /**
     * Get realFilename
     *
     * @return string
     */
    public function getRealFilename()
    {
        return $this->realFilename;
    }

    /**
     * Set downloadCount
     *
     * @param integer $downloadCount
     *
     * @return BbAttachmentsDesc
     */
    public function setDownloadCount($downloadCount)
    {
        $this->downloadCount = $downloadCount;

        return $this;
    }

    /**
     * Get downloadCount
     *
     * @return integer
     */
    public function getDownloadCount()
    {
        return $this->downloadCount;
    }

    /**
     * Set comment
     *
     * @param string $comment
     *
     * @return BbAttachmentsDesc
     */
    public function setComment($comment)
    {
        $this->comment = $comment;

        return $this;
    }

    /**
     * Get comment
     *
     * @return string
     */
    public function getComment()
    {
        return $this->comment;
    }

    /**
     * Set extension
     *
     * @param string $extension
     *
     * @return BbAttachmentsDesc
     */
    public function setExtension($extension)
    {
        $this->extension = $extension;

        return $this;
    }

    /**
     * Get extension
     *
     * @return string
     */
    public function getExtension()
    {
        return $this->extension;
    }

    /**
     * Set mimetype
     *
     * @param string $mimetype
     *
     * @return BbAttachmentsDesc
     */
    public function setMimetype($mimetype)
    {
        $this->mimetype = $mimetype;

        return $this;
    }

    /**
     * Get mimetype
     *
     * @return string
     */
    public function getMimetype()
    {
        return $this->mimetype;
    }

    /**
     * Set filesize
     *
     * @param integer $filesize
     *
     * @return BbAttachmentsDesc
     */
    public function setFilesize($filesize)
    {
        $this->filesize = $filesize;

        return $this;
    }

    /**
     * Get filesize
     *
     * @return integer
     */
    public function getFilesize()
    {
        return $this->filesize;
    }

    /**
     * Set filetime
     *
     * @param integer $filetime
     *
     * @return BbAttachmentsDesc
     */
    public function setFiletime($filetime)
    {
        $this->filetime = $filetime;

        return $this;
    }

    /**
     * Get filetime
     *
     * @return integer
     */
    public function getFiletime()
    {
        return $this->filetime;
    }

    /**
     * Set thumbnail
     *
     * @param boolean $thumbnail
     *
     * @return BbAttachmentsDesc
     */
    public function setThumbnail($thumbnail)
    {
        $this->thumbnail = $thumbnail;

        return $this;
    }

    /**
     * Get thumbnail
     *
     * @return boolean
     */
    public function getThumbnail()
    {
        return $this->thumbnail;
    }

    /**
     * Set trackerStatus
     *
     * @param boolean $trackerStatus
     *
     * @return BbAttachmentsDesc
     */
    public function setTrackerStatus($trackerStatus)
    {
        $this->trackerStatus = $trackerStatus;

        return $this;
    }

    /**
     * Get trackerStatus
     *
     * @return boolean
     */
    public function getTrackerStatus()
    {
        return $this->trackerStatus;
    }
}
