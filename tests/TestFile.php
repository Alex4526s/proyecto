// tests/TestFile.php
<?php

use PHPUnit\Framework\TestCase;

class TestFile extends TestCase
{
    public function testAddition()
    {
        $this->assertEquals(2 + 2, 4);
    }
}
