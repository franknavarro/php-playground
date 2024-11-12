<?php

namespace MyPHP\Fun;

final class HelloWorld
{
    private const OBI = "Hello there.";
    private const CLASSIC = "Hello World!";

    public function greet()
    {
        return self::CLASSIC;
    }

    public function greetSW()
    {
        return self::OBI;
    }
}
