<?php
use Silex\Application;
class ShortenIt extends Application
{
    public function __construct(array $values = array())
    {
        parent::__construct($values);
        $this->register(new Config);
    }

}