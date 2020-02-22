<?php
declare(strict_types=1);

namespace NWS\LibDomaine\Primitives;

final class EmailValide
{
    private $email;

    public function __construct(string $email)
    {
        $this->verifierValiditeEmail($email);

        $this->email = $email;
    }

    public function __toString(): string
    {
        return $this->email;
    }

    private function verifierValiditeEmail(string $email)
    {
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            throw new \InvalidArgumentException(
                sprintf("'%s' n'est pas une adresse valide", $email)
            );
        }
    }
}
