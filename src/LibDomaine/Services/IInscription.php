<?php
namespace NWS\libMetier\Services;

interface IInscription {
    public function inscrire(EmailValide $email, MotDePasseValide $mdp, NomAfficheValide $nom) : Error;   
}