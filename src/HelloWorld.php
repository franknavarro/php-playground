<?php

namespace MyPHP\Fun;

final class HelloWorld
{
    private const CLASSIC = "Hello world!";
    private const OLD_BEN = "Hello there...";
    private const SPOCK = "Live long and prosper.";
    private const DROID = "Roger! Roger!";

    public function greet()
    {
        return self::CLASSIC;
    }

    public function greetSW()
    {
        return self::OLD_BEN;
    }

    public function greetST()
    {
        return self::SPOCK;
    }

    public function greetDroid()
    {
        return self::DROID;
    }
}
