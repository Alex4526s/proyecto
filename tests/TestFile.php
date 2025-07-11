// tests/TestFile.php
<?php
use PHPUnit\Framework\TestCase;

class TestFile extends TestCase
{
    public function testSuma()
    {
        $this->assertEquals(4, 2 + 2);
    }
}
