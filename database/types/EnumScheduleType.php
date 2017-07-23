<?php

namespace Database\Types;

class EnumScheduleType extends EnumType
{
    protected $name = 'enumcronschedule';
    protected $values = array('hourly','daily','weekly','monthly','interval');
}
