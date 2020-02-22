<?php
declare(strict_types=1);

use PHPUnit\Framework\TestCase;
use NWS\LibDomaine\Primitives\MotDePasseValide;
;
final class MotDePasseTest extends TestCase
{
    public function testCanBeCreatedFromValidEmailAddress(): void
    {
        $this->assertInstanceOf(
            EmailValide::class,
            new EmailValide('user@example.com')
        );
    }

    public function testCannotBeCreatedFromInvalidEmailAddress(): void
    {
        $this->expectException(InvalidArgumentException::class);

        new EmailValide('invalid');
    }

    public function testCanBeUsedAsString(): void
    {
        $this->assertEquals(
            'user@example.com',
            new EmailValide('user@example.com')
        );
    }
}
