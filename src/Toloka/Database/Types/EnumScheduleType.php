<?php

namespace TorrentPier\Toloka\Database\Types;

use TorrentPier\Toloka\Database\Types\EnumType;

class EnumScheduleType extends EnumType
{
    protected $name = 'enumcronschedule';
    protected $values = array('hourly','daily','weekly','monthly','interval');
}
