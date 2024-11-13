<?php

namespace MyPHP\Fun\Test;

use MyPHP\Fun\HelloWorld;
use PHPUnit\Framework\TestCase;

final class HelloWorldTest extends TestCase
{
  /** @var HelloWorld */
    private $helloWorld;

    protected function setUp(): void
    {
        $this->helloWorld = new HelloWorld();
    }

    public function testCoolerGreeting()
    {
        $result = $this->helloWorld->greetSW();
        $this->assertEquals("Hello there...", $result);
    }

    public function testAnotherCoolGreeting()
    {
        $result = $this->helloWorld->greetST();
        $this->assertEquals("Live long and prosper.", $result);
    }

    public function testDroidGreeting()
    {
        $result = $this->helloWorld->greetDroid();
        $this->assertEquals("Roger! Roger!", $result);
    }
}
