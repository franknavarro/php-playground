<?php

namespace MyPHP\Fun;

final class HelloWorld
{
    private const OBI = "Hello there...";
    private const CLASSIC = "Hello World!!";
    private const SPOCK = "Live long and prosper";

    public function greet()
    {
        return self::CLASSIC;
    }

    public function greetSW()
    {
        return self::OBI;
    }

    public function greetST()
    {
        return self::SPOCK;
    }
}
