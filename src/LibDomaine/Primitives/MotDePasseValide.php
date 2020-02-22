<?php
declare(strict_types=1);

namespace NWS\LibDomaine\Primitives;

final class MotDePasseValide
{
    private $mdp;

    public function __construct(string $mdp)
    {
        $this->verifierTaille($mdp);
        $this->verifierCaracteresAutorises($mdp);
        $this->verifierReglesFormation($mdp);

        $this->mdp = $mdp;
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
