<?php

namespace Norm\Schema;

class UnsafeString extends Stringz
{
    public function prepare($value)
    {
        return utf8_encode($value);
    }
}
